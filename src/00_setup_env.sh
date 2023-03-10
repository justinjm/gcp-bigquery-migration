#!/bin/bash
# 00_setup_env.sh
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