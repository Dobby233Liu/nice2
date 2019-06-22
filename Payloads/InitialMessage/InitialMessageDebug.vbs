randomize
a = int(rnd * 57 + 1)

Eval2 ".\Payloads\Base64ToImage\Base64ToImage.vbs"
set ie = CreateObject("InternetExplorer.Application")
ie.navigate createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path+"\chara.jpg"
ie.menubar=0
ie.addressbar=0
ie.toolbar=0
ie.statusbar=0
ie.visible=1
msgbox "i will be your utmost... - your honey chara",,"From somewhere"