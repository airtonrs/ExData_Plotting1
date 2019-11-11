#Loading Data
d <- getwd()
setwd("C:/Users/Lu/Documents/R/exdata_data_household_power_consumption")
data_list <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors=FALSE, dec=".")
setwd(d)

Sys.setlocale("LC_TIME", "English") 

#Adjusting data
#Date 
data_list$Date <- as.Date(data_list$Date,format="%d/%m/%Y")

#Time
data_list$Time <- strptime(paste(as.character(data_list$Date),
                                 as.character(data_list$Time)),
                           format="%Y-%m-%d %H:%M:%S")

#Global Active Power to Numeric
data_list$Global_active_power <- as.numeric(data_list$Global_active_power)

#Global Active Power to Numeric
data_list$Global_reactive_power <- as.numeric(data_list$Global_reactive_power)


#Sub Metering to Numeric
data_list$Sub_metering_1 = as.numeric(data_list$Sub_metering_1)
data_list$Sub_metering_2 = as.numeric(data_list$Sub_metering_2)
data_list$Sub_metering_3 = as.numeric(data_list$Sub_metering_3)

#Creating a Subset to the data
plottest <- rbind(subset(data_list,Date=='2007-02-01'),
                  subset(data_list,Date=='2007-02-02'))

#Setting plot to PNG 480x480
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Creating hist as plot4
#1st Graph
with(plottest,plot(Time, Global_active_power, type="l", ylab="Global Active Power", cex=0.2, xlab=""))

#2nd Graph
with(plottest,plot(Time, Voltage, type="l", ylab="Voltage", xlab=""))

#3rd Graph
with(plottest,plot(Time, Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""))
with(plottest,lines(Time, Sub_metering_2, type="l", col="red"))
with(plottest,lines(Time, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#4th Graph
with(plottest,plot(Time, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab=""))

dev.off()



