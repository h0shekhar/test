library(shiny)
shinyUI( pageWithSidebar(
  headerPanel("Data Science with FTW"),
  
  sidebarPanel(
    h3("Input Values"),
    numericInput('id1','Numeric Input:', 0, min=0,max=10,step=1),
    checkboxGroupInput('id2', "Choice:", 
                      c("Value 1"="1","Value 2"="2","Value 3"="3")),
    dateInput("date","Date:"),
    sliderInput('mu','Guess at the Mean:',value=70,min=62,max=74,step=0.05)
    #, submitButton('Submit')
    ), 
  
  mainPanel(
    h3("Selection"),
    verbatimTextOutput("oid1"),
    verbatimTextOutput("oid2"),
    verbatimTextOutput("oid3"),
    verbatimTextOutput("mu"),
    verbatimTextOutput("mse"),
    plotOutput('newHist')
    )
  )
  )