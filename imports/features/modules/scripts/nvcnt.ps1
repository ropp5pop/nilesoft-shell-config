# Used in - nvcpl.nss
# Check status and if needed start/stop required service for NVCPL

param([string]$Action)
$ServiceName = "NVDisplay.ContainerLocalSystem"
$AppID = "NVIDIACorp.NVIDIAControlPanel_56jybvy8sckqj!NVIDIACorp.NVIDIAControlPanel"
$Service = Get-Service $ServiceName -ErrorAction SilentlyContinue

if (-not $Service) {
    if ($Action -ne "Stop") {
        explorer.exe "shell:AppsFolder\$AppID"
    }
    return
}

if ($Action -eq "Stop") {
    if ($Service.Status -ne "Stopped") {
        Start-Process powershell.exe -ArgumentList "-Command Stop-Service '$ServiceName' -Force" -Verb RunAs -Wait
    }
    return
}

if ($Service.Status -ne "Running") {
    Start-Process powershell.exe -ArgumentList "-Command Start-Service '$ServiceName'" -Verb RunAs -Wait
}

explorer.exe "shell:AppsFolder\$AppID"
