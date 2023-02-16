# 00_setup_test 

A file for setup testing


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