# just the sarima forecast function itself
sarima <- function(ts_data) {s_arima_model <- Arima(ts_data, order = c(1, 1, 1), 
                                                    seasonal = list(order = c(1, 1, 1), period = 7))
sarima <- forecast(s_arima_model, h = 2)
return(sarima) }