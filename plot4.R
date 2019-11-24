##Setting Working Directory
setwd("C:/Users/alok_/Desktop/R Scope/Exploratory Data Analysis/Week1")


##Load Data from txt file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

##Select data for 2 days (1/2/2007 and 2/2/2007)
required_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

##Convert Date in required Format
required_data$Date <- as.Date(required_data$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(required_data$Date), required_data$Time)
required_data$Datetime <- as.POSIXct(datetime)


par(mfrow=c(2,2))


with(required_data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5, bty="n",cex =0.65,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot111444.png", height=480, width=480)
dev.off()