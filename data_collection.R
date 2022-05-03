"Data Collection"
rm(list=ls())

library(RSocrata)
crimes <- read.csv("2018_crime_data.csv",  stringsAsFactors = FALSE,
                                            na.strings = c("","NA"))
demographics <- read.socrata('https://opendata.maryland.gov/resource/8mc4-hxm7.json?$select=state,median_age,population_density,median_household_income,percapita_personal_income,poverty_rate')

save(demographics, crimes, file="data_collection.rda")

