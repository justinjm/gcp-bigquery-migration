# 00_setup_test 

A file for setup testing


## data loading to gcs

```sh
### testing 
# curl https://raw.githubusercontent.com/justinjm/gcp-bigquery-migration/main/data/loan_201.sql | gsutil cp - gs://${BUCKET}/loan_201.sql
# curl https://raw.githubusercontent.com/justinjm/gcp-bigquery-migration/main/data/loan_201.csv | gsutil cp - gs://${BUCKET}/loan_201.csv
# curl https://raw.githubusercontent.com/justinjm/gcp-bigquery-migration/main/data/loan_200k.csv | gsutil cp - gs://${BUCKET}/loan_200k.csv
# curl https://raw.githubusercontent.com/justinjm/gcp-bigquery-migration/main/data/loan_200k.sql | gsutil cp - gs://${BUCKET}/loan_200k.sql

```

## MSSQL server 


```sh
gcloud sql instances describe mssqls-instance
```

```sh
gcloud sql instances patch mssqls-instance \
    --activation-policy=ALWAYS
```

<https://cloud.google.com/sql/docs/sqlserver/start-stop-restart-instance>

```sh
gcloud sql instances describe mssqls-2017 | grep "serviceAccountEmailAddress" > instance-test.txt
```

## Get IP address of MSSQL Server instance

```sh
echo "Getting IP address of MSSQL Server instance ..."
MSSQLS_IP=$(gcloud sql instances describe mssqls-2017 --format="value(ipAddresses[0].ipAddress)")
echo "IP: ${MSSQLS_IP}"
```

```sh
gcloud compute instances describe data-validator
```

```sh
gcloud compute instances describe data-validator --format='get(networkInterfaces[0].accessConfigs[0].natIP)'

VM_INSTANCE_IP=$(gcloud compute instances describe data-validator --format='get(networkInterfaces[0].accessConfigs[0].natIP)')
echo $VM_INSTANCE_IP
```


```
gcloud sql instances patch mssqls-instance \
    --quiet \
    --authorized-networks=34.134.160.245
```

```sh
gcloud sql import sql mssqls-instance gs://demos-vertex-ai-bq-staging/loans.sql \
  --database=test \
  --quiet 
```


```sh
bq load \
    --autodetect=TRUE \
    --skip_leading_rows=1 \
    dvt_demo.loan_201 \
    gs://demos-vertex-ai-gcp-bq-migration/loan_201.csv
```


## 2023-02-17


```sh
source args 
gsutil cp ../data/loan_200k.sql gs://${BUCKET}/loan_200k.sql

```

instance: 
db: demo200k

load 

```sh
source args 
gcloud sql import sql ${INSTANCE_NAME} gs://${BUCKET}/${DATA_FILE_SQL} \
  --database=${DATABASE_NAME} \
  --quiet
```


## VM SEtup 


```sh
gcloud compute instances create instance-3 --project=demos-vertex-ai --zone=us-central1-a --machine-type=e2-medium --network-interface=network-tier=PREMIUM,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --provisioning-model=STANDARD --service-account=746038361521-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=instance-3,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230206,mode=rw,size=10,type=projects/demos-vertex-ai/zones/us-central1-a/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any
```