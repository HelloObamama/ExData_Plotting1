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
# visualization
par(mfrow = c(1,1))
plot(y = EPData$Global_active_power, x = EPData$DateTime, type= 'l', 
     xlab = '', ylab = 'Global Active Power (kilowatts)')

# Copy screen plot to png files
dev.copy(png, file = "~/Documents/MOOC/ExData_Plotting1/plot2.png")
dev.off()