Function ReadFileToString(readfilepath)
    Set fs2 = CreateObject("Scripting.FileSystemObject") 
    Set file = fs2.OpenTextFile(readfilepath, 1, false) 
    ReadFileToString = file.readall 
    file.close 
    set fs2 = nothing 
end Function

function Eval2(vbsFile)
    Execute ReadFileToString(vbsFile)
end function

randomize
a = int(rnd * 57 + 1)

Eval2 ".\Payloads\Base64ToImage\Base64ToImage.vbs"
set ie = CreateObject("InternetExplorer.Application")
ie.navigate "C:\Users\Administrator\Desktop\nice2\chara.jpg"
ie.menubar=0
ie.addressbar=0
ie.toolbar=0
ie.statusbar=0
ie.visible=1
ie.width=79
ie.height=138
msgbox "i will be your utmost... - your honey chara",,"From somewhere"