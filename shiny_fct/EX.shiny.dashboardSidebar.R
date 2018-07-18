project.dashboardSidebar <- function()
{
  dashboardSidebar(
    sidebarMenu(
      br(),
      menuItem("Welcome", tabName = "tab_wel", icon=icon("fas fa-bullhorn")),
      br(),
      menuItem("Options", tabName = "tab_opti", icon=icon("fas fa-cogs")),
      br(),
      actionButton("FB","First Button"),
      br(),
      actionButton("SB","Second Button"),
      br(),
      menuItem("Graphic outputs", tabName = "tab_plot", icon=icon("fas fa-desktop")),
      menuItem("Download results", tabName = "tab_resu", icon=icon("fas fa-download"),
               br(),
               downloadButton("dl1","First Download"),
               br(),
               br(),
               downloadButton("dl2","Second Download")),
      br(),
      menuItem("The model", tabName = "tab_help", icon=icon("fas fa-info-circle"))
    )
  )
}