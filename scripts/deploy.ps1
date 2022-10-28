
. ./secrets.ps1
. ./00-set-variables.ps1

# core 
./create-core/01_create-rg.ps1

# sqldb & app
./create-services/create-sql.ps1
./create-services/create-app-service.ps1

# configuration
./configure-services/configure-sql.ps1
./configure-services/configure-app-service.ps1