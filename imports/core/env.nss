// Globals
// Scaling
$dpi = reg.get('HKCU\Control Panel\Desktop','LogPixels')
$dScale = if(dpi==0,96,dpi)/96

$tScale = reg.get('HKCU\Software\Microsoft\Accessibility','TextScaleFactor')
$tScaleFx = if(tScale==0,100,tScale)/100

$fScale = $dScale * $tScaleFx

$mScale = if(sys.is_primary_monitor, 1, 1.1)
$wScale = if(wnd.name == 'SystemTray_Main' || wnd.is_start, 1.1, 1)

// Application Environment Paths
$core   = '@app.dir\imports\core\'
$feat   = '@app.dir\imports\features\'
$mods   = '@app.dir\imports\features\modules\'
$scrpt  = '@app.dir\imports\features\modules\scripts\'

$nvcnt  = $scrpt + 'nvcnt.ps1'
$short  = $scrpt + 'shortcut.ps1'

// Local Paths
$portable = 'C:\Program Portable\'
$devenv = 'D:\.dev-env'
$repo = $devenv + '\_projects\.repos\nilesoft-shell-config'
$scripts = $devenv + '\_scripts\.active'
$start = @sys.programdata + '\Microsoft\Windows\Start Menu'

// Executables
$cmd_7zipC    = path.combine(sys.prog, '7-Zip-Zstandard', '7z.exe')
$cmd_7zipG    = path.combine(sys.prog, '7-Zip-Zstandard', '7zG.exe')
$cmd_7zipA    = path.combine(sys.prog, '7-Zip-Zstandard', '7zFM.exe')
$cmd_aren     = path.combine(sys.prog, 'Advanced Renamer', 'ARen.exe')
$cmd_npp      = path.combine(sys.prog, 'Notepad++', 'notepad++.exe')
$cmd_nvcpl    = $portable + 'NVIDIA ControlPanel\nvcplui.exe'
$cmd_pwsh     = path.combine(sys.prog, 'PowerShell', '7', 'pwsh.exe')
$cmd_vscodium = path.combine(sys.prog, 'VSCodium', 'VSCodium.exe')

// Registry Keys
$reg_explorer = 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\'
$reg_advanced = $reg_explorer + 'Advanced'

// Keys
$mkeyANY    = key.shift() || key.control()
$mkeyANYM1  = ($mkeyANY || key.lbutton())
$mkeyANYM2  = ($mkeyANY || key.rbutton())
$mkeySC     = key.shift() && key.control()

// Tooltip
$tipANYM2 = "(SHIFT/CTRL/RIGHT-CLICK)"
$tipADMIN = ["Administrator + " + $tipANYM2, tip.warning, 1.0]

// Misc
$dt = sys.datetime("ymd_HM")
