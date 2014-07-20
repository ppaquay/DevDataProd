library(shiny)

shinyUI(fixedPage(
    
    tags$head(
        tags$style(HTML("
      .shiny-output-error-validation {
        color: red;
        font-weight: bold;
      }
    "))
    ),
    
    titlePanel(em("Prediction of the duration of the eruption of Old Faithful geyser in Yellowstone National Park, Wyoming, USA")),
    sidebarLayout(
        sidebarPanel(
            h4("Waiting time to next eruption"),
            numericInput("in_wait_time", "Enter the desired waiting time (in mins)", 70, min = 43, max = 96, step = 1),
            submitButton("Submit")
            ),
        mainPanel(
            h4("Waiting time entered (in mins) :"),
            verbatimTextOutput("out_wait_time"),
            h4("Prediction of eruption duration (in mins) :"),
            verbatimTextOutput("prediction"),
            h4("Plot of eruption duration vs waiting time to next eruption :"),
            plotOutput("reg_plot")
            )
        )
    )
)