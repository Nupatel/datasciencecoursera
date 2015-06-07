data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", height = 480, width = 480)
plot(datetime, sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sub_metering_2, type = "l", col = "red")
lines(datetime, sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_2"), lwd = 1, col = c("black","red","blue"))

dev.off()
