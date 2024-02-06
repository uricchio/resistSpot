library(ggplot2)
library(cowplot)
library(wesanderson)

data<-read.table("~/projects/resistSpot/catRData.txt",header=T)

ggplot(data=data,aes(x=reorder(category,-positive),y=positive,fill=assignment))+
   geom_bar(stat="identity",position=position_dodge())+theme_classic()+
   ylab("proportion coded positive")+scale_fill_manual(values=wes_palette("Moonrise3"),name="Assignment Type",labels=c("RS","SS"))+
   theme(axis.text.x = element_text(angle = 45,  hjust=1,size=14), axis.title.y = element_text(size=16),axis.text.y= element_text(size=14))+
   scale_x_discrete(name="",labels=c("DC","DVS","DVR","CCP","CPE","APT","RIL","SIL"))
  
ggsave("~/projects/resistSpot/CodingPlot.jpg",height=5,width=8)


# thematic analysis


data<-read.table("~/projects/resistSpot/thematicData.txt",header=F)


plA<-ggplot(data[data$V4=="self",],aes(x=as.factor(paste(V2,V1,sep="")),y=V5,fill=V3))+geom_bar(position="stack",stat="identity")+theme_classic()+
  scale_y_continuous(name="Number of responses")+scale_x_discrete(name="")+
  scale_fill_manual(name="Thematic category",values=wes_palette("FantasticFox1"),guide="none")+
  theme(axis.text.x = element_text(angle = 45,  hjust=1,size=14), axis.title.y = element_text(size=16),axis.text.y= element_text(size=14))

plB<-ggplot(data[data$V4=="researcher",],aes(x=as.factor(paste(V2,V1,sep="")),y=V5,fill=V3))+geom_bar(position="stack",stat="identity")+theme_classic()+
  scale_y_continuous(name="Number of responses")+scale_x_discrete(name="")+
  scale_fill_manual(name="Thematic category",values=wes_palette("FantasticFox1"))+
  theme(axis.text.x = element_text(angle = 45,  hjust=1,size=14), axis.title.y = element_text(size=16),axis.text.y= element_text(size=14))

plot_grid(plA,plB,labels=c("A","B"),rel_widths=c(1,1.4))

ggsave("~/projects/resistSpot/ThematicPlot.jpg",height=4,width=10)



