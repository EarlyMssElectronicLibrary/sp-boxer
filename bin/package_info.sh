#!/bin/sh

read -r -d '' HELP <<-'EOF'
Create the package metdata file.
EOF

### TEMPFILES
# From:
#   http://stackoverflow.com/questions/430078/shell-script-templates
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
   echo "Usage: $cmd [-h] INPUT_FILE"
   echo ""
   echo "OPTIONS"
   echo ""
   echo "   -h             Display help message"
   echo ""
}

get_value() {
  gv_file=$1
  gv_var=$2
  gv_line=`grep "^$gv_var " $gv_file 2>&1`
  echo "$gv_line" | sed "s/^$gv_var[	 ][	 ]*//"
}

### VARIABLES
date_cmd="date +%FT%T%z"
JSON_TEMPLATE=`dirname $0`/../data/metadata_template.json
if [ ! -f $JSON_TEMPLATE ]; then 
  error "Cannot find $JSON_TEMPLATE"
fi

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
# grab input file and confirm it exists; 
INPUT_FILE=$1
if [ -z "$INPUT_FILE" ]; then
  error "Please provide an INPUT_FILE"
elif [ ! -f $INPUT_FILE ]; then
  error "INPUT_FILE not found: $INPUT_FILE"
fi

# get the variables
STAGING_VOLUME=/Volumes/SPP-Staging1
STAGING_DIR=Scholar-Packages
REPO_VOLUME=/Volumes/SPP-Repo1
REPO_DIR=Repository
PACKAGE_INFO=PACKAGE_INFO.txt

# TODO make volume location configurable, over-ridable

shelf_mark=`get_value $INPUT_FILE "SHELF_MARK"`
if [ -n "$shelf_mark" ]; then
  message "Shelf mark is $shelf_mark"
else
  error "Could not acquire shelf mark from $INPUT_FILE"
fi
short_shelf_mark=`get_value $INPUT_FILE "SHORT_SHELF_MARK"`
message "SHORT_SHELF_MARK is $short_shelf_mark"
shelf_mark_dir=`echo $shelf_mark | sed 's/  */_/g'`
message "SHELF_MARK_DIR is $shelf_mark_dir"
recipient=`get_value $INPUT_FILE "RECIPIENT"`
message "RECIPIENT is $recipient"
recipient_dir=`get_value $INPUT_FILE "RECIPIENT_DIR"`
if [ ! -n "$recipient_dir" ]; then
  recipient_dir="NO_RECIPIENT_SPECIFIED"
  warning "Using recipient directory: $recipient_dir"
else
  message "RECIPIENT_DIR is $recipient_dir"
fi
staging_volume=$STAGING_VOLUME
staging_dir=$STAGING_DIR
repo_volume=$REPO_VOLUME
repo_dir=$REPO_DIR

# make sure we find the repository
repository=$repo_volume/$repo_dir
if [ -d $repository ]; then 
  message "Using Repository $repository"
else
  error "Repository not found $repository"
fi

# make sure the staging volume is there
if ! ls $staging_volume/* >/dev/null ; then
  error "STAGING_VOLUME not found $staging_volume"
fi

staging=$staging_volume/$staging_dir/$recipient_dir
package_dir=$staging/$shelf_mark_dir
if [ -d $package_dir ]; then
  message "Using manuscript directory: $package_dir"
else
  error "No PACKAGE_DIR: $package_dir; please stage files first"
fi

metadata_file=$package_dir/$PACKAGE_INFO
echo "SHELF_MARK $shelf_mark" > $metadata_file
echo "SHORT_SHELF_MARK $short_shelf_mark" >> $metadata_file
echo "RECIPIENT $recipient" >> $metadata_file
message "Wrote metadata file: ${metadata_file}:"
cat $metadata_file
message "Yup. That's it."

### EXIT
# http://stackoverflow.com/questions/430078/shell-script-templates
rm -f $tmp.?
trap 0
exit 0
