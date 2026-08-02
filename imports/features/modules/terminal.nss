// Terminal
item( admin=$mkeyANYM2 tip=$tipADMIN
	image='cmd.exe'
	title='Terminal (cmd)'
	where=package.exists("WindowsTerminal")
	cmd="wt.exe"
	args=`-p "cmd" -d "@sel.path\."`)

item( admin=$mkeyANYM2 tip=$tipADMIN
	image=$cmd_pwsh
	title='Terminal (pwsh)'
	where=package.exists("WindowsTerminal") && path.exists($cmd_pwsh)
	cmd="wt.exe"
	args=`-p "PowerShell" -d "@sel.path\."`)
