#!/usr/bin/env Rscript

### Nathan Englehart (Summer 2022)

library(haven) # to read sav

gss_data <- read_sav("data.sav")

one_sample_t_test <- function(sample,theoretical_mean) {

   ### Returns the t value and degrees of freedom with one sample t test using given sample and theoretical mean. 
   ###	
   ###   Args:
   ###           
   ###	      sample::[List]
   ###	         Given sample 
   ###	      
   ###	      theoretical_mean::[Double]
   ###	         Theoretical mean of sample.
   ###
   ###

   t = (mean(sample,na.rm = TRUE)-theoretical_mean)/(sd(sample, na.rm = TRUE)/(sqrt(length(!is.na(sample)))))
   df = length(sample) - 1 

   return(list(t,df))
}

sample = as.numeric(unlist(gss_data[,"tvhours"])) # "how many hours per day do you watch tv?"
tm = 3.1

result = one_sample_t_test(sample,tm)
result
