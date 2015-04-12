png('plot1.png', width = 480, height = 480)
library(sqldf)
#test data
tdata <- read.csv.sql('household_power_consumption.txt',,sep = ';
                      ',sql = 'select * from file limit 6',header = TRUE,
                      colClasses = c('Date','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
#import data needed
data <- read.csv.sql('household_power_consumption.txt',,sep = ';',sql = 'select * from file where Date in("1/2/2007","2/2/2007")',header = TRUE,
                     colClasses = c('character','character','character','character','character','character','character','character','character'))

data$Date <- as.Date(data$Date, '%d/%m/%Y')
data$Time <- strptime(data$Time,'%H:%M:%S')
data$Time <- format(data$Time, '%H:%M:%S')
#test if NA values exist in Global_active_power
sum(data$Global_active_power == '?')
data$Global_active_power <- as.numeric(data$Global_active_power)
hist(data$Global_active_power,freq = T, main = 'Global Active Power', xlab = 'Global Active Power(kilowatts)', ylab = 'Frequency', col = 'red')
dev.off()