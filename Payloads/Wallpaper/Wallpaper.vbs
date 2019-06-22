set ws = CreateObject("wscript.shell")
ws.currentdirectory = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path
ws.Run "wallpaperchanger wp.png 1", 0