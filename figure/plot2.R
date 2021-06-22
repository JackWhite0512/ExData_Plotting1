## Read data file

df <- read.table("household_power_consumption.txt",sep=";", header=T)
subdf <- subset(df,df$Date=="1/2/2007" | df$Date =="2/2/2007")

## Transforming the Date and Time vars from characters into objects of 
## type Date and POSIXlt 

subdf$Date <- as.Date(subdf$Date, format="%d/%m/%Y")
subdf$Time <- strptime(subdf$Time, format="%H:%M:%S")
subdf[1:1440,"Time"] <- format(subdf[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdf[1441:2880,"Time"] <- format(subdf[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## open png file to save plot
png("plot2.png", width = 480, height = 480)
## make the plot 
plot(subdf$Time,as.numeric(as.character(subdf$Global_active_power)),type="l",
     xlab="",ylab="Global Active Power (kilowatts)", 
     main = "Global Active Power Vs Time") 
dev.off()
