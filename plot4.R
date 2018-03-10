rm(list = ls())
dataFile <- "C:\\Users\\Vikas_Singh\\Desktop\\coursera\\exploratory data analysis\\week1\\poject1\\household_power_consumption.txt"

Data <- read.table(dataFile, header = T, sep = ";", na.strings = "?")
# convert the date variable to Date class
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")

# Subset the data
subset_data <- subset(Data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time), "%Y-%m-%d %H:%M:%S")

# Plot 4
subset_data$datetime <- as.POSIXct(subset_data$datetime)
par(mfrow = c(2, 2))
attach(subset_data)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(Voltage ~ datetime, type = "l")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(Global_reactive_power ~ datetime, type = "l")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach(subset_data)