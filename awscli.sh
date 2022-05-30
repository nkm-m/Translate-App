
# Validate CloudFromation template
# Describe the profile as needed
aws cloudformation validate-template \
--template-body file://template.yaml \
{--profile your-profile-name}

# Create CloudFormation Stack
# replace {your-s3-bucket-name}
# Describe the profile as needed
aws cloudformation create-stack \
--stack-name Translate-App \
--template-body file://template.yaml \
--parameters ParameterKey=S3BucketName,ParameterValue={your-s3-bucket-name} \
--capabilities CAPABILITY_NAMED_IAM \
{--profile your-profile-name}

# copy local files to your S3 Bucket
# replace {your-s3-bucket-name}
# Describe the profile as needed
aws s3 cp ./public s3://{your-s3-bucket-name} \
--recursive \
{--profile your-profile-name}