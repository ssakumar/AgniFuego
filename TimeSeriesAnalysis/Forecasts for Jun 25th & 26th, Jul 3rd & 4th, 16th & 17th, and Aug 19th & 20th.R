# make sure my working directory is correct
getwd()
setwd('C:/Users/Spencer/OneDrive - George Mason University - O365 Production/DAEN 690 - Capstone Project/Recreating local Tableau dashboard/datasets/Time-Series datasets')
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

flights_till_June24th <- read.csv('Time-Series June 25th.csv')
str(flights_till_June24th)
flights_till_June24th$Date <- as.Date(flights_till_June24th$Date, 
                                      format = "%d/%m/%Y")
str(flights_till_June24th)

# Define a function to forecast and plot the SARIMA model
forecast_and_plot_June25th_and_26th <- function(variable_name) {
  # Create a time series object
  ts_data_4_June25th <- ts(flights_till_June24th[[variable_name]], frequency = 7)
  # Call the function
  forecast_result <- sarima(ts_data_4_June25th)
  # Calculate the start and end indices for the 7 days before the 1st forecasted day
  start_index <- length(ts_data_4_June25th) - 6
  end_index <- length(ts_data_4_June25th)
  # Extract the desired range of dates
  ts_data_subset <- ts_data_4_June25th[start_index:end_index]
  # Subset the forecast_result
  forecast_result_subset <- forecast_result
  forecast_result_subset$x <- tail(forecast_result$x, 9)
  forecast_result_subset$mean <- tail(forecast_result$mean, 9)
  forecast_result_subset$lower <- tail(forecast_result$lower, 9)
  forecast_result_subset$upper <- tail(forecast_result$upper, 9)
  
  # Create a new time series object combining the original data and the forecast data
  combined_ts <- ts(c(ts_data_subset, forecast_result_subset$mean), 
                    start = 1, frequency = 7)
  
  # Create date labels for the x-axis
  date_labels <- as.character(seq(tail(flights_till_June24th$Date, 1) - 6, 
                                  tail(flights_till_June24th$Date, 1) + 2, by = "1 day"))
  # Create date labels for the x-axis
  custom_date_breaks <- as.Date(c("2022-06-20", "2022-06-21", "2022-06-22", "2022-06-23", "2022-06-24", "2022-06-25", "2022-06-26"))
  custom_date_labels <- date_format("%b %d")(custom_date_breaks)
  
  # Convert the combined_ts object into a data frame
  
  combined_df <- data.frame(Date = as.Date(date_labels), 
                            Value = as.vector(combined_ts))
  
  # Convert the forecast_result_subset into a data frame
  forecast_df <- data.frame(Date = as.Date(date_labels[-(1:7)]), 
                            Value = forecast_result_subset$mean)
  
  # Plot the forecast
  plot_June25th_26th <- ggplot() +
    geom_line(data = combined_df, aes(x = Date, y = Value)) +
    geom_line(data = forecast_df, aes(x = Date, y = Value), color = "cyan") +
    geom_text(data = combined_df, aes(x = Date, y = Value, label = round(Value, 0)), vjust = -0.5, size = 3) +
    ggtitle(paste("SARIMA Forecasts for June 25th & 26th of 2022:", variable_name)) +
    ylab("Flights Per Day") + xlab(" ") +
    scale_x_date(breaks = custom_date_breaks, labels = custom_date_labels, limits = as.Date(c("2022-06-20", tail(flights$Date, 1) + 2))) +
    scale_y_continuous(expand = expansion(mult = c(0.4, 0.4))) + theme_minimal() +
    theme(panel.grid.minor.x = element_blank(),
          panel.grid.minor.y = element_blank() )
  
  return(plot_June25th_26th) }

# Create an empty list to store the plots
plots_June25th <- list()

for (variable_name in variable_names) {
  plot_June25th_26th <- forecast_and_plot_June25th_and_26th(variable_name)
  plots_June25th[[variable_name]] <- plot_June25th_26th}
