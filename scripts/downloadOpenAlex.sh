#!/bin/bash
FILE=/human-cancer-project/awscliv2.zip

if [[ -f "$FILE" ]]; then
    echo "$FILE exist."
else
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
fi

unzip awscliv2.zip
sudo ./aws/install --update
# aws s3 sync "s3://openalex" "openalex-snapshot" --no-sign-request
aws s3 sync "s3://openalex" "openalex-snapshot" --no-sign-request --delete --region us-east-2