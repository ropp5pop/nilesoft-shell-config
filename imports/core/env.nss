// Globals
// Scaling
$dpi = reg.get('HKCU\Control Panel\Desktop','LogPixels')
$dScale = if(dpi==0,96,dpi)/96

$tScale = reg.get('HKCU\Software\Microsoft\Accessibility','TextScaleFactor')
$tScaleFx = if(tScale==0,100,tScale)/100

$fScale = $dScale * $tScaleFx

$mScale = if(sys.is_primary_monitor, 1, 1.1)
$wScale = if(wnd.name == 'SystemTray_Main' || wnd.is_start, 1.1, 1)

// Paths
$core   = '@app.dir\imports\core\'
$feat   = '@app.dir\imports\features\'
$mods   = '@app.dir\imports\features\modules\'
$nvcnt  = $mods + 'scripts\nvcnt.ps1'

// Keys
$mkeyANY    = key.shift() || key.control()
$mkeyANYM1  = ($mkeyANY || key.lbutton())
$mkeyANYM2  = ($mkeyANY || key.rbutton())
$mkeySC     = key.shift() && key.control()

// Tooltip
$tipANYM2 = "(SHIFT/CTRL/RIGHT-CLICK)"
$tipADMIN = ["Administrator + " + tipANYM2, tip.warning, 1.0]

// Misc
$dt = sys.datetime("ymd_HM")

// Colors - TODO: revert to use hex-code for code readability
$Red        = #bb2233
$LightBlue  = #4cc2ff
$Green      = #338822