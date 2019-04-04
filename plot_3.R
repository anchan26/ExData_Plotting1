setwd("C:/Users/Mahe/Documents/R/courseraR")
fulldata<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
main_Data  <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
main_Data $Date <- as.Date(main_Data $Date, format="%d/%m/%Y")
date_time <- paste(as.Date(main_Data $Date), main_Data $Time)
main_Data $Datetime <- as.POSIXct(date_time)

with(main_Data , {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
