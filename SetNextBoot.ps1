<#
.SYNOPSIS
  List all available boot options and set the NextBoot firmware
  Microsoft documentation: https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/bcdedit-command-line-options
.NOTES
  Function   : SetNextBoot
  File Name  : SetNextBoot.ps1
  Author     : Gushmazuko
.LINK
  https://github.com/gushmazuko/windows-tips/blob/master/SetNextBoot.ps1
.EXAMPLE
  Open CMD as Admin and execute:
  powershell -exec bypass "iwr -useb https://raw.githubusercontent.com/gushmazuko/windows-tips/master/SetNextBoot.ps1 | iex"
  or
  powershell -exec bypass "iwr -useb https://kutt.it/setnextboot | iex"

#>

bcdedit /enum firmware
Write-Host "`n`nExecute:`nbcdedit /set {fwbootmgr} bootsequence {xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" -ForegroundColor green