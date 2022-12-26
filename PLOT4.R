#Reading, naming and subsetting power consumption data
power<-read.table('C:/Users/EFDVF/Downloads/household_power_consumption.txt',skip=1,sep=";")
names(power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
## subset for desired dates
subpower <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
## format dates
subpower$Date <- as.Date(power$Date, format="%d/%m/%Y")
##create data times
dateTime <- paste(as.Date(subpower$Date),subpower$Time)
## format data times
subpower$dateTime <- as.POSIXct(dateTime)
## set workspace for graph to be positioned
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
## plot desired data
with(subpower,{
  ## plot in top left
  plot(Global_active_power ~ dateTime, type="l", 
       xlab="", ylab="Global Active Power (Kilowatts)")
  ## plot in top right
  plot(Voltage ~ dateTime, type="l", 
       xlab="", ylab="Voltage (Volts)")
  ## plot in bottom left
  plot(Sub_metering_1 ~ dateTime, type="l", 
       xlab="", ylab="Global Active Power (Kilowatts)")
  lines(Sub_metering_2 ~ dateTime, col='Red')
  lines(Sub_metering_3 ~ dateTime, col='Blue')
  ## sets legend
  legend("topright", col=c("black","red","blue"), lty=1, lwd=2, bty="n",cex=0.75,
         text.width = 50000,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  ## plot in bottom right
  plot(Global_reactive_power ~ dateTime, type="l",
       xlab="", ylab="Global Reactive Power (Kilowatts)")
})
## save to png
dev.copy(png,"plot4.png", width=480, height=480)
## close PNG device
dev.off()
