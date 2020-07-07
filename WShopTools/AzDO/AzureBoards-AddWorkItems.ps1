
# Azure DevOps CLI Reference: https://docs.microsoft.com/en-us/cli/azure/ext/azure-devops/?view=azure-cli-latest

$orgURL = 'https://dev.azure.com/DemoEcolab'
$projectName = 'DemoWaterfall'

$rootAreaPath = "\$projectName\Area\Ecolab"
$rootIterationPath = "\$projectName\Iteration\Ecolab"

# az login

az devops configure --defaults organization=$orgURL project=$projectName

az boards area project create --name 'Legacy Portfolio' --path "$rootAreaPath"
az boards area project create --name 'Modern Portfolio' --path "$rootAreaPath"
az boards area project create --name 'CRM Program' --path "$rootAreaPath\Modern Portfolio"
az boards area project create --name 'ERP Program' --path "$rootAreaPath\Modern Portfolio"
az boards area project create --name 'Mobile CRM' --path "$rootAreaPath\Modern Portfolio\CRM Program"
az boards area project create --name 'Web CRM' --path "$rootAreaPath\Modern Portfolio\CRM Program"

az boards iteration project create --name 'Fiscal Year - H1' --path "$rootIterationPath"
az boards iteration project create --name 'Fiscal Year - H2' --path "$rootIterationPath"

az boards iteration project create --name 'PI 1' --path "$rootIterationPath\Fiscal Year - H1" --start-date (Get-Date $sprint1StartDate -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(2*7)) -Format 'yyy-MM-dd')
az boards iteration project create --name 'Sprint 1' --path "$rootIterationPath\Fiscal Year - H1\PI 1" --start-date (Get-Date $sprint1StartDate -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(0*7)) -Format 'yyy-MM-dd')
az boards iteration project create --name 'Sprint 2' --path "$rootIterationPath\Fiscal Year - H1\PI 1" --start-date (Get-Date $sprint1StartDate.AddDays(1*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(1*7)) -Format 'yyy-MM-dd')
az boards iteration project create --name 'Sprint 3' --path "$rootIterationPath\Fiscal Year - H1\PI 1" --start-date (Get-Date $sprint1StartDate.AddDays(2*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(2*7)) -Format 'yyy-MM-dd')

az boards iteration project create --name 'PI 2' --path "$rootIterationPath\Fiscal Year - H1" --start-date (Get-Date $sprint1StartDate.AddDays(3*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(3*7)) -Format 'yyy-MM-dd')
az boards iteration project create --name 'Sprint 4' --path "$rootIterationPath\Fiscal Year - H1\PI 2" --start-date (Get-Date $sprint1StartDate.AddDays(3*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(3*7)) -Format 'yyy-MM-dd')
az boards iteration project create --name 'Sprint 5' --path "$rootIterationPath\Fiscal Year - H1\PI 2" --start-date (Get-Date $sprint1StartDate.AddDays(4*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(4*7)) -Format 'yyy-MM-dd')
az boards iteration project create --name 'Sprint 6' --path "$rootIterationPath\Fiscal Year - H1\PI 2" --start-date (Get-Date $sprint1StartDate.AddDays(5*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(5*7)) -Format 'yyy-MM-dd')
