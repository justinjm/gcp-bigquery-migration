#!/bin/bash
# 01_setup_mssqls.sh
source vars

## create instnance
## https://cloud.google.com/sql/docs/sqlserver/create-instance
## https://cloud.google.com/sdk/gcloud/reference/sql/instances/create
# gcloud sql instances create myinstance \
#     --database-version=SQLSERVER_2017_STANDARD \
#     --cpu=2 \
#     --memory=7680MB \
#     --root-password=[INSERT-PASSWORD-HERE]


## create password for user `sqlserver`
## https://cloud.google.com/sql/docs/sqlserver/create-manage-users#user-root
## https://cloud.google.com/sdk/gcloud/reference/sql/users/set-password
# gcloud sql users set-password sqlserver \
#     --instance=INSTANCE_NAME \
#     --password=PASSWORD

## create database 