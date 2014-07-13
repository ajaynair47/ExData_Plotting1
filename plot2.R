## Routine to do the following:

## Create a time series plot for the Global_active_power column 
## in the "Individual household electric power consumption Data Set"
## for the dates 2007-02-01 and 2007-02-02.

## Uses sqldf package to restrict data loaded into memory
## install.packages("sqldf")
## library(sqldf)

CreatePlot2 <- function() {
        
        electric <- read.csv.sql("household_power_consumption.txt",
                                 sql = "select * from file where Date = 
                                 '1/2/2007' or Date = '2/2/2007'", 
                                 header=TRUE, sep=";")    
        Date_Time <- strptime(paste(electric$Date, electric$Time),
                              "%d/%m/%Y %H:%M:%S")
        electric <- cbind(electric,Date_Time)
        with(electric,plot(Date_Time,Global_active_power,
                           type="l",xlab="",
                           ylab="Global Active Power (kilowatts)"))
        dev.copy(png,file="plot2.png",width=480,height=480)
        dev.off()
}