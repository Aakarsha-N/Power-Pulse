$PSScriptRoot="your file path here...."
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File '$PSScriptRoot\Power-pulse.ps1'"

$trigger = New-ScheduledTaskTrigger -AtLogOn

Register-ScheduledTask -TaskName "PP1" -Action $action -Trigger $trigger -RunLevel Highest