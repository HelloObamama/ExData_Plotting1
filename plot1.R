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

# visualization
par(mfrow=c(1,1))
hist(EPData$Global_active_power, xlab = 'Global Active Power (killowatts)', col = 'red', 
     main = 'Global Active Power')

# Copy screen plot to png files
dev.copy(png, file = "~/Documents/MOOC/ExData_Plotting1/plot1.png")
dev.off()