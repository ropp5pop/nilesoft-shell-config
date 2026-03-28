item(
  where=package.exists("NVIDIACorp.NVIDIAControlPanel")
  title=@($mkeyANYRMB ? 'NVCPL - Stop Service' : 'NVIDIA Control Panel')
  image=@($mkeyANYRMB ? [\UE29A, Red] : icon.nvidia)
  tip=["Stop NVIDIA Container Service " +tipANYRMB, tip.warning, 1.0]
  cmd='powershell.exe' 
  args='-ExecutionPolicy Bypass -WindowStyle Hidden -File "' + $nvcnt + '" @($mkeyANYRMB ? "Stop" : "Start")'
  pos=bottom
)