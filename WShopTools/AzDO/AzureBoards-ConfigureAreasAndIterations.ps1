# $orgURL = 'https://dev.azure.com/WShop-iPay'
# $projectName = 'WShop-iPay'

$orgURL = 'https://dev.azure.com/DEMO-WA-LNI'
$projectName = 'AreasSandbox'

$dow = Get-Date -UFormat '%u' #Day of the Week
$lastMonday=(Get-Date).AddDays(-$dow+1)
$lastMonday

$sprint1StartDate = $($lastMonday).AddDays(-7) # Get-Date $($lastMonday).AddDays(-7) -Format 'yyy-MM-dd'

$rootAreaPath = "\$projectName\Area\StructurePOC"
$rootIterationPath = "\$projectName\Iteration\StructurePOC"

# az login

az devops configure --defaults organization=$orgURL project=$projectName

az boards area project create --name 'StructurePOC'
az boards iteration project create --name 'StructurePOC'

$divisionNode = 'IT-DivisionPortfolio'
az boards area project create --name $divisionNode --path "$rootAreaPath"

az boards area project create --name 'IT-FinancePortfolio' --path "$rootAreaPath\$divisionNode"

$portfolioNode = 'IT-SIOPortfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"
az boards area project create --name 'IT-PMO' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'BAO' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'TQO' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'BIO' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'ATO' --path "$rootAreaPath\$divisionNode\$portfolioNode"

$portfolioNode = 'AIS-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"
az boards area project create --name 'DevOpsIT' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'Monitoring' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'SOA' --path "$rootAreaPath\$divisionNode\$portfolioNode"

$portfolioNode = 'NetOps-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"
az boards area project create --name 'NetOps1' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'NetOps2' --path "$rootAreaPath\$divisionNode\$portfolioNode"

$portfolioNode = 'DM-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"
az boards area project create --name 'DA' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'DW' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'EAI' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'DBA' --path "$rootAreaPath\$divisionNode\$portfolioNode"

$portfolioNode = 'CSI-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"
az boards area project create --name 'CSI' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'VV' --path "$rootAreaPath\$divisionNode\$portfolioNode"

$portfolioNode = 'ITU-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"
az boards area project create --name 'ITSD' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'ITUnit' --path "$rootAreaPath\$divisionNode\$portfolioNode"

$portfolioNode = 'ITSA-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"

$portfolioNode = 'ITESS-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"

$portfolioNode = 'ITSec-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"

$portfolioNode = 'ITBM-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"

$portfolioNode = 'ARC-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode"
az boards area project create --name 'FinancialMgmt' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'IS' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'FSPS' --path "$rootAreaPath\$divisionNode\$portfolioNode"
az boards area project create --name 'FPLS' --path "$rootAreaPath\$divisionNode\$portfolioNode"

$divisionNode = 'WCS-DivisionPortfolio'
$portfolioNodes = @('ExternalWebPortfolio', 'MyLNIPortfolio')
az boards area project create --name $divisionNode --path "$rootAreaPath"
$portfolioNodes | ForEach-Object { az boards area project create --name "$_" --path "$rootAreaPath\$divisionNode" } 

$divisionNode = 'FSPS-DivisionPortfolio'
$portfolioNodes = @('RC2-Portfolio', 'DELTA-Portfolio', 'PI-Portfolio')
az boards area project create --name "$divisionNode" --path "$rootAreaPath"
$portfolioNodes | ForEach-Object { az boards area project create --name "$_" --path "$rootAreaPath\$divisionNode" }

$portfolioNode = 'DELTA-Portfolio'
$productNames = @('DeltaProduct', 'DOSHProduct')
$productNames | ForEach-Object { az boards area project create --name "$_" --path "$rootAreaPath\$divisionNode\$portfolioNode" }


$divisionNode = 'IS-DivisionPortfolio'
$portfolioNodes = @('MIPS-Portfolio', 'CMF-Portfolio', 'OHMS-Portfolio', 'Claims-Portfolio', 'ES-Portfolio', 'RE-Portfolio', 'CV-Portfolio', 'IME-Portfolio', 'SELFI-Portfolio', 'PAY-Portfolio')
az boards area project create --name "$divisionNode" --path "$rootAreaPath"
$portfolioNodes | ForEach-Object { az boards area project create --name "$_" --path "$rootAreaPath\$divisionNode" }

$divisionNode = 'FPLS-DivisionPortfolio'
$portfolioNode = 'FPLS1-Portfolio'
az boards area project create --name "$divisionNode" --path "$rootAreaPath"
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode" 
$productNode = 'ApprenticeshipProduct'
$appNames = @( 'ARTSEXT', 'ARTSINT', 'ARTSPREP', 'ARTSPUB' )
az boards area project create --name "$productNode" --path "$rootAreaPath\$divisionNode\$portfolioNode" 
$appNames | ForEach-Object { az boards area project create --name "$_" --path "$rootAreaPath\$divisionNode\$portfolioNode\$productNode" }

