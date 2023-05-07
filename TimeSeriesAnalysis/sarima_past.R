library(forecast)
library(fpp2) # For example dataset if needed

sarima_past <- function(ts_data, forecast_start_date) {
  # Select data up to the day before the forecasting start date
  train_data <- window(ts_data, end = forecast_start_date - 1)
  
  # Train the SARIMA model on the selected data
  s_arima_model <- Arima(train_data, order = c(1, 1, 1), 
                         seasonal = list(order = c(1, 1, 1), period = 7))
  
  # Forecast the next 2 days
  sarima_forecast <- forecast(s_arima_model, h = 2)
  
  return(sarima_forecast) }


SARIMA_plot_past <- function(ts_data, variable_name, forecast_start_date) {
  # Call the function
  forecast_result <- sarima_past(ts_data, forecast_start_date)
  
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
  date_labels <- as.character(seq(forecast_start_date - 7, forecast_start_date + 1, by = "1 day"))
  
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
    xlab("Date") + ylab("Values") + 
    scale_y_continuous(expand = expansion(mult = c(0.5, 0.5))) + 
    theme_minimal() + 
    theme(panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank() )  
  return(plot) }

SARIMA_plot_past(flights_Mar1st, "Rotorcraft", )


# Create an empty list to store the plots
plots <- list()

for (variable_name in variable_names) {
  plot <- SARIMA_plot_past(variable_name)
  plots[[variable_name]] <- plot }

# Display the plotz
grid.arrange(plotz[["Fixed.Wing.Multi.Engine"]], 
             plotz[["Fixed.Wing.Single.Engine"]], 
             plotz[["Rotorcraft"]], nrow = 3)
