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
