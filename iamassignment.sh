#!/bin/bash
#Author:Nicole Takam
#Creation Date:09-01-2023
#create policy awsaccess for only ....

read -p "Enter a groupname : " groupname
echo " The groupname is $groupname"
sleep 2

read -p "Enter a username : " username

echo " The username is $username"
sleep 2

read -p "Enter a password for user : " password
sleep 2

aws iam create-policy --policy-name awsaccess --policy-document file://accesspolicy.json | grep -i arn

# Create a group called devopadmins

aws iam create-group --group-name $groupname

# Attach policy to the group

aws iam attach-group-policy --policy-arn arn:aws:iam::145682747025:policy/awsaccess --group-name $groupname

# Create a user with username and password

aws iam create-user --user-name $username

aws iam create-login-profile --user-name $username --password '$password' --password-reset-required

#Add user to the group

aws iam add-user-to-group --user-name $username --group-name $groupname
