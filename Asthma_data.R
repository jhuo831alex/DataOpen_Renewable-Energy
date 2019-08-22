library(rvest)
library(data.table)
library(dplyr)

url <- c()
for (i in c(2011:2014,2016)){
  y <- paste("https://www.cdc.gov/asthma/brfss/",i,"/tableL1.htm",sep = "")
  url <- c(url,y)
}
url <- c(url,'https://www.cdc.gov/asthma/brfss/2015/tableL1.html','https://www.cdc.gov/asthma/brfss/2010/lifetime/tableL1.htm')
for (i in c(1:9)){
  y <- paste("https://www.cdc.gov/asthma/brfss/0",i,"/lifetime/tableL1.htm",sep = "")
  url <- c(url,y)
}

df <- data.frame()
for (i in url){
  #mainpage_url <- paste("https://www.cdc.gov/asthma/brfss/",i,"/tableL1.htm",sep = "")
  mainpage <- read_html(i)
  state_data <- mainpage %>% html_nodes("tr :nth-child(1)") %>% html_text()
  state_data <- state_data[9:60]
  size_data <- mainpage %>% html_nodes("tr :nth-child(2)") %>% html_text()
  size_data <- size_data[3:54]
  size_data <- as.numeric(gsub(",", "", size_data))
  rate_data <- mainpage %>% html_nodes("tr :nth-child(3)") %>% html_text()
  rate_data <- as.numeric(rate_data[2:53])
  year <- mainpage %>% html_nodes("#content") %>% html_text()
  year<- as.numeric(substring(year,1,4))
  df1 <- data.frame(state_data,size_data,rate_data,year)
  df <- rbind(df,df1)
}

data1 <- df[df$year %in% c(2008:2016),]

write.csv(data1,'asthma_by_state.csv')
url[8:14]

for (i in url[8:14]){
  mainpage <- read_html(i)
  state_data <- mainpage %>% html_nodes("tr :nth-child(1)") %>% html_text()
  state_data <- state_data[10:60]
  size_data <- mainpage %>% html_nodes("tr :nth-child(2)") %>% html_text()
  size_data <- size_data[5:55]
  size_data <- as.numeric(gsub(",", "", size_data))
  rate_data <- mainpage %>% html_nodes("tr :nth-child(3)") %>% html_text()
  rate_data <- as.numeric(rate_data[3:53])
  year <- mainpage %>% html_nodes("#content") %>% html_text()
  year<- as.numeric(substring(year,1,4))
  df1 <- data.frame(state_data,size_data,rate_data,year)
  data1 <- rbind(data1,df1)
}

df <- data.frame()
for (i in c('00','99','04','05','06','07')){
  mainpage_url <- paste("https://www.cdc.gov/asthma/brfss/",i,"/lifetime/tableL1.htm",sep = "")
  mainpage <- read_html(mainpage_url)
  state_data <- mainpage %>% html_nodes("tr :nth-child(1)") %>% html_text()
  state_data <- state_data[10:60]
  size_data <- mainpage %>% html_nodes("tr :nth-child(2)") %>% html_text()
  size_data <- size_data[5:55]
  size_data <- as.numeric(gsub(",", "", size_data))
  rate_data <- mainpage %>% html_nodes("tr :nth-child(3)") %>% html_text()
  rate_data <- as.numeric(rate_data[3:53])
  year <- mainpage %>% html_nodes("#content") %>% html_text()
  year<- as.numeric(substring(year,1,4))
  df1 <- data.frame(state_data,size_data,rate_data,year)
  df <- rbind(df,df1)
}

df <- df[df$year %in% c(2004:2006),]

mainpage <- read_html('https://www.cdc.gov/asthma/brfss/00/lifetime/tableL1.htm')
state_data <- mainpage %>% html_nodes("tr :nth-child(1)") %>% html_text()
state_data <- state_data[11:61]
size_data <- mainpage %>% html_nodes("tr :nth-child(2)") %>% html_text()
size_data <- size_data[7:57]
size_data <- as.numeric(gsub(",", "", size_data))
rate_data <- mainpage %>% html_nodes("tr :nth-child(3)") %>% html_text()
rate_data <- as.numeric(rate_data[3:53])
year <- mainpage %>% html_nodes("#content") %>% html_text()
year<- as.numeric(substring(year,1,4))
df1 <- data.frame(state_data,size_data,rate_data,year)
df <- rbind(df,df1)
df

mainpage <- read_html('https://www.cdc.gov/asthma/brfss/07/lifetime/tableL1.htm')
state_data <- mainpage %>% html_nodes("tr :nth-child(1)") %>% html_text()
state_data <- state_data[9:59]
size_data <- mainpage %>% html_nodes("tr :nth-child(2)") %>% html_text()
size_data <- size_data[5:55]
size_data <- as.numeric(gsub(",", "", size_data))
rate_data <- mainpage %>% html_nodes("tr :nth-child(3)") %>% html_text()
rate_data <- as.numeric(rate_data[3:53])
year <- mainpage %>% html_nodes("#content") %>% html_text()
year<- as.numeric(substring(year,1,4))
df1 <- data.frame(state_data,size_data,rate_data,year)
df <- rbind(df,df1)

mainpage <- read_html('https://www.cdc.gov/asthma/brfss/99/lifetime/tableL1.htm')
state_data <- mainpage %>% html_nodes("tr :nth-child(1)") %>% html_text()
state_data <- state_data[9:59]
size_data <- mainpage %>% html_nodes("tr :nth-child(2)") %>% html_text()
size_data <- size_data[5:55]
size_data <- as.numeric(gsub(",", "", size_data))
rate_data <- mainpage %>% html_nodes("tr :nth-child(3)") %>% html_text()
rate_data <- as.numeric(rate_data[3:53])
year <- mainpage %>% html_nodes("#content") %>% html_text()
year<- as.numeric(substring(year,1,4))
df1 <- data.frame(state_data,size_data,rate_data,year)
df <- rbind(df,df1)

