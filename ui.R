library(shiny)

# Define UI for esophageal cancer prediction 
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Esophageal Cancer Prediction"),
        
        # Sidebar with controls to select age group, tobacco and alcohol
        # and tobacco consumption. Note the use of the br()
        # element to introduce extra vertical spacing
        sidebarPanel(
                h5("To predict probability, choose parameters below and press Go"),
                radioButtons("agegp", "Age Group[years]:",
                             list("25-34" = "25-34",
                                  "35-44" = "35-44",
                                  "45-54" = "45-54",
                                  "55-64" = "55-64",
                                  "65-74" = "65-74",
                                  "75+" = "75+")),
                br(),
                
                radioButtons("alcgp", "Alcohol[shots of 40% by vol(e.g. whiskey) per day]:",
                             list("0-3" = "0-39g/day",
                                  "4-6" = "40-79",
                                  "7-8" = "80-119",
                                  "9+" = "120+")),
                br(),
                
                radioButtons("tobgp", "Tobacco[cigarretes per day]:",
                             list("0-2" = "0-9g/day",
                                  "3-5" = "10-19",
                                  "6-8" = "20-29",
                                  "9+" = "30+")),
                ## button to control the calculation of prediction
                submitButton( "Go!"),
                width = 5
                
        ),
        
        # Show a tabset that includes a prediction and Help  view
        # 
        mainPanel(
                tabsetPanel(
                        tabPanel("Prediction",verbatimTextOutput("probability")),
                         tabPanel("Info", includeMarkdown("Help.Rmd"))
                ),
        width = 7)
))
