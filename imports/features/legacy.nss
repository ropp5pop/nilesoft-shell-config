// Legacy Explorer features - available with ExplorerPatcher
// Win+X
remove(find='Desktop|File Explorer|Search|Power Options|Installed Apps|Terminal' type='start')
remove(find='Network Connections' type='start')
remove(find='*Manage*|Settings|System|Event Viewer|Shut down|Run' where=wnd.name=='LauncherTipWnd' type='start')

menu(mode="multiple" title='startmenu' image=icon.more_options type='start' expanded=1 pos=0)
{
  item(title='Settings' type='start' image=icon.settings cmd='ms-settings:')
  item(title='Control Panel' type='start' image=\uE0BE cmd='control')
  item(title='Device Manager' type='start' image=icon.device_manager cmd='devmgmt.msc')

  // Tools Menu
  menu(mode="multiple" title='Tools' image=icon.more_options type='start' pos=3 expanded=$mkeyANYM1 sep=both)
  {
    menu(mode="multiple" title='sys_manage' type='start' expanded=1 pos=3)
    {

      item(title='System' type='start' image=icon.pc cmd='ms-settings:about')
      item(title='Classic Power Options' type='start' image=\uE14D cmd='control' args='powercfg.cpl' )
      item(title='Network Adapters' type='start' image=\uE0BE cmd='shell:::{7007acc7-3202-11d1-aad2-00805fc1270e}' sep=after)
    }

    menu(mode="multiple" title='sys_admin' type='start' expanded=1 pos=4)
    {
      item(title='Computer Management' type='start' image=icon.pc cmd='compmgmt.msc' sep=before)
      item(title='Event Viewer' type='start' image=icon.view2 cmd='eventvwr.msc')
      item(title='Disk Management' type='start' image=icon.disk_management cmd='diskmgmt.msc' sep=after)
    }

    menu(mode="multiple" title='sys_util' type='start' expanded=1 pos=4)
    {
      item(title='Terminal (Admin)' type='start' image=icon.command_prompt admin=true cmd='wt.exe' sep=before)
      item(title='ExplorerPatcher' type='start' image=icon.properties cmd='rundll32.exe' args='C:\Windows\dxgi.dll,ZZGUI' sep=after)
    }

  }

  item(title='Run' type='start' image=\UE123 cmd='explorer.exe' args='shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}')

  menu(mode="multiple" title='Shut down...' type='start' pos=bottom)
  {
    item(title='Restart → Advanced Startup' type='start' image=icon.refresh admin=true cmd='shutdown.exe' args='/r /o /t 0')

  }

}


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
