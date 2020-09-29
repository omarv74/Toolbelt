# ####
# References:
#     https://git-scm.com/docs/git-submodule
#
#
# #####

$orgURL = 'https://dev.azure.com/LetsFindOut'
$projectName = 'SandboxGitSubmodules'

# az login

az devops configure --defaults organization=$orgURL project=$projectName

$newRepo = az repos create --name #<NewRepoName>

$remoteUrl = $newRepo | ConvertFrom-Json | Select remoteUrl 

cd # to directory of the submodule repo

copy ..\_Templates\VisualStudio.gitignore .gitignore

git add .

git commit -m 'Initial commit.'

git remote add origin $remoteUrl.remoteUrl

git push -u origin --all

cd # to SuperRepo location

git submodule add $remoteUrl.remoteUrl # <relative/path/to/submodule>

git add .

git commit -m 'Added git submodule.'

git push

