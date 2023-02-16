#!/bin/bash
# 03_setup_data.sh
source args

## load data into BQ  ---------------------------------

### create dataset
### create table - target table
### create results table - DVT tool output

## load data into MSSQL databse ---------------------------------

## upload loans.sql file to GCS bucket
# cd data
# gsutil cp loans.sql gs://demos-vertex-ai-bq-staging/loans.sql

## get service account `serviceAccountEmailAddress:`
# gcloud sql instances describe mssqls-instance

## grant service account access to GCS bucket (get service account from UI, instance overview page)
# gsutil iam ch serviceAccount:p746038361521-irmwld@gcp-sa-cloud-sql.iam.gserviceaccount.com:objectAdmin \
#   gs://demos-vertex-ai-bq-staging/



## execute load data (SQL file) to SQL instance from GCS 
# gcloud sql import sql mssqls-instance gs://demos-vertex-ai-bq-staging/loans.sql \
#   --database=demo
# <https://cloud.google.com/sql/docs/sqlserver/import-export/import-export-sql#gcloud>
