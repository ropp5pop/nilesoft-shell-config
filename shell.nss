settings
{
  priority=1
  exclude.where = !process.is_explorer
  showdelay = 200
  modify.remove.duplicate=1
  tip.enabled=true
}

// --- Globals --- 
import 'imports/core/env.nss'

// --- Core ---
import core + 'theme.nss'
import core + 'images.nss'

// --- Features ---
import feat + 'new.nss'
import feat + 'taskbar.nss'
import feat + 'winx.nss'
import feat + 'modify.nss'
import feat + 'remove.nss'