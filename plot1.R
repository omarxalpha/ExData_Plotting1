
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "electric_p.zip")

if(!exists("household_power_consumption.txt")){
  unzip("electric_p.zip")
}

electric_pow <- read.delim("household_power_consumption.txt", header= TRUE, sep = ";")
electric_pow <- subset(electric_pow, Date == "1/2/2007" | Date == "2/2/2007")
electric_pow$Global_active_power <-  as.numeric(as.character(electric_pow$Global_active_power))

png("plot1.png", width=480, height=480)
with(electric_pow, hist(Global_active_power, col="red", 
                        xlab = "Global Active Power (kilowats)",
                        main = "Global Active Power"))
dev.off ()

