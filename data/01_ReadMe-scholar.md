# Sinai Palimpsests Project Digital Release
# README Document for @SHELF_MARK@

Authors:

 - Doug Emery
 - Michael Phelps

## HELLO

Thank you for participating in the Sinai Palimpsests Project.

Please note that our delivery methods are still in development and some
compromises have been made in the assembly of this data set. 

While these are first-quality images, they are a selected subset of the
processed image data. For any given folio, project scientists generate a
standard set of 28 images, and may generate over 40 images in total.  Of those
possible 40 images, typically only a few are optimally useful for reading the
undertext.  We generate images to cover a range of permutations and results.
Within the Data directory here is the first core selection of images.
Supplemental images may be provided in the ResearchContrib directory.  If you
find texts that are particularly difficult to read with the core selections,
you may want to look for alternates in the ResearchContrib directory.

We are interested in your opinion of the image quality and of the number of
images we provide.

## 1 Sinai Palimpsest: @SHELF_MARK@

This data set contains JPEG images of a manuscript imaged under the Sinai
Palimpsests Project.  The purpose of this data set is to provide support for
the characterization of all erased texts of the same language and script found
in a single manuscript.  Please note that typically only palimpsested folios
are imaged, and many palimpsests in the St. Catherine's collection contain
more than undertext language and script.  As such, these images are of only
those folios containing undertexts of the selected language and script, and may
not represent all palimpsest folios from the manuscript.  

## 2 Rights and Conditions of Use

Unless otherwise indicated, all images in this data set are Copyright (c) @YEAR@
St. Catherine's Monastery at Mount Sinai.  All rights reserved. 

No permission is granted to distribute or publish this data set or any of its
contents.

## 3 Intended Audience and Consumers

This data set is intended solely for the use of the party to which it has been
given.  It is designed for scholar use for the identification of palimpsest
undertexts.

## 4 Palimpsest Data Set Purpose

This data set is contains images and supporting information for all palimpsest
folios of a single undertext layer for a single manuscript.  For example, if a
hypothetical manuscript Greek 123 contains Syriac and Greek uncial undertext
layers, a data would contain images of all folios with Syriac undertext or all
folios with Greek uncial undertext.

## 5 Data Set Contents

This data set consists of:

1.  a core content set digital images of the subject manuscript: `Data`

2.  a directory for alternate content files, added to supplement the core
    content set: `ResearchContrib`

### 5.1 Core Data Content

The core content of images and supporting metadata is the focus of the data
set.  For each folio, a comprehensive set of registered images is provided of
each folio containing the selected undertext layers.

The core data includes:

-   Image data consisting of high-resolution JPEG versions of processed images
    of several types intended to enhance visibility of the under text, and 
    a color _surrogate_ images of each folio

#### 5.1.1 Processing types

The images in this data set may include the following processing types:

- Calibrated RGB Reflectance image (`DJK_color`); for example
  `GeoNF-19_004v_28-008_DJK_color_RGB.jpg`.

- Difference image (`DIFF`); for example,
  `Syr-7_047v_14-002_WCB_DIFF-VSGM_3-1-GS.jpg`.  Difference formed by
  subtracting the second listed exposure number from the first listed exposure
  number.

- Fluorescent exposures image (`FLUOR`); for example
  `SyrNF-64_001v_29-002_WCB_FLUOR-V1_17-18-19-RGB.jpg`.  Image generated using
  only fluorescent exposures.

- Independent Component Analysis image (`ICA`); for example,
  `GeoNF-19_004v_28-008_DJK_ICA_01_RGB.jpg` or
  `GeoNF-19_004v_28-008_DJK_color_RGB.jpg`.  An RGB image taken from ICA bands.
  Selected UV, reflective, and transmissive images are used. 

- Principle Components Analysis image (`PCA`); PCA image; for example,
  `GrkNF-MG14_028v_21-032_RLE_PCA_01_RGB.jpg`,
  `GrkNF-MG14_028v_21-032_RLE_PCA_01_RGB.jpg`, or
  `SyrNF-64_004r_29-007_WCB_PCA-V1_1-2-4-RGB.jpg`.  An RGB image created from a
  PCA of normalized reflective and blue fluorescent bands.

- PhotoShoot color image (`PSH_color`); for example,
  `GeoNF-19_054v_28-026_PSH_color.jpg`. A color image generated using the
  PhotoShoot application at time of capture, using images of several of the
  visible wavelengths.

- Pseudocolor image (`KTK_pseudo`); for example,
  `GeoNF-19_053r_28-023_KTK_pseudo_WBUVUVb-MB780IR.jpg`.  A pseudocolor image
  combines two processed images, one from an ultraviolet separation and the
  other from a visible separation.  The erased text is visible in the UV image
  and not in the visible, so it appears as colored in the pseudocolor image.
  The upper text appears as gray or black, i.e. without color.  The images are
  locally adjusted in contrast so that all 500x500 pixel regions have the same
  mean and variance.  The UV processed image is put in the red separation of
  the pseudocolor image and the visible image in the other two separations.
  For this image, the UV image was the WBUVB47 separation and the visible image
  was the MB625Rd separation. In the example, above, the UV image was the
  WBUVUVb separation and the visible images was MB780IR.

- Pseudocolor image (`WCB_PSU`); for example,
  `Grk-962_183r_23-003_WCB_PSU-VSGM-GMA_12-21-21-RGB.jpg`.  Pseudocolor formed
  using one exposure in two channels and one different exposure in the third
  channel.

