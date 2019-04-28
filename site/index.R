# Created by Michael Cahana in early Apr. 2019

#===========
# standard setup
#===========
root <- getwd()
while(basename(root) != "got_death_bracket") {
  root <- dirname(root)
}
source(file.path(root, "data.R"))

#===========
# needed libraries
#===========
library(rmarkdown)

#===========
# render markdown file
#===========

render(file.path(root, 'site', 'index.Rmd'), 
	output_file = file.path(root, 'index.html'))