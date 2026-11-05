// Helpers for nss
menu(type='*' mode='single' title='DEV Helpers' image=$svg_sq16 vis=$mkeySC)
{
  item(title=wnd.name image=$svg_sq12)
  sep
  menu(type='file|dir|back.dir' mode="single" title='Attributes' image=icon.properties)
  {
    $attr = io.attributes(sel.path)
    item(title='hidden' 	checked=io.attribute.hidden(attr)		window=hidden
      cmd args='/c ATTRIB @if(io.attribute.hidden(attr),"-","+")H "@sel.path"')

    item(title='system' 	checked=io.attribute.system(attr) 	window=hidden
      cmd args='/c ATTRIB @if(io.attribute.system(attr),"-","+")S "@sel.path"')

    item(title='readonly'	checked=io.attribute.readonly(attr) window=hidden
      cmd args='/c ATTRIB @if(io.attribute.readonly(attr),"-","+")R "@sel.path"')

    item(title='archive'	checked=io.attribute.archive(attr) 	window=hidden
      cmd args='/c ATTRIB @if(io.attribute.archive(attr),"-","+")A "@sel.path"')
    sep
    item(title='created' 	keys=io.dt.created(sel.path, 'y/m/d')		vis=label)
    item(title='modified' keys=io.dt.modified(sel.path, 'y/m/d') 	vis=label)
    item(title='accessed' keys=io.dt.accessed(sel.path, 'y/m/d') 	vis=label)
  }
}