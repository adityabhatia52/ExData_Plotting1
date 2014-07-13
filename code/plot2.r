file <- "./data/household_power_consumption.txt"
data <- read.table(file,header=TRUE,sep=";",quote="",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
x <- as.Date(data$Date,format="%d/%m/%Y") == "2007-02-01"
y <- as.Date(data$Date,format="%d/%m/%Y") == "2007-02-02"
data2 <- data[x|y,]
data2$datetime <- strptime(paste(data2$Date,data2$Time),format="%d/%m/%Y %H:%M:%S")
plot(data2$datetime,data2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")