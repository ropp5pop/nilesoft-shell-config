// Helpers for nss
menu(type='*' mode='single' title='DEV Helpers' image=svg_sq14 pos=bottom sep=after vis=$mkeySC)
{
  item(title=wnd.name image=svg_sq)
  sep
  menu(type='file|dir|back.dir' mode="single" title='Attributes' image=icon.properties)
  {
    $atrr = io.attributes(sel.path)
    item(title='hidden' 	checked=io.attribute.hidden(atrr)		window=hidden
      cmd args='/c ATTRIB @if(io.attribute.hidden(atrr),"-","+")H "@sel.path"')
    
    item(title='system' 	checked=io.attribute.system(atrr) 	window=hidden
      cmd args='/c ATTRIB @if(io.attribute.system(atrr),"-","+")S "@sel.path"')
    
    item(title='readonly'	checked=io.attribute.readonly(atrr) window=hidden
      cmd args='/c ATTRIB @if(io.attribute.readonly(atrr),"-","+")R "@sel.path"')
    
    item(title='archive'	checked=io.attribute.archive(atrr) 	window=hidden
      cmd args='/c ATTRIB @if(io.attribute.archive(atrr),"-","+")A "@sel.path"')
    sep
    item(title='created' 	keys=io.dt.created(sel.path, 'y/m/d')		cmd=io.dt.created(sel.path,2000,1,1) 	vis=label)
    item(title='modified' keys=io.dt.modified(sel.path, 'y/m/d') 	cmd=io.dt.modified(sel.path,2000,1,1) vis=label)
    item(title='accessed' keys=io.dt.accessed(sel.path, 'y/m/d') 	cmd=io.dt.accessed(sel.path,2000,1,1) vis=label)
  }
}