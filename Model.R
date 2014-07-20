library(MASS)


names(geyser)

plot(duration ~ waiting, data = geyser)

model <- lm(duration ~ waiting, data = geyser)

plot(duration ~ waiting, data = geyser)
abline(model, col = "blue")

newdata <- data.frame(waiting = 80)
predict(model, newdata)

library(datasets)

str(faithful)

plot(eruptions ~ waiting, data = faithful)

model <- lm(eruptions ~ waiting, data = faithful)

plot(eruptions ~ waiting, data = faithful)
abline(model, col = "red")

newdata <- data.frame(waiting = 80)
predict(model, newdata)[[1]]