data<- read_delim("household_power_consumption.txt", delim=";", col_names = TRUE, na = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
feb <- data[data$Date=="2007-02-02" | data$Date=="2007-02-01",]
feb$SubMetering = rowMeans(cbind(feb$Sub_metering_1, feb$Sub_metering_2, feb$Sub_metering_3))
hist(feb$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, "plot1.png")
dev.off()
