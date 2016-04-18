## plot2 - red bar chart
plottwo <- function (x = c(x))
{
      ## read in the data and subset to the dates required
      alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
      data <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"),]
      
      ## add column for date and time
      data$datetime <- as.POSIXct(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")
      
      ## code for graph
      with(data, plot(datetime, Global_active_power, type = "n", ylab= "Global Active Power (kilowatts)", xlab = ""))
      lines(data$datetime, data$Global_active_power)
      
      ## copy to png file
      dev.copy(png, "plot2.png")
      dev.off()
}