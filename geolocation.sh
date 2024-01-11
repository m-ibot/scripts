#!/bin/bash

ip=$(curl -s https://api.ipify.org)
# httpS call requires a Key from ip-api.com. For my usecase, an http call is sufficient. 
location_data=$(curl -s http://ip-api.com/json/$ip?fields=status,message,continent,country,countryCode,city,timezone,query)
echo $location_data | jq --color-output .

