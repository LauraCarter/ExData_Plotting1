## plot1 - red bar chart
plotone <- function (x = c(x))
{
      ## read in the data and subset to the dates required
      alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
      data <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"),]
      
      ## add column for date and time
      data$datetime <- as.POSIXct(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")
      
      ## code for histogram
      hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
      
      ## copy to png file
      dev.copy(png, "plot1.png")
      dev.off()
}