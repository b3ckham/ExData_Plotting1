## Load household data
data <- read.csv("household_power_consumption.txt", 
                 header=TRUE, 
                 sep=';', 
                 na.strings="?", 
                 check.names=FALSE, 
                 stringsAsFactors=FALSE, 
                 dec=".", 
                 comment.char="", 
                 quote='\"') 

## Convert Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

## Convert DateTime for sub data
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

## Save to file
png(filename = 'plot4.png')

## Create Plot 4
par(mfrow = c(2, 2))
with(data_sub, {
plot(Datetime,
     Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power", 
     cex=0.2)

plot(Datetime,
     Voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

plot(Datetime,
     Sub_metering_1, 
     type="l", 
     xlab="", 
     ylab="Energy sub metering") 
lines(Datetime, Sub_metering_2, type="l", col="red")
lines(Datetime, Sub_metering_3, type="l", col="blue")
legend('topright' 
       , legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') 
       , col = c('black', 'red', 'blue') 
       , lty = 1, lwd = 2, bty = "n") 

plot(Datetime,
     Global_reactive_power, 
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
})


## Dispose
dev.off() 