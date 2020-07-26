plot1<-function(){
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
  
  #drawing a histogram
  hist(subdata$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",
       main = "Global Active Power")
  
  #copy graph into png file followed by dev.off
  dev.copy(png,file="plot1.png",width=480,height=480)
  dev.off()
  
}
