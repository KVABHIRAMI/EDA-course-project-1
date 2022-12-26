## read data text file
power<-read.table('C:/Users/EFDVF/Downloads/household_power_consumption.txt',skip=1,sep=";")
names(power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
## subset for desired dates
subpower<- subset(power, Date %in% c("1/2/2007","2/2/2007"))
## format dates
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
## plot desired data

hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
#annoting the graph
title(main="Global Active Power")
## save to png
dev.copy(png,"PLOT.png", width=480, height=480)
## close PNG device
dev.off()
