settings
{
	priority=1
	exclude.where = !process.is_explorer
	showdelay = 200
	modify.remove.duplicate=1
	tip.enabled=true
}

$core='imports\core\'
$feat='imports\features\'

import core + 'env.nss'
import core + 'theme.nss'
import core + 'images.nss'

import feat + 'new.nss'
import feat + 'remove.nss'
import feat + 'modify.nss'
import feat + 'taskbar.nss'
