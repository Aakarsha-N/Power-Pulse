while ($true) {

    $battery = Get-CimInstance Win32_Battery

    if (-not $battery) {
        Add-Content PPlog.txt "No battery detected"
        Start-Sleep -Seconds 600
        continue
    }

    $FirstChargePercentage = $battery.EstimatedChargeRemaining
    $FirstTime = Get-Date

    Start-Sleep -Seconds 600

    $battery2 = Get-CimInstance Win32_Battery
    if (-not $battery2) { continue }

    $SecondChargePercentage = $battery2.EstimatedChargeRemaining
    $SecondTime = Get-Date

    $Minutes = ($SecondTime - $FirstTime).TotalMinutes

    if ($Minutes -le 0) { continue }

    $PercentageChange = $SecondChargePercentage - $FirstChargePercentage
    $Rate = $PercentageChange / $Minutes

    if ($PercentageChange -lt 0) {

        Add-Content PPlog.txt "Battery Discharging"

        if ([math]::Abs($Rate) -gt 0.05) {
            Add-Content PPlog.txt "FAST DRAIN ALERT"
        }

    }
    elseif ($PercentageChange -gt 0) {

        Add-Content PPlog.txt "Battery Charging"

        if ($Rate -gt 0.05) {
            Add-Content PPlog.txt "FAST CHARGING"
        }

    }
    else {
        Add-Content PPlog.txt "Battery Stable"
    }

    Add-Content PPlog.txt "Time: $SecondTime | Start: $FirstChargePercentage% | End: $SecondChargePercentage% | Rate: $Rate %/min"
    Add-Content PPlog.txt "Thank you for using Power-Pulse"
}