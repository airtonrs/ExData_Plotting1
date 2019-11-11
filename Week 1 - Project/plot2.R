#Loading Data
d <- getwd()
setwd("C:/Users/Lu/Documents/R/exdata_data_household_power_consumption")
data_list <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors=FALSE, dec=".")
setwd(d)

#Adjusting data
#Date 
data_list[,1] <- as.Date(data_list[,1],format="%d/%m/%Y")

#Time
data_list$Time <- strptime(paste(as.character(data_list$Date),
                                 as.character(data_list$Time)),
                           format="%Y-%m-%d %H:%M:%S")

#Global Active Power to Numeric
data_list[,3] <- as.numeric(data_list[,3])


#Creating a Subset to the data
plottest <- rbind(subset(data_list,Date=='2007-02-01'),
                  subset(data_list,Date=='2007-02-02'))

#Setting plot to PNG 480x480
png("plot2.png", width=480, height=480)

#Creating hist as plot1
with(plottest,plot(Time,Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()



