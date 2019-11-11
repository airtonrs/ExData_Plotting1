#Loading Data
data_list <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#Adjusting data
#Date 
data_list[,1] <- as.Date(data_list[,1],format="%d/%m/%Y")

#Time
data_list[,2] <- with(data_list,strptime(x=paste(as.character(Date),
                                                 as.character(Time)),
                                                 format="%Y-%m-%d %H:%M:%S"))

#Global Active Power to Numeric
data_list[,3] <- as.numeric(data_list[,3])


#Creating a Subset to the data
plottest <- rbind(subset(data_list,Date=='2007-02-01'),
                  subset(data_list,Date=='2007-02-02'))


#Creating hist as plot1
hist(plottest$Global_active_power/500,col="red",main="Global Active Power",xlab = "Global Active Power (killowatts)")

with(plottest,plot(Time,Global_active_power/500))

