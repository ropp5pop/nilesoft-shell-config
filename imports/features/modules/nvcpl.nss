item(
  where=package.exists("NVIDIACorp.NVIDIAControlPanel")
  title=@(mkeyANYM2 ? 'NVCPL - Stop Service' : 'NVIDIA Control Panel')
  image=@(mkeyANYM2 ? [\UE29A, Red] : icon.nvidia)
  tip=["Stop NVIDIA Container Service " +tipANYM2, tip.warning, 1.0]
  cmd='powershell.exe' 
  args='-ExecutionPolicy Bypass -WindowStyle Hidden -File "' + $nvcnt + '" @(mkeyANYM2 ? "Stop" : "Start")'
  pos=bottom
)