
# ConvertTo-Hashtable function source: https://4sysops.com/archives/convert-json-to-a-powershell-hash-table/
function ConvertTo-Hashtable {
    [CmdletBinding()]
    [OutputType('hashtable')]
    param (
        [Parameter(ValueFromPipeline)]
        $InputObject
    )
 
    process {
        ## Return null if the input is null. This can happen when calling the function
        ## recursively and a property is null
        if ($null -eq $InputObject) {
            return $null
        }
 
        ## Check if the input is an array or collection. If so, we also need to convert
        ## those types into hash tables as well. This function will convert all child
        ## objects into hash tables (if applicable)
        if ($InputObject -is [System.Collections.IEnumerable] -and $InputObject -isnot [string]) {
            $collection = @(
                foreach ($object in $InputObject) {
                    ConvertTo-Hashtable -InputObject $object
                }
            )
 
            ## Return the array but don't enumerate it because the object may be pretty complex
            Write-Output -NoEnumerate $collection
        } elseif ($InputObject -is [psobject]) { ## If the object has properties that need enumeration
            ## Convert it to its own hash table and return it
            $hash = @{}
            foreach ($property in $InputObject.PSObject.Properties) {
                $hash[$property.Name] = ConvertTo-Hashtable -InputObject $property.Value
            }
            $hash
        } else {
            ## If the object isn't an array, collection, or other object, it's already a hash table
            ## So just return it.
            $InputObject
        }
    }
}

$orgUrl = 'https://dev.azure.com/DEMO-WA-LNI'
$projectName = 'PartsUnlimited'

# az login 

az devops configure --defaults organization=$orgUrl project=$projectName

$projectsList = az devops project list --organization $orgUrl | ConvertFrom-JSon

# $projectsList.value | Foreach-Object { 
#     $projectGroups = az devops security group list -p $_.Name --org $orgUrl | ConvertFrom-JSon
#     $ProjectGroups | Select -Property PrincipalName | Foreach-Object {
#         Write-Host $_.PrincipalName
#     }
# }

$projectsList.value | Foreach-Object { 
    $message = 'PROJECT: {0}' -f $_.Name
    Write-Output $message

    $projectGroups = az devops security group list -p $_.Name --org $orgUrl | ConvertFrom-JSon | ConvertTo-Hashtable
    $projectGroups.graphGroups.GetEnumerator() | ForEach-Object { 
        $message = ' ' * 6 + 'GROUP: ' + $_.displayName 
        Write-Output $message
        # $message = '     *GROUP ID: ' + $_.descriptor 
        # Write-Output $message

        $groupMembers = az devops security group membership list --org $orgUrl --relationship members --id $_.descriptor | ConvertFrom-JSon
        foreach ($property in $groupMembers.PSObject.Properties) { 
            if ($property.Value.subjectKind -eq 'user') {
                ' ' * 12 + "{0}: {1} ({2})" -f $property.Value.subjectKind, $property.Value.displayName, $property.Value.mailAddress
            }
        }

    }

    Write-Output "`n"
}
