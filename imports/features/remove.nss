
remove(find="Notepad++|Foobar|VLC")
remove(find="new|copy|cut|delete|paste|undo")
remove(find="Always keep on this device|Free up space|Manage access|View online|Version history|Different User") 
remove(type="file" find="Add to Favorites") 
remove(find='OneDrive|Sync or Backup')
remove(mode=mode.multiple
	where=this.id(
		id.create_shortcut,
		id.print,
		id.restore_previous_versions,
		id.restore,
		id.set_as_desktop_background,
		id.share,
		id.refresh,
    id.rename,
		id.move_to_folder,
    id.include_in_library,
    id.give_access_to,
    id.customize_this_folder
	)
)

remove(where=this.id==id.open image=image.default)
remove(where=this.id==id.play image=image.default)
remove(where=this.id==id.Edit image=image.default)
remove(clsid='{9F156763-7844-4DC4-B2B1-901F640F5155}|{02DB545A-3E20-46DE-83A5-1329B1E88B6B}') // Open in Windows Terminal; Open in Terminal
remove(find="Powershell")