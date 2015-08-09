################################################################################################
# 
# This script is for the programming assignment from Coursera Course Exploratory Data Analysis 
# in R
# 
################################################################################################

# read in the data
RawData <- read.table('~/Documents/MOOC/ExData_Plotting1/household_power_consumption.txt',
                      na.strings = '?', header = TRUE, sep = ';')
EPData <- RawData[RawData$Date == '1/2/2007' | RawData$Date == '2/2/2007',]
EPData$DateTime = with(EPData, paste(Date,  Time))
EPData$DateTime = strptime(EPData$DateTime, format = "%d/%m/%Y %H:%M:%S",tz= 'UTC')

# Visualization
par(mfrow = c(2,2))

# visualization 1
hist(EPData$Global_active_power, xlab = 'Global Active Power (killowatts)', col = 'red', 
     main = 'Global Active Power')


# visualization 2
plot(y = EPData$Global_active_power, x = EPData$DateTime, type= 'l', 
     xlab = 'Date Time', ylab = 'Global Active Power (kilowatts)')

# visualization 3 
plot(y = EPData$Sub_metering_1, x = EPData$DateTime, type= 'l', col = 'black',
     xlab = '', ylab = 'Energy Sub Metering')
lines(y = EPData$Sub_metering_2, x = EPData$DateTime, col = 'red')
lines(y = EPData$Sub_metering_3, x = EPData$DateTime, col = 'blue')
legend('topright', col = c('black','red','blue'), pch = c('-','-','-'),
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

# visualization 4
plot(y = EPData$Global_reactive_power, x = EPData$DateTime, type= 'l', 
     xlab = 'Date Time', ylab = 'Global Reactive Power (kilowatts)')

# Copy screen plot to png files
dev.copy(png, file = "~/Documents/MOOC/ExData_Plotting1/plot4.png")
dev.off()