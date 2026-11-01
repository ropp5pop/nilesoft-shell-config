// Explorer view presets - columns/widths are defined in views.ini
// Add a preset: new [Section] in views.ini + an item here with the same -Preset name
$vp_args = '-NoProfile -STA -ExecutionPolicy Bypass -WindowStyle Hidden -File "' + $viewps + '" -Ini "' + $views_ini + '"'

menu(title='View preset' type='back.dir' where=!wnd.is_desktop image=icon.details pos=top sep=after)
{
	item(title='Main'  window=hidden cmd='powershell.exe' args=vp_args + ' -Hwnd ' + wnd.handle + ' -Preset Main')
	item(title='Audio' window=hidden cmd='powershell.exe' args=vp_args + ' -Hwnd ' + wnd.handle + ' -Preset Audio')
}
