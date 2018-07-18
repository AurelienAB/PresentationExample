# Load packages for the computation (all paths used are defined in ../shiny/global.R)

list.of.packages <- c()
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages,function(x){library(x,character.only=TRUE)}) 

# Load functions for computation

sapply(list.files(pattern="[.][r,R]$", path=path_functions, full.names=TRUE), source)