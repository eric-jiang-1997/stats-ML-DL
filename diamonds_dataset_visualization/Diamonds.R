library("ggplot2")
library("dplyr")

###Part 1###
#data overview
str(diamonds)

#data cleaning
ordered.cut <- c("Fair","Good","Very Good","Premium","Ideal")
ordered.cut <- factor(1:length(ordered.cut),labels = ordered.cut)
diamonds$cut<-factor(diamonds$cut,levels = levels(ordered.cut))
ordered.color <- c("J","I","H","G","F","E","D")
ordered.color <- factor(1:length(ordered.color),labels = ordered.color)
diamonds$color<-factor(diamonds$color,levels = levels(ordered.color))
ordered.clarity <- c("I1","SI2","SI1","VS2","VS1","VVS2","VVS1","IF")
ordered.clarity <- factor(1:length(ordered.clarity),labels = ordered.clarity)
diamonds$clarity<-factor(diamonds$clarity,levels = levels(ordered.clarity))

#distribution of price and carat
ggplot(diamonds,aes(price))+geom_histogram(binwidth = 30,aes(fill=price))
ggplot(diamonds,aes(carat))+geom_histogram(binwidth = 0.1,aes(fill=carat))
boxplot(diamonds$price)
boxplot(diamonds$carat)

#overview of central tendency, dispersion and range
summary(diamonds)
#Also, a table is included in the appendix.

###Part 2###
#test assumptions
g1<-ggplot(data=diamonds,aes(x=carat,y=price,color=factor(cut)))
g1+geom_point(size=0.25)+geom_smooth(method = "lm")+ylim(0,20000)
g2<-ggplot(data=diamonds,aes(x=carat,y=price,color=factor(color)))
g2+geom_point(size=0.25)+geom_smooth(method = "lm")+ylim(0,20000)
g3<-ggplot(data=diamonds,aes(x=carat,y=price,color=factor(clarity)))
g3+geom_point(size=0.25)+geom_smooth(method = "lm")+ylim(0,20000)

#a step further to look at the data by categories of cut, color and clarity
diamonds %>% group_by(cut) %>% summarise(median_carat=median(carat),median_price=median(price))
diamonds %>% group_by(color) %>% summarise(median_carat=median(carat),median_price=median(price))
diamonds %>% group_by(clarity) %>% summarise(median_carat=median(carat),median_price=median(price))

#study the purchasing behavior
ggplot(diamonds,aes(cut,price))+geom_boxplot()
ggplot(diamonds,aes(cut,carat))+geom_boxplot()
ggplot(diamonds,aes(color,price))+geom_boxplot()
ggplot(diamonds,aes(color,carat))+geom_boxplot()
ggplot(diamonds,aes(clarity,price))+geom_boxplot()
ggplot(diamonds,aes(clarity,carat))+geom_boxplot()






