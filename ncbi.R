write.csv(dat,file="disaster_paper.csv")

papers <- function(x){
library(rvest)
library(knitr)
link <- paste0('https://www.ncbi.nlm.nih.gov/pubmed/?term=', x)
web <- read_html(link)
title <- web %>% html_nodes('div.rslt p.title a') %>%html_text()
author <- web %>% html_nodes('div.supp p.desc') %>%html_text()
journal <- web %>% html_nodes('div.supp p.details span') %>%html_text()
dat <- data.frame(Title = title, Author = author, Journal = journal)
kable(dat, format="html")
name <- paste0(x, ".csv")
write.table(dat, name, sep="", row.names = F, quote = F)
}
papers("disaster+reduction")
