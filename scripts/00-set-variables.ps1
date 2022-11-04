# variables
$environmentName = if ($env:ENVIRONMENT_NAME) { $env:ENVIRONMENT_NAME } else { 'dev' };
$appPlanSku = if ($env:APP_PLAN_SKU) { $env:APP_PLAN_SKU } else { 'B1' }
$appPlanWorkerCount = if ($env:APP_PLAN_WORKER_COUNT) { $env:APP_PLAN_WORKER_COUNT } else { '1' }
$sqlDatabaseComputeModel = if ($env:SQL_DB_COMPUTE_MODEL) { $env:SQL_DB_COMPUTE_MODEL } else { 'Serverless' }
$sqlDatabaseMaxSize = if ($env:SQL_DB_MAX_SIZE) { $env:SQL_DB_MAX_SIZE } else { '1GB' }
$sqlDatabaseCapacity = if ($env:SQL_DB_CAPACITY) { $env:SQL_DB_CAPACITY } else { '1' }

# core
$projectName="todoproject$environmentName"
$rg="rg-$($projectName)"
$location='westus'

# sql server
$sqlServerName="todosql$($projectName)"
$sqlUserName='sqluser'
$sqlPassword=$env:LAB_PASSWORD

# sql database
$sqlDatabaseName="todosqldb-$($projectName)"
$sqlDatabaseEdition='GeneralPurpose'
$sqlDatabaseFamily='Gen5'

# app service plan
$appPlanName="todoasp-$($projectName)"

# app service
$webAppName="web$($projectName)"
$webAppGitHubUrl='https://github.com/kopicoffe/azdev-project-1.git'
$webAppGitBranch='main'
$webAppGitHubToken=$env:GH_TOKEN
