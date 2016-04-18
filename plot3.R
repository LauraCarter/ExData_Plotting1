## plot3 - sub meters
plotthree <- function (x = c(x))
{
      ## read in the data and subset to the dates required
      alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
      data <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"),]
      
      ## add column for date and time
      data$datetime <- as.POSIXct(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")
      
      ## code for graph
      with(data, plot(datetime, Sub_metering_1, type = "n", ylab= "Energy sub metering", xlab = ""))
      lines(data$datetime, data$Sub_metering_1, col = "black")
      lines(data$datetime, data$Sub_metering_2, col = "red")
      lines(data$datetime, data$Sub_metering_3, col = "blue")
      legend("topright", lty = c(1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
      
      ## copy to png file
      dev.copy(png, "plot3.png")
      dev.off()
}