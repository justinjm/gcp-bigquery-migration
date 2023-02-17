#!/bin/bash
source args

echo "Project: " ${PROJECT_ID}
echo "Bucket: " ${BUCKET}
echo "SQL instance: " ${INSTANCE_NAME}
echo "VM instance: " ${VM_INSTANCE_NAME}
echo "BigQuery dataset: " ${BQ_DATASET}

echo -n "The resources above will be DELETED. Are you sure you want to proceed? (y/n) "
read choice

if [[ "$choice" =~ [yY](es)* ]]; then
    # Your code here
    echo "Deleting resources..."
    ## uncomment below to use ##
    ## GCS bucket (and all files within)
    # gsutil -m rm -r gs://${BUCKET}
    ## SQL instance 
    # gcloud beta sql instances delete ${INSTANCE_NAME}
    ## VM 
    # gcloud compute instances delete ${INSTANCE_NAME} --delete-disks=all --zone=us-central1-a
    # https://cloud.google.com/sdk/gcloud/reference/compute/instances/delete
    ## BQ dataset 
    # bq rm -r -f -d ${PROJECT_ID}:${BQ_DATASET}
    # https://cloud.google.com/bigquery/docs/managing-datasets#bq

else
    echo "No resources deleted"
    
fi