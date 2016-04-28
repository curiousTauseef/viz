lgrep <- function(tt,pat)
{ 
  c <- grep(pat, tt$URL);
  return(length(c))
}


counts.google <- ddply(tt, .(day), "lgrep", pat="www.google", .progress="text")

fix(temp)

google = length(grep(pattern = "www.google",temp$URL)) # Alphabet
gmail = length(grep(pattern = "mail.google",temp$URL)) # Alphabet
youtube = length(grep(pattern = "youtube",temp$URL)) # Social # Alphabet


df1 <- data.frame(
  google,gmail,youtube)

df1 = sort(df1)
pie_data1 = t(df1)
pie_data1 = data.frame(pie_data1)
pie(pie_data1$pie_data1) # Alphabet Pie





facebook = length(grep(pattern = "facebook",temp$URL)) # Social
insta = length(grep(pattern = "instagram",temp$URL)) # Social
twitter = length(grep(pattern = "twitter",temp$URL)) # Social
tumblr = length(grep(pattern = "tumblr",temp$URL)) # Social
ninegag = length(grep(pattern = "9gag",temp$URL)) # Social
storypick = length(grep(pattern = "storypick",temp$URL)) # Social
yelp = length(grep(pattern = "yelp",temp$URL)) # Social
quora = length(grep(pattern = "quora",temp$URL)) # Social
buzzfeed1 = length(grep(pattern = "buzzfeed",temp$URL)) # Social
buzzfeed2 = length(grep(pattern = "bzfd",temp$URL)) # Social


df2 <- data.frame(
  facebook,insta,twitter,tumblr,ninegag,storypick,yelp,quora,buzzfeed = buzzfeed1+buzzfeed2)

df2 = sort(df2)
pie_data2 = t(df2)
pie_data2 = data.frame(pie_data2)
pie(pie_data2$pie_data2) # Alphabet Pie




personal3 = length(grep(pattern = "branded",temp$URL)) # Personal
personal2 = length(grep(pattern = "shrutik.me",temp$URL)) # Personal
personal3 = length(grep(pattern = "stumbleupon",temp$URL)) # Personal
personal4 = length(grep(pattern = "shrutikblog",temp$URL)) # Personal

blackboard = length(grep(pattern = "bbgroupa.syr.edu",temp$URL)) # Study
stackoverflow = length(grep(pattern = "stackoverflow",temp$URL)) # Study
#syr = length(grep(pattern = "syr",temp$URL)) # Study
git = length(grep(pattern = "git",temp$URL)) # Study
slideshare = length(grep(pattern = "slideshare",temp$URL)) # Study
w3 = length(grep(pattern = "w3schools",temp$URL)) # Study
#kaggle = length(grep(pattern = "kaggle",temp$URL)) # Study


df3 <- data.frame(
  blackboard,stackoverflow,git,slideshare,w3)

df3 = sort(df3)
pie_data3 = t(df3)
pie_data3 = data.frame(pie_data3)
pie(pie_data3$pie_data3) # Alphabet Pie



imdb = length(grep(pattern = "imdb",temp$URL)) # Movies

#outlook = length(grep(pattern = "outlook",temp$URL)) # Other

jobvite = length(grep(pattern = "jobvite",temp$URL)) # Job
job1 = length(grep(pattern = "job",temp$URL)) # Job
job2 = length(grep(pattern = "careers",temp$URL)) # Job
job3 = length(grep(pattern = "indeed",temp$URL)) # Job
linkedin = length(grep(pattern = "linkedin",temp$URL)) # Jobs
refusa = length(grep(pattern = "referenceusa",temp$URL)) # Jobs

amazon = length(grep(pattern = "amazon",temp$URL)) # Shopping
bestbuy = length(grep(pattern = "bestbuy",temp$URL)) # Shopping
walmart = length(grep(pattern = "walmart",temp$URL)) # Shopping
ebay = length(grep(pattern = "ebay",temp$URL)) # Shopping
tiwiab = length(grep(pattern = "thisiswhyimbroke",temp$URL)) # Shopping
etsy = length(grep(pattern = "etsy",temp$URL)) # Shopping


df4 <- data.frame(
  amazon,bestbuy,walmart,ebay,tiwiab,etsy)

df4 = sort(df4)
pie_data4 = t(df4)
pie_data4 = data.frame(pie_data4)
pie(pie_data4$pie_data4) # Alphabet Pie


sports1 = length(grep(pattern = "sport",temp$URL)) # Sports
sports2 = length(grep(pattern = "stream",temp$URL)) # Sports
sports3 = length(grep(pattern = "soccer",temp$URL)) # Sports
sports4 = length(grep(pattern = "firstrow",temp$URL)) # Sports
sports5 = length(grep(pattern = "goal.com",temp$URL)) # Sports
sports6 = length(grep(pattern = "ronaldo7",temp$URL)) # Sports


 

df <- data.frame(
    alphabet=(google + gmail + youtube)
  , social = (facebook + insta + twitter + tumblr + ninegag + storypick + yelp + quora + buzzfeed1 + buzzfeed2)
  , personal = personal1 + personal2 + personal3 + personal4
  , study =   stackoverflow + syr + git + slideshare + w3 
  , movies = imdb
  , job = jobvite + job1 + job2 + job3 + linkedin + refusa
  , shopping = amazon + bestbuy + walmart + ebay + tiwiab + etsy
  , sports = sports1 + sports2 + sports3 + sports4 + sports5 + sports6
)


df


str(df)

df = sort(df)
pie_data = t(df)
pie_data = data.frame(pie_data)
str(pie_data)

pie(pie_data$pie_data) # Main Pie
pie_data

