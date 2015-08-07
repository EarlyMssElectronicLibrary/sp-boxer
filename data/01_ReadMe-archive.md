Sinai Palimpsests Project Digital Release
=========================================

# README document for digital archive of Sinai palimpsest @SHELF_MARK@

Authors:

 - Doug Emery
 - Michael B. Toth
 - Michael Phelps

# Sinai Palimpsests Data

This data set includes all captured and processed data from the
spectral imaging of palimpsest folios from @SHELF_MARK@ in the Library
of the Holy Monastery of St. Catherine in the Sinai (the Sinai
Palimpsests Project).

## 1 Sinai Palimpsest: @SHELF_MARK@

This data set contains images of a manuscript digitally imaged during
the Sinai Palimpsests Project between 2009 and 2016 and supporting
metadata. For each folio, a comprehensive set of registered TIFF
images with metadata is provided of the palimpsest leaves imaged.
During this project typically only palimpsested folios are imaged.

## 2 Rights and Conditions of Use

Unless otherwise indicated, all images in this data set are Copyright
(c) @YEAR@ The Holy Monastery of Saint Catherine, Sinai, Egypt

All image metadata by Early Manuscripts Electronic Library is
available for free use with attribution under Creative Commons
Attribution-Noncommercial 4.0 International License

## 3 Intended Audience and Consumers

This data set is intended to serve the preservation of cultural
heritage for future generations of monks, students, scholars,
scientists and the general public and to support online access.

## 4 Palimpsest Data Set Purpose

This data set contains images and supporting information for all
palimpsest folios of a single manuscript to be archived and hosted
online.

## 5 Data Set Contents

This data set consists of:

1.  `01_ReadMe.txt` file: A description of the data set providing an
    orientation to the data including, for example, a list of set
    contents (but not their locations), a summary of the images, and
    rights management.

2.  `Data`: The core data with all images and integrated metadata in
    folders arranged by manuscript.  Each folder contains a subfolder
    by bifolio or folio.

3.  `Documents`: Internal and external documentation, including
    standards and reference documents.

4.  `ResearchContrib` directory: Experimental images and other
    alternate content that contribute to the dataset but are not
    integrated into the core release.

### 5.1 Core Data Content

The core content of the data set comprises images and supporting
metadata for each folio.  For each folio, a comprehensive set of
high-resolution TIFF images is provided:

1.  Captured images: Individual monochrome images from each of
    multiple spectral bands taken with different wavelengths of light
    by a spectral imaging system described in the metadata.

2.  Processed images: Images that have been produced through the
    application of computer algorithms to combine multiple captured
    images to enhance visibility of the under text.  These include
    color surrogate images, which are images with color assigned that
    have been produced through the application of computer algorithms
    to combine multiple captured monochrome images.


#### 5.1.1 Capture types

All images were captured in a series of registered images with a
spectral imaging system comprising a a medium-format monochrome
camera, LED narrowband illumination sources, and a set of filters.

These captured images serve as the core image data for the production
of processed images.  More image capture details, including camera
specifications, number of light sources, wattage, spectral ranges, and
location, are provided in the metadata.

The camera was mounted at nadir above the object.  No acquisition
filters are used in imaging except when specified.  Filtered images
are identified by a symbol corresponding to the light source (always
UV and Blue) and a filter number based on a photographic standard that
identifies the light wavelengths that are filtered.

The manuscript was not moved between each image in a set.  Each image
is illuminated by specific narrowbands of LED illumination from one of
three light sources:

1. Book Cradle configuration

     - MB: Main lighting panels are mounted about 70 degrees above the
       manuscript on each side, with both lights used simultaneously

     - RS, RE: The raking panels are mounted about 15 degrees above
       the manuscript on the "south" and "east" sides of the scene,
       with only one panel on for each exposure.

     - TX: The transmissive panel is underneath the page, and the
       illumination shines through the page.

