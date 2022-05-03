rm(list=ls())

load("data_integration.rda")

library(dplyr)
library(ggplot2)

#Distribution of poverty rate and larceny theft
qplot(poverty_rate, Larceny_theft, data=state_stats, geom="point", xlab = "Poverty Rate",
      ylab= "Larceny Theft")
cor(state_stats$poverty_rate, state_stats$Larceny_theft)

#How do age and population contribute to crime?
state_stats$Age <- ifelse(state_stats$median_age > 38.5, "Old","Young")
state_stats$Population_Size <- cut(state_stats$Population, 
                                   breaks= c(-Inf, 1000000, 10000000, Inf),
                                   labels= c("Small", "Medium","Large"))
qplot(Population_Size, Property_Crime, data=state_stats, geom="col", facets=.~Age)

#How does crime in Iowa compare to crime in Illinois?
IA_IL <- subset(state_stats, State== "IOWA" | State=="ILLINOIS",
                c("Population","Violent_crime", "State"))
qplot(State, Violent_crime, data=IA_IL, geom="col", fill=State)
qplot(State, Population, data=IA_IL, geom="col", fill=State)
