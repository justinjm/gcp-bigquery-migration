#!/bin/bash
# 00_setup.sh
source args

## enable APIS ------------------------------------------------------------------
gcloud services enable compute.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable iamcredentials.googleapis.com
gcloud services enable monitoring.googleapis.com
gcloud services enable logging.googleapis.com
gcloud services enable bigquery.googleapis.com
gcloud services enable bigquerystorage.googleapis.com
gcloud services enable bigquerydatatransfer.googleapis.com
gcloud services enable monitoring.googleapis.com
gcloud services enable sqladmin.googleapis.com

## create bucket ------------------------------------------------------------------
gsutil mb -l ${LOCATION} gs://${BUCKET}

## give default compute engine service account access to bucket
gcloud projects describe ${PROJECT_ID} > project-info.txt
PROJECT_NUM=$(cat project-info.txt | sed -nre 's:.*projectNumber\: (.*):\1:p')
SVC_ACCOUNT="${PROJECT_NUM//\'/}-compute@developer.gserviceaccount.com"
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member serviceAccount:$SVC_ACCOUNT --role roles/storage.objectAdmin

## copy data into GCS bucket ------------------------------------------------------------------
curl https://raw.githubusercontent.com/justinjm/gcp-bigquery-migration/main/data/loans.sql | gsutil cp - gs://${BUCKET}/loans.sql
curl https://raw.githubusercontent.com/justinjm/gcp-bigquery-migration/main/data/loan_200k.csv | gsutil cp - gs://${BUCKET}/loan_200k.csv
curl https://raw.githubusercontent.com/justinjm/gcp-bigquery-migration/main/data/loan_201.csv | gsutil cp - gs://${BUCKET}/loan_201.csv



