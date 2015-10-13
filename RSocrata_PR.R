#Small R Script to use as demo as walkthrough for indicators site.#

install.packages("RSocrata") #need to make sure to turn on the package as well as the dependiencies: httr and jsonlite#
install.packages("forecast") #turn on forecast#

#read in a dataset# 
Crime <- read.socrata("https://data.pr.gov/resource/rs5t-fw7x.json")

# Create time series variable based off of "sum_delito" This is the daily crime dataset# 
myts <- ts(Crime$sum_delito, start = c(2013, 1), end = c(2015,81), frequency = 365)

#seasonal decomposition#
fit <- stl(myts, s.window = "period")

#forecast out a number of periods#
plot(forecast(fit))

