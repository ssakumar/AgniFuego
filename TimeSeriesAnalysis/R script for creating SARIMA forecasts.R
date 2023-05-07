
# load useful packages
library(tidyverse)
library(tidyr)
library(dplyr)
library(tsibble)
library(zoo)
library(ggplot2)
library(lubridate)
library(class)
library(scales)
library(forecast)


# 
ts_flights <- read.csv('Time-Series data on daily flights.csv')
str(ts_flights)
ts_flights$Date <- as.Date(ts_flights$Date, 
                           format = "%d/%m/%Y")
str(ts_flights)

TS_flights <- ts(ts_flights[, 2:4], start = c(2022, 5), frequency = 7)
TS_flights2 <- ts(ts_flights[, 2:4], start = c(2022, 7), frequency = 7)

sarima_forecast <- function(ts_data) { sarima_model <- Arima(ts_data, 
                                                             order = c(1, 1, 1), 
                                                             seasonal = list(order = c(1, 1, 1), period = 7))
sarima_forecast <- forecast(sarima_model, h = 2)
return(sarima_forecast) }
sarima_forecast(ts_flights[,2])
sarima_forecast(ts_flights[,3])
sarima_forecast(ts_flights[,4])





ts_flights_June26th <- read.csv('Time-Series data on daily flights June 26th.csv')
str(ts_flights_June26th)
sarima_forecast(ts_flights_June26th[,2])
sarima_forecast(ts_flights_June26th[,3])
sarima_forecast(ts_flights_June26th[,4])
#June_26th <- c(sarima_forecast(ts_flights_June26th[,2]),
#                   sarima_forecast(ts_flights_June26th[,3]),
#                   sarima_forecast(ts_flights_June26th[,4]))

#June_26th


ts_flights_July4th <- read.csv('Time-Series data on daily flights July 4th.csv')
str(ts_flights_July4th)
ts_flights_July4th$Date <- as.Date(ts_flights_July4th$Date, 
                                   format = "%d/%m/%Y")
# Convert the Date column to a Date object with the American format
ts_flights_July4th$Date <- as.Date(ts_flights_July4th$Date, format = "%m/%d/%Y")
sarima_forecast(ts_flights_July4th[,2])
sarima_forecast(ts_flights_July4th[,3])
sarima_forecast(ts_flights_July4th[,4])


ts_flights_July17th <- read.csv('Time-Series data on daily flights July 17th.csv')
str(ts_flights_July17th)
ts_flights_July4th$Date <- as.Date(ts_flights_July4th$Date, format = "%m/%d/%Y")
ts_flights_July17th$Date <- as.Date(ts_flights_July17th$Date, format = "%d/%m/%Y")
# Convert the Date column to the American format (mm/dd/yyyy)
ts_flights_July17th$Date <- format(ts_flights_July17th$Date, "%m/%d/%Y")


sarima_forecast(ts_flights_July17th[,2])
sarima_forecast(ts_flights_July17th[,3])
sarima_forecast(ts_flights_July17th[,4])


ts_flights_August20th <- read.csv('Time-Series data on daily flights August 20th.csv')
str(ts_flights_August20th)
ts_flights_August20th$Date <- as.Date(ts_flights_August20th$Date, 
                                    format = "%d/%m/%Y")
# Convert the Date column to the American format (mm/dd/yyyy)
ts_flights_August20th$Date <- format(ts_flights_August20th$Date, "%m/%d/%Y")
sarima_forecast(ts_flights_August20th[,2])
sarima_forecast(ts_flights_August20th[,3])
sarima_forecast(ts_flights_August20th[,4])


ts_flights_September6th <- read.csv('Time-Series data on daily flights September 6th.csv')
str(ts_flights_September6th)
ts_flights_September6th$Date <- as.Date(ts_flights_September6th$Date, format = "%d/%m/%Y")
# Convert the Date column to the American format (mm/dd/yyyy)
ts_flights_September6th$Date <- format(ts_flights_September6th$Date, "%m/%d/%Y")
sarima_forecast(ts_flights_September6th[,2])
sarima_forecast(ts_flights_September6th[,3])
sarima_forecast(ts_flights_September6th[,4])





real_num_of_flights <- c()
real_num_of_flights_June26th <- c(144.2,	41.4,	138.8)
real_num_of_flights_June27th <- c(134.4,	38.2,	126.8)
first_observed_pair <- rbind(real_num_of_flights_June26th,
                             real_num_of_flights_June27th)

real_num_of_flights_July4th <- c(84.6, 23.4, 90.2)
real_num_of_flights_July5th <- c(90.4, 20.2, 77)
second_observed_pair <- rbind(real_num_of_flights_July4th, real_num_of_flights_July5th)
second_observed_pair

real_num_of_flights_July17th <- c(129, 43.4, 135.8)
real_num_of_flights_July18th <- c(132.6, 41.4, 145.6)
third_observed_pair <- rbind(real_num_of_flights_July17th, real_num_of_flights_July18th)
third_observed_pair

real_num_of_flights_August20th <- c(124.8, 35.8,	135.8)
real_num_of_flights_August21st <- c(113.8, 36.8,	128.8)
fourth_observed_pair <- rbind(real_num_of_flights_August20th, real_num_of_flights_August21st)
fourth_observed_pair

real_num_of_flights_September6th <- c(228.6,	33.8,	149)
real_num_of_flights_September7th <- c(252.4, 34.4,	162)
fifth_observed_pair <- rbind(real_num_of_flights_September6th,
                              real_num_of_flights_September7th)
fifth_observed_pair


observations <- rbind(real_num_of_flights_June26th,
                      real_num_of_flights_June27th,
                      real_num_of_flights_July4th,
                      real_num_of_flights_July5th, 
                      real_num_of_flights_July17th, 
                      real_num_of_flights_July18th,
                      real_num_of_flights_August20th,
                      real_num_of_flights_August21st,
                      real_num_of_flights_September6th,
                      real_num_of_flights_September7th)
observations







