#!/bin/bash

# colors

# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after that
clear='\033[0m'

print_green () {
    echo -e "${green}<<< ${1} >>>${clear}"
}
print_cyan () {
    echo -e "${cyan}<<< ${1} >>>${clear}"
}


print_cyan "Welcome $USER!"
print_cyan "Let's check for some updates!"

print_green "Process updates... package manager (apt)"
sudo apt update && apt list --upgradable && sudo apt-get -y upgrade

print_green "Process updates... PiHole"
pihole -up

print_cyan "Updates completed"
