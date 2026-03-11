item(
  title=@($mkeyANY ? 'NVCPL - Stop Service' : 'NVIDIA Control Panel')
	image=@($mkeyANY ? [\UE29A, Red] : icon.nvidia)
	tip=["Stop NVIDIA Container Service (+SHIFT, CTRL or RMB)", 1.0]
	cmd='powershell.exe' 
	args='-ExecutionPolicy Bypass -WindowStyle Hidden -File "' + $nvcnt + '" @($mkeyANY ? "Stop" : "Start")'
	pos=bottom
)