# List Ec2 Instances
These two scripts will list all Ec2 Instances on all accounts in an Organization.

I also include a over permissive IAM policy, please adjust to your needs

# Instructions for running the scripts.

- Deploy the Cloud Formation (RoleAdmin.yaml) as StackSet on all the accounts on your Organization from your organizations master account.
How to [https://aws.amazon.com/blogs/aws/new-use-aws-cloudformation-stacksets-for-multiple-accounts-in-an-aws-organization/]

This will create a role in all accounts named "describeInstanceRole". Check it before proceding.

- Create an IAM User with Administration Access (Probably over permissive).

- Configure your aws cli (aws configure) with the IAM User you created in the previous step.

- Run the createProfiles.sh as this will generate the assume role profiles needed for get instance script.
As described in the official docs[https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html]

- Run the getInstances.sh and it will generate a txt file with the list of instances it finds in the format \[account-id\]-\[region\].txt
Thanks to this page[https://howto.lintel.in/listing-instances-multiple-regions-aws/]
- Count the instances with (cat *.txt | wc -l)

