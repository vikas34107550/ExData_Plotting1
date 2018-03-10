rm(list = ls())
dataFile <- "C:\\Users\\Vikas_Singh\\Desktop\\coursera\\exploratory data analysis\\week1\\poject1\\household_power_consumption.txt"
Data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subset the data
subset_data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
#chage time nd date to class 
datetime <- strptime(paste(subset_data$Date, subset_data$Time,sep=' '),"%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subset_data$Global_active_power)
subMetering1 <- as.numeric(subset_data$Sub_metering_1)
subMetering2 <- as.numeric(subset_data$Sub_metering_2)
subMetering3 <- as.numeric(subset_data$Sub_metering_3)
par(mfrow=c(1,1))
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()


