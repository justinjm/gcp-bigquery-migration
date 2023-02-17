# DVT Examples 

## Pre-requisites 

1. run all setup scripts in `src` folder to setup your GCP, VM environments and install DVT on the VM. Once you have setup connections to MSSQL and BigQuery, the following examples can be run.
2. Activate venv - cd into the directory `src` and then activate the venv setup previously (if not already):

```sh
cd gcp-bigquery-migration/src/ && source env/bin/activate && source args 
```

## Examples

See more [examples](https://github.com/GoogleCloudPlatform/professional-services-data-validator/blob/develop/docs/examples.md) in DVT documentation.


### 1) Validate row count

```sh
data-validation validate column \
    --source-conn MY_MSSQL_CONN --target-conn MY_BQ_CONN \
    --tables-list demo.demo.loans=${PROJECT_ID}.${BQ_DATASET}.${BQ_TABLE_DATA} \
    --count '*' \
    --bq-result-handler ${PROJECT_ID}.${BQ_DATASET}.results \
    --labels tag=loans-loans201-2023-02-17
```

### 2) Run a row hash validation for all rows but filter only the failed records

```sh
data-validation validate row \
    --source-conn MY_MSSQL_CONN --target-conn MY_BQ_CONN \
    --tables-list demo.demo.loans=${PROJECT_ID}.${BQ_DATASET}.${BQ_TABLE_DATA} \
    --filter-status fail \
    --primary-keys id \
    --hash '*' \
    --bq-result-handler ${PROJECT_ID}.${BQ_DATASET}.results
```

### 3) Run a row level comparison field validation for 10 random rows

```sh
data-validation validate row \
    --source-conn MY_MSSQL_CONN --target-conn MY_BQ_CONN \
    --tables-list demo.demo.loans=${PROJECT_ID}.${BQ_DATASET}.${BQ_TABLE_DATA} \
    --primary-keys id \
    -comp-fields member_id \
    -rr -rbs 10 \
    --bq-result-handler ${PROJECT_ID}.${BQ_DATASET}.results
```



### Viewing results in BigQuery 

The DVT results table (specified in the `args` file) can be queried 

```sql
SELECT
  run_id,
  validation_name,
  validation_type,
  group_by_columns,
  source_table_name,
  source_agg_value,
  target_agg_value,
  pct_difference,
  pct_threshold,
  difference,
  start_time
FROM
  `${PROJECT_ID}.${BQ_DATASET}.results`
  WHERE 
  source_agg_value=target_agg_value
ORDER BY
  start_time DESC
```

Additionally, Looker studio can be used to visualize the results of validation jobs.

Example Looker Studio DVT dashboard template [here](https://lookerstudio.google.com/u/0/reporting/b5c0bab0-075d-4a87-ab7e-93bf1bbfe0bf)