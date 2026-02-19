  // path
  menu(mode='single' title=title.copy_path image=icon.copy_path pos=top sep=after vis=mkeyANY)
  {
    item(title='Open Path' image cmd='explorer.exe' args='/select, @sel')
    separator()
    item(image=inherit cmd=command.copy(this.title) title=sel.path)
    item(cmd=command.copy(this.title) type='file|dir|back.dir' title=@sel.file.name)
  } 