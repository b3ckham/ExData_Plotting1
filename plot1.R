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

## Create Plot 1
hist(data_sub$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off() 