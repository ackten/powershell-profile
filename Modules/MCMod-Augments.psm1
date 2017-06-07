Import-Module -Name $PSScriptRoot\PS-Augments.psm1 -Force

#***********************************************************
# common mc locations
#***********************************************************

# get eco mod path
function get-ecopath() {
  return "C:\Source\terracraft\"
}

# navigate to eco path
function ecopath() {
  Push-Location $(get-ecopath)
}

#***********************************************************
# common gradle commands
#***********************************************************

# run gradle build
function gbuild() {
  gradle "build"
}

# run gradle client
function grun() {
  gradle "runClient"
}

# run gradle with a command
function gradle(){
  param(
    [parameter(Mandatory=$true, HelpMessage="Enter gradlew command to run.")] [string] $command
  )

  Write-DevHost "Starting gradle command: $command"
  .\gradlew $command
}

