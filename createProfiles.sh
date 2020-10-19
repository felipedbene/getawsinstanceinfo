roleName="describeInstanceRole"

for i in $(aws organizations list-accounts --query 'Accounts[].Id[]')
do
echo "Creating profile for account $i"
aws configure set profile.$i.role_arn arn:aws:iam::$i:role/$roleName
aws configure set profile.$i.source_profile default
echo "Done"
done