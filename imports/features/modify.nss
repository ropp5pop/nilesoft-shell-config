modify(mode=mode.multiple vis=$mkeyANY
  where=this.id(
    id.cast_to_device,
    id.set_as_desktop_background,
    id.rotate_left,
    id.rotate_right,
    id.map_network_drive,
    id.disconnect_network_drive,
    id.format,
    id.eject,
    id.give_access_to,
    id.include_in_library
  )
  pos=1 menu=title.more_options)

// Menu - View
modify(find="View" vis=$mkeyANYM1 && !$mkeySC sep=before)
modify(find="Group by|Sort by" vis=$mkeyANYM1 menu="view" sep=before)

// Menu - Pin/Unpin
modify(find="pin*" menu="Pin/Unpin" pos="top")
modify(find="unpin*" menu="Pin/Unpin" pos="bottom")

// Menu - Manage
modify(where=this.name=='scan with microsoft defender' menu='Manage' sep=both)
modify(find='Send To|Locksmith' menu='Manage')

// Menu - Display
modify(find='Personalize' menu="Display" sep=after)
modify(where=this.name=='display settings' menu="Display")

// Run as Admin
modify(find='Run as Administrator' where=!str.contains('.exe|.lnk|.bat|.msi|.ps1', @sel.file.ext) vis=Hidden)