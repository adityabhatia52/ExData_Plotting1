file <- "./data/household_power_consumption.txt"
data <- read.table(file,header=TRUE,sep=";",quote="",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
x <- as.Date(data$Date,format="%d/%m/%Y") == "2007-02-01"
y <- as.Date(data$Date,format="%d/%m/%Y") == "2007-02-02"
data2 <- data[x|y,]
par(mfcol=c(1,1))
hist(data2$Global_active_power,col="orangered",main="Global Active Power",xlab = "Global Active Power (kilowatts)")