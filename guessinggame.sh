#!/bin/bash

directory_count=$(ls -1 | wc -l)

# Regular expression for verifying input is a number greater than or equal to 0
re='^[0-9]+$'


guess_num() {

read -p "--> What do you think is the number of items in this directory?  " user_guess

# Check if guess is a number greater than or equal to 0

case $user_guess in
    # Guess is not valid
    ''|*[!0-9]*) echo "\nInvalid input. Please enter a number greater than or equal to 0. \n"
    guess_num;;
    
    # Guess is valid
    *) 
    # Check if guess is correct
    if [ ${user_guess} -eq ${directory_count} ]
    then 
    	echo "\nCongratulations! You guessed ${user_guess} and the number of items in this directory is ${directory_count}!"
    	
    # Check if guess is too high
    	
       elif [ ${user_guess} -gt ${directory_count} ]
       then
       	echo "\nYour guess is too large! Try again. \n"
       	guess_num
       	
    # Check if guess is too low
    	
    	else 
    	    echo "\nYour guess is too small! Try again. \n"
       	guess_num
    
    fi ;;
esac


}

guess_num


