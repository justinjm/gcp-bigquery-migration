# 04_install_dvt

See official [installation](https://github.com/GoogleCloudPlatform/professional-services-data-validator/blob/develop/docs/installation.md) guide for more details.

## 1. SSH into instance and clone this repository

```sh
git clone https://github.com/justinjm/gcp-bigquery-migration && cd gcp-bigquery-migration/src
```

## 2. install DVT and dependencies

run `04_install_dvt.sh` to install DVT and necessary dependencies 

```sh
source 04_install_dvt.sh
```

check install via:

```sh
data-validation -h
```

Note: if not in virtual environment, run the following to reactivate: 

```sh
source env/bin/activate
```

## 3. create source and target connections

GCP doc: <https://cloud.google.com/sql/docs/sqlserver/connect-overview>
DVT doc: <https://github.com/GoogleCloudPlatform/professional-services-data-validator/blob/develop/docs/connections.md>

### MSSQL

Get IP address of SQL instance for setting up DVT connection and save as global variable for re-use:

```sh 
MSSQLS_IP=$(gcloud sql instances describe mssqls-2017 --format="value(ipAddresses[0].ipAddress)")
```

#### create a connection to MS SQL Server Cloud SQL instance

```sh
data-validation connections add \
    --connection-name MY_MSSQL_CONN MSSQL \
    --host ${MSSQLS_IP} \
    --port 1433 \
    --user sqlserver \
    --password password123 \
    --database demo
```

#### test connection by column validation (`COUNT(*)`)

```sh
data-validation validate column \
  -sc MY_MSSQL_CONN \
  -tc MY_MSSQL_CONN \
  -tbls demo.demo.loans
```

### bigquery

Initialize gcloud

```sh
gcloud config set project demos-vertex-ai
```

add connection to BQ

```sh
data-validation connections add \
    --connection-name MY_BQ_CONN BigQuery \
    --project-id demos-vertex-ai
```

#### test connection by column validation (`COUNT(*)`)

```sh
data-validation validate column \
  -sc MY_BQ_CONN -tc MY_BQ_CONN \
  -tbls demos-vertex-ai.dvt_demo.loans
```
