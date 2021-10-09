## sourcing wrangling code file
source("~/Desktop/MA_615/assignment2/wrangling_code.R")

## generating linear model for the relationship between the two variables
gapminder.model <- lm(Mortality ~ Vaccination_Rate, data = mortality.vacc)
summary(gapminder.model)

## creating plot_gg function which will display ggplot output
plot_gg <- function(tibble, variable1, variable2, .fitted = ".fitted") {
  augment(tibble) %>%
    ggplot() +
    geom_point(aes_string(x = variable1, y = variable2), color = "red") +
    geom_line(aes_string(x = variable1, y = .fitted)) +
    theme_minimal()
}

## running plot_gg function
plot_gg(gapminder.model, "Vaccination_Rate", "Mortality") + labs(x = "Vaccination Rate", y = "Mortality")
