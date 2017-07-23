table<- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
table$Date <- as.Date(table$Date, "%d/%m/%Y")
data<- subset(table,table$Date>=as.Date("2007-2-1") &table$Date<=as.Date("2007-2-2"))
data<- data[complete.cases(data),]
dateTime<- paste(data$Date,data$Time)
dateTime<- setNames(dateTime,"DateTime")
data<-cbind(data,dateTime)
data$DateTime<-as.POSIXct(dateTime)


hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()