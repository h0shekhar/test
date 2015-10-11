library(shiny)
library(UsingR)
data(galton)


shinyServer(
  function(input, output){
    output$oid1<- renderPrint({input$id1})
    output$oid2<- renderPrint({input$id2})
    output$oid3<- renderPrint({input$date})
    output$mu<- renderPrint({input$mu})
    output$mse<- renderPrint(round(mean((galton$child - {input$mu})^2),2))
    
    
    output$newHist <- renderPlot({
      hist(galton$child, xlab="Child Height", col="lightblue", main="Histogram")
      mu <-input$mu
      lines(c(mu,mu), c(0,300), col="red", lwd=5)
      mse <-mean((galton$child - mu)^2)
      text(63,150,paste("mu =", mu))
      text(63,140,paste("MSE =", round(mse,2)))
    })        
  }
  )