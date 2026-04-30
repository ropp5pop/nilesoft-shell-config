# **[Nilesoft Shell Config](https://github.com/ropp5pop/nilesoft-shell-config) - Design System**

#### [CheatSheet](cheatsheet.md) | `Design-System` | [Emoji-reference](emojis.md)

---

Basic UI/UX guidelines.

## Colors

- ### Theme
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

- ### Icons etc.
  - <span style="background-color: #fff0e6; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#fff0e6` White
  - <span style="background-color: #bb2233; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#bb2233` Red
  - <span style="background-color: #ffbb22; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#ffbb22` Orange
  - <span style="background-color: #4cc2ff; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#4cc2ff` LightBlue
  - <span style="background-color: #338822; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;</span> `#338822` Green

---

## Icons

- [Emoji-reference](emojis.md)

SVG content can be trimmed down to essentials in .nss.

- ### Baseline Layout:
  - Units in '**dp**' unless other specified.
  - **Total Area:** `24 x 24`
  - **Live Area:** `20 x 20`
  - **viewBox:** `"0 0 24 24"`

- ### SVG Basic Examples:

  ```svg
      <svg height="128" viewBox="0 0 24 24">
        <path fill="#000000" d="M0 0h24v24H0z" />
        <rect fill="#ff0000" width="75%" height="75%" x="3" y="3" />
        <circle stroke="#ffff00" stroke-width="1" cx="12" cy="12" r="10" fill="#0000ff" />
        <circle cx="50%" cy="50%" r="25%" fill="#ff00ff" />
        <text x="12" y="15" font-size="9" font-weight="800" text-anchor="middle"
          stroke-width="0.25" stroke="#ffffff" fill="#000000"> SVG </text>
      </svg>
  ```

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