# Display the plots
grid.arrange(plots_June25th[["Fixed.Wing.Multi.Engine"]], 
             plots_June25th[["Fixed.Wing.Single.Engine"]], 
             plots_June25th[["Rotorcraft"]], nrow = 3)





flights_till_July3rd <- read.csv('Time-Series July 3rd.csv')
str(flights_till_July3rd)
flights_till_July3rd$Date <- as.Date(flights_till_July3rd$Date, 
                                    format = "%d/%m/%Y")
str(flights_till_July3rd)

# Define a function to forecast and plot the SARIMA model
forecast_and_plot_July3rd_and_4th <- function(variable_name) {
  # Create a time series object
  ts_data_4_July3rd <- ts(flights_till_July3rd[[variable_name]], frequency = 7)
  # Call the function
  forecast_result <- sarima(ts_data_4_July3rd)
  # Calculate the start and end indices for the 7 days before the 1st forecasted day
  start_index <- length(ts_data_4_July3rd) - 6
  end_index <- length(ts_data_4_July3rd)
  # Extract the desired range of dates
  ts_data_subset <- ts_data_4_July3rd[start_index:end_index]
  # Subset the forecast_result
  forecast_result_subset <- forecast_result
  forecast_result_subset$x <- tail(forecast_result$x, 9)
  forecast_result_subset$mean <- tail(forecast_result$mean, 9)
  forecast_result_subset$lower <- tail(forecast_result$lower, 9)
  forecast_result_subset$upper <- tail(forecast_result$upper, 9)
  
  # Create a new time series object combining the original data and the forecast data
  combined_ts <- ts(c(ts_data_subset, forecast_result_subset$mean), 
                    start = 1, frequency = 7)
  
  # Create date labels for the x-axis
  date_labels <- as.character(seq(tail(flights_till_July3rd$Date, 1) - 6, 
                                  tail(flights_till_July3rd$Date, 1) + 2, by = "1 day"))
  # Create date labels for the x-axis
  custom_date_breaks <- as.Date(c("2022-06-28", "2022-06-29", "2022-06-30", "2022-06-31", "2022-07-01", "2022-07-02", "2022-07-03", "2022-07-04"))
  custom_date_labels <- date_format("%b %d")(custom_date_breaks)
  
  # Convert the combined_ts object into a data frame
  
  combined_df <- data.frame(Date = as.Date(date_labels), 
                            Value = as.vector(combined_ts))
  
  # Convert the forecast_result_subset into a data frame
  forecast_df <- data.frame(Date = as.Date(date_labels[-(1:7)]), 
                            Value = forecast_result_subset$mean)
  
  # Plot the forecast
  plot_July3rd_4th <- ggplot() +
    geom_line(data = combined_df, aes(x = Date, y = Value)) +
    geom_line(data = forecast_df, aes(x = Date, y = Value), color = "cyan") +
    geom_text(data = combined_df, aes(x = Date, y = Value, label = round(Value, 0)), vjust = -0.5, size = 3) +
    ggtitle(paste("SARIMA Forecasts for July 3rd & 4th of 2022:", variable_name)) +
    ylab("Flights Per Day") + xlab(" ") +
    scale_x_date(breaks = custom_date_breaks, labels = custom_date_labels, limits = as.Date(c("2022-06-28", tail(flights$Date, 1) + 2))) +
    scale_y_continuous(expand = expansion(mult = c(0.4, 0.4))) + theme_minimal() +
    theme(panel.grid.minor.x = element_blank(),
          panel.grid.minor.y = element_blank() )
  
  return(plot_July3rd_4th) }

# Create an empty list to store the plots
plots_July4th <- list()

for (variable_name in variable_names) {
  plot_July3rd_4th <- forecast_and_plot_July3rd_and_4th(variable_name)
  plots_July4th[[variable_name]] <- plot_July3rd_4th}
