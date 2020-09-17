#Library
library(data.table)
library(dplyr)

dir_d <- getwd()
file_n <- "household_power_consumption.txt"
# Load ,Read and Filter the data
plot_data <- fread(file.path(dir_d,file_n))
plot_data <- select(plot_data, Date,Time, Global_active_power)
plot_data <- filter(plot_data, as.Date(plot_data$Date,"%d/%m/%Y") > "2007-01-31"
               & as.Date(plot_data$Date,"%d/%m/%Y")<"2007-02-03")
plot_data[, dateTime := as.POSIXct(paste(Date, Time),
                                   format = "%d/%m/%Y %H:%M:%S")]
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)
        png("plot2.png", width=480, height=480)
        plot(x= plot_data$dateTime,y=plot_data$Global_active_power, type="l", 
             xlab="", ylab="Global Active Power (kilowatts)")
        
        dev.off()