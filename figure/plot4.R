## Read data file

df <- read.table("household_power_consumption.txt",sep=";", header = T)
subdf <- subset(df,df$Date=="1/2/2007" | df$Date =="2/2/2007")

## Transforming the Date and Time vars from characters into objects of 
## type Date and POSIXlt 

subdf$Date <- as.Date(subdf$Date, format="%d/%m/%Y")
subdf$Time <- strptime(subdf$Time, format="%H:%M:%S")
subdf[1:1440,"Time"] <- format(subdf[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdf[1441:2880,"Time"] <- format(subdf[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


## open png file to save plot
png("plot4.png", width = 480, height = 480)
## make a plot with 4 graphs
par(mfrow=c(2,2))
with(subdf,{
  # First graph
  plot(subdf$Time,as.numeric(as.character(subdf$Global_active_power)),type="l",
       xlab="",ylab="Global Active Power")  
  # Second graph
  plot(subdf$Time,as.numeric(as.character(subdf$Voltage)), type="l",
       xlab="datetime",ylab="Voltage")
  # Third graph
  plot(subdf$Time,subdf$Sub_metering_1,type="n",
       xlab="",ylab="Energy sub metering")
  with(subdf,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subdf,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subdf,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  # Fourth graph
  plot(subdf$Time,as.numeric(as.character(subdf$Global_reactive_power)),
       type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()