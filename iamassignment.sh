#!/bin/bash

#create policy awsaccess for only ....


aws iam create-policy --policy-name awsaccess --policy-document file://accesspolicy.json | grep -i arn

# Create a group called devopadmins

aws iam create-group --group-name devopadmins

# Attach policy to the group

aws iam attach-group-policy --policy-arn arn:aws:iam::145682747025:policy/awsaccess --group-name devopadmins

# Create a user with username and password

aws iam create-user --user-name sephora

aws iam create-login-profile --user-name sephora --password 'Blue3567!' --password-reset-required

#Add user to the group

aws iam add-user-to-group --user-name sephora --group-name devopadmins
