varNames<-read.table("household_power_consumption.txt",sep=";",nrow=1); 
var<-sapply(varNames,toString);

dataDay<-read.table("household_power_consumption.txt",sep=";",skip=1,colClasses=c(NA, "NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL"));
dataDay<-as.Date(dataDay[,1],"%d/%m/%Y");
date1=as.Date("1/2/2007","%d/%m/%Y")
date2=as.Date("2/2/2007","%d/%m/%Y")
indices<-dataDay==date1 | dataDay==date2;
nkip<-sum(dataDay<date1);
data<-read.table("household_power_consumption.txt",sep=";",skip=nkip+1,nrow=sum(indices));
names(data)<-var;

x<-with(data, paste(Date,Time));
z<-strptime(x, format="%d/%m/%Y %H:%M:%S");
data<-cbind(data,z);
png(file="plot2.png",width=480,height=480);
plot(data$z,data$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowats)");
dev.off();