## Routine to do the following:

## Create a set of plots for data  
## in the "Individual household electric power consumption Data Set"
## for the dates 2007-02-01 and 2007-02-02.

## Uses sqldf package to restrict data loaded into memory
## install.packages("sqldf")
## library(sqldf)

CreatePlot4 <- function() {
        
        electric <- read.csv.sql("household_power_consumption.txt",
                                 sql = "select * from file where Date = 
                                 '1/2/2007' or Date = '2/2/2007'", 
                                 header=TRUE, sep=";")    
        Date_Time <- strptime(paste(electric$Date, electric$Time),
                              "%d/%m/%Y %H:%M:%S")
        electric <- cbind(electric,Date_Time)
        
        par(mfrow=c(2,2))
        
        with(electric,plot(Date_Time,Global_active_power,
                           type="l",xlab="",
                           ylab="Global Active Power (kilowatts)"))
        
        with(electric,plot(Date_Time,Voltage,
                           type="l",xlab="datetime",
                           ylab="Voltage"))
        
        with(electric,plot(Date_Time,Sub_metering_1,type="l",xlab="",
                           ylab="Energy sub metering"))
        with(electric,lines(Date_Time,Sub_metering_2,col="red"))
        with(electric,lines(Date_Time,Sub_metering_3,col="blue"))
        legend("topright", pch=c(NA,NA,NA), lwd=1, 
               col=c("black","red","blue"), 
               legend = c("Sub_metering_1","Sub_metering_2",
                          "Sub_metering_3"),
               cex=0.5, bty="n", text.width=strwidth("Sub_metering_1"))
        
        with(electric,plot(Date_Time,Global_reactive_power,
                           type="l",xlab="datetime",
                           ylab="Global_reactive_power"))
        
        dev.copy(png,file="plot4.png",width=480,height=480)
        dev.off()
}