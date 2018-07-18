project.dashboardBody <- function()
{
  dashboardBody(
    
    useShinyalert(),                                         # For pop-up windows
    useShinyjs(),                                            # For javascript functions (enable/disable buttons or text)
    tags$head(tags$style(HTML('.modal-lg {width: 95%;}'))),  # Define modal (pop up windows) large size.
    
    fluidPage(
      tabItems(
        
        # Welcome page with instructions and contacts
        tabItem("tab_wel",
                includeHTML("./html/about.html")
                ),
        
        # Options page
        tabItem("tab_opti",
                box(title="Start date",
                    dateInput("date_input1", "Date:", value = startDate)),
                
                box(title = "Upload a .csv file here",
                    status = status_color,
                    solidHeader = TRUE,
                    fileInput('in_X', 'Choose a file to upload',
                              accept=c(".csv")))),
        
        
        
        # Graphics page
        tabItem("tab_plot",
                box(title="Pop-Up dygraph example",
                    actionButton("plot_button", "plot_test1"),
                    bsModal("modalExample", "Your plot", "plot_button", 
                            size = "large",dygraphOutput("plot_test1"))),
                
                box(title="GGPlotly example",
                    status=status_color,
                    width=11,
                    solidHeader=TRUE,
                    collapsible=TRUE,
                    collapsed=TRUE,
                    plotlyOutput("plot_test2"))
                ),

        # Help page with model informations
        tabItem("tab_help",
                withMathJax(includeMarkdown('./markdown/model.Rmd'))
				)
			)
		)
	)
}