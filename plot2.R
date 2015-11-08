#setting working directory
setwd("C:/Users/Divya/Desktop/coursera/exploratory/project1")

#fetching data from file
power_data <- read.table("household_power_consumption.txt",sep=";", header=TRUE, dec=".")
head(power_data)

#Getting data for only for given dates
feb_power_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]
head(feb_power_data)
feb_gl_act_Power <- as.numeric(feb_power_data$Global_active_power)

#plotting the histrogram into png file
date_format <- strptime(paste(feb_power_data$Date, feb_power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(date_format, feb_gl_act_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