- Quotient image (`QUOT`); for example,
  `Syr-7_047r_14-001_WCB_QUOT-VGMA_19-12-GS.jpg`. Quotient formed by first
  listed exposure divided by the second listed exposure number. 

- Reflectance and fluorescent image (`REFLU`); for example,
  `Grk-962_183v_11-004_WCB_REFLU_9-19-21-RGB.jpg`. Image generated using
  fluorescent and reflectance exposures.

- Sharpie image (`sharpie`); for example,
  `GeoNF-19_053v_28-024_KTK_sharpie_WBUVB47-MB780IR.jpg`.  A sharpie image is
  the difference of the locally adjusted UV and visible separations of
  pseudocolor images.  Because the upper text appears the same in both, it
  tends to disappear, leaving only the erased text.  For the sample image, the UV
  image was the WBUVB47 separation and the visible image was the MB780IR
  separation.

- Txratio image (`txratio`); for example, `28-024_KTK_txratio_TX940IR-MB940IR.jpg`. A
  txratio image divides the IR transmission image by the IR reflectance images
  and then performs a global adjustment of the contrast.  The result will show
  characters that have eaten away at the parchment, as white-on-black.  For the
  sample image, the transmission image was the TX940IR separation and the
  reflectance image was the MB940IR separation.


#### 5.1.2 File naming

All file names follow strict naming conventions to facilitate easy
identification of file type and content.

Note the following image file names:

     GrkNF-MG99_005r_20-07_KTK_pseudo_WBUVB47-MB625Rd.jpg
     GrkNF-MG99_005r_20-07_KTK_pseudo_WBUVB47-VIS.jpg
     GrkNF-MG99_005r_20-07_KTK_pseudo_WBUVG61-MB625Rd.jpg
     GrkNF-MG99_005r_20-07_KTK_pseudo_WBUVG61-VIS.jpg
     GrkNF-MG99_005r_20-07_KTK_sharpie_WBUVG61-MB625Rd.jpg
     GrkNF-MG99_005r_20-07_KTK_sharpie_WBUVR25-MB625Rd.jpg
     GrkNF-MG99_005r_20-07_PSH_color.jpg
     GrkNF-MG99_005r_20-07_WCB_PCA_RGB_01.jpg

Each file name has this structure:

`<SHELFMARK>_<FOLIOS><SHOT_SEQ>_<PROCESSOR>_<PROCESSING_TYPE>_<MODIFIERS>.<EXT>`

`SHELFMARK` is an abbreviated form of the imaged manuscript's shelf mark;
here, `GrkNF-MG99` for 'Greek NF MG 99'.

`FOLIOS` represents the folio or folios in the image scene; something like
`005v` or `frgs-1r-2r-3r`. The latter is for an image of multiple fragments
assigned the numbers '1r', '2r', and '3r'.

`SHOT_SEQ` is the database identifier of the shot sequence under which this
folio was imaged. Some folios are imaged more than once, and this number
prevents files of the same folio from having duplicate names.

`PROCESSOR` gives the initials of the party responsible for generating the
processed image. The processors are:

  * WCB: Willam Christens-Barry
  * RLE: Roger Easton
  * DJK: David Kelbe
  * KTK: Keith Knox
  * PSH: The PhotoShoot application, which controls the camera and generates
    the `color` images at the time of capture

`PROCESSING_TYPE` is a word or code that indicates the method of processing
used of the type of the resulting image; for example, 'sharpie', 'pseudo',
'PCA'.

`MODIFIERS` is an optional field the processor can use to provide more detail
about processing parameters or methods, or to distinguish similarly named files
from one another using serial number '01', '02', etc. Full details of the
processing are provided in a tag in the image header: `DAT_File_Processing` (in
XMP notation, `ap:DAT_File_Processing`).

`EXT` is the file extension, either 'tif' or 'jpg'.

#### 5.1.2 Metadata

Each image is provided with descriptive metadata in its header giving full
details of the processing methods used to generate it.

The metadata for images complies with the Archimedes Palimpsest project
metadata standard, which is provided with this set as documentation. The
metadata provides investigative, data sharing and scientific information
on the images and transitions.

Metadata are data elements about the content, quality, condition, and
other characteristics of the data sets that make up the digital
holdings. Metadata records are produced according to rules and
definitions governing several subtypes:

1.  Identification Information
2.  Spatial Data Reference Information (images and spatial indexes,
    only)
3.  Imaging and Spectral Data Reference Information (images only)
4.  Data Type Information
5.  Data Content Information
6.  Metadata Reference Information

NOTE: Not all metadata is included with each image.

### 5.2 Contributed Research Files

The Contributed Research data includes supplemental image files.  The core Data
files represent a first selection of image files deemed most likely to
facilitate reading of the under text. However, team scientists may have
produced additional custom images. When available, these images have been
included in the `ResearchContrib` directory.

The `ResearchContrib` directory is a useful place to turn for images to
supplement those found in the `Data` directory.

## 6 How to Use This Data Set

This data set contains supporting documentation to enable discovery of
the data and available access tools. The files named below may be
located by using the file 1\_FileList.txt which accompanies this ReadMe
file.

For General Orientation to the data set, see

-   0\_ReadMe.txt: this file

-   1\_FileIndex.txt: list of files in the data set
