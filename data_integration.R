"Data Integration"
rm(list=ls())

load(file="data_collection.rda")

demographics$state <- toupper(demographics$state)
demographics$state[demographics$state == "WASHINGTON D.C."] <- "DISTRICT OF COLUMBIA"

state_stats <- merge(crimes, demographics, 
                       by.x = "State", by.y = "state")
state_stats$median_age <- as.numeric(state_stats$median_age)
state_stats$population_density <- as.numeric(state_stats$population_density)
state_stats$median_household_income <- as.numeric(state_stats$median_household_income)
state_stats$percapita_personal_income <- as.numeric(state_stats$percapita_personal_income)
state_stats$poverty_rate <- as.numeric(state_stats$poverty_rate)

save(state_stats, file = "data_integration.rda")
