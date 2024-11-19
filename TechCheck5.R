#######################################################
## TECH CHECK 5
###################################################### 

library(nycflights13)
library(dplyr)

head(weather)

# Question 1

weather_summary <- weather %>%
  group_by(month) %>%
  summarize(IQR_temp = IQR(temp, na.rm = TRUE)) %>%
  arrange(IQR_temp)  

print(weather_summary)



# Question 2

combined_data <- merge(flights, weather, by = c("year", "month", "day", "hour", "origin"))

result <- combined_data %>%
  group_by(month) %>%
  summarise(
    Median_Gain = round(median((dep_delay - arr_delay) / (air_time / 60), na.rm = TRUE), 6),
    Mean_Temp_Celsius = round(mean((temp - 32) / 1.8, na.rm = TRUE), 6),
    Missing_Temp = sum(is.na(temp))
  ) %>%
  arrange(Median_Gain)

result$Median_Gain <- formatC(result$Median_Gain, format = "f", digits = 6)
result$Mean_Temp_Celsius <- formatC(result$Mean_Temp_Celsius, format = "f", digits = 6)

print(result)


























