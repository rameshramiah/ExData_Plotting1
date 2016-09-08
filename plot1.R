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
    
    
    ## Plot 1
    png("plot1.png", width=480, height=480)
    hist(epc$Global_active_power, main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
    dev.off()
}