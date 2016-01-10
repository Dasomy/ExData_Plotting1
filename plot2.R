Sys.setenv(LANG = 'en')
Sys.setlocale("LC_TIME", "English")

file <- "./dataset/household_power_consumption.txt"
origialData <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
newData <- origialData[origialData$Date %in% c("1/2/2007","2/2/2007") ,]

dateTime <- strptime(paste(newData$Date, newData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(newData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()