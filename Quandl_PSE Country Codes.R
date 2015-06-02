setwd("~/GitHub/Quandl Paris School of Economics Data Collection")
library(Quandl)

#authenticate Quandl
Quandl.auth("PLACE_YOUR_TOKEN_HERE") #Insert your API key before running

#get country names and codes into data.frame
CountryCodes <- read.csv('Quandl_PSE Country Codes.csv')

#get indicator for all data sets in Paris School of Econmics set
Indicators <- read.csv('Quandl_PSE Indicators.csv')

#store search indicator
searchIndicator <- Indicators$Indicator.Code[80]  #6210301
  
#initialize variable for final data.frame
final_PSEData<-NULL

#loop through country codes
for (i in 1:length(CountryCodes$Code)){
  #create search string
  searchString <- paste("PSE/",CountryCodes$Code[i],"_",searchIndicator,sep="")
  
  tryCatch({
    #for each country code, store data set in temporary variable
    myPSEData <- Quandl(searchString)
    
    #add country name and code to temp variable
    myPSEData$CountryCode <- CountryCodes$Code[i]
    myPSEData$Country <- CountryCodes$Country[i]
    
    #append to final data.frame
    final_PSEData <- rbind(final_PSEData,myPSEData)
    },
    warning = function(war){
      print(paste("MY_WARNING:  ",war))
      print(searchString)
    },
    error = function(err){
      print(paste("MY_ERROR:  ",err))
      print(searchString)
    }
  )#end tryCatch

}#end for loop

#write data to csv
write.csv(final_PSEData, file="final_PSE_1PctCountries.csv")