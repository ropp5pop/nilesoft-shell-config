item(
  title=@($mkeyANY ? 'NVCPL - Stop Service' : 'NVIDIA Control Panel')
	image=@($mkeyANY ? [\UE29A, Red] : icon.nvidia)
	tip=@($mkeyANY ? "Force STOP NVIDIA Service" : "Open Panel (Auto-starts service if needed)")
	cmd='powershell.exe' 
	args='-ExecutionPolicy Bypass -WindowStyle Hidden -File "' + $nvcnt + '" @($mkeyANY ? "Stop" : "Start")'
)