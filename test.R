

Chrome = read.csv(file = "C:/Users/Shrutik/Desktop/Spring 2016/IST 719/Chrome History/Chrome_History_4.9.2016.csv", sep = ",")
Canary = read.csv(file = "C:/Users/Shrutik/Desktop/Spring 2016/IST 719/Chrome History/Canary_History.csv", sep = ",") 
str(Chrome)
str(Canary)
temp1 = data.frame(Chrome$URL,Chrome$Visited.On)
names(temp1) = c("URL","Visit.Time")
temp2 = data.frame(Canary$URL, Canary$Visit.Time)
names(temp2) = c("URL","Visit.Time")
temp = rbind(temp1,temp2)
str(temp)

#temp = read.csv(file = "C:/Users/Shrutik/Desktop/Spring 2016/IST 719/Chrome History/4.25.csv", sep = ",")

#fix(temp)


#sum(temp$Title == 'Google')
#sum(temp$Title == 'Facebook')
#sum(temp$Title == 'Gmail')


str(temp)
#fix(temp)





length(grep(pattern = "www.google",temp$URL))
length(grep(pattern = "www.facebook",temp$URL))
length(grep(pattern = "mail.google",temp$URL))
length(grep(pattern = "bbgroupa.syr.edu",temp$URL))
length(grep(pattern = "https://mail.google.com/mail/",temp$URL))
length(grep(pattern = "https://www.facebook.com/",temp$URL))
length(grep(pattern = "www.imdb",temp$URL))
length(grep(pattern = "imdb",temp$URL))
length(grep(pattern = "twitter",temp$URL))

#temp[temp$URL[grep(pattern = "twitter",temp$URL)],3]


#temp[temp$URL[grep(pattern = "facebook",temp$URL)],3]

#aggregate(URL[grep(pattern = "twitter",temp$URL)], data = temp, FUN = length)


#head(table(temp$URL))


#head(temp$Visited.On)

tt = temp
str(tt$Visit.Time)

tt$date = as.POSIXct(temp$Visit.Time, format = "%m/%d/%Y %I:%M:%S %p")
str(tt)
head(tt$Visit.Time,20)
tt$day <- format(tt$date, format="%Y-%m-%d")
str(tt$Visit.Time)
str(tt$day)
#fix(tt)
#grep("google",tt$URL)

head(tt)



# Count visits per day
lgrep <- function(tt,pat)
        { 
          c <- grep(pat, tt$URL);
          return(length(c))
        }


counts.google <- ddply(tt, .(day), "lgrep", pat="www.google", .progress="text")
counts.mail <- ddply(tt, .(day), "lgrep", pat="mail.google", .progress="text")
counts.facebook <- ddply(tt, .(day), "lgrep", pat="facebook", .progress="text")
counts.wiki <- ddply(tt, .(day), "lgrep", pat="wikipedia", .progress="text")
counts.blackboard <- ddply(tt, .(day), "lgrep", pat="bbgroupa", .progress="text")
counts.imdb <- ddply(tt, .(day), "lgrep", pat="imdb", .progress="text")
counts.outlook <- ddply(tt, .(day), "lgrep", pat="outlook", .progress="text")
counts.stackoverflow <- ddply(tt, .(day), "lgrep", pat="stackoverflow", .progress="text")
counts.youtube <- ddply(tt, .(day), "lgrep", pat="youtube", .progress="text")

df <- data.frame(
                  day=counts.google$day
                  , Google=counts.google$lgrep
                  , GMail = counts.mail$lgrep
                  , Facebook=counts.facebook$lgrep
                  , Wikipedia=counts.wiki$lgrep
                  , BB=counts.blackboard$lgrep
                  , imdb=counts.imdb$lgrep
                  , outlook = counts.outlook$lgrep
                  , stackoverflow = counts.stackoverflow$lgrep
                  , youtube = counts.youtube$lgrep) 

str(df)
# fix(df)
em <- melt(df, id = "day")
str
fix(em)
#em$day[max(em$value)]
#fix(temp)

ggplot(aes(as.Date(day), value, color = variable), colour=clarity , data=em) + 
  scale_x_date('') + 
  stat_smooth() + 
  scale_y_continuous('visits') + 
  geom_line(alpha=0.25) +  
  geom_point(alpha=0.20) + 
#  opts(legend.title = theme_text(colour = 'white', size = 0)) + 
  scale_colour_brewer(palette="Set1")

str(tt)
tt$weekdays <- weekdays(tt$date,abbreviate = F)
str(tt)






counts.google.weekday <- ddply(tt, .(weekdays), "lgrep", pat="www.google", .progress="text")
counts.mail.weekday <- ddply(tt, .(weekdays), "lgrep", pat="mail.google", .progress="text")
counts.facebook.weekday <- ddply(tt, .(weekdays), "lgrep", pat="facebook", .progress="text")
counts.wiki.weekday <- ddply(tt, .(weekdays), "lgrep", pat="wikipedia", .progress="text")
counts.blackboard.weekday <- ddply(tt, .(weekdays), "lgrep", pat="bbgroupa", .progress="text")
counts.imdb.weekday <- ddply(tt, .(weekdays), "lgrep", pat="imdb", .progress="text")
counts.outlook.weekday <- ddply(tt, .(weekdays), "lgrep", pat="outlook", .progress="text")
counts.stackoverflow.weekday <- ddply(tt, .(weekdays), "lgrep", pat="stackoverflow", .progress="text")
counts.youtube.weekday <- ddply(tt, .(weekdays), "lgrep", pat="youtube", .progress="text")

df_weekdays <- data.frame(
    day=counts.google.weekday$weekdays
  , Google=counts.google.weekday$lgrep
  , BB=counts.blackboard.weekday$lgrep
  , Facebook=counts.facebook.weekday$lgrep
  , GMail = counts.mail.weekday$lgrep
  , outlook = counts.outlook.weekday$lgrep
#  , stackoverflow = counts.stackoverflow.weekday$lgrep
  , youtube = counts.youtube.weekday$lgrep
  , imdb=counts.imdb.weekday$lgrep
  ) 

df_weekdays[(df_weekdays$day=="Monday"),]


target = c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")

df_weekdays$day <- reorder.factor(df_weekdays$day, new.order=target)

str(df_weekdays)

fix(df_weekdays)
melteddf_weekdays = melt(df_weekdays, id = "day")

ggplot(melteddf_weekdays, aes(day, value)) +   
  geom_bar(aes(fill = variable), position = "dodge", stat="identity")



str(temp)
c <- grep("google", temp$URL);






