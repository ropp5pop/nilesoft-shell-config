// --- Scaling ----------------------------------------------------------------
$dpi    = reg.get('HKCU\Control Panel\Desktop','LogPixels')
$dScale = if(dpi==0,96,dpi)/96

$tScale   = reg.get('HKCU\Software\Microsoft\Accessibility','TextScaleFactor')
$tScaleFx = if(tScale==0,100,tScale)/100

$fScale = $dScale * $tScaleFx

$mScale = if(sys.is_primary_monitor, 1, 1.1)
$wScale = if(wnd.name == 'SystemTray_Main' || wnd.is_start, 1.1, 1)


// --- Application Environment Paths -----------------------------------------
$core   = '@app.dir\imports\core\'
$feat   = '@app.dir\imports\features\'
$mods   = '@app.dir\imports\features\modules\'
$items   = '@app.dir\imports\features\modules\items\'
$scrpt  = '@app.dir\imports\features\modules\scripts\'

// Scripts
$nvcnt = path.combine($scrpt, 'nvcnt.ps1')
$short = path.combine($scrpt, 'shortcut.ps1')
$viewps = path.combine($scrpt, 'viewpreset.ps1')

// Data
$views_ini = path.combine($mods, 'views.ini')


// Local Paths ---------------------------------------------------------------
$portable   = 'C:\Program Portable\'
$scoop      = path.combine($portable, 'scoop\apps')
$dir_7zip   = path.combine($scoop, '7zip-dark\current')

// Executables
$cmd_7zipC    = path.combine($dir_7zip, '7z.exe')
$cmd_7zipG    = path.combine($dir_7zip, '7zG.exe')
$cmd_7zipA    = path.combine($dir_7zip, '7zFM.exe')
$cmd_aren     = path.combine(sys.prog, 'Advanced Renamer', 'ARen.exe')
$cmd_npp      = path.combine(sys.prog, 'Notepad++', 'notepad++.exe')
$cmd_nvcpl    = path.combine($portable, 'NVIDIA ControlPanel', 'nvcplui.exe')
$cmd_pwsh     = path.combine(sys.prog, 'PowerShell', '7', 'pwsh.exe')
$cmd_vscodium = path.combine(sys.prog, 'VSCodium', 'VSCodium.exe')

// Everything - first existing install, '' if none
$ev_64_alpha    = path.combine(sys.prog, 'Everything 1.5a', 'Everything.exe')
$ev_64          = path.combine(sys.prog, 'Everything', 'Everything.exe')
$ev_32          = path.combine(sys.prog32, 'Everything', 'Everything.exe')
$cmd_everything = if(path.exists($ev_64_alpha), $ev_64_alpha, if(path.exists($ev_64), $ev_64, if(path.exists($ev_32), $ev_32, '')))


// --- Registry Keys ---------------------------------------------------------
$reg_explorer = 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\'
$reg_advanced = $reg_explorer + 'Advanced'
$reg_opstatus = $reg_explorer + 'OperationStatusManager'

// --- Keys ------------------------------------------------------------------
$mkeyANY    = key.shift() || key.control()
$mkeyANYM1  = ($mkeyANY || key.lbutton())
$mkeyANYM2  = ($mkeyANY || key.rbutton())
$mkeySC     = key.shift() && key.control()


// --- Tooltip ---------------------------------------------------------------
$tipANYM2 = "(SHIFT/CTRL/RIGHT-CLICK)"
$tipADMIN = ["Administrator + " + $tipANYM2, tip.warning, 1.0]


// --- Misc ------------------------------------------------------------------
$dt = sys.datetime("ymd_HM")
