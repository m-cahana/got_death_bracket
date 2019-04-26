# To run this makefile, make sure you have a local data.txt that holds 
# the directory path to the data

# ===========================================================================
# establish directory paths
# ===========================================================================
# load in a local .txt file that holds the directory path to the data
ifeq ($(OS), Windows_NT)
	DATA = $(file < paths.txt)
else
	DATA = $(shell cat paths.txt)
endif

DIR = ${CURDIR}

code = $(DIR)/code
output = $(DIR)/output

# data files
brackets = $(DATA)/brackets

INSTALL := $(shell Rscript $(CDIR)/package_installation.R)

all : # some future markdown file