2. Copystand configuration

     - MB: Main lighting panels are mounted about 45 degrees above the
       manuscript on each side, with both lights used simultaneously

     - RS, RE: The raking panels are mounted about 15 degrees above
       the manuscript on the "southwest" and "northeast" sides of the
       scene, with only one panel on for each exposure.

     - TX: The transmissive panel is underneath the page, and the
       illumination shines through the page.

The illuminations used to produce each image are cited in the filename
(see below). Each group of capture images is a sequence of registered
exposures referred to here as a 'shot sequence'.  Each palimpsest
folio side is captured in at least one shot sequence. Rarely a folio
side will have more than one shot sequence.  Each of the twenty-eight
to thirty-three exposures represents a different combination of
illumination wavelength, light panel(s), and capture filter.  This
information is encoded in the `CAPTURE_DESCRIPTOR`.  The capture
description is one of the following symbols:

  - `MB365UV` - main panel (`MB`), 365 nm, ultraviolet (`UV`) LED
    illumination
  - `MB455RB` - main panel, 445 nm, royal blue (`RB`) LED illumination
  - `MB470LB` - main panel, 470 nm, light blue (`LB`) LED illumination
  - `MB505Cy` - main panel, 505 nm, cyan (`Cy`) LED illumination
  - `MB535Gr` - main panel, 535 nm, green (`Gr`) LED illumination
  - `MB570Am` - main panel, 570 nm, amber (`Am`) LED illumination
  - `MB625Rd` - main panel, 625 nm, red (`Rd`) LED illumination
  - `MB700IR` - main panel, 700 nm, infrared (`IR`) LED illumination
  - `MB735IR` - main panel, 735 nm, infrared (`IR`) LED illumination
  - `MB780IR` - main panel, 780 nm, infrared (`IR`) LED illumination
  - `MB870IR` - main panel, 870 nm, infrared (`IR`) LED illumination
  - `MB940IR` - main panel, 940 nm, infrared (`IR`) LED illumination
  - `RE455RB` - raking panel east (`RE`), 455 nm, royal blue (`RB`) LED
    illumination
  - `RE870IR` - raking panel east, 870 nm, infrared (`IR`) LED
    illumination
  - `RS455RB` - raking panel south (`RS`), 455 nm, royal blue (`RB`) LED
    illumination
  - `RS870IR` - raking panel south, 870 nm, infrared (`IR`) LED
    illumination
  - `TX450RB` - transmissive panel, 450 nm, royal blue (`RB`) LED
    illumination
  - `TX535Gr` - transmissive panel, 535 nm, green (`Gr`) LED illumination
  - `TX570Am` - transmissive panel, 570 nm, amber (`Am`) LED illumination
  - `TX635Rd` - transmissive panel, 635 nm, red (`Rd`) LED illumination
  - `TX700IR` - transmissive panel, 700 nm, infrared (`IR`) LED
    illumination
  - `TX780IR` - transmissive panel, 780 nm, infrared (`IR`) LED
    illumination
  - `TX870IR` - transmissive panel, 870 nm, infrared (`IR`) LED
    illumination
  - `TX940IR` - transmissive panel, 940 nm, infrared (`IR`) LED
    illumination
  - `WBRBG58` - main panel, 445 nm, royal blue (`RB`) illumination, with
    green #58 filter (`G58`)
  - `WBRBO22` - main panel, 445 nm, royal blue illumination, with
    orange #22 filter (`O22`)
  - `WBRBR28` - main panel, 445 nm, royal blue illumination, with
    red #28 filter (`R28`)
  - `WBUVB47` - main panel, 365 nm, ultraviolet (`UV`) illumination,
    with blue #47 filter (`B47`)
  - `WBUVG58` - main panel, 365 nm, ultraviolet illumination, with
    green #58 filter (`G58`)
  - `WBUVO22` - main panel, 365 nm, ultraviolet illumination, with
    orange #22 filter (`O22`)
  - `WBUVR28` - main panel, 365 nm, ultraviolet illumination, with
    red #28 filter (`R28`)
  - `WBUVUVb` - main panel, 365 nm, ultraviolet illumination, with
    ultraviolet blocking filter (`UVb`)
  - `WBUVUVP` - main panel, 365 nm, ultraviolet illumination, with
    ultraviolet pass-through filter (`UVP`)


