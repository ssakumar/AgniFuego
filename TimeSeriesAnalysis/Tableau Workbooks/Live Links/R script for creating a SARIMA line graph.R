# make sure my working directory is correct
getwd()
setwd('C:/Users/Spencer/OneDrive - George Mason University - O365 Production/DAEN 690 - Capstone Project/Recreating local Tableau dashboard/datasets/Time-Series datasets')
# Forecast and plot for all three variables
variable_names <- c("Fixed.Wing.Multi.Engine", 
                    "Fixed.Wing.Single.Engine", "Rotorcraft")

# load useful packages
library(tidyverse)
library(tidyr)
library(dplyr)
library(tsibble)
library(zoo)
library(ggplot2)
library(gridExtra)
library(lubridate)
library(class)
library(scales)
library(forecast)
# Forecast and plot for all three variables
variable_names <- c("Fixed.Wing.Multi.Engine", 
                    "Fixed.Wing.Single.Engine", "Rotorcraft")

 
flights <- read.csv('Time-Series data on daily flights.csv')
str(flights)
flights$Date <- as.Date(flights$Date, 
                           format = "%d/%m/%Y")
str(flights)



sarima <- function(ts_data) {s_arima_model <- Arima(ts_data, order = c(1, 1, 1), 
                                                            seasonal = list(order = c(1, 1, 1), period = 7))
sarima <- forecast(s_arima_model, h = 2)
return(sarima) }
sarima(flights[,2])
sarima(flights[,3])
sarima(flights[,4])

# Define a function to forecast and plot the SARIMA model
SARIMA_plot <- function(variable_name) {
  # Create a time series object
  ts_data <- ts(flights[[variable_name]], frequency = 7)
  # Call the function
  forecast_result <- sarima(ts_data)
  # Calculate the start and end indices for the 7 days before the 1st forecasted day
  start_index <- length(ts_data) - 6
  end_index <- length(ts_data)
  # Extract the desired range of dates
  ts_data_subset <- ts_data[start_index:end_index]
  # Subset the forecast_result
  forecast_result_subset <- forecast_result
  forecast_result_subset$x <- tail(forecast_result$x, 9)
  forecast_result_subset$mean <- tail(forecast_result$mean, 9)
  forecast_result_subset$lower <- tail(forecast_result$lower, 9)
  forecast_result_subset$upper <- tail(forecast_result$upper, 9)
  # Create a new time series object combining the original data and the forecast data
  combined_ts <- ts(c(ts_data_subset, forecast_result_subset$mean), start = 1, frequency = 7)
  # Create date labels for the x-axis
  date_labels <- as.character(seq(tail(flights$Date, 1) - 6, tail(flights$Date, 1) + 2, by = "1 day"))
  # Convert the combined_ts object into a data frame
  combined_df <- data.frame(Date = as.Date(date_labels), Value = as.vector(combined_ts))
  # Convert the forecast_result_subset into a data frame
  forecast_df <- data.frame(Date = as.Date(date_labels[-(1:7)]), Value = forecast_result_subset$mean)
  # Plot the forecast
  plot <- ggplot() +
    geom_line(data = combined_df, aes(x = Date, y = Value)) +
    geom_line(data = forecast_df, aes(x = Date, y = Value), color = "cyan") +
    geom_text(data = combined_df, aes(x = Date, y = Value, 
                                      label = round(Value, 0)), vjust = -0.5, size = 3) +
    ggtitle(paste("SARIMA Forecast:", variable_name)) +
    xlab("Date") + ylab("Flights Per Day") + 
    scale_y_continuous(expand = expansion(mult = c(0.5, 0.5))) + 
    theme_minimal() + 
    theme(panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank() )
  
  return(plot) }

# Create an empty list to store the plots
plotz <- list()

for (variable_name in variable_names) {
  plot <- SARIMA_plot(variable_name)
  plotz[[variable_name]] <- plot }

