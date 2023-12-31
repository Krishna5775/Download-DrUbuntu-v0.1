#!/bin/bash

# Update commands
sudo apt update
sudo apt upgrade
sudo apt install -f

# Check the exit status of the last command
if [ $? -eq 0 ]; then
  echo "All Respositories are sucsessfully updated"
  zenity --info --text="All respositories and applications has updated."
else
  echo "An error occurred. Performing error handling..."
  
  sudo apt update —fix-missing
  sudo apt upgrade
  
  if [ $? -eq 0 ]; then
    echo "Error handling completed successfully"
  else
    echo "Error handling failed. Your os is totally corrupted you must reinstall it."
    
    zenity --info --text="Operation failed."
  fi
fi
