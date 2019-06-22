CreateObject("WScript.Shell").currentdirectory = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path
do
randomize
a = int(rnd * 15 + 1)
if a = 8 or a = 13 or a = 10 or a = 3 or a = 5 then
CreateObject("WScript.Shell").Run "wscript WahooDialog.vbs"
end if
wscript.sleep 1000
loop