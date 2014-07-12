data <- read.table("household_power_consumption.txt", sep=";", quote = "", comment.char = "", nrows = 2075259, header = T, na.strings = "?")
data_new <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

dates <- strptime(paste(data_new$Date, data_new$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", height = 480, width = 480)

par(mfrow = c(2,2))

plot(dates, data_new$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

plot(dates, data_new$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

plot(dates,
     data_new$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(dates, data_new$Sub_metering_2, col = "red")
lines(dates, data_new$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lw = c(1,1,1))

plot(dates, data_new$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.off()