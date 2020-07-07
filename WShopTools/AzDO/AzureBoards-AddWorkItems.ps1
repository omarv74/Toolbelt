
# Azure DevOps CLI Reference: https://docs.microsoft.com/en-us/cli/azure/ext/azure-devops/?view=azure-cli-latest

$orgURL = 'https://dev.azure.com/DemoEcolab'
$projectName = 'DemoWaterfall'

$rootAreaPath = "\$projectName\Area\Ecolab"
$rootIterationPath = "\$projectName\Iteration\Ecolab"

# az login

az devops configure --defaults organization=$orgURL project=$projectName

az boards work-item create  --type Epic  --title 'Identify Change Requirements' --area 'DemoWaterfall\Ecolab\Reporting'

