##For this to work, you need to  
#1. Download the data from here:
#   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#2. Unzip it into your working folder.
##If all steps were followed, you should have a .txt file named 'household_power_consumption.txt" in your working folder

##First we load the data  into R
household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";")

#We subset it to the wanted dates - '1/2/2007' or '2/2/2007'
data<-household_power_consumption[(household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007"),]
#We retrieve the Global_active_power data and convert the data type from factor to numeric
gap<-as.numeric(as.character(data$Global_active_power))

#we start the png device
png(filename="plot1.png",width=480,height=480)


#We make the histogram, colored red, main title Global active power, with x axis label
hist(gap,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#And we shut down the last device used - png
dev.off()