#!/Bin/bash

#requires 3 arguments  Argument $1 pulls the date and AM PM as string example for syntax is 01:00:00 PM 
#Argument $2 is the four digit number for the  date of the file example  0310
#Argument $3  you will need to provide the column number for the game $2, $3 or $4.  
grep "$1" $2_Dealer_schedule |awk -F '\t' '{print $1, '$3'}' 

