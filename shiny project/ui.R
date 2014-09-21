
library(shiny)
library(caret)
shinyUI(pageWithSidebar(
  headerPanel("Prediction of son's height from father's height"),
  sidebarPanel(
    numericInput('fheight', 'Father height inches',value = 60, min = 40, max = 80, step = 0.01),
    submitButton('Submit')
  ),
  mainPanel(
    h2('Results of prediction'),
    h4('Father Height you entered'),
    verbatimTextOutput("inputValue"),
    h4('Son Height Bottom Line'),
    verbatimTextOutput("lwr"),
    h4('Son Height Upper Line'),
    verbatimTextOutput("upr")
  )
))
