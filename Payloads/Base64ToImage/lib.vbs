function Base64ToImage(fstr,otpfile)
set fso = createobject("Scripting.FileSystemObject")
if fso.fileexists(otpfile) then fso.deletefile(otpfile)
Set Dom=CreateObject("Microsoft.XMLDOM")
Set Tmp=Dom.createElement("span")
Tmp.DataType="bin.base64"
Tmp.Text=fstr
Bin=Tmp.NodeTypedValue
ParentFolderName=fso.GetParentFolderName(otpfile)
dFile=fso.BuildPath(ParentFolderName,otpfile)
Set Dst=CreateObject("ADODB.Stream") 
Dst.Open 
Dst.Type=1
Dst.Write Bin 
Dst.SaveToFile dFile,1
Dst.Close
end function
