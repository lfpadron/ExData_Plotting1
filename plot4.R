# sets working directory

setwd("C:/Users/lfpadron.lfpadron-HP.000/Documents/2017-08-11_DataScience/R Working/04-ExploratoryData1")


# the origianal data was downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# then it was unzipped

electric_consumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

power_consumption <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(power_consumption$Date), power_consumption$Time)
power_consumption$Datetime <- as.POSIXct(datetime)

## creates plot4

par(mfrow=c(2,2), mar=c(4,4,2,1))
with(power_consumption, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy Submetering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})
  
dev.copy(png, file="plot4.png", width=480, height=480)   

dev.off()

print("plot4.png created successfully")