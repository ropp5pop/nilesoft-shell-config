// New 'Edit with' items
item(title='Open Path' image cmd='explorer.exe' pos=top sep=after vis=mkeyANY args='/select, @sel' where=sel.file.ext != '.lnk')

item(title='Edit with VSCodium ' type='file'  vis=mkeyANY image
	cmd='%LocalAppData%' + '\Programs\VSCodium\VSCodium.exe' 
	arg=@sel.file.name pos=1)

item(title='Edit with Notepad++' type='file' vis=mkeyANY image
	cmd=@sys.prog + '\Notepad++\notepad++.exe' 
	arg=@sel.file.name pos=2 sep=bottom)

// Menus
menu(mode="multiple" title="Pin/Unpin" image=icon.pin vis=mkeySC)
{
}

// New menu - Manage
menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" title='Manage' image=\uE253 sep=none)
{
	import mods + 'path.nss'
	import mods + 'terminal.nss'
	separator   
	item(type='file|dir|back.dir|drive' title='Take Ownership' image=[\uE194,#f00] admin vis=mkeyANY
		cmd args='/K takeown /f "@sel.path" @if(sel.type==1,null,"/r /d y") && icacls "@sel.path" /grant *S-1-5-32-544:F @if(sel.type==1,"/c /l","/t /c /l /q")')
	
	item(where=!wnd.is_desktop title=title.folder_options image=icon.folder_options cmd=command.folder_options pos=bottom)    
}

menu(mode="multiple" title=title.more_options image=icon.more_options sep=above)
{
}

import mods + '7zip.nss'

// New menu - New
menu(mode="single" type='back' title='New'  image=[\uE17A, LightBlue] sep=after)
{
	item(title='Folder (ymd_HM)'  cmd=io.dir.create('@(dt)')  image=icon.new_folder)
	separator
	item(title='.txt'		cmd=io.file.create('@(dt).txt')   image=icon.new_file)
	item(title='.xml'		cmd=io.file.create('@(dt).xml')		image=icon.new_file)
	item(title='.json'	cmd=io.file.create('@(dt).json')	image=icon.new_file)
}

// New menu - Display
menu(mode="single" type='desktop' title='Display' pos="9" image=[\uE203, Green] sep=before)
{
	import mods + 'nvcpl.nss'
}
// New item - Restart Explorer
item(title="Restart Explorer" cmd=command.restart_explorer vis=mkeySC pos=bottom sep=before image=[\UE29A, Red])