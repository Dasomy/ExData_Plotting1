Sys.setenv(LANG = 'en')
Sys.setlocale("LC_TIME", "English")

file <- "./dataset/household_power_consumption.txt"
originalData <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
newData <- originalData[originalData$Date %in% c("1/2/2007","2/2/2007") ,]

dateTime <- strptime(paste(newData$Date, newData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalReactivePower <- as.numeric(newData$Global_reactive_power)
globalActivePower <- as.numeric(newData$Global_active_power)
voltage <- as.numeric(newData$Voltage)
submetering1 <- as.numeric(newData$Sub_metering_1)
submetering2 <- as.numeric(newData$Sub_metering_2)
submetering3 <- as.numeric(newData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, submetering1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, submetering2, type="l", col="red")
lines(dateTime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, bty="n", col=c("black", "red", "blue"))

plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()