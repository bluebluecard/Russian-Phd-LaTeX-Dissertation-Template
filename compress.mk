### PDF compression with Ghostscript.
#
# gs command reference: https://www.ghostscript.com/doc/current/VectorDevices.htm
# (!) Ghostscript silently ignores unknown parameters.


# Fix for MSYS2 make to disable automatic path mangling. See:
#  * https://stackoverflow.com/a/34386471/1032586
#  * https://github.com/msys2/msys2/wiki/Porting#user-content-filesystem-namespaces
FULL_MAKE_VERSION_INFO := $(shell $(MAKE) --version)   # e.g. "GNU Make 4.2.1 Built for x86_64-pc-msys ... "
ISMSYS_MAKE := $(findstring msys,$(FULL_MAKE_VERSION_INFO))
MSYS_FIX := MSYS_NO_PATHCONV=1 MSYS2_ARG_CONV_EXCL="*"
MSYS_FIX := $(if $(ISMSYS_MAKE),$(MSYS_FIX),)

# File to be recompressed
COMPRESS_FILE ?= $(TARGET)

# Do not stop after each page
COMPRESSION_FLAGS_COMMON += -P- -dSAFER -dBATCH -dNOPAUSE

# Output device
COMPRESSION_FLAGS_COMMON += -sDEVICE=pdfwrite

# Embed fonts into PDF
COMPRESSION_FLAGS_COMMON += -dEmbedAllFonts=true -dSubsetFonts=true

# gs developers do not recommend `-dPDFSETTINGS` presets unless you clearly understand all
# details ( https://stackoverflow.com/a/30860751/1032586 ); explicitly setting required values is safer.
# COMPRESSION_FLAGS_COMMON += -dPDFSETTINGS=/default

# Do not show page counter
COMPRESSION_QUIET ?= no
ifneq ($(COMPRESSION_QUIET),no)
COMPRESSION_FLAGS_COMMON += -q
endif

### (1) Rebuild PDF to reduce size by lowering image quality --------------------------
# (tune `COMPRESSION_IMAGE_DPI` until acceptable output size is reached)
COMPRESSION_IMAGE_DPI ?= 144
COMPRESSION_FLAGS_1 = $(COMPRESSION_FLAGS_COMMON)

COMPRESSION_FLAGS_1 += -dDownsampleColorImages=true
COMPRESSION_FLAGS_1 += -dColorImageDownsampleThreshold=1.5
COMPRESSION_FLAGS_1 += -dColorImageDownsampleType=/Average  # Bicubic may produce color artifacts
COMPRESSION_FLAGS_1 += -dColorImageFilter=/DCTEncode        # /DCTEncode = jpg, lossy
COMPRESSION_FLAGS_1 += -dColorImageResolution=$(COMPRESSION_IMAGE_DPI)

COMPRESSION_FLAGS_1 += -dDownsampleGrayImages=true
COMPRESSION_FLAGS_1 += -dGrayImageDownsampleThreshold=1.5
COMPRESSION_FLAGS_1 += -dGrayImageDownsampleType=/Bicubic
COMPRESSION_FLAGS_1 += -dGrayImageFilter=/DCTEncode
COMPRESSION_FLAGS_1 += -dGrayImageResolution=$(COMPRESSION_IMAGE_DPI)

COMPRESSION_FLAGS_1 += -dDownsampleMonoImages=true
COMPRESSION_FLAGS_1 += -dMonoImageDownsampleThreshold=1.5
COMPRESSION_FLAGS_1 += -dMonoImageDownsampleType=/Subsample
COMPRESSION_FLAGS_1 += -dMonoImageFilter=/CCITTFaxEncode
COMPRESSION_FLAGS_1 += -dMonoImageResolution=$(COMPRESSION_IMAGE_DPI)


##! lossy file compression
compress-lowdpi:
	$(MSYS_FIX) gs $(COMPRESSION_FLAGS_1) \
		-sOutputFile=$(basename $(COMPRESS_FILE))_lowdpi.pdf \
		$(basename $(COMPRESS_FILE)).pdf



### (2) PDF rebuild for print-shop delivery -----------------------------------------------------------
COMPRESSION_FLAGS_2 = $(COMPRESSION_FLAGS_COMMON)

# Transparency
# A print shop may require a file "without transparency" or warn that transparency may print unpredictably
# in output. A requirement for "PDF 1.3" or "PDF/X-1a" also implies no transparency.
# To remove transparency, gs rasterizes the whole page.
# Example of a rasterized page: the template title page. Although the logo has no visible transparency,
# it is formally present and related validation checks fail.
COMPRESSION_FLAGS_2 += -dHaveTransparency=false
COMPRESSION_FLAGS_2 += -dCompatibilityLevel=1.3

