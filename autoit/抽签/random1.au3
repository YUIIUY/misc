#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=D:\ca\players\110.ico
#EndRegion ;**** ���������� ACNWrapper_GUI ****
Dim $used[56]
Dim $i=0
Dim $b=false
$ini = FileOpen("config.ini",0) 


If $ini = -1 Then
	MsgBox(16, "����", '���������ļ�' & @ScriptDir & '\"config.ini"�Ƿ����!') ;@ScriptDirΪ�ű�����Ŀ¼
	Exit
EndIf

$min= IniRead("config.ini", "��ֵ", "min", "")
$max= IniRead("config.ini", "��ֵ", "max", "")
$result=Random($min,$max,1)

While $b=false
	for $i =1 to 55
	$used[$i]=IniRead("config.ini","�ѳ�",$i,"")
	If $used[$i] = $result Then
		$b=False
		$result=Random($min,$max,1)
		$i=0
	Else
		$b=True
    EndIf
	Next
WEnd
 
If $b=true Then			 
	IniWrite("config.ini","�ѳ�",$result,$result)
	MsgBox(64,"Result",$result)
EndIf