# Display the plotz
grid.arrange(plotz[["Fixed.Wing.Multi.Engine"]], 
             plotz[["Fixed.Wing.Single.Engine"]], 
             plotz[["Rotorcraft"]], nrow = 3)





flights_till_Sep6th <- read.csv('Time-Series Sep 7th.csv')
str(flights_till_Sep6th)
flights_till_Sep6th$Date <- as.Date(flights_till_Sep6th$Date, format = "%d/%m/%Y")
str(flights_till_Sep6th)

# Define a function to forecast and plot the SARIMA model
forecast_and_plot_Sep7th_and_8th <- function(variable_name) {
  # Create a time series object
  ts_data_4_Sep7th <- ts(flights_till_Sep6th[[variable_name]], frequency = 7)
  # Call the function
  forecast_result <- sarima(ts_data_4_Sep7th)
  # Calculate the start and end indices for the 7 days before the 1st forecasted day
  start_index <- length(ts_data_4_Sep7th) - 6
  end_index <- length(ts_data_4_Sep7th)
  # Extract the desired range of dates
  ts_data_subset <- ts_data_4_Sep7th[start_index:end_index]
  # Subset the forecast_result
  forecast_result_subset <- forecast_result
  forecast_result_subset$x <- tail(forecast_result$x, 9)
  forecast_result_subset$mean <- tail(forecast_result$mean, 9)
  forecast_result_subset$lower <- tail(forecast_result$lower, 9)
  forecast_result_subset$upper <- tail(forecast_result$upper, 9)
  
  # Create a new time series object combining the original data and the forecast data
  combined_ts <- ts(c(ts_data_subset, forecast_result_subset$mean), start = 1, frequency = 7)
  
  # Create date labels for the x-axis
  date_labels <- as.character(seq(tail(flights_till_Sep6th$Date, 1) - 6, tail(flights_till_Sep6th$Date, 1) + 2, by = "1 day"))
  # Create date labels for the x-axis
  custom_date_breaks <- as.Date(c("2022-09-02", "2022-09-03", "2022-09-04", "2022-09-05", "2022-09-06", "2022-09-07", "2022-09-08"))
  custom_date_labels <- date_format("%b %d")(custom_date_breaks)
  
  # Convert the combined_ts object into a data frame
  combined_df <- data.frame(Date = as.Date(date_labels), Value = as.vector(combined_ts))
  print(combined_df) # Print combined_df
  
  # Convert the forecast_result_subset into a data frame
  forecast_df <- data.frame(Date = as.Date(date_labels[-(1:7)]), 
                            Value = forecast_result_subset$mean)
  print(forecast_df) # Print forecast_df

  # Plot the forecast
  plot_Sep7th_8th <- ggplot() +
    geom_line(data = combined_df, aes(x = Date, y = Value)) +
    geom_line(data = forecast_df, aes(x = Date, y = Value), color = "cyan") +
    geom_text(data = combined_df, aes(x = Date, y = Value, label = round(Value, 0)), vjust = -0.5, size = 3) +
    ggtitle(paste("SARIMA Forecasts for September 7th & 8th of 2022:", variable_name)) +
    ylab("Flights Per Day") + xlab(" ") +
    scale_x_date(breaks = custom_date_breaks, labels = custom_date_labels, limits = as.Date(c("2022-09-02", tail(flights$Date, 1) + 2))) +
    scale_y_continuous(expand = expansion(mult = c(0.4, 0.4))) + theme_minimal() +
    theme(panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank() )
  return(plot_Sep7th_8th) }

# Create an empty list to store the plots
plots <- list()

for (variable_name in variable_names) {
  plot_Sep7th_8th <- forecast_and_plot_Sep7th_and_8th(variable_name)
  plots[[variable_name]] <- plot_Sep7th_8th}
# Display the plots
grid.arrange(plots[["Fixed.Wing.Multi.Engine"]], 
             plots[["Fixed.Wing.Single.Engine"]], 
             plots[["Rotorcraft"]], nrow = 3)


