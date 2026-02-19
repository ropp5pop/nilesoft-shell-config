$dpi = reg.get('HKCU\Control Panel\Desktop','LogPixels')
$displayScale = if(dpi==0,96,dpi)/96

$textScale = reg.get('HKCU\Software\Microsoft\Accessibility','TextScaleFactor')
$textScaleFix = if(textScale==0,100,textScale)
$textScaleFactor = $textScaleFix/100

$finalScale = $displayScale * $textScaleFactor

$mkeyANY  = key.shift() or key.control()
$mkeySC   = key.shift() and key.control()
