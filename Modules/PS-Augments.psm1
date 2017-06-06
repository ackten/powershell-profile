<#
.Synopsis
   Writes message to console, prepends computer name of the console it's writing on.
.DESCRIPTION
   replaces write-host for most console messages
#>
function Write-DevHost() {
  [CmdletBinding()]
  param($object, $backgroundColor, $ForegroundColor, [switch]$NoNewLine, $separator)
  Begin {
  }
  Process {
    Write-Host "($((Get-Date).ToString())) [$env:computername] " -NoNewline -ForegroundColor Yellow
    Write-Host @PSBoundParameters
  }
  End {
  }
}

<#
.Synopsis
   Writes header to console, makes it a header message
.DESCRIPTION
   replaces write-host for most console messages
#>
function Write-DevHeader() {
  [CmdletBinding()]
  param([string]$title)
  Begin {
  }
  Process {

    Write-DevHost ""
    Write-DevHost "========  " -ForegroundColor DarkGreen -NoNewline
    Write-Host $title -ForegroundColor Green -NoNewline
    Write-Host " ========  "
    Write-DevHost ""
  }
  End {
  }
}

#***********************************************************
# common powershell profile commands
#***********************************************************

<#
.Synopsis
   Open profile in VSCode
#>
function profile() {
  code $profile
}

<#
.Synopsis
   Refresh the environment variables in PS
#>
function refresh {
  RefreshEnv.cmd
}

<#
.Synopsis
   Get Profile location
#>
function Get-ProfileLoc {
  return "$env:USERPROFILE\Documents\WindowsPowerShell"
}

<#
.Synopsis
   GO to Profile location
#>
function profileloc {
  $profileLoc = Get-ProfileLoc
  Push-Location $profileLoc
}

Export-ModuleMember -Function *
