#!/bin/bash

source args

## Start MSSQL Server 
echo "Starting MSSQL server instance: ${INSTANCE_NAME}..."
gcloud sql instances patch ${INSTANCE_NAME} \
    --activation-policy=ALWAYS

## Start-VM 
echo "Starting VM instance: ${VM_INSTANCE_NAME}..."
gcloud compute instances start ${VM_INSTANCE_NAME}

## get IP of VM 
VM_INSTANCE_IP=$(gcloud compute instances describe ${VM_INSTANCE_NAME} --format='get(networkInterfaces[0].accessConfigs[0].natIP)')
echo ${VM_INSTANCE_IP}

## add VM IP to MSSQL instance
echo "Adding VM instance ${VM_INSTANCE_NAME} IP to MSSQL server instance: ${INSTANCE_NAME}..."
gcloud sql instances patch ${INSTANCE_NAME} \
    --quiet \
    --authorized-networks=${VM_INSTANCE_IP}