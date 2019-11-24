##Setting Working Directory
setwd("C:/Users/alok_/Desktop/R Scope/Exploratory Data Analysis/Week1")

##Load Data from txt file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

##Select data for 2 days (1/2/2007 and 2/2/2007)
required_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

##Convert Date in required Format
required_data$Date <- as.Date(required_data$Date, format="%d/%m/%Y")


png("plot1.png", width=480, height=480)
##Plot Histogram
hist(required_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##close device
dev.off()