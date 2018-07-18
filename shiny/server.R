server <- function(input, output, session) { 
  
  shinyjs::disable("dl1")
  shinyjs::disable("dl2")

  ###############################################
  #             REACTIVE VALUES :               #
  ###############################################

  rv <- reactiveValues(X=data.frame(),
                       messageNotif=data.frame(
                                    from = c("First message","Second message","Third message"),
                                    message = c("Change date in options & observe below", paste0("Initial date: ", as.character(startDate)), "Same as initial date ?"),
                                    icon = c(icon_warning, icon_right, icon_right),
                                    time = c(NULL, NULL, as.character(Sys.time())),
                                    stringsAsFactors = FALSE
                                  ))
  
  ###############################################
  #               NOTIFICATIONS :               #
  ###############################################
  
  output$notif <- renderMenu({
    
    notifs <- apply(rv$messageNotif, 1, function(row) {
      messageItem(
        from = row[["from"]],
        message = row[["message"]],
        icon = icon(row[["icon"]]),
        time = row[["time"]]
      )
    })
    dropdownMenu(type = "messages",
                 .list = notifs
                 )
    })
  
  observe({
    rv$messageNotif$icon[[3]] <- dplyr::if_else(as.Date(input$date_input1, format="%Y-%m-%d") == startDate, icon_right, icon_wrong)
  })
  
  ###############################################
  #                  UPLOAD :                   #
  ###############################################
  
  in_X <- reactive({
    infile <- input$in_X
    if (!is.null(infile)) read.csv(infile$datapath, header=TRUE, sep=";", stringsAsFactors=FALSE) else NULL
  })
  
  observe({
    rv$X <- in_X()
    if(!is.null(rv$X)) shinyjs::enable("dl1")
    print(head(rv$X))
  })
  
  ###############################################
  #                 DOWNLOAD :                  #
  ###############################################
  
  output$dl1 <- downloadHandler(
    filename = function() {
      paste("example_results", ".csv", sep = "")
    },
    content = function(file) {
      write.table(rv$X, file, sep=";", row.names=FALSE, dec=",")
      
    }
  )
  
  ###############################################
  #               FIRST BUTTON :                #
  ###############################################
  
  observeEvent(input$FB, {
    shinyalert(title = "You clicked on the first button",
               text = "Click ok, press escape or click anywhere outside this box to dismiss",
               closeOnClickOutside = TRUE,
               type = "success")
    })
  
  
  ###############################################
  #              SECOND BUTTON :                #
  ###############################################
  
  observeEvent(input$SB, {
    computeSB()
  })
  
  computeSB <- reactive({
    shinyalert(title = "You clicked on the second button",
               text = "Click ok, press escape or click anywhere outside this box to dismiss",
               closeOnClickOutside = TRUE,
               type = "success")
    shinyjs::disable("SB")
  })

  ###############################################
  #                  PLOTS :                    #
  ###############################################
    
    output$plot_test1 <- renderDygraph({
      myDates <- seq(as.Date("2014-01-13"), as.Date("2015-01-13"), by="days")
      myData <- data.frame(myDates,sample(1:10000,size=length(myDates))/5000)
      colnames(myData)=c('Dates','Data')
      rownames(myData)=myDates
      dyRangeSelector(dygraph(myData))
      })
    
    output$plot_test2 <- renderPlotly({
      ggiris <- qplot(Petal.Width, Sepal.Length, data = iris, color = Species)
      ggplotly(ggiris)
    })
    
}