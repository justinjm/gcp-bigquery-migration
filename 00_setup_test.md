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

gcloud sql instances describe mssqls-2017 | grep "serviceAccountEmailAddress" > instance-test.txt