# Display the plots
grid.arrange(plots_July4th[["Fixed.Wing.Multi.Engine"]], 
             plots_July4th[["Fixed.Wing.Single.Engine"]], 
             plots_July4th[["Rotorcraft"]], nrow = 3)




flights_till_July16th <- read.csv('Time-Series July 16th.csv')
str(flights_till_July16th)
flights_till_July16th$Date <- as.Date(flights_till_July16th$Date, 
                                      format = "%d/%m/%Y")
str(flights_till_July16th)

# Define a function to forecast and plot the SARIMA model
forecast_and_plot_July16th_and_17th <- function(variable_name) {
  # Create a time series object
  ts_data_4_July17th <- ts(flights_till_July16th[[variable_name]], frequency = 7)
  # Call the function
  forecast_result <- sarima(ts_data_4_July17th)
  # Calculate the start and end indices for the 7 days before the 1st forecasted day
  start_index <- length(ts_data_4_July17th) - 6
  end_index <- length(ts_data_4_July17th)
  # Extract the desired range of dates
  ts_data_subset <- ts_data_4_July17th[start_index:end_index]
  # Subset the forecast_result
  forecast_result_subset <- forecast_result
  forecast_result_subset$x <- tail(forecast_result$x, 9)
  forecast_result_subset$mean <- tail(forecast_result$mean, 9)
  forecast_result_subset$lower <- tail(forecast_result$lower, 9)
  forecast_result_subset$upper <- tail(forecast_result$upper, 9)
  
  # Create a new time series object combining the original data and the forecast data
  combined_ts <- ts(c(ts_data_subset, forecast_result_subset$mean), 
                    start = 1, frequency = 7)
  
  # Create date labels for the x-axis
  date_labels <- as.character(seq(tail(flights_till_July16th$Date, 1) - 6, 
                                  tail(flights_till_July16th$Date, 1) + 2, by = "1 day"))
  # Create date labels for the x-axis
  custom_date_breaks <- as.Date(c("2022-07-11", "2022-07-12", "2022-07-13", "2022-07-14", "2022-07-15", "2022-07-16", "2022-07-17"))
  custom_date_labels <- date_format("%b %d")(custom_date_breaks)
  
  # Convert the combined_ts object into a data frame
  
  combined_df <- data.frame(Date = as.Date(date_labels), 
                            Value = as.vector(combined_ts))
  
  # Convert the forecast_result_subset into a data frame
  forecast_df <- data.frame(Date = as.Date(date_labels[-(1:7)]), 
                            Value = forecast_result_subset$mean)
  
  # Plot the forecast
  plot_July16th_17th <- ggplot() +
    geom_line(data = combined_df, aes(x = Date, y = Value)) +
    geom_line(data = forecast_df, aes(x = Date, y = Value), color = "cyan") +
    geom_text(data = combined_df, aes(x = Date, y = Value, label = round(Value, 0)), vjust = -0.5, size = 3) +
    ggtitle(paste("SARIMA Forecasts for July 16th & 17th of 2022:", variable_name)) +
    ylab("Flights Per Day") + xlab(" ") +
    scale_x_date(breaks = custom_date_breaks, labels = custom_date_labels, limits = as.Date(c("2022-07-11", tail(flights$Date, 1) + 2))) +
    scale_y_continuous(expand = expansion(mult = c(0.4, 0.4))) + theme_minimal() +
    theme(panel.grid.minor.x = element_blank(),
          panel.grid.minor.y = element_blank() )
  
  return(plot_July16th_17th) }

# Create an empty list to store the plots
plots_July17th <- list()

for (variable_name in variable_names) {
  plot_July16th_17th <- forecast_and_plot_July16th_and_17th(variable_name)
  plots_July17th[[variable_name]] <- plot_July16th_17th}
# Display the plots
grid.arrange(plots_July17th[["Fixed.Wing.Multi.Engine"]], 
             plots_July17th[["Fixed.Wing.Single.Engine"]], 
             plots_July17th[["Rotorcraft"]], nrow = 3)







