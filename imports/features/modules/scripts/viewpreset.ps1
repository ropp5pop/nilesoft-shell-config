# Apply a view preset (Details view + columns/widths) from views.ini to an Explorer window

param(
    [long]$Hwnd = 0,    # 0 = use the foreground window
    [Parameter(Mandatory)][string]$Preset,
    [string]$Ini = (Join-Path $PSScriptRoot '..\views.ini')
)

Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public static class ViewPreset
{
    [StructLayout(LayoutKind.Sequential)]
    public struct PROPERTYKEY { public Guid fmtid; public uint pid; }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct CM_COLUMNINFO
    {
        public uint cbSize, dwMask, dwState, uWidth, uDefaultWidth, uIdealWidth;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 80)] public string wszName;
    }

    [ComImport, Guid("6D5140C1-7436-11CE-8034-00AA006009FA"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    interface IServiceProvider
    {
        void QueryService(ref Guid sid, ref Guid iid, [MarshalAs(UnmanagedType.IUnknown)] out object ppv);
    }

    // Only GetWindow and QueryActiveShellView are called; the rest hold vtable slots
    [ComImport, Guid("000214E2-0000-0000-C000-000000000046"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    interface IShellBrowser
    {
        void GetWindow(out IntPtr hwnd);
        void ContextSensitiveHelp(); void InsertMenusSB(); void SetMenuSB(); void RemoveMenusSB();
        void SetStatusTextSB(); void EnableModelessSB(); void TranslateAcceleratorSB(); void BrowseObject();
        void GetViewStateStream(); void GetControlWindow(); void SendControlMsg();
        void QueryActiveShellView([MarshalAs(UnmanagedType.IUnknown)] out object view);
    }

    [ComImport, Guid("CDE725B0-CCC9-4519-917E-325D72FAB4CE"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    interface IFolderView
    {
        void GetCurrentViewMode(out uint mode);
        void SetCurrentViewMode(uint mode);
    }

    [ComImport, Guid("D8EC27BB-3F3B-4042-B10A-4ACFD924D453"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    interface IColumnManager
    {
        void SetColumnInfo(ref PROPERTYKEY key, ref CM_COLUMNINFO info);
        void GetColumnInfo(ref PROPERTYKEY key, ref CM_COLUMNINFO info);
        void GetColumnCount(uint flags, out uint count);
        void GetColumns(uint flags, [Out, MarshalAs(UnmanagedType.LPArray)] PROPERTYKEY[] keys, uint count);
        void SetColumns([In, MarshalAs(UnmanagedType.LPArray)] PROPERTYKEY[] keys, uint count);
    }

    [DllImport("propsys.dll", CharSet = CharSet.Unicode)]
    static extern int PSGetPropertyKeyFromName(string name, out PROPERTYKEY key);

    [DllImport("user32.dll")] static extern bool IsChild(IntPtr parent, IntPtr child);
    [DllImport("user32.dll")] static extern IntPtr GetAncestor(IntPtr hwnd, uint flags);
    [DllImport("user32.dll")] static extern IntPtr GetForegroundWindow();

    const uint GA_ROOT = 2, FVM_DETAILS = 4, CM_MASK_ALL = 0x1F, CM_MASK_WIDTH = 0x1;
    static Guid SID_STopLevelBrowser = new Guid("4C96BE40-915C-11CF-99D3-00AA004AE837");

    static IShellBrowser Browser(object window)
    {
        Guid sid = SID_STopLevelBrowser, iid = typeof(IShellBrowser).GUID;
        object o;
        ((IServiceProvider)window).QueryService(ref sid, ref iid, out o);
        return (IShellBrowser)o;
    }

    // 2 = tab/window contains target, 1 = same top-level window only, 0 = unrelated
    public static int Match(object window, long target)
    {
        try
        {
            IntPtr host, t = target == 0 ? GetForegroundWindow() : new IntPtr(target);
            Browser(window).GetWindow(out host);
            if (host == t || IsChild(host, t)) return 2;
            return GetAncestor(host, GA_ROOT) == GetAncestor(t, GA_ROOT) ? 1 : 0;
        }
        catch { return 0; }
    }

    public static void Apply(object window, string[] names, uint[] widths)
    {
        var keys = new PROPERTYKEY[names.Length];
        for (int i = 0; i < names.Length; i++)
            if (PSGetPropertyKeyFromName(names[i], out keys[i]) != 0)
                throw new ArgumentException("Unknown property: " + names[i]);

        object view;
        Browser(window).QueryActiveShellView(out view);
        ((IFolderView)view).SetCurrentViewMode(FVM_DETAILS);

        var cm = (IColumnManager)view;
        cm.SetColumns(keys, (uint)keys.Length);
        for (int i = 0; i < keys.Length; i++)
        {
            if (widths[i] == 0) continue;
            var info = new CM_COLUMNINFO { cbSize = (uint)Marshal.SizeOf(typeof(CM_COLUMNINFO)), dwMask = CM_MASK_ALL };
            cm.GetColumnInfo(ref keys[i], ref info);
            info.dwMask = CM_MASK_WIDTH;
            info.uWidth = widths[i];
            cm.SetColumnInfo(ref keys[i], ref info);
        }
    }
}
'@

function Show-Error([string]$Message) {
    (New-Object -ComObject WScript.Shell).Popup($Message, 0, 'View preset', 16) | Out-Null
    exit 1
}

# --- Read preset from ini -----------------------------------------------------
if (-not (Test-Path $Ini)) { Show-Error "views.ini not found:`n$Ini" }

$section = $null
$columns = $null
foreach ($line in Get-Content $Ini) {
    $line = $line.Trim()
    if ($line -match '^\[(.+)\]$') { $section = $Matches[1]; continue }
    if ($section -eq $Preset -and $line -match '^columns\s*=\s*(.+)$') { $columns = $Matches[1] }
}
if (-not $columns) { Show-Error "Preset [$Preset] has no 'columns' in views.ini" }

# "System.Size:90" -> name + width (width optional, 0 = leave as is)
$names  = @()
$widths = @()
foreach ($col in $columns -split ',') {
    $name, $width = $col.Trim() -split ':'
    $names  += $name.Trim()
    $widths += [uint32]$(if ($width) { $width.Trim() } else { 0 })
}

# --- Find the Explorer tab that owns the menu ---------------------------------
$windows = @((New-Object -ComObject Shell.Application).Windows())
$best = $null
$bestScore = 0
foreach ($w in $windows) {
    $score = [ViewPreset]::Match($w, $Hwnd)
    if ($score -gt $bestScore) { $best = $w; $bestScore = $score }
    if ($score -eq 2) { break }
}
if (-not $best) { Show-Error "No Explorer window found for handle $Hwnd" }

try { [ViewPreset]::Apply($best, [string[]]$names, [uint32[]]$widths) }
catch {
    $e = $_.Exception
    while ($e.InnerException) { $e = $e.InnerException }
    Show-Error $e.Message
}
