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

## Create Plot 2
plot(data_sub$Datetime,
     data_sub$Global_active_power,
     type="l", 
     xlab='',
     ylab='Global Active Power (kilowatts)')

## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off() 