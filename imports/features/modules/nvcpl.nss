item(
  title='NVIDIA Control Panel'
  image=icon.nvidia
  where=path.exists($cmd_nvcpl)
  vis=!$mkeyANYM2
  cmd='powershell.exe'
  args='-ExecutionPolicy Bypass -WindowStyle Hidden -File "' + $nvcnt + '" Start'
  pos=bottom
)

item(
  title='NVCPL - Stop Service'
  image=[\UE29A, #bb2233]
  where=path.exists($cmd_nvcpl)
  vis=$mkeyANYM2
  tip=["Stop NVIDIA Container Service " + $tipANYM2, tip.warning, 1.0]
  cmd='powershell.exe'
  args='-ExecutionPolicy Bypass -WindowStyle Hidden -File "' + $nvcnt + '" Stop'
  pos=bottom
)
