# azdev-project-1

## Pre-reqs

Create a file `scripts/secrets.ps1` with the confidential data items:

```
$env:LAB_PASSWORD='<password-for-sql-server>'

$env:GH_TOKEN='<your-github-access-token'
```

## Test environment

Deploy with a serverles SQL database with 1 CPU, and a single App Service worker:

```
cd scripts

./deploy-test.ps1
```

> Deployment will be in the RG called `rg-proj1todotest`


## Production environment

Deploy with a 4-CPU SQL database and 3 App Service workers:

```
./deploy-prod.ps1
```

> Deployment will be in the RG called `rg-proj1todoprod`

## Teardown

```
./delete-test.ps1

./delete-prod.ps1
```