Values:

The panel symbols are:

- `MB`: Main lighting panels

- `RS`, `RE`: The raking panels

- `TX`: The transmissive panel

- `WB`: Main light panel with filter

#### 5.1.2 Processing types

Each set of captured images is processed using mathematical algorithms
to provide output images that better reveal the undertext of the
palimpsest.  Multiple processing algorithms are used by various tools
and scientists.  More processing details are provided in the processed
image metadata.

The images in this data set may include one or more of the following
processing types:

- Calibrated RGB Reflectance image (`DJK_color`); for example
  `GeoNF-19_004v_28-008_DJK_color_RGB.jpg`.

- Difference image (`DIFF`); for example,
  `Syr-7_047v_14-002_WCB_DIFF-VSGM_3-1-GS.jpg`.  Difference formed by
  subtracting the second listed exposure number from the first listed
  exposure number.

- Fluorescent exposures image (`FLUOR`); for example
  `SyrNF-64_001v_29-002_WCB_FLUOR-V1_17-18-19-RGB.jpg`.  Image
  generated using only fluorescent exposures.

- Independent Component Analysis image (`ICA`); for example,
  `GeoNF-19_004v_28-008_DJK_ICA_01_RGB.jpg` or
  `GeoNF-19_004v_28-008_DJK_color_RGB.jpg`.  An RGB image taken from
  ICA bands.  Selected UV, reflective, and transmissive images are
  used.

- Principle Components Analysis image (`PCA`); PCA image; for example,
  `GrkNF-MG14_028v_21-032_RLE_PCA_01_RGB.jpg`,
  `GrkNF-MG14_028v_21-032_RLE_PCA_01_RGB.jpg`, or
  `SyrNF-64_004r_29-007_WCB_PCA-V1_1-2-4-RGB.jpg`.  An RGB image
  created from a PCA of normalized reflective and blue fluorescent
  bands.

- Proprietary color processed image (`PSH_color`); for example,
  `GeoNF-19_054v_28-026_PSH_color.jpg`.  A color image generated using
  a proprietary application at time of capture, using images of
  several of the visible wavelengths.

- Pseudocolor image (`KTK_pseudo`); for example,
  `GeoNF-19_053r_28-023_KTK_pseudo_WBUVUVb-MB780IR.jpg`.  A
  pseudocolor image combines two processed images, one from an
  ultraviolet separation and the other from a visible separation.  The
  erased text is visible in the UV image and not in the visible, so it
  appears as colored in the pseudocolor image.  The upper text appears
  as gray or black, i.e. without color.  The images are locally
  adjusted in contrast so that all 500x500 pixel regions have the same
  mean and variance.  The UV processed image is put in the red
  separation of the pseudocolor image and the visible image in the
  other two separations.  For this image, the UV image was the WBUVB47
  separation and the visible image was the MB625Rd separation. In the
  example, above, the UV image was the WBUVUVb separation and the
  visible images was MB780IR.

- Pseudocolor image (`WCB_PSU`); for example,
  `Grk-962_183r_23-003_WCB_PSU-VSGM-GMA_12-21-21-RGB.jpg`.
  Pseudocolor formed using one exposure in two channels and one
  different exposure in the third channel.

- Quotient image (`QUOT`); for example,
  `Syr-7_047r_14-001_WCB_QUOT-VGMA_19-12-GS.jpg`. Quotient formed by
  first listed exposure divided by the second listed exposure number.

- Reflectance and fluorescent image (`REFLU`); for example,
  `Grk-962_183v_11-004_WCB_REFLU_9-19-21-RGB.jpg`. Image generated
  using fluorescent and reflectance exposures.

