# **[Nilesoft Shell Config](https://github.com/ropp5pop/nilesoft-shell-config) - CheatSheet**

#### `CheatSheet` | [Design-System](design-system.md) | [Emoji-reference](emojis.md)

---

Some help for further development.

## Snippets

- **If this or this:**
  [env.nss](../imports/core/env.nss#L12) _(Line: 12)_
  - `$wScale = if(wnd.name == 'SystemTray_Main' || wnd.is_start, 1.1, 1)`
    <br>

- **2x if-statements:**
  [theme.nss](../imports/core/theme.nss#L33) _(Line: 33)_
  - `border.color  = if(key.alt(), #bb2233, if($mkeyANYM1, #ffbb22, #404558))`
    <br>

- **Wrap in double-quotes at runtime to support spaces in filenames etc.:**
  [new.nss](../imports/features/new.nss#L6) _(Line: 6)_
  - `args='"' + @sel.file.name + '"'`
    <br>

### Code Format/Style Conventions

- **Property**
  - First line: identity/control props like `title`, `mode`, `where`, `type`, `vis`
  - Next lines: visual/layout props like `image`, `sep`, `pos`
  - Last lines: action props like `admin`, `cmd`, `args`
  - Split long `where` or `args` onto its own line
  - Be consistent per file, not necessarily dogmatic repo-wide
    <br>

- **One property per line for multi-line items:**

  ```ini
  item(
    title='Edit with VSCodium'
    type='file'
    image
    where=path.exists($cmd_vscodium)
    vis=$mkeyANY
    cmd=$cmd_vscodium
    args='"' + @sel.file.name + '"'
  )
  ```