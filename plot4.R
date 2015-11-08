#setting working directory
setwd("C:/Users/Divya/Desktop/coursera/exploratory/project1")

#fetching data from file
power_data <- read.table("household_power_consumption.txt",sep=";", header=TRUE, dec=".")
head(power_data)

#Getting data for only for given dates
feb_power_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]
head(feb_power_data)
feb_gl_act_Power <- as.numeric(feb_power_data$Global_active_power)
feb_gl_rct_Power <- as.numeric(feb_power_data$Global_reactive_power)
feb_voltage <- as.numeric(feb_power_data$Voltage)
SM1 <- as.numeric(feb_power_data$Sub_metering_1)
SM2 <- as.numeric(feb_power_data$Sub_metering_2)
SM3 <- as.numeric(feb_power_data$Sub_metering_3)

#plotting the histrogram into png file
date_format <- strptime(paste(feb_power_data$Date, feb_power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(date_format, feb_gl_act_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_format, feb_voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_format, SM1, type="l", ylab="Energy sub metering", xlab="")
lines(date_format, SM2, type="l", col="red")
lines(date_format, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_format, feb_gl_rct_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