$productNode = 'PWA'
$appNames = @( 'PWAEXT', 'PWCEnergy', 'PWCPayroll', 'PWCPortal', 'PWCPortal', 'PWCrosswalk', 'PWDebar', 'PWHSurvey', 'PWIAPWUExternal', 'PWPWLApprentice', 'PWRTraining', 'PWRLookup', 'PWSDPublic', 'PWSList', 'PWWUpdate', 'ROAR' )
az boards area project create --name "$productNode" --path "$rootAreaPath\$divisionNode\$portfolioNode" 
$appNames | ForEach-Object { az boards area project create --name "$_" --path "$rootAreaPath\$divisionNode\$portfolioNode\$productNode" }

$portfolioNode = 'FPLS2-Portfolio'
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode" 

$divisionNode = 'DOSH-DivisionPortfolio'
$portfolioNode = 'WIN-Portfolio'
az boards area project create --name "$divisionNode" --path "$rootAreaPath"
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode" 

$divisionNode = 'FinMgmt-DivisionPortfolio'
$portfolioNode = 'AdminServices-Portfolio'
az boards area project create --name "$divisionNode" --path "$rootAreaPath"
az boards area project create --name "$portfolioNode" --path "$rootAreaPath\$divisionNode" 





# az boards area project create --name 'Legacy Portfolio' --path "$rootAreaPath"
# az boards area project create --name 'Modern Portfolio' --path "$rootAreaPath"
# az boards area project create --name 'CRM Program' --path "$rootAreaPath\Modern Portfolio"
# az boards area project create --name 'ERP Program' --path "$rootAreaPath\Modern Portfolio"
# az boards area project create --name 'Mobile CRM' --path "$rootAreaPath\Modern Portfolio\CRM Program"
# az boards area project create --name 'Web CRM' --path "$rootAreaPath\Modern Portfolio\CRM Program"


# Iterations
# az boards iteration project create --name 'Fiscal Year - H1' --path "$rootIterationPath"
# az boards iteration project create --name 'Fiscal Year - H2' --path "$rootIterationPath"

# az boards iteration project create --name 'PI 1' --path "$rootIterationPath\Fiscal Year - H1" --start-date (Get-Date $sprint1StartDate -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(2*7)) -Format 'yyy-MM-dd')
# az boards iteration project create --name 'Sprint 1' --path "$rootIterationPath\Fiscal Year - H1\PI 1" --start-date (Get-Date $sprint1StartDate -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(0*7)) -Format 'yyy-MM-dd')
# az boards iteration project create --name 'Sprint 2' --path "$rootIterationPath\Fiscal Year - H1\PI 1" --start-date (Get-Date $sprint1StartDate.AddDays(1*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(1*7)) -Format 'yyy-MM-dd')
# az boards iteration project create --name 'Sprint 3' --path "$rootIterationPath\Fiscal Year - H1\PI 1" --start-date (Get-Date $sprint1StartDate.AddDays(2*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(2*7)) -Format 'yyy-MM-dd')

# az boards iteration project create --name 'PI 2' --path "$rootIterationPath\Fiscal Year - H1" --start-date (Get-Date $sprint1StartDate.AddDays(3*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(3*7)) -Format 'yyy-MM-dd')
# az boards iteration project create --name 'Sprint 4' --path "$rootIterationPath\Fiscal Year - H1\PI 2" --start-date (Get-Date $sprint1StartDate.AddDays(3*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(3*7)) -Format 'yyy-MM-dd')
# az boards iteration project create --name 'Sprint 5' --path "$rootIterationPath\Fiscal Year - H1\PI 2" --start-date (Get-Date $sprint1StartDate.AddDays(4*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(4*7)) -Format 'yyy-MM-dd')
# az boards iteration project create --name 'Sprint 6' --path "$rootIterationPath\Fiscal Year - H1\PI 2" --start-date (Get-Date $sprint1StartDate.AddDays(5*7) -Format 'yyy-MM-dd') --finish-date (Get-Date $sprint1StartDate.AddDays(4+(5*7)) -Format 'yyy-MM-dd')


## Teams

# $teamsList = @('AgencyLeadershipTeam','ITLeadershipTeam','ITPortfolioTeam','ITSIOLeadershipTeam','ITPMOTeam','ATOTeam','BAOTeam','TQOTeam','BIOTeam','AISLeadershipTeam','DOITTeam','MonitoringTeam','SOATeam','NetOpsLeadershipTeam','NetOps1Team','NetOps2Team','DMLeadershopTeam','DATeam','DWTeam','EAITeam','DBATeam','CSILeadershipTeam','CSITeam','VVTeam','ITUnitLeadershipTeam', 'ITSDTeam','ITUnitTeam','ITSATeam','ITESSTeam','ITBMTeam','ARCLeadershipTeam','ARCTeam','WCSLeadershipTeam','EXTLNITeam','MyLniTeam','FSPSLeadershipTeam','RC2Team','DELTATeam','PITeam','ISLeadershipTeam','MIPSTeam','CMFTeam','OHMSTeam','ESTeam','RETeam','RETeam','CVTeam','IMETeam','SELFITeam','PAYTeam','FPLSLeadershipTeam','FPLS1LeadershipTeam','FPLS1Team','FPLS2LeadershipTeam','FPLS2Team','DOSHLeadershipTeam','WINTeam','FinMgmtLeadershipTeam','FMTeamFinMgmtLeadershipTeam','AdminSvcsTeam')

# $teamsList | ForEach-Object { az devops team create --name $_ }
