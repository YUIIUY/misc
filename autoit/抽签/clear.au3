#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=D:\ca\players\s.ico
#EndRegion ;**** ���������� ACNWrapper_GUI ****
FileCopy("./config.ini","./config.bak",1)
for $i = 1 to 55
IniWrite("config.ini","�ѳ�",$i,"")
Next
MsgBox(64,"clear","�����á�")