# Rasterization resolution
# Recommended black-and-white image resolution is usually 1000..1200 dpi. To minimize impact on
# normal text (which may also be present on the page), use a similar resolution,
# even though the image may become color (if the page contains an illustration).
# Potential issue: some print shops warn that all color images above a certain resolution
# will be resampled to a lower resolution.
COMPRESSION_FLAGS_2 += -r1200

# Convert all fonts to outlines
# If true, text will no longer be selectable and file size increases. This can help
# when some fonts cannot be embedded due to licensing limits, and may still be
# recommended by some print shops. This is not the same as rasterization.
COMPRESSION_FLAGS_2 += -dNoOutputFonts=false

# RGB -> CMYK
# A print shop may require a file "in CMYK" or warn that RGB may print unpredictably.
# Besides DeviceCMYK, the output PDF also contains DeviceGRAY.
COMPRESSION_FLAGS_2 += -dProcessColorModel=/DeviceCMYK
COMPRESSION_FLAGS_2 += -sColorConversionStrategy=CMYK

# Because of RGB->CMYK conversion, images should be recompressed. For print delivery it is reasonable
# to keep compression lossless and resolution unchanged if file size remains acceptable.
COMPRESSION_FLAGS_2 += -dDownsampleColorImages=false
# COMPRESSION_FLAGS_2 += -dColorImageResolution=300
# COMPRESSION_FLAGS_2 += -dColorImageDownsampleThreshold=1.5
# COMPRESSION_FLAGS_2 += -dColorImageDownsampleType=/Average
COMPRESSION_FLAGS_2 += -dAutoFilterColorImages=false
COMPRESSION_FLAGS_2 += -dColorImageFilter=/FlateEncode   # /FlateEncode = zip, lossless

COMPRESSION_FLAGS_2 += -dDownsampleGrayImages=false
# COMPRESSION_FLAGS_2 += -dGrayImageResolution=300
# COMPRESSION_FLAGS_2 += -dGrayImageDownsampleThreshold=1.5
# COMPRESSION_FLAGS_2 += -dGrayImageDownsampleType=/Bicubic
COMPRESSION_FLAGS_2 += -dAutoFilterGrayImages=false
COMPRESSION_FLAGS_2 += -dGrayImageFilter=/FlateEncode

COMPRESSION_FLAGS_2 += -dDownsampleMonoImages=false
# COMPRESSION_FLAGS_2 += -dMonoImageResolution=1200
# COMPRESSION_FLAGS_2 += -dMonoImageDownsampleThreshold=1.5
# COMPRESSION_FLAGS_2 += -dMonoImageDownsampleType=/Subsample
COMPRESSION_FLAGS_2 += -dAutoFilterMonoImages=false
COMPRESSION_FLAGS_2 += -dMonoImageFilter=/FlateEncode

# For PDF output, Ghostscript supports only limited color-management controls.
#  * Of everything described in https://www.ghostscript.com/doc/9.26/GS9_Color_Management.pdf ,
#    in practice only sDefaultRGBProfile affects color conversion values. Also, when building
#    PDF/X-3 you can embed an Output Intent ICC profile (a later conversion stage).
#  * DefaultGrayProfile and sDefaultCMYKProfile do not affect output because those colors are not converted.
#    sOutputICCProfile, dRenderIntent, dUseFastColor, etc., also do not work here.
#
# Print input color space is almost always already sRGB (where your images are likely stored).
# Ghostscript default CMYK conversion can clip the most saturated colors.
# For example, both RGB(255,0,0) and RGB(240,0,0) map to CMYK(0,1,1,0), reducing color distinguishability.
# Distinctions may degrade/disappear, so review sensitive spots after conversion. In average cases,
# nothing critical should happen.
#
# For precise color management, options include rasterizing to TIFF (`-sDEVICE=tiff32nc`),
# or using ICCBased colors (`-sColorConversionStrategy=UseDeviceIndependentColor`). Both options
# should be agreed with your print shop in advance (if you know why you need this, you likely know
# what you are doing).
#
# COMPRESSION_FLAGS_2 += -I.  # allows loading profile files from the current directory
# COMPRESSION_FLAGS_2 += -sDefaultRGBProfile="default_rgb.icc"


##! compress file with CMYK conversion
compress-cmyk:
	$(MSYS_FIX) gs $(COMPRESSION_FLAGS_2) \
		-sOutputFile=$(basename $(COMPRESS_FILE))_cmyk.pdf \
		$(basename $(COMPRESS_FILE)).pdf

.PHONY: compress-lowdpi compress-cmyk
