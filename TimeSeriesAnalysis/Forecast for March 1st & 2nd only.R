flights_Mar1st <- read.csv('Time-Series Feb 28th, 2023.csv')
str(flights_Mar1st)
flights_Mar1st$Date <- as.Date(flights_Mar1st$Date, 
                                     format = "%d/%m/%Y")
str(flights_Mar1st)



# Define a function to forecast and plot the SARIMA model
forecast_and_plot_Mar1st_and_2nd <- function(variable_name) {
  # Create a time series object
  ts_data_4_Mar1st <- ts(flights_Mar1st[[variable_name]], frequency = 7)
  # Call the function
  forecast_result <- sarima(ts_data_4_Mar1st)
  # Calculate the start and end indices for the 7 days before the 1st forecasted day
  start_index <- length(ts_data_4_Mar1st) - 6
  end_index <- length(ts_data_4_Mar1st)
  # Extract the desired range of dates
  ts_data_subset <- ts_data_4_Mar1st[start_index:end_index]
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
  date_labels <- as.character(seq(tail(flights_Mar1st$Date, 1) - 6, 
                                  tail(flights_Mar1st$Date, 1) + 2, by = "1 day"))
  # Create date labels for the x-axis
  custom_date_breaks <- as.Date(c("2023-02-24", "2023-02-25", "2023-02-26", "2023-02-27", "2023-02-28", "2023-03-01", "2023-03-02"))
  custom_date_labels <- date_format("%b %d")(custom_date_breaks)
  
  # Convert the combined_ts object into a data frame
  
  combined_df <- data.frame(Date = as.Date(date_labels), 
                            Value = as.vector(combined_ts))
  
  # Convert the forecast_result_subset into a data frame
  forecast_df <- data.frame(Date = as.Date(date_labels[-(1:7)]), 
                            Value = forecast_result_subset$mean)
  
  # Plot the forecast
  plot_Mar1st_2nd <- ggplot() +
    geom_line(data = combined_df, aes(x = Date, y = Value)) +
    geom_line(data = forecast_df, aes(x = Date, y = Value), color = "cyan") +
    geom_text(data = combined_df, aes(x = Date, y = Value, label = round(Value, 0)), vjust = -0.5, size = 3) +
    ggtitle(paste("SARIMA Forecasts for March 1st & 2nd of 2023:", variable_name)) +
    ylab("Flights Per Day") + xlab(" ") +
    scale_x_date(breaks = custom_date_breaks, labels = custom_date_labels, limits = as.Date(c("2023-02-24", tail(flights$Date, 1) + 2))) +
    scale_y_continuous(expand = expansion(mult = c(0.4, 0.4))) + theme_minimal() +
    theme(panel.grid.minor.x = element_blank(),
          panel.grid.minor.y = element_blank() )
  
  return(plot_Mar1st_2nd) }

# Create an empty list to store the plots
plots <- list()

for (variable_name in variable_names) {
  plot_Mar1st_2nd <- forecast_and_plot_Mar1st_and_2nd(variable_name)
  plots[[variable_name]] <- plot_Mar1st_2nd}
# Display the plots
grid.arrange(plots[["Fixed.Wing.Multi.Engine"]], 
             plots[["Fixed.Wing.Single.Engine"]], 
             plots[["Rotorcraft"]], nrow = 3)




