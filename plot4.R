dataSource <- "household_power_consumption.txt"
data <- read.table(dataSource, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

time <- strptime(paste(subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)
metering1 <- as.numeric(subData$Sub_metering_1)
metering2 <- as.numeric(subData$Sub_metering_2)
metering3 <- as.numeric(subData$Sub_metering_3)


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(time, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(time, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(time, metering1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(time, metering2, type = "l", col = "red")
lines(time, metering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_methering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o")

plot(time, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()