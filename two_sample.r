#!/usr/bin/env Rscript

### Nathan Englehart (Summer 2022)

library(haven) # to read sav

gss_data <- read_sav("data.sav")

two_sample_t_test <- function(sample_1,sample_2) {

   ### Returns the t value and degrees of freedom with two sample t test using given samples. 
   ###	
   ###   Args:
   ###          
   ###	      sample_1::[List]
   ###	         First given sample 
   ###
   ###	      sample_2::[List]
   ###	         Second given sample
   ###
   ###

   t = (mean(sample_1, na.rm = TRUE) - mean(sample_2, na.rm = TRUE))/sqrt((((sd(sample_1, na.rm = TRUE))^2)/(sum(!is.na(sample_1))-1)) + (((sd(sample_2, na.rm = TRUE))^2)/(sum(!is.na(sample_2))-1)))
   df = sum(!is.na(sample_1)) + sum(!is.na(sample_2)) - 2

   return(list(t,df))
}

s <- as.numeric(unlist(gss_data[,"sex"]))
t <- as.numeric(unlist(gss_data[,"tvhours"]))

sample <- data.frame(s,t)

m <- subset(sample, sample$s == 1)
w <- subset(sample, sample$s == 2)

m_hours <- m$t
w_hours <- w$t

result <- two_sample_t_test(m_hours,w_hours)
result
