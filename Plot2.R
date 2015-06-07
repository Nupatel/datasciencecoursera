data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep= " "), "%d/%m/%Y %H:%M:%S")#paste() converts to character vector
globalActivePower <- as.numeric(as.vector(subSetData$Global_active_power))
png("plot2.png", height = 480, width = 480)
plot(datetime, globalActivePower, type = "l", ylab = "Global Actice Power (kilowatts)")
dev.off()