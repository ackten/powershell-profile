Import-Module -Name .\Modules\Git-Augments.psm1 -Force -Verbose

# cd to dashboard
function dash() {
  Push-Location "C:\ackten\dashboard"
}

# cd to main-site
function site() {
  Push-Location "C:\ackten\main-site"
}


# git commit
function adgca() {
  param(
  [parameter(Mandatory=$true, HelpMessage="Enter ticket number.")] [string] $ticketNumber,
  [parameter(Mandatory=$true, HelpMessage="Enter commit message.")] [string] $commitMsg,
  [parameter(Mandatory=$false, HelpMessage="Enter project type.")] [string] $projectType = "AD"
  )

  $commitMsg = "[$projectType-$ticketNumber]: $commitMsg"
  if (-Not $commitMsg.EndsWith(".")) {
    $commitMsg = "$commitMsg."
  }
  gca "$commitMsg"
}


# run git checkout
function adgco {
  param(
    [parameter(Mandatory=$true, HelpMessage="Enter ticket number.")] [string] $ticketNumber,
    [parameter(Mandatory=$true, HelpMessage="Enter description name.")] [string] $description,
    [parameter(Mandatory=$false, HelpMessage="Enter project type.")] [string] $projectType = "AD",
    [parameter(Mandatory=$false, HelpMessage="Enter (y/n) if you want to force checkout of that branch.")] [string] $force
    )

    $branchName = "feature/$projectType-$ticketNumber/$description"

    newgco $branchName $force
  }
