// Hide default "Extract All..."
modify(find='Extract All' vis=hidden)

// Executable Paths
$cmd_7zipG=path.combine(sys.prog,'7-Zip','7zG.exe')

// Supported formats:: Packing / unpacking:
$se7zP = '7z|xz|bz2|gz|tar|zip|wim'

// Supported formats: Unpacking only:
$se7zU = 'apfs|ar|arj|cab|chm|cpio|cramfs|dmg|ext|fat|gpt|hfs|ihex|iso|lzh|lzma|mbr|msi|nsis|ntfs|qcow2|rar|rpm|squashfs|udf|uefi|vdi|vhd|vhdx|vmdk|xar|z'

// Main
menu(title='7-Zip' mode='multiple'  type='file|dir' image=cmd_7zipG)
{
  $is_se7z1=if(keys.shift(), '', str.replace('."'+se7zP+'|'+se7zU+'"', '|', '"|."'))
  $sel_air=str.replace('"-air!@sel(false, '" "-air!')#', '" "-air#', '" -an')
  menu(title='Extract...' type='file' find=is_se7z1 image=svg_7z_extract expanded=1)
  {
    separator
    item(title='Extract Here' image=inherit cmd=cmd_7zipG args='x @sel_air -spe')
    item(title='Extract'+if(sel.count==1, ' to "@sel.title\"', ' each to separate folder') image=inherit
      cmd=cmd_7zipG args='x @sel_air -o*\ -spe') 
  }
  menu(title='Archive...' type='file|dir|back' image=svg_7z_archive expanded=1) 
  {
    $tip_shift_zip=["+[SHIFT] for .zip", 1.0]
    separator
    item(title='Add to...' image=inherit
      cmd=cmd_7zipG args='a @(sel.title) -ad -sae -- @sel(true)')
    item(title='Add to "@(sel.title).7z"@"\t"' tip=tip_shift_zip image=inherit
      cmd=cmd_7zipG args='a @(sel.title)@if(!keys.shift(), '.7z -t7z', '.zip -tzip') -sae -- @sel(true)')
  }
}