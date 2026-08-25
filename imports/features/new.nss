// Open Path
item(title='Open Path' type='dir|back'
	image pos=top
	cmd='explorer.exe'
	args='/select, @sel')

// New module - DEV Helpers
import mods + 'devutil.nss'
sep
// New 'Edit with' items
item(title='Edit with VSCodium' type='file' vis=$mkeyANYM1 
	image pos=1
	cmd=$cmd_vscodium
	args='"' + @sel.file.name + '"' where=sel.file.ext != '.lnk')

item(title='Edit with Notepad++' type='file' vis=$mkeyANYM1
	image pos=2 sep=bottom
	cmd=$cmd_npp
	args='"' + @sel.file.name + '"' where=sel.file.ext != '.lnk')

// Menus
menu(mode="multiple" title="Pin/Unpin" image=icon.pin vis=$mkeySC)
{
}

// New menu - Manage
menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" title='Manage' image=\uE253 sep=none)
{
	import mods + 'path.nss'
	import mods + 'terminal.nss'
	sep
	item(type='file|dir|back.dir|drive' title='Take Ownership' image=[\uE194,#f00] admin vis=$mkeyANY
		cmd args='/K takeown /f "@sel.path" @if(sel.type==1,null,"/r /d y") && icacls "@sel.path" /grant *S-1-5-32-544:F @if(sel.type==1,"/c /l","/t /c /l /q")')
	
	item(where=!wnd.is_desktop title=title.folder_options image=icon.folder_options cmd=command.folder_options pos=bottom)
}

// New menu - Tools
menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" title='Tools' image=[\uE0F6, #FCD116] sep=none vis=$mkeySC)
{
	import mods + 'rename.nss'
}

menu(mode="multiple" title=title.more_options image=icon.more_options sep=above)
{
}

// New menu - New
menu(mode="single" type='back' title='New'  image=[\uE17A, #4cc2ff] sep=after vis=!$mkeyANYM1)
{
	item(title='Folder (ymd_HM)'  cmd=io.dir.create('@(dt)')  image=icon.new_folder)
	sep
	item(title='.txt'		cmd=io.file.create('@(dt).txt')   image=icon.new_file)
	item(title='.xml'		cmd=io.file.create('@(dt).xml')		image=icon.new_file)
	item(title='.json'	cmd=io.file.create('@(dt).json')	image=icon.new_file)
	sep
	import mods + 'shortcut.nss'
}

// New module - 7-Zip
import mods + '7zip.nss'

// New menu - Display
menu(mode="single" type='desktop' title='Display' pos="9" image=[\uE203, #338822] sep=before)
{
	import mods + 'nvcpl.nss'
}



// New item - Restart Explorer
item(title="Restart Explorer" cmd=command.restart_explorer vis=$mkeySC pos=bottom sep=before image=[\UE29A, #bb2233])