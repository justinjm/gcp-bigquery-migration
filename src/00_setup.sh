#!/bin/bash
# 00_setup.sh
source args

## enable APIS ------------------------------------------------------------------
# gcloud services enable aiplatform.googleapis.com
# gcloud services enable artifactregistry.googleapis.com
# gcloud services enable bigquerystorage.googleapis.com
# gcloud services enable cloudbuild.googleapis.com
# gcloud services enable clouddeploy.googleapis.com
# gcloud services enable container.googleapis.com
# gcloud services enable containerregistry.googleapis.com
# gcloud services enable monitoring.googleapis.com
# gcloud services enable notebooks.googleapis.com
# gcloud services enable run.googleapis.com

# gcloud services enable sqladmin.googleapis.com

## create bucket ------------------------------------------------------------------
# gsutil mb -l ${LOCATION} gs://${BUCKET}

## give default compute engine service account access to bucket
# gcloud projects describe $GOOGLE_CLOUD_PROJECT > project-info.txt
# PROJECT_NUM=$(cat project-info.txt | sed -nre 's:.*projectNumber\: (.*):\1:p')
# SVC_ACCOUNT="${PROJECT_NUM//\'/}-compute@developer.gserviceaccount.com"
# gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT --member serviceAccount:$SVC_ACCOUNT --role roles/storage.objectAdmin

## copy data into GCS bucket ------------------------------------------------------------------
# curl https://raw.githubusercontent.com/justinjm/XXXXXXXXXXX.csv | gsutil cp - gs://${BUCKET}/XXXXX.csv


