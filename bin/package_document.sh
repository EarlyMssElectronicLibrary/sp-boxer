#!/bin/sh

read -r -d '' HELP <<-'EOF'
Add documentation files to PACKAGE_DIR.

A package will have the following structure.

      .
      ├── 01_ReadMe.txt
      ├── 02_FileList.txt
      ├── Data
      │   ├── GeoNF-71_001r_15-01
      │   │   ├── GeoNF-71_001r_15-01_KTK_pseudo_WBUVB47-MB625Rd.jpg
      │   │   ├── GeoNF-71_001r_15-01_KTK_pseudo_WBUVB47-VIS.jpg
      │   │   ├── ...
      │   │   └── GeoNF-71_001r_15-01_KTK_sharpie_WBUVR25-MB625Rd.jpg
      │   ├── ...
      │   └── GeoNF-71_008v_15-16
      │       ├── GeoNF-71_008v_15-16_KTK_pseudo_WBUVB47-MB625Rd.jpg
      │       ├── ...
      │       └── GeoNF-71_008v_15-16_KTK_sharpie_WBUVR25-MB625Rd.jpg
      └── manifest-md5s.txt

This script will:

* generate a ReadMe file
* add standard documentation
* add supplement files
* generate a list of files

Input file variables used:

* SHELF_MARK
EOF

### TEMPFILES
# From:
#   http://stackoverflow.com/questions/430078/shell-script-templates
# create a default tmp file name
tmp=${TMPDIR:-/tmp}/prog.$$
# delete any existing temp files
trap "rm -f $tmp.?; exit 1" 0 1 2 3 13 15
# then do
#   ...real work that creates temp files $tmp.1, $tmp.2, ...

#### USAGE AND ERRORS
cmd=`basename $0 .sh`
export SPINDLE_COMMAND=$cmd
source `dirname $0`/sp-boxer_functions

usage() {
   echo "Usage: $cmd [-h] PACKAGE_DIR"
   echo ""
   echo "OPTIONS"
   echo ""
   echo "   -h             Display help message"
   echo ""
}

get_value() {
  file=$1
  var=$2
  line=`grep "^$var" $file 2>&1`
  echo "$line" | sed "s/^$var[	 ][	 ]*//"
}
### VARIABLES
PACKAGE_INFO=PACKAGE_INFO.txt
date_cmd="date +%FT%T%z"

### OPTIONS
while getopts ":hd:" opt; do
  case $opt in
    h)
      usage 
      help
      exit 1
      ;;
    \?)
      echo "ERROR Invalid option: -$OPTARG" >&2
      echo ""
      usage
      exit 1
      ;;
  esac
done

shift $((OPTIND-1))

### THESCRIPT
# grab input file and confirm it exists
# get the variables
# TODO make volume location configurable, over-ridable
STAGING_VOLUME=/Volumes/SPP-Staging1
STAGING_DIR=Scholar-Packages
REPO_VOLUME=/Volumes/SPP-Repo1
REPO_DIR=Repository

PACKAGE_DIR=`package_dir $1`
metadata_file=$PACKAGE_DIR/$PACKAGE_INFO
if [ -f $metadata_file ]; then
  message "Found package metadata proceeding."
else
  error "Can't find package metadata: $metadata_file"
fi
# find the resource dir; this hold ReadMe file templates
RESOURCE_DIR=`dirname $0`/../data
if [ ! -d $RESOURCE_DIR ]; then
  error "Cannot find resource directory: $RESOURCE_DIR"
fi
README_TEMPLATE=$RESOURCE_DIR/01_ReadMe.md
if [ -f $README_TEMPLATE ]; then
  message "Using ReadMe template: $README_TEMPLATE"
else
  error "Can't find ReadMe template $README_TEMPLATE"
fi
  

year=`date +%Y`
shelf_mark=`get_value $metadata_file "SHELF_MARK"`
recipient=`get_value $metadata_file "RECIPIENT"`
shelf_mark_dir=`echo $shelf_mark | sed 's/  */_/g'`
staging_volume=$STAGING_VOLUME
staging_dir=$STAGING_DIR

