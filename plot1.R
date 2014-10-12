plot1 <- function() {

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")

data <- na.omit(data)

data$Date <-  as.Date(data$Date, "%d/%m/%Y")

validData <- subset(data, (data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")) )

##plot(validData$Global_active_power)

hist(validData$Global_active_power, xlab="Global Active Power (kilowatts)", main ="Global Active Power", col="red")

dev.copy(png,'plot1.png')
dev.off()

}