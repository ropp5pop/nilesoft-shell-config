// Create Shortcut - Uses shortcut.ps1
item(
	title = 'New shortcut' type = 'back'
	image = icon.create_shortcut
	cmd = 'powershell.exe'
	args = '-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File "' + $short + '" -Directory "@sel.dir"'
)