file <- "./data/household_power_consumption.txt"
data <- read.table(file,header=TRUE,sep=";",quote="",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
x <- as.Date(data$Date,format="%d/%m/%Y") == "2007-02-01"
y <- as.Date(data$Date,format="%d/%m/%Y") == "2007-02-02"
data2 <- data[x|y,]
par(mfcol=c(2,2))
par(mar=c(4,4,2,2))
plot(data2$datetime,data2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(data2$datetime,y[1:2880],xlab="",ylab="Energy sub metering",type="n")
points(data2$datetime,y[1:2880],col="black",type="l")
points(data2$datetime,y[2881:5760],col="red",type="l")
points(data2$datetime,y[5761:8640],col="blue",type="l")
legend("topright", lty = c(1,1,1), 
       col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n",cex=0.45)
plot(data2$datetime,data2$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(data2$datetime,data2$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")