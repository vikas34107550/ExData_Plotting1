dataFile <- "C:\\Users\\Vikas_Singh\\Desktop\\coursera\\exploratory data analysis\\week1\\poject1\\household_power_consumption.txt"
Data <- read.table(dataFile, header = T, sep = ";", na.strings = "?")
# convert the date variable to Date class
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
# Subset the data
subset_data <- subset(Data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
# Convert dates and times into class
subset_data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
# attach data 
attach(data)
#plot2
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Save file into png format
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)
