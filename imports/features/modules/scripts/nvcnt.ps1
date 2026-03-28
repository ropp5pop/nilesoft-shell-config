# Used in - nvcpl.nss
# Check status and if needed start/stop required service for NVCPL

param([string]$Action)
$ServiceName = "NVDisplay.ContainerLocalSystem"
$AppID = "NVIDIACorp.NVIDIAControlPanel_56jybvy8sckqj!NVIDIACorp.NVIDIAControlPanel"

if ($Action -eq "Stop") {
    Start-Process powershell.exe -ArgumentList "-Command Stop-Service $ServiceName -Force" -Verb RunAs -Wait
}
else {
    $svc = Get-Service $ServiceName -ErrorAction SilentlyContinue
    if ($svc -and $svc.Status -ne "Running") {
        Start-Process powershell.exe -ArgumentList "-Command Start-Service $ServiceName" -Verb RunAs -Wait
    }
    explorer.exe "shell:AppsFolder\$AppID"
}