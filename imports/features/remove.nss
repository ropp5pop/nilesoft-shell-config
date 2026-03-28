remove(find="Foobar|OneDrive|Powershell")
remove(find="new|copy|cut|delete|paste|undo")
remove(find="Always keep on this device|Free up space|Manage access|View online|Version history|Different User|Sync or Backup|Add to Favorites") 

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
    id.customize_this_folder,
		id.open,
		id.play,
		id.edit
	)
)