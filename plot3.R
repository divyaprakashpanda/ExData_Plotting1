#setting working directory
setwd("C:/Users/Divya/Desktop/coursera/exploratory/project1")

#fetching data from file
power_data <- read.table("household_power_consumption.txt",sep=";", header=TRUE, dec=".")
head(power_data)

#Getting data for only for given dates
feb_power_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]
head(feb_power_data)
feb_gl_act_Power <- as.numeric(feb_power_data$Global_active_power)
SM1 <- as.numeric(feb_power_data$Sub_metering_1)
SM2 <- as.numeric(feb_power_data$Sub_metering_2)
SM3 <- as.numeric(feb_power_data$Sub_metering_3)

#plotting the histrogram into png file
date_format <- strptime(paste(feb_power_data$Date, feb_power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width=480, height=480)
plot(date_format, SM1, type="l", ylab="Energy sub metering", xlab="")
lines(date_format, SM2, type="l", col="red")
lines(date_format, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
