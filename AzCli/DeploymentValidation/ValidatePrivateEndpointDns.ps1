#
# az login --use-device-code
#

$rgName = 'RG-Consolidated-Reporting-ITG-EUS'
$endpointName = 'pe-fta-itg-eus-kv'

$dnsZoneGroups = az network private-endpoint dns-zone-group list --endpoint-name $endpointName --resource-group $rgName | ConvertFrom-Json

if ($dnsZoneGroups.Count -eq 0) {
    Write-Error 'FAILED!'
}
else {
    Write-Output 'PASSED!'
}