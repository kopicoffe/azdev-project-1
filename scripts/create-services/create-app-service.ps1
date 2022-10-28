
echo "Creating App Service Plan: $appPlanName"

az appservice plan create `
  -l $location -g $rg -n $appPlanName `
  --is-linux `
  --sku $appPlanSku `
  --number-of-workers $appPlanWorkerCount

echo "Creating App Service: $webAppName"

az webapp create `
  -g $rg -n $webAppName `
  --plan $appPlanName `
  --runtime dotnetcore:6.0

echo "Configuring App Service deployment from: $webAppGitBranch branch; $webAppGitUrl"

az webapp config appsettings set `
  -g $rg -n $webAppName `
  --settings PROJECT='src/ToDoList.csproj' DEPLOYMENT_BRANCH=$webAppGitBranch

az webapp deployment source config `
  -g $rg -n $webAppName `
  --branch $webAppGitBranch `
  --repo-url $webAppGitHubUrl `
  --git-token $webAppGitHubToken
