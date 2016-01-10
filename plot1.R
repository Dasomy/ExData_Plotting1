file <- "./dataset/household_power_consumption.txt"
origialData <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
newData <- origialData[origialData$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(newData$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

dev.off()