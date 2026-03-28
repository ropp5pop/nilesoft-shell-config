// Globals
// Scaling
$dpi = reg.get('HKCU\Control Panel\Desktop','LogPixels')
$displayScale = if(dpi==0,96,dpi)/96

$textScale = reg.get('HKCU\Software\Microsoft\Accessibility','TextScaleFactor')
$textScaleFix = if(textScale==0,100,textScale)
$textScaleFactor = $textScaleFix/100

$finalScale = $displayScale * $textScaleFactor

// Paths
$core = 'imports\core\'
$feat = 'imports\features\'
$mods = '@app.dir\imports\features\modules\'
$nvcnt = $mods + 'scripts\nvcnt.ps1'

// Keys
$mkeyANY = keys.shift() or keys.control()
$mkeyANYRMB = ($mkeyANY || key.rbutton())
$mkeySC = key.shift() and key.control()
$mkeyNONE = key == key(key.shift, key.control, key.lbutton)

// Tooltip
$tipANYRMB = "(SHIFT/CTRL/RIGHT-CLICK)"
$tipADMIN = ["Administrator + " + tipANYRMB, tip.warning, 1.0]

// Tooltip
$dt = sys.datetime("ymd_HM")

// Colors
$Red        = #BB2233
$LightBlue  = #22A7F2
$Green      = #338822