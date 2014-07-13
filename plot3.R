## Routine to do the following:

## Create a time series plot for Energy sub meters 
## in the "Individual household electric power consumption Data Set"
## for the dates 2007-02-01 and 2007-02-02.

## Uses sqldf package to restrict data loaded into memory
## install.packages("sqldf")
## library(sqldf)

CreatePlot3 <- function() {
        
        electric <- read.csv.sql("household_power_consumption.txt",
                                 sql = "select * from file where Date = 
                                 '1/2/2007' or Date = '2/2/2007'", 
                                 header=TRUE, sep=";")    
        Date_Time <- strptime(paste(electric$Date, electric$Time),
                              "%d/%m/%Y %H:%M:%S")
        electric <- cbind(electric,Date_Time)
        with(electric,plot(Date_Time,Sub_metering_1,type="l",xlab="",
                           ylab="Energy sub metering"))
        with(electric,lines(Date_Time,Sub_metering_2,col="red"))
        with(electric,lines(Date_Time,Sub_metering_3,col="blue"))
        legend("topright", pch=c(NA,NA,NA), lwd=1, 
               col=c("black","red","blue"), 
               legend = c("Sub_metering_1","Sub_metering_2",
                          "Sub_metering_3"),
               text.width = strwidth("Sub_metering_3")*1.5)
        dev.copy(png,file="plot3.png",width=480,height=480)
        dev.off()
}