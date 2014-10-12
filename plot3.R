plot3 <- function() {
  
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
  
  data <- na.omit(data)
  
  data$DateTime <- strptime(paste(data$Date, data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
  
  data$Date <-  as.Date(data$Date, "%d/%m/%Y")
  
  validData <- subset(data, (data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")) )
  
  plot(validData$DateTime, validData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(validData$DateTime, validData$Sub_metering_2, type = "l", col = "red")
  lines(validData$DateTime, validData$Sub_metering_3, type = "l", col = "blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red", "blue"))
   
  dev.copy(png,'plot3.png')
  dev.off()
  
}


