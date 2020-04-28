#UI file for the application

#Uses the iris dataset and provides basic interactive visualization capability

library(shiny)
library(markdown)

shinyUI(navbarPage(
    "Shiny App using Iris Dataset",
    tabPanel("Home",
             # Sidebar with a slider input for number of bins or class #intervals
             sidebarLayout(
                 sidebarPanel(
                     selectInput(
                         "var",
                         label = "Choose an attribute",
                         choices = c(
                             "Sepal.Length" = 1,
                             "Sepal.Width" = 2,
                             "Petal.Length" = 3,
                             "Petal.Width" = 4
                         ),
                         selected = 3
                     ), 
                     sliderInput(
                         "bin",
                         "Select the number of BINS",
                         min = 10,
                         max = 60,
                         value = 5
                     ),
                     radioButtons(
                         "radio",
                         label = "Pick a color for the histogram",
                         choices = c("Blue", "Green", "Yellow"),
                         select = "Blue"  #default selection
                     )
                 ),
                 # Main Panel - Show a plot of the generated distribution
                 mainPanel(
                     # textOutput("text0species"),
                     textOutput("text1var"),
                     textOutput("text2bin"),
                     textOutput("text3colour"),
                     plotOutput("distPlot")
                 )
             )),
    tabPanel("Directions",
             mainPanel(includeMarkdown("Documentation.md")))
))