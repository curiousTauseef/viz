

getwd()
setwd('E:/aaa')
getwd()


queries = lapply(list.files('E:/a', full.names=TRUE), fromJSON, simplifyDataFrame=FALSE) %>%
  do.call("c", .) %>%
  do.call("c", .) %>%
  do.call("c", .) %>%
  list.mapv(.$query) %>%
  tolower %>%
  removePunctuation %>%
  removeWords(stopwords("english")) %>%
  wordStem

words = stri_split_regex(queries, "\\s") %>%
  do.call("c", .) %>%
  `[`(., . != "")

word_table = table(words) %>%
  sort(decreasing = TRUE)

words = data.frame(word_table)

write.csv(words,file = "Words.csv")
pal <- colorRampPalette(c("red","blue"))(10)
wordcloud(names(word_table), word_table, scale=c(3, 1), min.freq=20,colors=pal,random.order=TRUE, max.words=200)

#wordcloud(names(word_table), word_table, min.freq = 40)
