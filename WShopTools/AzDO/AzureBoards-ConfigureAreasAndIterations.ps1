# $orgURL = 'https://dev.azure.com/WShop-iPay'
# $projectName = 'WShop-iPay'

$orgURL = 'https://dev.azure.com/DEMO-WA-LNI'
$projectName = 'DemoScrum'

$dow = Get-Date -UFormat '%u' #Day of the Week
$lastMonday=(Get-Date).AddDays(-$dow+1)
$lastMonday

$sprint1StartDate = $($lastMonday).AddDays(-7) # Get-Date $($lastMonday).AddDays(-7) -Format 'yyy-MM-dd'

$rootAreaPath = "\$projectName\Area\TEST"
$rootIterationPath = "\$projectName\Iteration\TEST"

# az login

az devops configure --defaults organization=$orgURL project=$projectName

az boards area project create --name 'TEST'
az boards iteration project create --name 'TEST'

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
