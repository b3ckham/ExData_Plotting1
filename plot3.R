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

## Create Plot 3
with(data_sub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

## Add Legend
legend("topright", 
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col=c("black", "red", "blue"), 
    lty=1, 
    lwd=2)

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off() 