#
# az login --use-device-code
#

$rgName = 'RG-Consolidated-Reporting-ITG-EUS'
$vnetName = 'vnet-fta-itg-eus'

$peeringList = az network vnet peering list --resource-group $rgName --vnet-name $vnetName | ConvertFrom-Json

if ($peeringList.Count -eq 0) {
    Write-Output 'FAILED!'
}
else {
    Write-Output 'PASSED!'
}