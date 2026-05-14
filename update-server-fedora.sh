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
print_red () {
    echo -e "${red}<<< ${1} >>>${clear}"
}
print_blue () {
    echo -e "${blue}<<< ${1} >>>${clear}"
}


print_cyan "Welcome $USER!"
print_cyan "Let's check for some updates!"

print_green "Process updates... package manager (dnf)"
sudo dnf check-update --refresh
sudo dnf update
sudo dnf autoremove 

print_green "Process updates... pihole (docker)"
$HOME/pihole/update-pihole.sh

print_cyan "Check if reboot is required."
sudo needrestart -b > /dev/null 2>&1
STATUS=$?

# Exit code 1 means a restart is required
if [ $STATUS -eq 1 ]; then
    echo ""
    print_red "⚠️  A system restart IS required to apply core updates."
    print_blue "Please choose an action:"
    
    options=("Schedule restart for 2:00 AM" "Restart now" "No restart")
    select opt in "${options[@]}"; do
        case $REPLY in
            1)
                print_blue "Scheduling system restart for 02:00..."
                sudo shutdown -r 02:00
                break
                ;;
            2)
                print_blue "Initiating immediate restart..."
                sudo shutdown -r +1
                break
                ;;
            3)
                print_blue "Skipping restart. Don't forget to do it later!"
                break
                ;;
            *)
                print_blue "Invalid option. Please enter 1, 2, or 3."
                ;;
        esac
    done

# Exit code 0 means everything is up to date
elif [ $STATUS -eq 0 ]; then
    print_green "✅ No system restart is currently required."
else
    print_red "❌ Error: Could not determine status. Make sure 'dnf-utils' is installed."
fi

print_cyan "Updates completed."