flights_till_Aug19th <- read.csv('Time-Series Aug 19th.csv')
str(flights_till_Aug19th)
flights_till_Aug19th$Date <- as.Date(flights_till_Aug19th$Date, 
                                     format = "%d/%m/%Y")
str(flights_till_Aug19th)

# Define a function to forecast and plot the SARIMA model
forecast_and_plot_Aug19th_and_20th <- function(variable_name) {
  # Create a time series object
  ts_data_4_Aug19th <- ts(flights_till_Aug19th[[variable_name]], frequency = 7)
  # Call the function
  forecast_result <- sarima(ts_data_4_Aug19th)
  # Calculate the start and end indices for the 7 days before the 1st forecasted day
  start_index <- length(ts_data_4_Aug19th) - 6
  end_index <- length(ts_data_4_Aug19th)
  # Extract the desired range of dates
  ts_data_subset <- ts_data_4_Aug19th[start_index:end_index]
  # Subset the forecast_result
  forecast_result_subset <- forecast_result
  forecast_result_subset$x <- tail(forecast_result$x, 9)
  forecast_result_subset$mean <- tail(forecast_result$mean, 9)
  forecast_result_subset$lower <- tail(forecast_result$lower, 9)
  forecast_result_subset$upper <- tail(forecast_result$upper, 9)
  
  # Create a new time series object combining the original data and the forecast data
  combined_ts <- ts(c(ts_data_subset, forecast_result_subset$mean), 
                    start = 1, frequency = 7)
  # Create date labels for the x-axis
  date_labels <- as.character(seq(tail(flights_till_Aug19th$Date, 1) - 6, tail(flights_till_Aug19th$Date, 1) + 2, by = "1 day"))
  # Create date labels for the x-axis
  custom_date_breaks <- as.Date(c("2022-08-14", "2022-08-15", "2022-08-16", "2022-08-17", "2022-08-18", "2022-08-19", "2022-08-20"))
  custom_date_labels <- date_format("%b %d")(custom_date_breaks)
  
  # Convert the combined_ts object into a data frame
  combined_df <- data.frame(Date = as.Date(date_labels), 
                            Value = as.vector(combined_ts))
  # Convert the forecast_result_subset into a data frame
  forecast_df <- data.frame(Date = as.Date(date_labels[-(1:7)]), 
                            Value = forecast_result_subset$mean)
  # Plot the forecast
  plot_Aug19th_20th <- ggplot() +
    geom_line(data = combined_df, aes(x = Date, y = Value)) +
    geom_line(data = forecast_df, aes(x = Date, y = Value), color = "cyan") +
    geom_text(data = combined_df, aes(x = Date, y = Value, label = round(Value, 0)), vjust = -0.5, size = 3) +
    ggtitle(paste("SARIMA Forecasts for August 19th & 20th of 2022:", variable_name)) +
    ylab("Flights Per Day") + xlab(" ") +
    scale_x_date(breaks = custom_date_breaks, labels = custom_date_labels, limits = as.Date(c("2022-08-14", tail(flights$Date, 1) + 2))) +
    scale_y_continuous(expand = expansion(mult = c(0.5, 0.5))) + theme_minimal() +
    theme(panel.grid.minor.x = element_blank(),
          panel.grid.minor.y = element_blank() )
  
  return(plot_Aug19th_20th) }

# Create an empty list to store the plots
plots <- list()

for (variable_name in variable_names) {
  plot_Aug19th_20th <- forecast_and_plot_Aug19th_and_20th(variable_name)
  plots[[variable_name]] <- plot_Aug19th_20th}
# Display the plots
grid.arrange(plots[["Fixed.Wing.Multi.Engine"]], 
             plots[["Fixed.Wing.Single.Engine"]], 
             plots[["Rotorcraft"]], nrow = 3)


