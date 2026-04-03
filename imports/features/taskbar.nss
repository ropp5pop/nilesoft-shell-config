menu(type="taskbar" vis=(mkeyANY || key.lbutton()) pos=0 title=app.name image=\uE249)
{
	item(title="manager" image=\uE0F3 admin cmd='"@app.exe"')
	item(title="directory" image=\uE0E8 cmd='"@app.dir"')
	item(title="version\t"+@app.ver vis=label col=1)
	item(title="docs" image=\uE1C4 cmd='https://nilesoft.org/docs')
}
menu(where=@(this.count == 0) type="taskbar" image=icon.settings expanded=true)
{
	menu(title='Windows' image=\uE1FB vis=mkeyNONE)
	{
		item(title='cascade_windows' cmd=command.cascade_windows)
		item(title='Show_windows_stacked' cmd=command.Show_windows_stacked)
		item(title='Show_windows_side_by_side' cmd=command.Show_windows_side_by_side)
		sep
		item(title='minimize_all_windows' cmd=command.minimize_all_windows)
		item(title='restore_all_windows' cmd=command.restore_all_windows)
	}
	item(title=title.desktop image=icon.desktop cmd=command.toggle_desktop vis=mkeyNONE)
	item(title='Task Manager' sep=both image=icon.task_manager cmd='taskmgr.exe')
	item(title='Taskbar Settings' image=inherit cmd='ms-settings:taskbar')
	item(title="Restart Explorer" cmd=command.restart_explorer vis=mkeySC pos=bottom sep=before image=[\UE29A, Red])
}