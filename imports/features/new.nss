// --- Open Path -------------------------------------------------------------

import $items + 'openpath.nss'

// --- Modules ----------------------------------------------
import $mods + 'devutil.nss'
sep()

import $mods + 'viewpreset.nss'


// --- New 'Edit with' items -------------------------------------------------
item(title='Edit with VSCodium' type='file' vis=$mkeyANYM1
	where=sel.file.ext != '.lnk' && path.exists($cmd_vscodium)
	image pos=1 sep=before
	cmd=$cmd_vscodium
	args='"@sel.path"')

item(title='Edit with Notepad++' type='file' vis=$mkeyANYM1
	where=sel.file.ext != '.lnk' && path.exists($cmd_npp)
	image pos=2 sep=after
	cmd=$cmd_npp
	args='"@sel.path"')


// --- Menus -----------------------------------------------------------------
menu(mode="multiple" title="Pin/Unpin" image=icon.pin vis=$mkeySC)
{
}

menu(mode="multiple" menu="view" expanded=1)
{
	sep()
	import $mods + 'advprefs.nss'
}


// --- New menu - Manage -----------------------------------------------------
menu(title='Manage' type='file|dir|drive|namespace|back' mode="multiple" 
	where=sel.count>0
	image=\uE253 sep=none)
{
	// import $mods + 'path.nss'
	import $mods + 'terminal.nss'
	sep()
	item(type='file|dir|back.dir|drive' title='Take Ownership' image=[\uE194, #bb2233] admin vis=$mkeyANY
		cmd args='/K takeown /f "@sel.path" @if(sel.type==1,null,"/r /d y") && icacls "@sel.path" /grant *S-1-5-32-544:F @if(sel.type==1,"/c /l","/t /c /l /q")')
	
	item(where=!wnd.is_desktop title=title.folder_options image=icon.folder_options cmd=command.folder_options pos=bottom)
}


// --- New menu - Tools ------------------------------------------------------
menu(title='Tools' type='file|dir|drive|namespace|back' mode="multiple"
	where=sel.count>0
	image=[\uE0F6, #ffbb22] sep=none vis=$mkeySC)
{
	import $mods + 'rename.nss'
	
	// New module - Everything
	import $mods + 'everything.nss'
}

menu(mode="multiple" title=title.more_options image=icon.more_options sep=above)
{
}




// --- New menu - New --------------------------------------------------------
menu(mode="single" type='back' title='New'  image=[\uE17A, #4cc2ff] sep=after vis=!$mkeyANYM1)
{
	item(title='Folder (ymd_HM)'  cmd=io.dir.create('@(dt)')  image=icon.new_folder)
	sep()
	item(title='.txt'		cmd=io.file.create('@(dt).txt')   image=icon.new_file)
	item(title='.xml'		cmd=io.file.create('@(dt).xml')		image=icon.new_file)
	item(title='.json'	cmd=io.file.create('@(dt).json')	image=icon.new_file)
	sep()
	import $mods + 'shortcut.nss'
}


// --- New module - 7-Zip ----------------------------------------------------
import $mods + '7zip.nss'


// --- New menu - Display ----------------------------------------------------
menu(mode="single" type='desktop' title='Display' pos="9" image=[\uE203, #338822] sep=before)
{
	import $mods + 'nvcpl.nss'
}


// --- New item - Restart Explorer -------------------------------------------
item(title="Restart Explorer" cmd=command.restart_explorer vis=$mkeySC pos=bottom sep=before image=[\uE29A, #bb2233])

item(title=str.res('ieframe.dll', -17985) where=wnd.is_titlebar type='*' 
	tip=str.res('ieframe.dll', -9531)
	pos=indexof(str.replace(title.close, '&', '')) image=\uE1B1
	cmd=key.send(key.F11))

menu(title=title.windows where=wnd.is_titlebar type='*' pos=indexof(str.replace(title.close, '&', '')) sep='both' image=\uE1FB)
{
	item(title=title.cascade_windows cmd=command.cascade_windows)
	item(title=title.Show_windows_stacked cmd=command.Show_windows_stacked)
	item(title=title.Show_windows_side_by_side cmd=command.Show_windows_side_by_side)
	sep
	item(title=title.minimize_all_windows keys='Win+M' cmd=command.minimize_all_windows)
	item(title=title.restore_all_windows keys='Win+Shift+M' cmd=command.restore_all_windows)
}