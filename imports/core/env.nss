// Globals
// Scaling
$dpi = reg.get('HKCU\Control Panel\Desktop','LogPixels')
$dScale = if(dpi==0,96,dpi)/96

$tScale = reg.get('HKCU\Software\Microsoft\Accessibility','TextScaleFactor')
$tScaleFx = if(tScale==0,100,tScale)/100

$fScale = $dScale * $tScaleFx

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
$mkeyNONE   =! ($mkeyANY || key.lbutton())

// Tooltip
$tipANYM2 = "(SHIFT/CTRL/RIGHT-CLICK)"
$tipADMIN = ["Administrator + " + tipANYM2, tip.warning, 1.0]

// Misc
$dt = sys.datetime("ymd_HM")

// Colors
$Red        = #BB2233
$LightBlue  = #22A7F2
$Green      = #338822