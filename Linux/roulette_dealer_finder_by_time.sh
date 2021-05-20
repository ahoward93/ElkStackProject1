#!/Bin/bash


#This shell requires two arguments Time with AM /PM and the date in four digit format
#Argument 1 in string  example 08:00:00 AM
#Argument 2 as integer 0310

grep "$1" $2_Dealer_schedule |awk -F '\t' '{print $1, $3}' 
