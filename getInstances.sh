#!/bin/bash
for i in $(aws organizations list-accounts --query 'Accounts[].Id[]')
do
    #OWNER_ID=`aws iam get-user --profile $i --output text | awk -F ':' '{print $5}'`
    tput setaf 2;echo "Profile : $i";tput sgr0
    #tput setaf 2;echo "OwnerID : $OWNER_ID";tput sgr0
    for region in `aws --profile $i ec2  describe-regions --region us-east-1 --output text | cut -f4`
    do
        tput setaf 1;echo  "Listing Instances in region $region for account $i";tput sgr0
        aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`].Value , InstanceId]' --profile $i --region $region --output text >> $i-$region.txt
    done &
done
wait