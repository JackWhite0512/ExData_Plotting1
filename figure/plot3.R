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
png("plot3.png", width = 480, height = 480)
## make the plot 
plot(subdf$Time,subdf$Sub_metering_1,type="n",xlab="",
     ylab="Energy sub metering", main="Energy sub-metering")
## include Sub_metering_1-3
with(subdf,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subdf,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subdf,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
## Add legend to plot
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()