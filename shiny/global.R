# Authors : Aurelien Ancelin-Binet, Irina Kouvabina
# Contact : aurelien.ancelin-binet@engie.com ; irina.kouvabina@gmail.com
#
# Global environment of the R session

rm(list=ls())
Sys.setlocale("LC_TIME", "C")  # R in English
set.seed(1)

# Packages used for shiny app

list.of.shiny.packages <- c("shiny","shinyjs","shinyalert","shinyBS","shinydashboard","htmltools","markdown")
list.of.graphic.packages <- c("plotly","dygraphs")
new.packages <- list.of.shiny.packages[!(list.of.shiny.packages %in% installed.packages()[,"Package"])]
new.packages <- c(new.packages,list.of.graphic.packages[!(list.of.graphic.packages %in% installed.packages()[,"Package"])])

if(length(new.packages)) install.packages(new.packages)
lapply(c(list.of.shiny.packages,list.of.graphic.packages),function(x){library(x,character.only=TRUE)}) 

# Global paths used (ADAPT IT TO YOUR WORK ENVIRONMENT)

project_dir <- "C:/Users/LB5553/R/shiny/PresentationExample/"

path_data <- paste0(project_dir,"data/")
path_out <- paste0(project_dir,"out/")
path_functions <-  paste0(project_dir,"fct/")
path_scripts <-  paste0(project_dir,"script/")
path_data <-  paste0(project_dir,"data/")
path_out<- paste0(project_dir,"out/" )

setwd(project_dir)

# Load functions used for shiny app :

project_title <- "Dashboard Demo"
skin_color <- "green"
status_color <- "success"
startDate <- as.Date(Sys.time(),format="%Y-%m-%d")

sapply(list.files(pattern="[.][r,R]$", path=paste0(project_dir,"shiny_fct/"), full.names=TRUE), source)

# Load packages and function for the computations :

source(file=paste0(project_dir,"script/EX.Intro.R"))

# Timezone used :

project_tz="Europe/Paris"

# Color code, icon and status used for the dashboard :

color.blue = c("cyan","deepskyblue2","darkblue")
color.red=c("indianred1","firebrick1","red1")

icon_current <- "fas fa-spinner"
icon_wrong <- "fas fa-times-circle"
icon_right <- "fas fa-check-circle"
icon_warning <- "exclamation-triangle"

status_current <- "info"
status_warning <- "warning"
status_wrong <- "danger"
status_right <- "success"