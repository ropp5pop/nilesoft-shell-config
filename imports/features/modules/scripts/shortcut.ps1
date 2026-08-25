# New-Shortcut-Wizard.ps1
param([string]$Directory)

Add-Type -AssemblyName Microsoft.VisualBasic

$target = [Microsoft.VisualBasic.Interaction]::InputBox("Target path or URL:", "New Shortcut", "")
if ([string]::IsNullOrWhiteSpace($target)) { exit }

$default = [System.IO.Path]::GetFileNameWithoutExtension($target)
$name = [Microsoft.VisualBasic.Interaction]::InputBox("Shortcut name:", "New Shortcut", $default)
if ([string]::IsNullOrWhiteSpace($name)) { $name = $default }

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut((Join-Path $Directory "$name.lnk"))
$shortcut.TargetPath = $target
$shortcut.Save()