#!/usr/bin/python3

import os

# Task 1: Add the users
userlist = ["alpha", "beta", "gamma"]

for usr in userlist:
	exitCode = os.system("id {} > /dev/null".format(usr))
	if exitCode == 0:
		# Exit code = 0 => user has already existed
		print("The user {} is already exist!".format(usr))
	else:
		# User does not exist
		os.system("useradd {}".format(usr))
		print("Adding user {}...".format(usr))

# Task 2: Add a group
groupName = "science"
exitCode = os.system("grep {} /etc/group > /dev/null".format(groupName))

if(exitCode != 0):
	# No group exist
	os.system("groupadd {}".format(groupName))
	print("Starting adding group " + groupName + "...")
else:
	print("The group {} has already existed!".format(groupName))

# Task 3: Add all user to the group
for usr in userlist:
	print("Adding user {} to {} group...".format(usr, groupName))
	os.system("usermod -G {} {}".format(groupName, usr))

# Task 4: Grant ownership to the group
dirPath = "/opt/science"
# Create a directory
exitCode = os.path.isdir(dirPath)
print("Checking directory...")
if not exitCode:
	print("Creating the directory...")
	os.system("mkdir {}".format(dirPath))

# Giving privileges
print("Giving ownership to the directory...")
os.system("chown :{} {}".format(groupName, dirPath))
os.system("chmod 770 {}".format(dirPath))
