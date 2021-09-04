set ws = CreateObject("wscript.shell")
ws.currentdirectory = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path

ws.RegWrite "HKCU\Control Panel\Desktop\Wallpaper", ws.currentdirectory+"/wp.png"
ws.Run "%windir%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters", 1, True
