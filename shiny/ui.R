library("shiny")
library("shinydashboard")

header <- project.dashboardHeader()

sidebar <- project.dashboardSidebar()

body <- project.dashboardBody()

ui <- dashboardPage(header, sidebar, body, skin = skin_color)
  
