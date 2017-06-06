#region Write-DevHost
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
#endregion

#region Write-DevHeader
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
#endregion
