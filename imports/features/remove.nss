remove(find="OneDrive|Powershell")
remove(find="new|copy|cut|delete|paste|undo|redo")
remove(find="Always keep*|Free up space|View online|Version history|Different User|Sync or Backup|Favorites") 

remove(mode=mode.multiple
  where=this.id(
    id.create_shortcut,
    id.customize_this_folder,
    id.edit,
    id.give_access_to,
    id.include_in_library,
    id.move_to_folder,
    id.open,
    id.play,
    id.print,
    id.redo,
    id.refresh,
    id.rename,
    id.restore,
    id.restore_previous_versions,
    id.set_as_desktop_background,
    id.share,
    id.troubleshoot_compatibility
  )
)