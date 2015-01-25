library(lattice)
library(plyr)
#library(devtools)
#install_github("paraGBMalgae", user="mazgit82")
#library(paraGBMalgae)
#data(para1)
#results = para1
results =readRDS("para1.rds")
names(results)=c("interaction.depth", "shrinkage", "n.minobsinnode", "n.trees", "Validation")

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
    if(input$id4=="TRUE"){
      res = ddply(results, c("n.trees",input$id2), summarize, Validation=min(Validation))
      xyplot(Validation ~ n.trees|factor(get(input$id2)), res, main=input$id2, type="l", as.table=TRUE, outer=TRUE, auto.key=TRUE, ylab="Validation Error")
    } else {
        res = ddply(results, c("n.trees",input$id2), summarize, Validation=min(Validation))
        xyplot(Validation ~ n.trees, groups=factor(get(input$id2)), res, main=input$id2, type="l", as.table=TRUE, outer=FALSE, auto.key=list(columns=5), ylab="Validation Error")
    }
    }) 
    }
)