modify(mode=mode.multiple
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
    id.include_in_library,
    id.troubleshoot_compatibility
  )
  pos=1 menu=title.more_options)

// Menu - View
modify(find="View" vis=mkeyANY)
modify(find="Paint" vis=mkeyANY sep=none)
modify(find="Group by|Sort by" vis=key.control() or key.shift() menu="view" sep=before)

// Menu - Pin/Unpin
modify(find="pin*"   menu="Pin/Unpin" pos="top")
modify(find="unpin*" menu="Pin/Unpin" pos="bottom")

// Menu - Manage
modify(where=this.name=='scan with microsoft defender' menu='Manage' sep=both)
modify(find='Send To|Locksmith' menu='Manage')
modify(find="Terminal Preview" title='Terminal' menu='Manage' vis=mkeyANY sep=none)

// Menu - Display
modify(find='Personalize' menu="Display" sep=after)
modify(where=this.name=='display settings' menu="Display")

modify(find='run as' where=sel.file.ext != '.exe' vis=remove)