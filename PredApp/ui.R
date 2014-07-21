library(shiny)

shinyUI(fixedPage(theme = "bootstrap.css",
    
    tags$head(
        tags$style(HTML("
      .shiny-output-error-validation {
        color: red;
        font-weight: bold;
      }
    "))
    ),
    
    titlePanel(strong(em("Prediction of the duration of the eruption of Old Faithful geyser in Yellowstone National Park, Wyoming, USA"))),
    p(em("This application predicts the duration of an eruption as a function of the waiting time to the next eruption. The waiting times must be between 43 mins and 96 mins to avoid extrapolation.")),
    sidebarLayout(
        sidebarPanel(
            h4("Waiting time to next eruption"),
            numericInput("in_wait_time", "Enter the desired waiting time (in mins)", 70, min = 43, max = 96, step = 1),
            h4("With or without regression line ?"),
            selectInput("smooth", "Do you want to draw the plot with or without the regression line ?", list("With" = "W", "Without" = "Wo")),
            p(),
            submitButton("Submit")
            ),
        mainPanel(
            h4("Waiting time entered (in mins) :"),
            verbatimTextOutput("out_wait_time"),
            h4("Prediction of eruption duration (in mins) :"),
            verbatimTextOutput("prediction"),
            h4("Plot of eruption duration vs waiting time to next eruption :"),
            conditionalPanel(condition = "InputId == 'smooth'", plotOutput("reg_plot"))
            )
        )
    )
)