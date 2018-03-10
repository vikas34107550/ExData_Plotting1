rm(list = ls())
Data<- read.csv("C:\\Users\\Vikas_Singh\\Desktop\\coursera\\exploratory data analysis\\week1\\poject1\\household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
#convert into data and time class
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
head(Data)
#subset data
subset_data <- subset(Data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
head(subset_data)
attach(subset_data)
#Histogram for global active power
hist(Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "red")

# Save it to plot1.png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(subset_data)
