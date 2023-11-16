library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)


l <-"https://olympics.com/en/news/asian-games-2023-hangzhou-india-medals-tally-winners-table"



web<-read_html(l)
View(web)


Athletes<- web%>%html_nodes(".kBHfZA:nth-child(4) td:nth-child(2) .text--body")%>% html_text()
View(Athletes)
sport<- web%>%html_nodes(".kBHfZA:nth-child(4) td:nth-child(3) .text--body")%>% html_text()
View(sport)
event<- web%>%html_nodes(".kBHfZA:nth-child(4) td:nth-child(4) .text--body")%>% html_text()
View(event)
medals<- web%>%html_nodes(".kBHfZA:nth-child(4) td:nth-child(5) .text--body")%>% html_text()
View(medals)
games = data.frame(Athletes,sport,event,medals)
View(games)

write.csv(games,"asian_games.csv")

str(games)
