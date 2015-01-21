library(shiny)
data(esoph)

## logistical model is calculated once
model <- glm(cbind(ncases, ncontrols) ~ agegp + tobgp * alcgp,
                            data = esoph, family = binomial())
## the prediction is done using the data coming from the options
## selected in the radio buttons.
shinyServer(
        function(input, output) {
                output$probability <- { renderText(
                        paste("Probability is:",
                         as.character(predict(model,
                                              data.frame(agegp=input$agegp,
                                                         alcgp=input$alcgp,
                                                         tobgp=input$tobgp),
                                              type = "response")) 
                
                ))}
      
        }
)