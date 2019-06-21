wscript.sleep 3000

ws.Run "wscript .\Payloads\TTS\Payloader.vbs", 0

Set s = CreateObject("sapi.spvoice") 
i=0 
do 
s.speak "a micro soft partner"
i=i+1
wscript.sleep 321
loop