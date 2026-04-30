// Legacy Explorer features - available with ExplorerPatcher
// Win+X
remove(find='Desktop|File Explorer|Search|Power Options|Installed Apps|"Terminal"|"Network Connections"' type='start')

modify(find='Settings' type='start' pos=0)
menu(mode="multiple" title='Settings' image=icon.more_options type='start' expanded=1 pos=1 )
{
	item(title='Control Panel' type='start' image=\uE0BE cmd='control' sep=before)
	item(title='Classic Power Options' type='start' image=\uE14D cmd='control' args='powercfg.cpl')
}

modify(find='Device Manager' type='start' sep=both pos=2)

// Tools Menu
menu(mode="multiple" title='Tools' image=icon.more_options type='start' pos=2 sep=both)
{
	item(title='Network Adapters' type='start' image=\uE0BE cmd='shell:::{7007acc7-3202-11d1-aad2-00805fc1270e}' sep=before)    
}
modify(find='System' type='start' image=icon.pc menu='Tools' pos=0)
modify(find='Computer Management|Event Viewer|Disk Management' type='start' menu='Tools')
modify(find='Terminal (Admin)' type='start' pos=4 image=icon.command_prompt menu='Tools' pos=5)
modify(find='properties' type='start' title='ExplorerPatcher' menu='Tools' sep=both pos=bottom)

modify(find='Run' type='start' image=\UE123 pos=5)

modify(find='Shut Down' type='start' image=\uE12F pos=bottom)

// Win 7 - Navigation Bar
remove(type='*' where=wnd.name=='CabinetWClass' and wnd.parent.name=='msctls_progress32' find='Edit address|Delete history|*text')

modify(find='Top' where=wnd.name=='CabinetWClass' and wnd.parent.name=='msctls_progress32' type='*' image=\UE123)
modify(type='*' where=wnd.name=='CabinetWClass' where=this.name=='Copy address' title='Copy' image=$svg_sq24)

// Win 7 - Scroll Bar
remove(type='*'where=wnd.parent.name=='DirectUIHWND' find='Page|Scroll|Edge')

modify(type='*' where=wnd.parent.name=='DirectUIHWND' && this.title=='Top'
	image=$svg_triple_up)

modify(type='*' where=wnd.parent.name=='DirectUIHWND' && this.title=='Bottom'
	image=$svg_triple_down)