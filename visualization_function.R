## sourcing wrangling code file
source("~/Desktop/MA_615/assignment2/wrangling_code.R")

## generating linear model for the relationship between the two variables
gapminder.model <- lm(Mortality ~ Vaccination_Rate, data = mortality.vacc)
summary(gapminder.model)

## creating plot_gg function which will display ggplot output
plot_gg <- function(model, variable1, variable2, .fitted = ".fitted") {
  augment(model) %>%
    ggplot() +
    geom_point(aes_string(x = variable1, y = variable2), color = "red") +
    geom_line(aes_string(x = variable1, y = .fitted)) +
    theme_minimal()
}

## running plot_gg function
plot_gg(gapminder.model, "Vaccination_Rate", "Mortality") + labs(x = "Vaccination Rate", y = "Mortality")

## filtering data for second model of recent data

filtered.data <- filter(mortality.vacc, Year >= 2000)

## generating linear model for the relationship between the two variables with filtered data

gapminder.model2 <- lm(Mortality ~ Vaccination_Rate, data = filtered.data)
summary(gapminder.model2)

## running plot_gg function with filtered data
plot_gg(gapminder.model2, "Vaccination_Rate", "Mortality") + labs(x = "Vaccination Rate", y = "Mortality")



