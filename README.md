# Google BigQuery Migration 

An example workflow for migrating data to BigQuery and validating with the Data Validation Tool ([DVT](https://github.com/GoogleCloudPlatform/professional-services-data-validator))


## How to use 

Recommendation: clone this repository in Cloud Shell 

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/justinjm/gcp-bigquery-migration)

You can also clone this repository on your local machine or GCE VM:

```sh
git clone https://github.com/justinjm/gcp-bigquery-migration.git 
```

then authenticate with `gcloud`: 

```sh
gcloud config set project demos-vertex-ai 
```


## Setup 

### Summary

1. Setup GCP environment `00_setup.sh` 
2. Setup MSSQL Server `01_setup_mssqls.sh`
3. Load data into MSSQLS and BQ   `02_setup_data.sh`
4. Setup VM for DVT - run `03_setup_vm.sh`
5. install DVT tool on VM - open `docs/04_install_dvt.md`
   1. SSH into instance
   2. git clone this repository 
   3. run script `source 04_install_dvt.sh`
6. Setup DVT connections and run example validations 
   1. add connections
   2. run validations* view results (BQ and Looker Studio Dashboard)
7. Run DVT Examples - open `docs/05_dvt_examples.md` in seperate browser window and copy/paste


### Steps 

## References

* [GCP SDK](https://cloud.google.com/sdk/docs/)  
* [GCP gsutil Commands](https://cloud.google.com/storage/docs/gsutil)
* [GoogleCloudPlatform/professional-services-data-validator: Utility to compare data between homogeneous or heterogeneous environments to ensure source and target tables match](https://github.com/GoogleCloudPlatform/professional-services-data-validator)
* [Automate Validation using the Data Validation Tool (DVT) | Google Cloud Skills Boost](https://www.cloudskillsboost.google/focuses/45997?parent=catalog)
* [justinjm/google-cloud-scripts](https://github.com/justinjm/google-cloud-scripts)

## Acknowledgements  
