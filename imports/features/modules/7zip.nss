// Hide default "Extract All..."
modify(find='Extract All' vis=hidden)

// Executable Paths
$cmd_7zipC = path.combine(sys.prog,'7-Zip','7z.exe')
$cmd_7zipG = path.combine(sys.prog,'7-Zip','7zG.exe')
$cmd_7zipA = path.combine(sys.prog,'7-Zip','7zFM.exe')

// Supported formats:: Packing / unpacking:
$se7zP = '7z|xz|bz2|gz|tar|zip|wim'

// Supported formats: Unpacking only:
$se7zU = 'apfs|ar|arj|cab|chm|cpio|cramfs|dmg|ext|fat|gpt|hfs|ihex|iso|lzh|lzma|mbr|msi|nsis|ntfs|qcow2|rar|rpm|squashfs|udf|uefi|vdi|vhd|vhdx|vmdk|xar|z' + '|docx|xlsx|pptx|odt|ods|odp|odg|odf|ott|ots|otp' // Office Open XML and OpenDocument formats

// Supported extension: ppmd:
$se7zM = 'txt|log|cfg|c|cpp|java|py|html|xml|ini|conf|yaml|json|bat|sh|ps1|csv|doc'

// Main
menu(title='7-Zip' mode='multiple' type='file|dir|drive|back' image=cmd_7zipA) 
{
	$is_se7z1 = if(keys.shift(), '', str.replace('."'+se7zP+'|'+se7zU+'"', '|', '"|."'))
	$is_se7z3 = str.replace('."'+se7zM+'"', '|', '"|."')
	$sel_air = str.replace('"-air!@sel(false, '" "-air!')#', '" "-air#', '" -an')
	
	// Extract
	menu(title='Extract...' type='file' find=is_se7z1 image=icon.svg_7z_extract expanded=1)
	{
		separator
		item(title='Extract Here' image=inherit cmd=cmd_7zipG args='x @sel_air -spe')
		item(title='Extract'+if(sel.count==1, ' to "@sel.title\"', ' each to separate folder') image=inherit
			cmd=cmd_7zipG args='x @sel_air -o*\ -spe') 
	}
	
	// Archive
	menu(title='Archive...' type='file|dir|drive|back' image=icon.svg_7z_archive expanded=1) 
	{
		$tip_shift_zip=["+[SHIFT] for .zip", 1.0]
		separator
		item(title='Add to...' keys='with manager' image=inherit
			cmd=cmd_7zipG args='a "@sel.title" -ad -sae -- @sel(true)')
		
		item(title='Add to "@(sel.title).7z"' keys='SHIFT to .zip' image=inherit
			cmd=cmd_7zipG args='a "@(sel.title)@if(!keys.shift(), '.7z" -t7z', '.zip" -tzip') -sae -- @sel(true)')
	}
	
	// Archive -> mkeyANY	
	menu(title='Archive...' where=mkeyANY image=inherit expanded=1) 
	{
		separator
		item(title='Add to "@(sel.title).7z" with password' keys='Shift in secret' image=inherit
			tip='in secret: Encrypts file headers, hiding file names, sizes, and metadata.'
			cmd=if(input('NileSoft Shell', 'Enter password for archive') and len(input.result)>0, cmd_7zipG)
			args='a "@(sel.title).7z" -t7z -p@input.result @if(keys.shift(), '-mhe') -sae -- @sel(true)')
		
		item(title='Add to "@(sel.title).zip" with password' image=inherit
			cmd=if(input('NileSoft Shell', 'Enter password for archive') and len(input.result)>0, cmd_7zipG)
			args='a "@(sel.title).zip" -tzip -p@input.result -sae -- @sel(true)')
		
		item(title='Add to "@(sel.title).ppmd.7z" ' keys='SHIFT to .zip' find=is_se7z3
			tip='PPMd compression effective for compressing text files with repetitive patterns and structured content' image=inherit
			cmd=cmd_7zipG args='a @(sel.title).ppmd@if(!keys.shift(), '.7z -t7z', '.zip -tzip') -m0=PPMd -sae -- @sel(true)')    
	}
}