

library(UsingR)
library(caret)
data(father.son)
model<-lm(sheight ~ fheight, data=father.son)
sheight<-function(input){
newdata<-data.frame(fheight=input)
pred<-predict(model, newdata, interval="predict")
pred
}
shinyServer(
  function(input, output) {
    output$inputValue<-renderPrint({input$fheight})
    output$lwr<-renderPrint({sheight(input$fheight)[,2]})
    output$upr<-renderPrint({sheight(input$fheight)[,3]})
    }
 )
