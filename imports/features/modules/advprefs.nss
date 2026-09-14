// Toggle Hidden files
item(title='Show' image=@icon.show
		keys='⁝⁝⁝ Protected System Files ☐'
    where=reg.get(reg_advanced, 'ShowSuperHidden')!=1
    cmd=[reg.set(reg_advanced, 'ShowSuperHidden', 1, reg.dword), command.refresh]
    window=hidden)

item(title='Hide' image=@icon.hide
		keys='⁝⁝⁝ Protected System Files ☑'
    where=reg.get(reg_advanced, 'ShowSuperHidden')==1
    cmd=[reg.set(reg_advanced, 'ShowSuperHidden', 0, reg.dword), command.refresh]
    window=hidden)