#
# Change here roleName variable value to OrganizationAccountAccessRole, 
# more details can be found on : https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html
# it also works with AWS Control Tower ControlTowerExecution role.
# More info: https://docs.aws.amazon.com/controltower/latest/userguide/how-control-tower-works.html
#
roleName="describeInstanceRole"

for i in $(aws organizations list-accounts --query 'Accounts[].Id[]')
do
echo "Creating profile for account $i"
aws configure set profile.$i.role_arn arn:aws:iam::$i:role/$roleName
aws configure set profile.$i.source_profile default
echo "Done"
done