
$appServiceIps=$(az webapp show -g $rg -n $webAppName --query possibleOutboundIpAddresses -o tsv).Split(',')

foreach ($appServiceIp in $appServiceIps) {
    echo "Adding firewall rule for app service IP $appServiceIp"
    az sql server firewall-rule create `
    -g $rg -s $sqlServerName -n "appservice-$appServiceIp" `
    --start-ip-address $appServiceIp --end-ip-address $appServiceIp
}
