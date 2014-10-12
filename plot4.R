Sys.setlocale("LC_TIME", "en_US.UTF-8")

pc <- read.csv('household_power_consumption.txt', sep=';', colClasses="character")
spc <- subset(pc, pc$Date == "1/2/2007" | pc$Date == "2/2/2007")

# convert columns
spc$Global_active_power <- as.numeric(spc$Global_active_power)
spc$Global_reactive_power <- as.numeric(spc$Global_reactive_power)
spc$Sub_metering_1 <- as.numeric(spc$Sub_metering_1)
spc$Sub_metering_2 <- as.numeric(spc$Sub_metering_2)
spc$Sub_metering_3 <- as.numeric(spc$Sub_metering_3)
spc$Voltage <- as.numeric(spc$Voltage)
spc$time <- strptime(paste(spc$Date, spc$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png")
par(mfcol=c(2,2))

plot(spc$time, spc$Global_active_power, ylab="Global Active Power", xlab="", type="l")

plot(spc$time, spc$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(spc$time, spc$Sub_metering_1, type="l", col="black")
lines(spc$time, spc$Sub_metering_2, type="l", col="red")
lines(spc$time, spc$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, bty="n")

plot(spc$time, spc$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(spc$time, spc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()