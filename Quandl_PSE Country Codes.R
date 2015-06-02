setwd("~/GitHub/Quandl Paris School of Economics Data Collection")
library(Quandl)

#authenticate Quandl
Quandl.auth("")

#get country names and codes into data.frame
CountryCodes <- read.csv('Quandl_PSE Country Codes.csv')

#get indicator for all data sets in Paris School of Econmics set
Indicators <- read.csv('Quandl_PSE Indicators.csv')

#initialize variable for final data.frame
final_PSEData<-NULL

for (i in 1:length(CountryCodes$Code)){
#loop through country codes

  #for each country code, store data set in temporary variable

  #add country name and code to temp variable

  #append to final data.frame
  final_PSEData <- rbind(final_PSEData,myPSEData)

}

myPSEData <- Quandl("PSE/ARG_6210301")

myPSEData$CountryCode <- 'ARG'

myPSEData$Country <- 'Argentina'