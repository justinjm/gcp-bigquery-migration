# DVT Examples 

## Pre-requisites 

First run all setup scripts in `src` folder to setup your GCP, VM environments and install DVT on the VM.

Once you have setup connections to MSSQL and BigQuery, the following examples can be run.

## Examples

### Activate venv

cd into the directory `src` and then activate the venv setup previously (if not already):

```sh
cd src/
source env/bin/activate
```

### Validate row count

```sh
data-validation validate column \
    --source-conn MY_MSSQL_CONN --target-conn MY_BQ_CONN \
    --tables-list demo.demo.loans=demos-vertex-ai.dvt_demo.loan_201 \
    --count '*' \
    --bq-result-handler demos-vertex-ai.dvt_demo.results \
    --labels tag=loans-loans201
```