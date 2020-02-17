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

# directories
DIR = ${CURDIR}
code = $(DIR)/code
site = $(DIR)/site

# data files
brackets = $(DATA)/brackets
results = $(DATA)/results

INSTALL := $(shell Rscript $(code)/package_installation.R)

all : $(DIR)/index.html

# ===========================================================================
# Score brackets
# ===========================================================================

$(results)/scores.csv: \
	$(code)/score_brackets.R \
	$(DATA)/master.xlsx \
	$(brackets)
	Rscript $<

# ===========================================================================
# Visualize 
# ===========================================================================

$(results): \
	$(code)/visualize_scores.R \
	$(results)/scores.csv 
	Rscript $<

# ===========================================================================
# Site
# ===========================================================================

$(DIR)/index.html: \
	$(site)/index.R \
	$(site)/index.Rmd \
	$(results)
	Rscript $<