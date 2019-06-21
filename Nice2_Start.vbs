dim ws
set ws = createobject("wscript.shell")

Function ReadFileToString(readfilepath)
    Set fs = CreateObject("Scripting.FileSystemObject") 
    Set file = fs.OpenTextFile(readfilepath, 1, false) 
    ReadFileToString = file.readall 
    file.close 
    set fs = nothing 
end Function
function Eval2(vbsFile)
    Execute ReadFileToString(vbsFile)
end function
Eval2 ".\Payloads\InitialMessage\InitialMessage.vbs"