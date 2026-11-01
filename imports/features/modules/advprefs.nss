// Toggle Hidden files
item(title='Show' image=@icon.show
	keys='Protected System Files'
	where=reg.get(reg_advanced, 'ShowSuperHidden')!=1
	cmd=command.togglehidden)

item(title='Hide' image=@icon.hide
	keys='Protected System Files'
	where=reg.get(reg_advanced, 'ShowSuperHidden')==1
	cmd=command.togglehidden)