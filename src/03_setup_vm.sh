#!/bin/bash
# 02_setup_vm.sh 
source args

## create compute engine instance 
# use default compute engine service account for demo purposes only 
echo "Creating VM ${VM_INSTANCE_NAME} for DVT..."
gcloud compute instances create ${VM_INSTANCE_NAME} \
    --project=${PROJECT_ID}\
    --zone=us-central1-a \
    --machine-type=e2-medium \
    --metadata=startup-script='sudo apt-get update && sudo apt-get install -y git',enable-oslogin=true \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server 

## get IP of newly created VM for adding to MSQQL Server instance 
echo "Get IP address for whitelisting on MSSQL Server instance"
VM_INSTANCE_IP=$(gcloud compute instances describe ${VM_INSTANCE_NAME} --zone=us-central1-a --format='get(networkInterfaces[0].accessConfigs[0].natIP)')
echo "VM IP:" $VM_INSTANCE_IP
# https://cloud.google.com/compute/docs/instances/view-ip-address#viewing_ip_addresses

## add VM IP address to MSSQL instance
echo "Adding IP to MSSQL Server instance ${INSTANCE_NAME}..."
gcloud sql instances patch ${INSTANCE_NAME} \
    --quiet \
    --authorized-networks=${VM_INSTANCE_IP}
# https://cloud.google.com/sql/docs/sqlserver/configure-ip
# https://cloud.google.com/sql/docs/sqlserver/connect-admin-ip

## check to confirm changes 
echo "View MSSQL Server instance configuration to confirm changes:"
gcloud sql instances describe ${INSTANCE_NAME}