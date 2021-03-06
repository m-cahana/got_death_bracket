# Install necessary packages

packages <- c('tidyverse', 'readxl', 'rmarkdown', 'knitr', 'prettydoc', 
	'plotly', 'fontawesome', 'kableExtra')

check_install <- function(pkg){
	if(!(pkg %in% installed.packages())){
		install.packages(pkg, repos="http://cran.rstudio.com/")
		return(paste(pkg, " is now installed"))
	} else {
		return(paste(pkg, " is already installed"))
	}
}

lapply(packages, check_install)
