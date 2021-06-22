## Read data file

df <- read.table("household_power_consumption.txt",sep=";", header = T)
subdf <- subset(df,df$Date=="1/2/2007" | df$Date =="2/2/2007")



## open png file to save plot
png("plot1.png", width = 480, height = 480)
## make the plot 
hist(as.numeric(as.character(subdf$Global_active_power)),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
