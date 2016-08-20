library(shiny)
library(stringr)
library(ggplot2)

unordered_table<-function(mystring)
{ mystring<-tolower(mystring)
  count_vector<-as.integer("")
  j<-1
  for (i in letters)  { count_vector[j]<-str_count(mystring, i)
      j<-j+1
    }
  len<-sum(count_vector)
  freq<-100*count_vector/len
  df<-data.frame(letters, count_vector, freq)
}

ordered_table<-function(mystring)
{
  df<-unordered_table(mystring)
  df<-df[order(df$count_vector, decreasing=TRUE),]
  names(df)<-c("Letter", "Count", "Frequency (percentage)")
  df
}  
  
percentage_plot<-function(mystring)
{
  df<-unordered_table(mystring)
  ggplot(df, aes(x=letters, y=freq)) + geom_point() + labs(y="Percentage")
}

shinyServer(
  function(input, output) {
    output$oid1 = renderPrint({input$id1})
    output$count_table = renderTable({ ordered_table(input$id1)})
    output$percentageplot = renderPlot({ percentage_plot(input$id1)})
  } )
