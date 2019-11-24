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


png("plot2.png", width=480, height=480)
## Plot
with(required_data, {plot(Global_active_power~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")})

##close device
dev.off()