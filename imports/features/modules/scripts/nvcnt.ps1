# Check status and if needed start/stop required service for NVCPL

param([string]$Action)

$ServiceName = "NVDisplay.ContainerLocalSystem"
$NVCPL = "C:\Program Portable\NVIDIA ControlPanel\nvcplui.exe"

$Service = Get-Service $ServiceName -ErrorAction SilentlyContinue

if (-not $Service) {
    if ($Action -ne "Stop") {
        Start-Process $NVCPL
    }
    return
}

if ($Action -eq "Stop") {
    if ($Service.Status -ne "Stopped") {
        Start-Process powershell.exe `
            -ArgumentList "-Command Stop-Service '$ServiceName' -Force" `
            -Verb RunAs -Wait
    }
    return
}

if ($Service.Status -ne "Running") {
    Start-Process powershell.exe `
        -ArgumentList "-Command Start-Service '$ServiceName'" `
        -Verb RunAs -Wait
}

Start-Process $NVCPL