message "Using manuscript directory: $PACKAGE_DIR"

data_dir=$PACKAGE_DIR/Data
if [ ! -d $data_dir ]; then
  error "Data directory not found: $data_dir"
fi
message "Using Data directory: $data_dir"

# generate the ReadMe file
readme_file=$PACKAGE_DIR/01_ReadMe.txt
sedscr=$tmp.1
readme_tmp=$tmp.2
# generate sed script
echo "s/@YEAR@/$year/g" >> $sedscr
echo "s/@SHELF_MARK@/$shelf_mark/g" >> $sedscr

sed -f $sedscr $README_TEMPLATE > $readme_tmp
message "Wrote tmp ReadMe file"

# generate HTML readme; including TOC
readme_head=`dirname $0`/../data/01_ReadMe_head.html
readme_html=$PACKAGE_DIR/01_ReadMe.html
readme_footer=`dirname $0`/../data/01_ReadMe_footer.html
echo "s/(c)/\&copy;/g" > $sedscr
cp $readme_head $readme_html
markdown $readme_tmp | sed -f $sedscr >> $readme_html
cat $readme_footer >> $readme_html
message "Wrote $readme_html"

# clean up \_ in .txt files
echo 's/\_/_/g' > $sedscr
echo 's/(c)/©/g' >> $sedscr
sed -f $sedscr $readme_tmp > $readme_file
message "Wrote $readme_file"

# copy documentation

# create file list
filelist_html=$PACKAGE_DIR/02_FileList.html
filelist_txt=$PACKAGE_DIR/02_FileList.txt

# delete the old file lists
if [ -f $filelist_html ]; then 
  rm $filelist_html
fi
if [ -f $filelist_txt ]; then 
  rm $filelist_txt
fi

# first create the HTML version of the file list

# filelist_open=`dirname $0`/../data//02_FileList_start.md
# filelist_md=$tmp.4
# echo "s/@YEAR@/$year/g" > $sedscr
# echo "s/@SHELF_MARK@/$shelf_mark/g" >> $sedscr
# first create the HTML version of the file list

filelist_open=`dirname $0`/../data//02_FileList_start.md
filelist_md=$tmp.4
echo "s/@YEAR@/$year/g" > $sedscr
echo "s/@SHELF_MARK@/$shelf_mark/g" >> $sedscr
echo "s/(c)/\&copy;/g" >> $sedscr
sed -f $sedscr $filelist_open > $filelist_md
echo >> $filelist_md
filelist_tmp=$tmp.3
(
cd $PACKAGE_DIR
touch 02_FileList.txt
touch 02_FileList.html
ls -R1 ** | grep -v $PACKAGE_INFO > $filelist_tmp
echo >> $filelist_tmp
ls -R1 */* >> $filelist_tmp
)
root='./'
while read line
do 
  if [ "$line" == "" ]; then
    # blank line 
    echo >> $filelist_md
  elif echo "$line" | grep ":$" >/dev/null 2>&1 ; then
    root=`echo $line | sed 's/:$//'`
    escaped_name=`echo $line | sed 's/_/\\\\_/g'`
    echo "### $escaped_name" >> $filelist_md
  else
    escaped_name=`echo $line | sed 's/_/\\\\_/g'`
    echo "- [$escaped_name]($root/$line)" >> $filelist_md
  fi

done < $filelist_tmp

cp $readme_head $filelist_html
markdown $filelist_md >> $filelist_html
cat $readme_footer >> $filelist_html
message "Wrote $filelist_html"

# now create the text version
echo "s/@YEAR@/$year/g" > $sedscr
echo "s/@SHELF_MARK@/$shelf_mark/g" >> $sedscr
echo "s/(c)/©/g" > $sedscr
sed -f $sedscr $filelist_open > $filelist_txt
cat $filelist_tmp >> $filelist_txt
message "Wrote $filelist_txt"


### EXIT
# http://stackoverflow.com/questions/430078/shell-script-templates
rm -f $tmp.?
trap 0
exit 0
