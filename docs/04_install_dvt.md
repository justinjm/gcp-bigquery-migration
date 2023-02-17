# 04_install_dvt

Instructions for installing [DVT](https://github.com/GoogleCloudPlatform/professional-services-data-validator) with the script `04_install_dvt.sh` on a VM (created via `03_setup_vm.sh`).

See official [installation](https://github.com/GoogleCloudPlatform/professional-services-data-validator/blob/develop/docs/installation.md) guide in DVT documentation for more details.

## 1. SSH into instance and clone this repository

```sh
git clone https://github.com/justinjm/gcp-bigquery-migration && cd gcp-bigquery-migration/src
```

## 1.1 Update args 

Update the `args` file before proceeding with the same variables during the initial setup:

```sh
vi sh 
```

## 2. install DVT and dependencies

run `04_install_dvt.sh` to install DVT and necessary dependencies:

```sh
source 04_install_dvt.sh
```

check install via:

```sh
data-validation -h
```

Note: if not in virtual environment, run the following to reactivate and re-source the `args` file:

```sh
source env/bin/activate
source args
```

## 3. create source and target connections

GCP doc: <https://cloud.google.com/sql/docs/sqlserver/connect-overview>
DVT doc: <https://github.com/GoogleCloudPlatform/professional-services-data-validator/blob/develop/docs/connections.md>

### MSSQL

Get IP address of SQL instance for setting up DVT connection and save as global variable for re-use:

```sh 
MSSQLS_IP=$(gcloud sql instances describe ${INSTANCE_NAME} --format="value(ipAddresses[0].ipAddress)")
```

#### create a connection to MS SQL Server Cloud SQL instance

```sh
data-validation connections add \
    --connection-name MY_MSSQL_CONN MSSQL \
    --host ${MSSQLS_IP} \
    --port 1433 \
    --user sqlserver \
    --password password123 \
    --database ${DATABASE_NAME}
```

#### test connection by column validation (`COUNT(*)`)

```sh
data-validation validate column \
  -sc MY_MSSQL_CONN \
  -tc MY_MSSQL_CONN \
  -tbls demo.demo.loans
```

### bigquery

Initialize gcloud first

```sh
gcloud config set project ${PROJECT_ID}
```

then add connection to BQ

```sh
data-validation connections add \
    --connection-name MY_BQ_CONN BigQuery \
    --project-id ${PROJECT_ID}
```

#### test connection by column validation (`COUNT(*)`)

finally, check the connection works with a validation job:

```sh
data-validation validate column \
  -sc MY_BQ_CONN -tc MY_BQ_CONN \
  -tbls ${PROJECT_ID}.${BQ_DATASET}.${BQ_TABLE_DATA}
```
