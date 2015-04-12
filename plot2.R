png('plot2.png', width = 480, height = 480)
library(sqldf)
data <- read.csv.sql('household_power_consumption.txt',,sep = ';',sql = 'select * from file where Date in("1/2/2007","2/2/2007")',header = TRUE,
                     colClasses = c('character','character','character','character','character','character','character','character','character'))
Sys.setlocale('LC_TIME','C')
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data$Time <- strptime(data$Time,'%H:%M:%S')
data$Time <- format(data$Time, '%H:%M:%S')
#generate var 'day' to identify weekdays
day <- paste(data$Date, data$Time)
dataall <- cbind(data,day)
dataall$day <- strptime(dataall$day, '%Y-%m-%d %H:%M:%S')
plot(dataall$day,dataall$Global_active_power,type = 'l',ylab = 'Global Active Power(kilowatts)',xlab = "")
dev.off()