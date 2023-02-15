# Google BigQuery Migration 

An example workflow for migrating data to BigQuery and validating with the Data Validation Tool ([DVT](https://github.com/GoogleCloudPlatform/professional-services-data-validator))


## How to use 

Recommendation: clone this repository in Cloud Shell 

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/justinjm/gcp-bigquery-migration)

You can also clone this repository on your local machine or GCE VM:

```sh
git clone https://github.com/justinjm/gcp-bigquery-migration.git 
```

## Setup 

### Summary

1. run `00_setup.sh` 
2. run `01_prepare data.sh` 
3. 

### Steps 

#### Enable APIs

1. [In the GCP Cloud Shell](https://console.cloud.google.com/home/dashboard?cloudshell=true), run the commands below.

```sh
export PROJECT=$DEVSHELL_PROJECT_ID

gcloud services enable aiplatform.googleapis.com --project $PROJECT_ID
gcloud services enable artifactregistry.googleapis.com --project $PROJECT_ID
gcloud services enable bigquerystorage.googleapis.com --project $PROJECT_ID
gcloud services enable cloudbuild.googleapis.com --project $PROJECT_ID
gcloud services enable clouddeploy.googleapis.com --project $PROJECT_ID
gcloud services enable container.googleapis.com --project $PROJECT_ID
gcloud services enable containerregistry.googleapis.com --project $PROJECT_ID
gcloud services enable monitoring.googleapis.com --project $PROJECT_ID
gcloud services enable notebooks.googleapis.com --project $PROJECT_ID
gcloud services enable run.googleapis.com --project $PROJECT_ID
```


## References

* [GCP SDK](https://cloud.google.com/sdk/docs/)  
* [GCP gsutil Commands](https://cloud.google.com/storage/docs/gsutil)
* [GoogleCloudPlatform/professional-services-data-validator: Utility to compare data between homogeneous or heterogeneous environments to ensure source and target tables match](https://github.com/GoogleCloudPlatform/professional-services-data-validator)
* [Automate Validation using the Data Validation Tool (DVT) | Google Cloud Skills Boost](https://www.cloudskillsboost.google/focuses/45997?parent=catalog)
* [justinjm/google-cloud-scripts](https://github.com/justinjm/google-cloud-scripts)

## Acknowledgements  
