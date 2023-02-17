#!/bin/bash
source args

echo "Bucket: " ${BUCKET}
echo "SQL instance: " ${INSTANCE_NAME}
echo "VM instance: " ${VM_INSTANCE_NAME}
echo "BigQuery dataset: " ${BQ_DATASET}

echo -n "The resources above will be DELETED. Are you sure you want to proceed? (y/n) "
read choice

if [[ "$choice" =~ [yY](es)* ]]; then
    # Your code here
    echo "Deleting resources..."
else
    echo "No resources deleted"
    
fi