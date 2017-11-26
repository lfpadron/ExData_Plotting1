# sets working directory

setwd("C:/Users/lfpadron.lfpadron-HP.000/Documents/2017-08-11_DataScience/R Working/04-ExploratoryData1")


# the origianal data was downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# then it was unzipped

electric_consumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot1 <- subset(electric_consumption, Date %in% c("1/2/2007","2/2/2007"))
plot1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

# creates plot

hist(plot1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
  
dev.copy(png, file="plot1.png", width=480, height=480)   

dev.off()

print("plot1.png created successfully")