// Win+X - not available on default Windows 11. Works with ExplorerPatcher
menu(mode="multiple" title='Tools' image=icon.more_options type='start' sep=above)
{
}
remove(find='Desktop|File Explorer|Search' type='start')

modify(find='Computer Management|Event Viewer|Disk Management|Network Connections|Power Options' type='start' menu='Tools')
modify(find='Device Manager' type='start' sep=both)
modify(find='Settings' type='start' pos=top)
modify(find='Terminal' type='start' image=icon.command_prompt)
modify(find='Run' type='start' image=\UE123)
modify(find='properties' type='start' title='ExplorerPatcher' menu='Tools' sep=both)