#!/bin/bash
source vars

gcloud projects describe $PROJECT_ID > project-info.txt
echo $PROJECT_ID
PROJECT_NUM=$(cat project-info.txt | sed -nre 's:.*projectNumber\: (.*):\1:p')
echo $PROJECT_NUM
SVC_ACCOUNT="${PROJECT_NUM//\'/}-compute@developer.gserviceaccount.com"
echo $SVC_ACCOUNT