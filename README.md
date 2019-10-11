# What this is

A set of scripts for generating delivery packages of Sinai Palimpsests Project
data.

# How it works

The scripts should be run in this order:

- `box-add` -- copy data from repository to the package; this
  script begins the creation of the package; uses an input file generated by
  KatIkon to know which files to add; see below for sample input file

- `box-info` -- generate a temporary metadata file, `PACKAGE_INFO.txt`
  in the root directory of the package; subsequent scripts use the
  `PACKAGE_INFO.txt` to do their work

- `box-document` -- create the ReadMe and FileList files for the
  package; uses `PACKAGE_INFO.txt` to replacement strings, like the shelf mark,
  input into the ReadMe.

- `box-manifest` -- create the MD5 manifest for the package; will not
  run if `PACKAGE_INFO.txt` is not found in the package directory; deletes
  `PACKAGE_INFO.txt` upon completion

# Sample input file

      SHELF_MARK Greek 962
      PACKAGE_DIR Greek_962

      RECIPIENT Nigel Wilson
      RECIPIENT_DIR Nigel_Wilson

      SHORT_SHELF_MARK Grk-962

      SEQ_DIR Grk-962_182r_11-001
      SEQ_DIR Grk-962_182r_23-001
      SEQ_DIR Grk-962_182v_11-002
      SEQ_DIR Grk-962_182v_23-002
      SEQ_DIR Grk-962_184r_11-005
      ...


      PICK Processed/0011_000001/0011_000001_KTK_pseudo_WBUVB47-MB780IR.jpg  \
        Grk-962_182r_11-001/Grk-962_182r_11-001_KTK_pseudo_WBUVB47-MB780IR.jpg
      PICK Processed/0011_000001/0011_000001_KTK_pseudo_WBUVB47-VIS.jpg  \
        Grk-962_182r_11-001/Grk-962_182r_11-001_KTK_pseudo_WBUVB47-VIS.jpg
      PICK Processed/0011_000001/0011_000001_KTK_pseudo_WBUVG61-MB780IR.jpg  \
        Grk-962_182r_11-001/Grk-962_182r_11-001_KTK_pseudo_WBUVG61-MB780IR.jpg
      PICK Processed/0011_000001/0011_000001_KTK_pseudo_WBUVG61-VIS.jpg  \
        Grk-962_182r_11-001/Grk-962_182r_11-001_KTK_pseudo_WBUVG61-VIS.jpg
      ...


      CONTRIB Processed/0011_000003/0011_000003_DJK_ICA_01_RGB.jpg \
        Grk-962_183r_11-003/Grk-962_183r_11-003_DJK_ICA_01_RGB.jpg
      CONTRIB Processed/0011_000003/0011_000003_DJK_ICA_02_RGB.jpg \
        Grk-962_183r_11-003/Grk-962_183r_11-003_DJK_ICA_02_RGB.jpg
      CONTRIB Processed/0011_000004/0011_000004_DJK_color_RGB.jpg \
        Grk-962_183v_11-004/Grk-962_183v_11-004_DJK_color_RGB.jpg
      CONTRIB Processed/0011_000004/0011_000004_DJK_ICA_01_RGB.jpg \
        Grk-962_183v_11-004/Grk-962_183v_11-004_DJK_ICA_01_RGB.jpg
      ...

> Note: Long lines broken for formatting for this document. PICK and CONTRIB
> lines are single lines.

`SHELF_MARK` - the manuscript's shelf mark

`PACKAGE_DIR` - the directory the package should be placed into

`RECIPIENT` - the package recipient

`RECIPIENT_DIR` - the directory the `PACKAGE_DIR` goes into

`SHORT_SHELF_MARK` - the abbreviated form of the shelf mark

`SEQ_DIR` - each shot sequence directory name

`PICK` - each file that goes into the `Data` directory: its path and name in the
repository; and its path and name in the `Data` directory

`CONTRIB` - each file that goes into the `ResearchContrib/Data` directory: its
path and name in the repository; and its path and name in the
`ResearchContrib/Data` directory

## No contributions

Please note that the software is not being updated and pull requests are not accepted.
