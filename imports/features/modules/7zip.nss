// Supported formats: Packing / unpacking:
$ext7zP = '7z|xz|bz2|gz|tar|zip|wim|br|brotli|tbr|liz|tliz|lz4|tlz4|lz5|tlz5|zst|zstd|tzst|tzstd'

// Supported formats: Unpacking only:

  $ext7za = 'dmg|iso|udf|vdi|vhd|vhdx|vmdk|qcow2|' // Disk Images and Virtualization

  $ext7zb = 'ar|arj|cpio|lha|lzh|lz|tlz|lzma|rar|xar|z|' // Compressed Archives

  $ext7zc = 'cab|msi|nsis|rpm|' // Software Installers and Packages

  $ext7zd = 'apfs|cramfs|ext|fat|gpt|hfs|mbr|ntfs|squashfs|'  // File Systems and Partition Tables

  $ext7ze = 'chm|ihex|uefi|'  // System Firmware and Help Documentation

  $ext7zf = 'docx|xlsx|pptx|odt|ods|odp|odg|odf|ott|ots|otp|'  // Office Open XML and OpenDocument formats

  // Misc
  $ext7zg = 'pkg'

$ext7zU = $ext7za + $ext7zb + $ext7zc + $ext7zd + $ext7ze + $ext7zf + $ext7zg

// Supported extension: ppmd:
$se7zM = 'txt|log|cfg|c|cpp|java|py|html|xml|ini|conf|yaml|json|bat|sh|ps1|csv|doc'

// Main
menu(title='7-Zip ZS' mode='multiple' type='file|dir|drive|back' image=\uE223 where=path.exists($cmd_7zipG))
{
	$is_se7z1 = if(keys.shift(), '', str.replace('."'+ext7zP+'|'+ext7zU+'"', '|', '"|."'))
	$is_se7z3 = str.replace('."'+se7zM+'"', '|', '"|."')
	$sel_air = str.replace('"-air!@sel(false, '" "-air!')#', '" "-air#', '" -an')

	// Extract
	menu(title='Extract...' type='file' find=is_se7z1 image=$svg_minus expanded=1)
	{
		separator
		item(title='Extract Here' image=inherit cmd=cmd_7zipG args='x @sel_air -spe')
		item(title='Extract'+if(sel.count==1, ' to "@sel.title\"', ' each to separate folder') image=inherit
			cmd=cmd_7zipG args='x @sel_air -o*\ -spe')
	}

	// Archive
	menu(title='Archive...' type='file|dir|drive|back' image=$svg_plus expanded=1)
	{
		$tip_shift_zip=["+[SHIFT] for .zip", 1.0]
		separator
		item(title='Add to...' keys='with manager' image=inherit
			cmd=cmd_7zipG args='a "@sel.title" -ad -sae -- @sel(true)')

		item(title='Add to "@(sel.title).7z"' keys='SHIFT to .zip' image=inherit
			cmd=cmd_7zipG args='a "@(sel.title)@if(!keys.shift(), '.7z" -t7z', '.zip" -tzip') -sae -- @sel(true)')
	}

	// Archive -> mkeyANY
	menu(title='Archive...' where=$mkeyANY image=inherit expanded=1)
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
