function Fakenon32()
randomize
a = int(rnd * 32 + 1)

if a = 32 then
msgbox wscript.scriptfullname+" ������Ч�� Win32 ����",0+16,wscript.scriptfullname
else if a = 24 or a = 31 or a = 17 then
msgbox wscript.scriptfullname+" Ӧ�ó����޷��� Win32 ģʽ�����С�",0+16,wscript.scriptfullname
else
msgbox wscript.scriptfullname+" ������Ч�� Win32 ����",0+16,wscript.scriptfullname
end if
end if
end function

randomize
a = int(rnd * 57 + 1)

if a = 33 or a=55 or a=57 or a=12 or a=35 or a=20 then
Eval2 ".\Payloads\Base64ToImage\Base64ToImage.vbs"
set ie = CreateObject("InternetExplorer.Application")
ie.navigate createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path+"\chara.jpg"
ie.menubar=0
ie.addressbar=0
ie.toolbar=0
ie.statusbar=0
ie.visible=1
msgbox "i will be your utmost... - your honey chara",,"From somewhere"
else
Fakenon32
end if

Eval2 ".\Payloads\TTS\TTS.vbs"