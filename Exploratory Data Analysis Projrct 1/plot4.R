plot4<-function(){
  #storing the path of working directory in variable
  workingdirectory<-getwd()
  
  #Path to the data is created by concatenating file name and working
  #directory path and storing it in variable  datapath
  datapath<-paste(workingdirectory,"/household_power_consumption.txt",sep="")
  
  #reading the data to powerdata variable
  powerdata<-read.table(datapath,header = TRUE,sep = ";",na.strings = "?")
  
  #Creating a column which combines date and time columns and naming it DatewithTime
  powerdata$DatewithTime<-strptime(paste(powerdata$Date,powerdata$Time),"%d/%m/%Y %H:%M:%S")
  
  # Converting date column into date class
  powerdata$Date<-as.Date(powerdata$Date,format="%d/%m/%Y")
  
  #Storing  dates 2007-02-01 and 2007-02-02 as variables of date class
  date1<-as.Date("2007-02-01",format="%Y-%m-%d")
  date2<-as.Date("2007-02-02",format="%Y-%m-%d")
  
  #subsetting data to include data point for  dates 2007-02-01 and 2007-02-02
  subdata<-subset(powerdata,Date==date1 | Date==date2)
  
  # creating a 2x2 crid for four graphs through mfrow
  par(mfrow=c(2,2))
  
  #Plot Global_active_power against time
  plot(subdata$DatewithTime,subdata$Global_active_power,type = "l",xlab = "",
       ylab = "Global Active Power (kilowatts)")
  
  #Plot Voltage against time
  plot(subdata$DatewithTime,subdata$Voltage,type = "l",xlab = "",
       ylab = "Voltage")
  
  #Plot Sub_metering_1:Sub_metering_3 against time
  plot(subdata$DatewithTime,subdata$Sub_metering_1,type = "l",xlab = "",
       ylab = "Energy sub metering")
  lines(subdata$DatewithTime,subdata$Sub_metering_2,col="red")
  lines(subdata$DatewithTime,subdata$Sub_metering_3,col="blue")
  
  #Plot Global_recative_power against time
  
  
  plot(subdata$DatewithTime,subdata$Global_reactive_power,type = "l",xlab = "datetime",
       ylab = "Global_reactive_power" )
  
  #copy graph into png file followed by dev.off
  dev.copy(png,file="plot4.png",width=480,height=480)
  dev.off()
}
