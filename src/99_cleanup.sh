#!/bin/bash

echo -n "Do you want to proceed? (y/n) "
read choice

if [[ "$choice" =~ [yY](es)* ]]; then
    # Your code here
    echo "Proceeding with the script..."
else
    echo "Exiting the script."
    exit 0
fi