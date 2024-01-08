#/bin/bash

echo "################## LOGIN ###################"
# Prompt the user to enter a username
read -p "Enter username: " USR
# Prompt the user to enter a password without showing it on the screen
read -sp "Enter password: " PWD
echo ""
echo "############ LOGIN SUCCESSFULLY ############"

# Welcome the user
echo "Welcome $USR"

# Prompt the user to enter their skill
read -p "Please enter your skill:" SKILL

# Display a message about the entered skill
echo "Your $SKILL skill sounds great!"
