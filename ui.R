shinyUI(fluidPage(
  headerPanel("Character frequency in text"),
  sidebarPanel(textInput("id1", "Enter text to analyze", value = "", width = 1000, placeholder = NULL)),
  sidebarPanel("Documentation: The user enters some text input in the box to the left. The app computes how frequently each letter of the alphabet appears in the user's input, 
and outputs a table listing how frequently each letter appears. The letters are listed in decreasing order of frequency. 
               Also, a scatterplot of the frequency per letter is output."),
  mainPanel(
    h3('Output'),
    h4('You entered'),
    verbatimTextOutput("oid1"),
    h4('Sorted frequency table'),
    tableOutput("count_table"),
    h4('Percentage plot'),
    plotOutput("percentageplot")
  )
  ))

