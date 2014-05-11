##For this to work, you need to  
#1. Download the data from here:
#   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#2. Unzip it into your working folder.
##If all steps were followed, you should have a .txt file named 'household_power_consumption.txt" in your working folder

##First we load the data  into R
household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";")

#We subset it to the wanted dates - '1/2/2007' or '2/2/2007'
data<-household_power_consumption[(household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007"),]
#We retrieve the submetering data and date/time and convert the data type from factor to numeric
data$submeter_1<-as.numeric(as.character(data$Sub_metering_1))
data$submeter_2<-as.numeric(as.character(data$Sub_metering_2))
data$submeter_3<-data$Sub_metering_3
#We append the date time data using strptime and format approprately
data$datetime<-strptime(paste(as.character(data$Date),as.character(data$Time)),"%d/%m/%Y %H:%M")

#we start the png device
png(filename="plot3.png",width=480,height=480)

#We will draw three plots over each other - one for each submetering
plot(data$datetime,data$submeter_1,type="l",ylim=range(c(0,40)),axes=FALSE,xlab="",ylab="")
#this is to make it overwrite
par(new=TRUE)
#and now we repeat for submeter 2, changing the color
plot(data$datetime,data$submeter_2,type="l",ylim=range(c(0,40)),axes=FALSE,xlab="",ylab="",col="red")
par(new=TRUE)
#and now we repeat for submeter 3, only we add the x axis by omitting the y, and label the y axis
plot(data$datetime,data$submeter_3,type="l",ylim=range(c(0,40)),yaxt="n",xlab="",ylab="Energy sub metering",col="blue")
par(new=TRUE)
#we add the axis and the legend
axis(side=2,at=c(0,10,20,30))
legend("topright",lwd="1",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#And we shut down the last device used - png
dev.off()