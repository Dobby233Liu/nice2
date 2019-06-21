Set Player = CreateObject("wmplayer.ocx") 
set ws=createobject("wscript.shell")
ws.Run "taskkill /f /im Earrape_EXTERNAL.exe", 0
ws.Run ".\Payloads\PlayBGM\BGM.exe"
Player.url = ".\Payloads\PlayBGM\kITTYcAT - BNDS.mp3"
do
do until Player.playState = 1 
wscript.sleep 1
loop
Player.controls.play
loop