- Sharpie image (`sharpie`); for example,
  `GeoNF-19_053v_28-024_KTK_sharpie_WBUVB47-MB780IR.jpg`.  A sharpie
  image is the difference of the locally adjusted UV and visible
  separations of pseudocolor images.  Because the upper text appears
  the same in both, it tends to disappear, leaving only the erased
  text.  For the sample image, the UV image was the WBUVB47 separation
  and the visible image was the MB780IR separation.

- Txratio image (`txratio`); for example,
  `28-024_KTK_txratio_TX940IR-MB940IR.jpg`. A txratio image divides
  the IR transmission image by the IR reflectance images and then
  performs a global adjustment of the contrast.  The result will show
  characters that have eaten away at the parchment, as white-on-black.
  For the sample image, the transmission image was the TX940IR
  separation and the reflectance image was the MB940IR separation.


#### 5.1.3 File naming

All file names follow strict naming conventions to facilitate easy
identification of file type and content.

##### 5.1.3.1 Captured Image Names

Each file name of a captured image contains the following string of
information, with each segment of the filename separated by underscore
characters:

    <SHELFMARK>_<FOLIO><SHOT_SEQ>+<CAPTURE_DESCRIPTOR><SERIALNO>_F.<EXT>

Where:

  - `SHELFMARK` is the manuscript's shelf mark

  - `FOLIO` is the bifolio, folio, or folio fragment imaged

  - `SHOT_SEQ` is the identifier of the shot sequence for this image

  - `CAPTURE_DESCRIPTOR` is imaging illumination details and type of
    illumination source

  - `SERIALNO` is the serial number of the exposure during imaging

  - `EXT` is `.tif` for a TIFF image and `.jpg` for a JPEG image

The basic file name structure is illustrated by the following captured
file name: `GrkNF-MG99_20-9_6r+MB365UV_007.tif`

The components of a captured image file name are:

  - Shelfmark: `GrkNF-MG99` for 'Greek NF MG 99'

  - Bifolio (or Folio or fragments): `6r`, the folio or folios in the
    image scene

  - Shot sequence identifier: `20-9`, the grouping of all registered
    images of this subject captured in this group of exposures; here,
    for shot sequence with identifier `9` in shoot list `20`

  - Imaging Illumination details preceded by a + sign: `+MB365UV`
    Illumination light source `MB` for the main panel LED lights
    mounted about above the manuscript on each side of the camera lens

    - Serial number: `007`, three digit serial number, between 001 and
    033, for the image within this sequence of exposures; thus, `007`
    for the 7th image

  - Flattening flag: A set of "flats" is captured at the beginning of
    each imaging setup.  These are an image sequence taken of a
    standard white sheet of paper.  This is used to "flatten" the
    captured images, which eliminates differences in captured images
    caused by variability in illumination or flaws in the camera
    sensor.  The proprietary imaging software creates a flattened
    image based on the flat file and the captured palimpsest image.
    It classifies pixels as normal and abnormal based on the "flats."
    Some of the abnormal pixels in the captured image may then be
    adjusted during flattening.  These flattened images have an "_F"
    suffix denoting that they are flattened.  The metadata includes
    the name of the flat file that was used to create the
    corresponding flattened image.  These captured and flattened
    images serve as the core image data for the production of
    processed images.

  - Extension: `tif`

This filename indicates the file an image of Greek NF MG 99 folio 6
recto and was taken as a part of shot sequence `20-9`.  It was
illuminated by both main panel 365 nm ultraviolet LED lights and was
assigned serial number 7.  It was flattened upon conversion to TIFF
format.  Additional information about the image collection parameters
is contained in the metadata.

NOTES:

- Shot sequences: Through rare, a folio is sometimes imaged more than
  once as part of separate shoot lists, and therefore as a different
  shot sequence. For example, a folio may have been imaged on the book
  cradle and then again later on the copystand. One of functions of
  shot sequences is to differentiate distinct sequences of images of
  the same folio.

