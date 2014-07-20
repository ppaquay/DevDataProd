library(shiny)

library(datasets)

str(faithful)

#plot(eruptions ~ waiting, data = faithful)

model <- lm(eruptions ~ waiting, data = faithful)

#plot(eruptions ~ waiting, data = faithful)
#abline(model, col = "red")

#newdata <- data.frame(waiting = 80)
#predict(model, newdata)

shinyServer(
    function(input, output) {
        output$out_wait_time <- renderPrint({input$in_wait_time})
        wait <- reactive({
            validate(
                need((input$in_wait_time <= 96) & (input$in_wait_time >= 43), "Entered waiting time off limits !")
            )
            input$in_wait_time
        })
        pred <- reactive({predict(model, data.frame(waiting = wait()))[[1]]})
        output$prediction <- renderPrint({pred()})
        output$reg_plot <- renderPlot({
            plot(eruptions ~ waiting, data = faithful, xlab = "Winting time to next eruption (in mins)", ylab = "Eruption duration (in mins)")
            abline(model, col = "blue")
            points(wait(), pred(), col = "red", pch = 19)
            segments(wait(), 0, wait(), pred(), col = "red", lty = 2)
            segments(0, pred(), wait(), pred(), col = "red", lty = 2)
        })
    }
)