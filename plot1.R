data <- read.table("household_power_consumption.txt", sep=";", quote = "", comment.char = "", nrows = 2075259, header = T, na.strings = "?")
data_new <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]


png(file = "plot1.png", height = 480, width = 480)
hist(data_new$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()