table<- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
table$Date <- as.Date(table$Date, "%d/%m/%Y")
data<- subset(table,table$Date>=as.Date("2007-2-1") &table$Date<=as.Date("2007-2-2"))
data<- data[complete.cases(data),]
dateTime<- paste(data$Date,data$Time)
dateTime<- setNames(dateTime,"DateTime")
data<-cbind(data,dateTime)
data$DateTime<-as.POSIXct(dateTime)


with(data,{plot(Sub_metering_1~DateTime,type="l",col="black")
        lines(Sub_metering_2~DateTime,type="l",col="red")
        lines(Sub_metering_3~DateTime,type="l",col="blue")})

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()