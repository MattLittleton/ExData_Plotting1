plot4 <- function() {
  
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
  
  data <- na.omit(data)
  
  data$DateTime <- strptime(paste(data$Date, data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
  
  data$Date <-  as.Date(data$Date, "%d/%m/%Y")
  
  validData <- subset(data, (data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")) )
  
  par(mfrow=c(2,2))
  
  plot(validData$DateTime, validData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  
  plot(validData$DateTime, validData$Voltage, type = "l", ylab = "Volatge", xlab = "datetime")
  
  plot(validData$DateTime, validData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(validData$DateTime, validData$Sub_metering_2, type = "l", col = "red")
  lines(validData$DateTime, validData$Sub_metering_3, type = "l", col = "blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red", "blue"), bty = "n", cex=0.5)
  
  plot(validData$DateTime, validData$Global_reactive_power, type = "l", xlab = "datetime" , ylab="Global_reactive_power")
  
  dev.copy(png,'plot4.png')
  dev.off()

}


