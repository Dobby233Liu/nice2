Function ReadFileToString(readfilepath)
    Set fs2 = CreateObject("Scripting.FileSystemObject") 
    Set file = fs2.OpenTextFile(readfilepath, 1, false) 
    ReadFileToString = file.readall 
    file.close 
    set fs2 = nothing 
end Function

set ws = CreateObject("WScript.Shell")
ws.currentdirectory = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path
dim Enabled
Enabled = ReadFileToString("EnableGillgillLove.boolean")
if Enabled = "false" then
WScript.Quit
end if

ws.sendkeys "{NUMLOCK}"
wscript.sleep 100

do
ws.sendkeys "{NUMLOCK}"
wscript.sleep 100
ws.sendkeys "{NUMLOCK}"
wscript.sleep 100
ws.sendkeys "{CAPSLOCK}"
wscript.sleep 100
ws.sendkeys "{CAPSLOCK}"
wscript.sleep 100
ws.sendkeys "{SCROLLLOCK}"
wscript.sleep 100
ws.sendkeys "{SCROLLLOCK}"
wscript.sleep 100
ws.sendkeys "{NUMLOCK}"
wscript.sleep 100
ws.sendkeys "{CAPSLOCK}"
wscript.sleep 100
ws.sendkeys "{SCROLLLOCK}"
wscript.sleep 100
ws.sendkeys "{NUMLOCK}"
wscript.sleep 30
ws.sendkeys "{CAPSLOCK}"
wscript.sleep 30
ws.sendkeys "{SCROLLLOCK}"
wscript.sleep 30

ws.sendkeys "{SCROLLLOCK}"
wscript.sleep 100
ws.sendkeys "{SCROLLLOCK}"
wscript.sleep 100
ws.sendkeys "{CAPSLOCK}"
wscript.sleep 100
ws.sendkeys "{CAPSLOCK}"
wscript.sleep 100
ws.sendkeys "{NUMLOCK}"
wscript.sleep 100
ws.sendkeys "{NUMLOCK}"
wscript.sleep 100
ws.sendkeys "{SCROLLLOCK}"
wscript.sleep 100
ws.sendkeys "{SCROLLLOCK}"
wscript.sleep 100
ws.sendkeys "{CAPSLOCK}"
wscript.sleep 100
ws.sendkeys "{CAPSLOCK}"
wscript.sleep 100
ws.sendkeys "{NUMLOCK}"
wscript.sleep 100
ws.sendkeys "{NUMLOCK}"
wscript.sleep 100
ws.sendkeys "{NUMLOCK}"
wscript.sleep 30
ws.sendkeys "{CAPSLOCK}"
wscript.sleep 30
ws.sendkeys "{SCROLLLOCK}"
wscript.sleep 30
LOOP