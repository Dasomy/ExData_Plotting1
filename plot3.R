Sys.setenv(LANG = 'en')
Sys.setlocale("LC_TIME", "English")

file <- "./dataset/household_power_consumption.txt"
originalData <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
newData <- originalData[originalData$Date %in% c("1/2/2007","2/2/2007") ,]

dateTime <- strptime(paste(newData$Date, newData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(newData$Global_active_power)
submetering1 <- as.numeric(newData$Sub_metering_1)
submetering2 <- as.numeric(newData$Sub_metering_2)
submetering3 <- as.numeric(newData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dateTime, submetering1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, submetering2, type="l", col="red")
lines(dateTime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, lty=1, col=c("black", "red", "blue"))

dev.off()