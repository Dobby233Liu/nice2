function Fakenon32()
    randomize
    a = int(rnd * 32 + 1)
    if a=24 or a=31 or a=17 then
        msgbox wscript.scriptfullname+" 应用程序无法在 Win32 模式中运行。",0+16,wscript.scriptfullname
    else
        msgbox wscript.scriptfullname+" 不是有效的 Win32 程序。",0+16,wscript.scriptfullname
    end if
end function

randomize
a = int(rnd * 57 + 1)

if a=33 or a=55 or a=57 or a=12 or a=35 or a=20 then
Eval2 ".\Payloads\Base64ToImage\Base64ToImage.vbs"
lol=1
set ie = CreateObject("InternetExplorer.Application")
ie.navigate CreateObject("Scripting.FileSystemObject").GetFile(wscript.ScriptFullName).ParentFolder.Path+"\chara.jpg"
ie.menubar=0
ie.addressbar=0
ie.toolbar=0
ie.statusbar=0
ie.visible=1
ie.width=79
ie.height=138
msgbox "i will be your utmost... - your honey chara",,"From somewhere"
else
Fakenon32
end if

Eval2 ".\Payloads\TTS\TTS.vbs"
