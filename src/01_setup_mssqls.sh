#!/bin/bash
# 01_setup_mssqls.sh
source args

## create instnance
echo "Creating Cloud SQL instance ${INSTANCE_NAME}..."
gcloud beta sql instances create ${INSTANCE_NAME} \
  --database-version=SQLSERVER_2017_STANDARD \
  --cpu=2 \
  --memory=4GB \
  --root-password=password123 \
  --zone=us-central1-a
## https://cloud.google.com/sql/docs/sqlserver/create-instance
## https://cloud.google.com/sdk/gcloud/reference/sql/instances/create

## create password for user `sqlserver`
echo "Setting password for user sqlserver..."
gcloud sql users set-password sqlserver \
    --instance=${INSTANCE_NAME} \
    --password=password123
## https://cloud.google.com/sql/docs/sqlserver/create-manage-users#user-root
## https://cloud.google.com/sdk/gcloud/reference/sql/users/set-password

## create database 
echo "Creating database ${DATABASE_NAME}..."
gcloud sql databases create ${DATABASE_NAME} \
    --instance=${INSTANCE_NAME} 
# https://cloud.google.com/sql/docs/sqlserver/create-manage-databases#gcloud
# https://cloud.google.com/sdk/gcloud/reference/sql/databases/create