Set Player = CreateObject("wmplayer.ocx") 
set ws=createobject("wscript.shell")
ws.currentdirectory = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path
ws.Run "taskkill /f /im Earrape_EXTERNAL.exe", 0
Player.url = ".\kITTYcAT - BNDS.mp3"
do
do until Player.playState = 1 
wscript.sleep 1
loop
Player.controls.play
loop