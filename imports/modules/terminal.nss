  // Terminal
  $tip_run_admin=["Administrator (+SHIFT or RMB)", 1.0]
  $has_admin=key.shift() or key.rbutton()

  item( admin=has_admin tip=tip_run_admin 
    image='cmd.exe'
    title='Terminal (cmd)'
    where=package.exists("WindowsTerminal")
    cmd="wt.exe"
    args=`-p "cmd" -d "@sel.path\."`)

  item( admin=has_admin tip=tip_run_admin 
    image=@sys.prog + '\PowerShell\7\pwsh.exe'
    title='Terminal (pwsh)'
    where=package.exists("WindowsTerminal")
    cmd="wt.exe"
    args=`-p "PowerShell" -d "@sel.path\."`)