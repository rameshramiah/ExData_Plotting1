{
    ## Before you run this script, download the Electric power consumption dataset
    ## from the course website.
    ## Extract the default folder on the zip file to your working directory.
    
    
    ## Reading the full electric power consumption dataset
    epc_data <- read.csv("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", 
                         header=T, sep=';', na.strings="?", check.names=F, 
                         stringsAsFactors=F, dec=".", comment.char="",quote='\"')
    epc_data$Date <- as.Date(epc_data$Date, format="%d/%m/%Y")
    
    
    ## Subsetting the required dates from the full electric power consumption dataset
    epc <- subset(epc_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
    rm(epc_data)
    
    
    ## Converting dates
    datetime <- paste(as.Date(epc$Date), epc$Time)
    epc$Datetime <- as.POSIXct(datetime)
    
    
    ## Plot 4
    png("plot4.png", width=480, height=480)
    
    par(mfrow = c(2, 2))
    with(epc, {
               plot(Global_active_power ~ Datetime, type="l",
                    ylab="Global Active Power", xlab="")
               
               plot(Voltage ~ Datetime, type="l")
               
               plot(Sub_metering_1 ~ Datetime, type="l",
                    ylab="Energy sub metering", xlab="")
               lines(Sub_metering_2 ~ Datetime,col='Red')
               lines(Sub_metering_3 ~ Datetime,col='Blue')
               legend("topright", c("Sub_metering_1", "Sub_metering_2",
                                    "Sub_metering_3"), 
                      col=c("black", "red", "blue"), lty=1, lwd=2, bty="n")
               
               plot(Global_reactive_power ~ Datetime, type="l")
               }
           )
    
    dev.off()
}