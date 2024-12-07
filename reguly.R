library(tidyverse)
library(dlookr)
library(editrules)
library(VIM)
library(ISLR)
library(validate)

data <- read.csv("sklep_rowerowy.csv")
boxplot(data$Income)
boxplot(data$Children)
boxplot(data$Age)
boxplot(data$Cars)


rules <- editset(c("Martial.Status %in% c('Single', 'Married')", 
                  "Gender %in% c('Female','Male')", 
                  "Income>0", "Income<50000", 
                  "Children>=0", 
                  "Education %in% c('Bachelors','Partial College')", 
                  'High School','Graduate Degree', 'Partial High School')", 
                  "Occupation %in% c('Skilled Manual','Clerical','Professional', 'Management'"), "Home.Owner %in% c('Yes','No')", 
                "Commute Distance %in% c('0-1 Miles','1-2 Miles', '2-5 Miles', '5-10 Miles', ' 10+ Miles')",
                "Region %in% c('Europe', 'Pacific', 'North America')", "Age>0", "Age<120", "Purchased Bike %in% c('Yes','No')")

summary(violatedEdits(rules, data))


