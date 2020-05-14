data<- read_delim("household_power_consumption.txt", delim=";", col_names = TRUE, na = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
feb <- data[data$Date=="2007-02-02" | data$Date=="2007-02-01",]
par(mfrow=c(2,2), cex=0.5)

plot(feb$Global_active_power, type="l", xaxt='n', ylab="Global Active Power", xlab="")
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

plot(feb$Voltage, type="l", xaxt='n', yaxt="n", ylab="Voltage", xlab="datetime")
axis(2, at=c("234", "238", "242", "246"))
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

plot(feb$Sub_metering_1 , type="n", xaxt="n", yaxt="n", ylab="Energy Sub Metering", xlab="")
points(feb$Sub_metering_1, type = "l")
points(feb$Sub_metering_2, type = "l", col="Red")
points(feb$Sub_metering_3, type = "l", col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, xjust=1, yjust=1)
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0, 10, 20, 30), labels = c("0", "10", "20", "30"))

plot(feb$Global_reactive_power, type="l", xaxt="n", ylab="Global Reactive Power", xlab="datetime")
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, "plot4.png")
dev.off()