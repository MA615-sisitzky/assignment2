library(tidyr)


## Reading vacc.rate csv file into R
vacc.rate <- read.csv("vacc_rate.csv", header=T, check.names = F)

## Creating new columns in dataframe vacc.rate.sub for country's total vaccination rate between 1979 and 2018
vacc.rate.sub <- gather(data=vacc.rate, key='Year', value='Vaccination_Rate', '1979':'2018',convert = TRUE)

## Creating a new dataframe while selecting only the relevant columns
vacc.rate2 <- vacc.rate.sub[, c('country', 'Year', 'Vaccination_Rate')]


## Reading mortality csv file into R
child.mortality <- read.csv("child_mortality_0_5_year_olds_dying_per_1000_born.csv", header=T, check.names = F)

## Creating new columns in dataframe child.mortality.sub for country"s child mortality between 1979 and 2018
child.mortality.sub <- gather(data=child.mortality, key='Year', value='Mortality', '1979':'2018',convert = TRUE)

## Creating a new dataframe while selecting only the relevant columns
child.mortality2 <- child.mortality.sub[, c('country', 'Year', 'Mortality')]

## Generating empty tibble
mortality.vacc <- tibble()

## Merging mortality and vacc.rate datasets
mortality.vacc <- merge( x = child.mortality2, y = vacc.rate2, all.x=TRUE)

## Removing null and empty values from dataset
mortality.vacc <- mortality.vacc[!(is.na(mortality.vacc$Mortality) | mortality.vacc$Mortality=="" | is.na(mortality.vacc$Vaccination_Rate) | mortality.vacc$Vaccination_Rate==""),] 

## Capitalizing "Country" in mortality.vacc dataset to match other variables
names(mortality.vacc)[[1]] <- "Country"

