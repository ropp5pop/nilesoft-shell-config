## **Nilesoft Shell Config - CheatSheet**

Some help for further development.

---

### Colors

- **theme**
  - **.background**
    - <span style="background-color: #141a22; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#d0c4bc` .color
    - <span style="background-color: #000000; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#000000` .color `SystemTray_Main`
      <br>
  - **.item**
    - <span style="background-color: #d0c4bc; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#d0c4bc` .text.normal
    - <span style="background-color: #fff0e6; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#fff0e6` .text.select
    - <span style="background-color: #222d3b; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#222d3b` .back.select
    - <span style="background-color: #567397; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#567397` .border.select
      <br>
  - **.border**
    - <span style="background-color: #404558; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#404558` .color
    - <span style="background-color: #bb2233; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#bb2233` .color `key.alt()`
    - <span style="background-color: #ffbb22; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#ffbb22` .color `$mkeyANYM1`
      <br>

- **Icons etc.**
  - <span style="background-color: #fff0e6; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#fff0e6` White
  - <span style="background-color: #bb2233; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#bb2233` Red
  - <span style="background-color: #ffbb22; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#ffbb22` Orange
  - <span style="background-color: #4cc2ff; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#4cc2ff` LightBlue
  - <span style="background-color: #338822; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#338822` Green

---

### Snippets

- **env.nss**
  If this or this:
  - `$wScale = if(wnd.name == 'SystemTray_Main' || wnd.is_start, 1.1, 1)`
    <br>
- **theme.nss**
  2x if-statements:
  - `border.color  = if(key.alt(), #bb2233, if($mkeyANYM1, #ffbb22, #404558))`

---

### SVG

**Squares using path:**

<svg fill="none" width="24" height="24" viewBox="0 0 24 24">
	<path fill="#ff0000" d="M0 0h24v24H0" />
	<path fill="#00ff00" d="M2 2h20v20H2z" />
	<path fill="#0000ff" d="M4 4h16v16H4z" />
	<path fill="#ffff00" d="M6 6h12v12H6z" />
	<path fill="#ff00ff" d="M8 8h8v8H8z" />
	<path fill="#00ffff" d="M10 10h4v4H10z" />
</svg>

```svg
@svg_sq='<svg fill="none" viewBox="0 0 24 24">
	<path fill="#ff0000" d="M0 0h24v24H0" />
	<path fill="#00ff00" d="M2 2h20v20H2z" />
	<path fill="#0000ff" d="M4 4h16v16H4z" />
	<path fill="#ffff00" d="M6 6h12v12H6z" />
	<path fill="#ff00ff" d="M8 8h8v8H8z" />
	<path fill="#00ffff" d="M10 10h4v4H10z" />
</svg>'
```

<br>

**Squares using path:**

<svg fill="none" width="24" height="24" viewBox="0 0 24 24">
    <rect fill ="#ff0000" x="0" y="0" width="24" height="24"/>
    <rect fill ="#00ff00" x="2" y="2" width="20" height="20"/>
    <rect fill ="#0000ff" x="4" y="4" width="16" height="16"/>
    <rect fill ="#ffff00" x="6" y="6" width="12" height="12"/>
    <rect fill ="#ff00ff" x="8" y="8" width="8" height="8"/>
    <rect fill ="#00ffff" x="10" y="10" width="4" height="4"/>
</svg>

```svg
@svg_sqB24='<svg fill="none" viewBox="0 0 24 24">
    <rect fill ="#ff0000" x="0" y="0" width="24" height="24"/>
    <rect fill ="#00ff00" x="2" y="2" width="20" height="20"/>
    <rect fill ="#0000ff" x="4" y="4" width="16" height="16"/>
    <rect fill ="#ffff00" x="6" y="6" width="12" height="12"/>
    <rect fill ="#ff00ff" x="8" y="8" width="8" height="8"/>
    <rect fill ="#00ffff" x="10" y="10" width="4" height="4"/>
</svg>'
```
