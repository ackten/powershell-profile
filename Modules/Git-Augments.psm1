Import-Module -Name .\PS-Augments.psm1 -Force -Verbose
#***********************************************************
# common git commands
#***********************************************************

# run git status
function gst() {
  git status
}

# run git fetch -p
function gf() {
  git fetch -p
}

# run git branch [displays local branches list]
function gb() {
  git branch
}

# run git branch -r [displays remote branches list]
function gbr() {
  git branch -r
}

#run git branch -D
function gbd($x) {
  git branch -D $x
}

# run git log --oneline
function glo() {
  git log --oneline
}

# git commit
function gca() {
  param(
  [parameter(Mandatory=$true, HelpMessage="Enter commit message.")] [string] $commitMsg
  )
  git add .
  git commit -a -m $commitMsg
}


# run git checkout develop
function gdev {
param(
  [parameter(Mandatory=$false, HelpMessage="Enter (y/n) if you want to force checkout of that branch.")] [string] $force
  )
  gco "develop" $force
  git pull -f
}

# run git checkout
function gco {
param(
  [parameter(Mandatory=$true, HelpMessage="Enter branch name you wish to checkout.")] [string] $branchName,
  [parameter(Mandatory=$false, HelpMessage="Enter (y/n) if you want to force checkout of that branch.")] [string] $force
  )
  if($force -eq "y" )
  {
    Write-Host "Forcing checkout to $branchName, dropping all existing code."
    git stash
    git stash drop
  }
  git checkout $branchName
  git pull
}



Export-ModuleMember -Function *
