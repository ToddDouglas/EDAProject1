data<- read_delim("household_power_consumption.txt", delim=";", col_names = TRUE, na = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
feb <- data[data$Date=="2007-02-02" | data$Date=="2007-02-01",]
plot(feb$Global_active_power, type="l", xaxt='n', ylab="Global Active Power (kilowatts)")
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))