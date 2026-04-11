# **[Nilesoft Shell Config](https://github.com/ropp5pop/nilesoft-shell-config)**

![Screenshot 01](https://i.imgur.com/Z8Q5lQN.png)
___
### Structure
- imports/core → environment, icons, theme
- imports/features → actual menu features
- imports/features/modules → imported directly into features

### Install
1. Copy files into your Nilesoft Shell config folder
2. Replace your existing shell.nss
3. Restart Explorer / `CTRL`+`Right-Click`

### Notes

- Tested on Canary - **https://nilesoft.org/download/shell/shell-canary.zip**
- This config is what I personally use, there are some items you probably want to edit or delete.

***

<details>
<summary><h3>Optimize for better performance (optional)</h3></summary>

I recommend blocking slow-loading entries by their GUID in the registry. 
The `remove` item and `vis=disable` property only hides the entry.

##### GUID Keys Detection
1. Select the desired object(s) you want to analyze
2. Hold `Alt` and `Right-Click`
3. Check `shell.log` for timing results

##### GUID Keys Registry Locations:
- Non-UWP Applications: `HKEY_CLASSES_ROOT\CLSID`
- UWP Applications: `HKEY_CLASSES_ROOT\PackagedCom\ClassIndex`

##### GUID Keys Block:
- Location: `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked`
  (If not already present, create a new key named `Blocked`)

- Add a new `String Value` (REG_SZ) and name it with GUID in brackets.
  *Example: `{8BCF599D-B158-450F-B4C2-430932F2AF2F}`*

- Use the `Data` field to describe what you're blocking in plain text.

**Related information:** [Nilesoft-Shell-Snippets/ext.nilesoft/nss.disabler.tut.md](https://github.com/RubicBG/Nilesoft-Shell-Snippets/blob/main/ext.nilesoft/nss.disabler.tut.md)

</details>

***

### Links
Nilesoft Shell Webpage - **https://nilesoft.org/**

Since I've removed the donation link from the taskbar - **https://nilesoft.org/donate**

Nilesoft Shell Snippets - **https://github.com/RubicBG/Nilesoft-Shell-Snippets**