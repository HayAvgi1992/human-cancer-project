#!/bin/bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

aws s3 sync "s3://openalex" "openalex-snapshot" --no-sign-request --region us-east-2