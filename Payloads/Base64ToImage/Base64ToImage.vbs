dim imgstr
imgstr = ReadFileToString(".\Payloads\Base64ToImage\chara.jpg.b64")

Eval2 ".\Payloads\Base64ToImage\lib.vbs"

Base64ToImage imgstr, "chara.jpg"
