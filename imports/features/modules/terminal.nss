// Terminal
item( admin=$mkeyANYM2 tip=$tipADMIN
	image='cmd.exe'
	title='Terminal (cmd)'
	where=package.exists("WindowsTerminal")
	cmd="wt.exe"
	args=`-p "cmd" -d "@sel.path\."`)

item( admin=$mkeyANYM2 tip=$tipADMIN
	image=@sys.prog + '\PowerShell\7\pwsh.exe'
	title='Terminal (pwsh)'
	where=package.exists("WindowsTerminal")
	cmd="wt.exe"
	args=`-p "PowerShell" -d "@sel.path\."`)
