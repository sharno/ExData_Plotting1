data <- read.table("household_power_consumption.txt", sep=";", quote = "", comment.char = "", nrows = 2075259, header = T, na.strings = "?")
data_new <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

dates <- strptime(paste(data_new$Date, data_new$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", height = 480, width = 480)
plot(dates,
     data_new$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)")
dev.off()