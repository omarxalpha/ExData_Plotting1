#plot 2
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "electric_p.zip")

if(!exists("household_power_consumption.txt")){
  unzip("electric_p.zip")
}

electric_pow <- read.delim("household_power_consumption.txt", header= TRUE, sep = ";")
electric_pow <- subset(electric_pow, Date == "1/2/2007" | Date == "2/2/2007")

electric_pow$Global_active_power <-  as.numeric(as.character(electric_pow$Global_active_power))
electric_pow$Date <- as.Date(as.character(electric_pow$Date), "%d/%m/%Y")
electric_pow$Time <- strptime(electric_pow$Time, format="%H:%M:%S")

electric_pow[1:1440,"Time"] <- format(electric_pow[1:1440,"Time"],"2007-02-01 %H:%M:%S")
electric_pow[1441:2880,"Time"] <- format(electric_pow[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot2.png", width=480, height=480)
with(electric_pow, plot(Time, Global_active_power, type = "l",
                        ylab="Global Active Power (kilowatts)"))
dev.off ()
