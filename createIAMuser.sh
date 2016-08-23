#createIAMuser.sh
#Phil Mackovski

#Creates a IAM user account in AWS

#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: createIAMuser.sh <username>"
    exit 1
fi

USERNAME=$1

#use apg tool to generate random password
PASSWD=$(apg -n 1 -m 12 -x 12 -M SNCL -c cl_seed -a 1)

#create user
aws iam create-user --user-name $USERNAME

#add the user to a group
aws iam add-user-to-group --group-name Administrators --user-name $USERNAME

#create a login profile for the user (set password and set flag to enforce password reset upon initial logon)
aws iam create-login-profile --user-name $USERNAME --password $PASSWD --password-reset-required

#send below to requestor
printf "\nURL:      https://proserv-au.signin.aws.amazon.com/console\n"
printf "username: $USERNAME\n"
printf "password: $PASSWD\n\n"
