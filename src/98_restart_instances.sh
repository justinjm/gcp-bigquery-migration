#!/bin/bash

source args

## Start MSSQL-Server 
gcloud sql instances patch ${INSTANCE_NAME} \
    --activation-policy=ALWAYS

## Start-VM 
gcloud compute instances start ${VM_INSTANCE_NAME}

## get IP of VM 
VM_INSTANCE_IP=$(gcloud compute instances describe data-validator --format='get(networkInterfaces[0].accessConfigs[0].natIP)')
echo ${VM_INSTANCE_IP}

## add VM IP to MSSQL instance
gcloud sql instances patch ${INSTANCE_NAME} \
    --quiet \
    --authorized-networks=${VM_INSTANCE_IP}