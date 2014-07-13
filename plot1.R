
## Routine to do the following:

## Create a histogram plot for the Global_active_power column 
## in the "Individual household electric power consumption Data Set"
## for the dates 2007-02-01 and 2007-02-02.

## Uses sqldf package to restrict data loaded into memory
## install.packages("sqldf")
## library(sqldf)

CreatePlot1 <- function() {
        
        electric <- read.csv.sql("household_power_consumption.txt",
                                 sql = "select * from file where Date = 
                                 '1/2/2007' or Date = '2/2/2007'", 
                                 header=TRUE, sep=";")    
        par(cex.axis=.8)
        hist(electric$Global_active_power, main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)", col="red")
        dev.copy(png,file="plot1.png",width=480,height=480)
        dev.off()
}