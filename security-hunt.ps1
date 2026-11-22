<#
.SYNOPSIS
  security-hunt.ps1 - pull lab alert events from the last 2 days into one CSV
.NOTES
  Code: Generated with AI. Run, tested, and documented by Emil Aguirre Herrera.
#>
$since = (Get-Date).AddDays(-2)
$queries = @(
  @{LogName='Security'; Id=4625,4688,4698,4699,1102},
  @{LogName='Microsoft-Windows-Windows Defender/Operational'; Id=1116,1117,5001,5013},
  @{LogName='Microsoft-Windows-PowerShell/Operational'; Id=4104}
)
$events = foreach ($q in $queries) {
  $q.StartTime = $since
  Get-WinEvent -FilterHashtable $q -ErrorAction SilentlyContinue
}
$events | Sort-Object TimeCreated |
  Select-Object TimeCreated, LogName, Id, @{n='Summary';e={($_.Message -split "`r?`n")[0].Trim()}} |
  Export-Csv C:\Users\Public\security-hunt.csv -NoTypeInformation
"Exported $($events.Count) events to C:\Users\Public\security-hunt.csv"