- Flattening: A set of "flats" is captured at the beginning of each
  imaging setup.  These are an image sequence taken of a standard
  white sheet of paper. This is used to "flatten" the captured images,
  which eliminates differences in captured images caused by
  variability in illumination or flaws in the camera sensor.  The
  proprietary imaging software creates a flattened image based on the
  flat file and the captured palimpsest image. It classifies pixels as
  normal and abnormal based on the "flats." Some of the abnormal
  pixels in the captured image may then be adjusted during flattening.
  These flattened images have an `_F` suffix denoting that they are
  flattened. The metadata includes the name of the flat file that was
  used to create the corresponding flattened image.  These captured
  and flattened images serve as the core image data for the production
  of processed images.

These captured images serve as the core image data for the production
of processed images.

##### 5.1.3.2 Processed Image Names

The processed file names use a combination of multiple symbols for the
wavelengths of the captured images used for developing the processed
images.

Each file name of a captured image contains the following string of
information, with each segment of the filename separated by underscore
characters:

`<SHELFMARK>_<FOLIOS><SHOT_SEQ>_<PROCESSOR>_<PROCESSING_TYPE>_<MODIFIERS>.<EXT>`

`PROCESSOR` gives the initials of the party responsible for generating
the processed image. The processors are:

  - `WCB`: Willam Christens-Barry
  - `RLE`: Roger Easton
  - `DJK`: David Kelbe
  - `KTK`: Keith Knox
  - `PSH`: The automated imaging application that controls the camera
    and generates the `color` images at the time of capture

`PROCESSING_TYPE` is a word or code that indicates the method of
processing used of the type of the resulting image; for example,
'sharpie', 'pseudo', 'PCA'.

`MODIFIERS` is an optional field the processor can use to provide more
detail about processing parameters or methods, or to distinguish
similarly named files from one another using serial number '01', '02',
etc. Full details of the processing are provided in a tag in the image
header: `DAT_File_Processing` (in XMP notation,
`ap:DAT_File_Processing`).

`EXT` is the file extension, either 'tif' or 'jpg'.

The basic file name structure is illustrated by the following
processed image file name:
`GrkNF-MG99_116r-121v_20-07_WCB_PCA_RGB_01.tif`

The components of this sample file name are:

  - Shelfmark: `Greek_NF_MG_99`

  - Bifolio (or Folio): `116r-121v`

  - A 2-digit numbers or wavelength symbols indicating the
    illumination light sources combined to create the processed image:
    Images 20 to 07

  - Processor: Initials of the scientist who processed the image (not
    included in color images): `WCB` (William Christens-Barry)

  - Processing type and modifier, with some images including a hyphen
    and number further describing the processing type, e.g. pca-2lab,
    indicating a color processed image: `PCA`

  - Modifier: Additional information about the image: Color image
    combining the RGB channels extension: always `tif` or `jpg`

#### 5.1.4 Metadata

Each image is provided with descriptive metadata in its header giving
full details of the processing methods used to generate it.

The metadata for images complies with the Archimedes Palimpsest
Project Metadata Standard used for spectral imaging projects.  This is
provided with this set as documentation.  The metadata provides
investigative, data sharing and scientific information on the images
and transitions.

Metadata are data elements about the content, quality, condition, and
other characteristics of the data sets that make up the digital
holdings.  Metadata records are produced according to rules and
definitions governing several subtypes:

1.  Identification Information
2.  Spatial Data Reference Information (images and spatial indexes,
    only)
3.  Imaging and Spectral Data Reference Information (images only)
4.  Data Type Information
5.  Data Content Information
6.  Metadata Reference Information

NOTE: Not all metadata is included with each image.

### 5.2 ResearchContrib Files

The Contributed Research data, if included, contains supplemental
image files.  The core Data files represent all captured and standard
processed images for a folio. When available, additional processed
images have been included in the `ResearchContrib` directory.

## 6 How to Use This Data Set

This data set contains supporting documentation to enable discovery of
the data and available access tools. The files named below may be
located by using the file 1\_FileList.txt which accompanies this
ReadMe file.

For General Orientation to the data set, see

-   `0_ReadMe.txt`: this file

-   `1_FileIndex.txt`: list of files in the data set
