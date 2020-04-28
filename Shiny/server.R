# 
#

library(shiny)
library(markdown)


library(shiny)
data("iris")
shinyServer(function(input, output) {
    output$text1var <- renderText({
        colm = as.numeric(input$var)
        paste("Here is your histogram with", names(iris[colm]), " as column with", input$bin, "histogram bins in", input$radio)
    })
    
    
    output$distPlot <- renderPlot({
        colm = as.numeric(input$var)
        hist(
            iris[, colm],
            freq = FALSE,
            col = input$radio,
            xlab = names(iris[colm]),
            main = "Histogram",
            breaks = seq(0, max(iris[, colm]), l = input$bin + 1)
        )
        
        # add a normal distribution line in histogram
        curve(dnorm(x,
                    mean = mean(iris[, colm]),
                    sd = sd(iris[, colm])),
              add = TRUE,
              col = "red") #line
    })
    
})