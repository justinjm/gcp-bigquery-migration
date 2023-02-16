#!/bin/bash
# 03_setup_data.sh
source args

## load data into MSSQL databse ---------------------------------
### done in 00_setup
## upload loans.sql file to GCS bucket
## upload loans_200.csv file to GCS bucket 

## get service account `serviceAccountEmailAddress:`
echo "Getting service account from recently created instance"
SVC_ACCOUNT_INSTANCE=$(gcloud sql instances describe ${INSTANCE_NAME} --format="value(serviceAccountEmailAddress)")
echo $SVC_ACCOUNT_INSTANCE

## grant service account access to GCS bucket
gsutil iam ch serviceAccount:${SVC_ACCOUNT_INSTANCE}:objectAdmin \
  gs://${BUCKET}/

## execute load data (SQL file) to SQL instance from GCS 
## quiet flag so script runs without prompt interrupting
gcloud sql import sql ${INSTANCE_NAME} gs://${BUCKET}/loans.sql \
  --database=${DATABASE_NAME} \
  --quiet 
# https://cloud.google.com/sql/docs/sqlserver/import-export/import-export-sql#gcloud
# https://cloud.google.com/sdk/gcloud/reference/sql/import

## load data into BQ  ---------------------------------

### create dataset
bq mk ${BQ_DATASET}

### create results table - DVT tool output
bq mk --table \
  --time_partitioning_field start_time \
  --clustering_fields validation_name,run_id \
  ${BQ_DATASET}.${BQ_TABLE_DVT_RESULTS} \
  results_schema.json

### create table - target table
bq load \
    --autodetect=TRUE \
    --skip_leading_rows=1 \
    ${BQ_DATASET}.${BQ_TABLE_DATA} \
    gs://${BUCKET}/loan_201.csv
# https://cloud.google.com/bigquery/docs/reference/bq-cli-reference#bq_load
# https://cloud.google.com/bigquery/docs/bq-command-line-tool