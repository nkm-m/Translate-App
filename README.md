# App overview
This web app has the following features:
- Translate Japanese to English
- Replace English with lowercase
- Insert a hyphen between English words
- Removed specific symbols (`.`, `'`, `?`)

# Prerequisites
- Have an AWS account
- You can use the AWS CLI

# How to set up

## 1. Clone repository
```
$ git clone https://github.com/nkm-m/Translate-App.git
```
## 2. Run the awscli.sh CloudFormation command

```
$ cd Translate-App
```

2-1. Validate CloudFromation template
```bash:awscli.sh
$ aws cloudformation validate-template \
--template-body file://template.yaml \
{--profile your-profile-name}
```

2-2 Create CloudFormation Stack
```bash
$ aws cloudformation create-stack \
--stack-name Translate-App \
--template-body file://template.yaml \
--parameters ParameterKey=S3BucketName,ParameterValue={your-s3-bucket-name} \
--capabilities CAPABILITY_NAMED_IAM \
{--profile your-profile-name}
```

# 3. Describe index.js RestAPIEndpoint
From the output of the CloudFormation console, check RestAPIEndpoint and paste it into index.js

![Screenshot_1](https://user-images.githubusercontent.com/55443396/170989361-af99cf4e-f3b4-4461-ba61-cdc8536cf548.png)

```JavaScript:index.js
function translateText() {
  const url = "{your-RestAPIEndpoint}"; // Replace this with RestAPIEndpoint
  const text = document.getElementById("japanese").value;
  axios
    .post(url, {
      text,
    })
    .then((res) => {
      document.getElementById("english").value = res.data;
    })
    .catch((error) => {
      document.getElementById("err").innerHTML = error;
    });
}
```

## 4. Run the awscli.sh S3 command
Copy local files to your S3 Bucket
```bash
$ aws s3 cp ./public s3://{your-s3-bucket-name} \
--recursive \
{--profile your-profile-name}
```

## 5. Access S3BucketWebsSiteEndPoint
Check and access S3BucketWebsSiteEndPoint from the output of the CloudFormation console

![Screenshot_1 - コピー](https://user-images.githubusercontent.com/55443396/170989430-fe57da09-c14c-4a3a-a927-42bbf59f365c.png)

# How to use
Just enter the Japanese you want to translate and click the translate button.

![modal](https://user-images.githubusercontent.com/55443396/170990219-cb7817ab-8377-431d-8057-ae8ec1806baa.gif)
