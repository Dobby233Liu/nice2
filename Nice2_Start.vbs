dim ws
set ws = createobject("wscript.shell")
ws.currentdirectory = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path

Function ReadFileToString(readfilepath)
    Set fs2 = CreateObject("Scripting.FileSystemObject") 
    Set file = fs2.OpenTextFile(readfilepath, 1, false) 
    ReadFileToString = file.readall 
    file.close 
    set fs2 = nothing 
end Function
function Eval2(vbsFile)
    Execute ReadFileToString(vbsFile)
end function

Eval2 ".\Payloads\InitialMessage\InitialMessage.vbs"

