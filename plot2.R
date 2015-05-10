dataSource <- "household_power_consumption.txt"
data <- read.table(dataSource, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

time <- strptime(paste(subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subData$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(time, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()