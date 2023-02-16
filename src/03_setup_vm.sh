#!/bin/bash
# 02_setup_vm.sh 
source args





## add VM IP address to MSSQL instance
# gcloud sql instances patch INSTANCE_NAME \
#     --authorized-networks=IP_ADDR1,IP_ADDR2...
# https://cloud.google.com/sql/docs/sqlserver/configure-ip

## check to confirm changes 
# gcloud sql instances describe INSTANCE_NAME