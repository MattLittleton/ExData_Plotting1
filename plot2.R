plot2 <- function() {
  
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
  
  data <- na.omit(data)
  
  data$DateTime <- strptime(paste(data$Date, data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
  
  data$Date <-  as.Date(data$Date, "%d/%m/%Y")
  
  validData <- subset(data, (data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")) )

  plot(validData$DateTime, validData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    
  dev.copy(png,'plot2.png')
  dev.off()
  
}



