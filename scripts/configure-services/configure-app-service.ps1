
echo "Configuring App Service app settings"

$connectionStringTemplate=$(az sql db show-connection-string --server $sqlServerName --client ado.net -o tsv)
$connectionString=$connectionStringTemplate.Replace('<databasename>', $sqlDatabaseName).Replace('<username>', $sqlUserName).Replace('<password>', $sqlPassword)
az webapp config appsettings set `
  -g $rg -n $webAppName `
  --settings Database__Provider='SqlServer' ConnectionStrings__ToDoDb=$connectionString