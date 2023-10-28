#!/bin/bash
#write on/off
 toggle_conservation () {             
    if [ $value -gt 0 ]
    then  
    # If variable equal to 1  
        sudo bash -c 'echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
        echo "Conservation is off, bettery will charge upto 100%"
    else
        sudo bash -c 'echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
        echo "Conservation is enabled, battery wont charge beyond 60-70%"
    fi 
    }

#check stats
value=$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)
    if [[ $value -eq 0 ]]
    then
        echo "Conservation mode is off, battery will charge up to 100%"
        echo "Would you like to turn it on? y/n"
        read choice
        if [ $choice == 'y' ]
        then
            toggle_conservation
        elif [ $choice == 'n' ]
        then
            echo 'Danke'
        else
        echo 'Wrong answer!'
        fi
    else
        echo "Conservation mode is on, battery will charge to 60 - 70%"
        echo "Would you like to turn it off? y/n"
        read choice
        if [ $choice == 'y' ]
        then
            toggle_conservation
        elif [ $choice == 'n' ]
        then
            echo "Danke"
        else
        echo "Wrong answer!"
        fi
    fi



