# This file is appended to the main Makefile,
# if the operating system is detected as Windows

### User settings

FONTFAMILY ?= 1 # MS font family is used

### User rules

INDENT_SETTINGS ?= indent.yaml
ifeq ($(INDENT_FILES),)
INDENT_FILES += $(wildcard Dissertation/part*.tex)
INDENT_FILES += Synopsis/content.tex
INDENT_FILES += Presentation/content.tex
endif
##! format *.tex files
indent:
	@$(foreach file, $(INDENT_FILES),\
	latexindent -l=$(INDENT_SETTINGS) -s -w $(file) &&)\
	echo "done"

##! format *.tex files with wrapped long lines
indent-wrap: INDENT_SETTINGS+=-m
indent-wrap: indent

.PHONY: indent indent-wrap
