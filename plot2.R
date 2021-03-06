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

## creates plot2
with(power_consumption, {
  plot(Global_active_power~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
  })
  
dev.copy(png, file="plot2.png", width=480, height=480)   

dev.off()

print("plot2.png created successfully")