#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=D:\ca\players\110.ico
#EndRegion ;**** ���������� ACNWrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Dim $used[56]
Dim $i=0
Dim $a=1
Dim $b=false
$ini = FileOpen("config.ini",0) 


If $ini = -1 Then
	MsgBox(16, "����", '���������ļ�' & @ScriptDir & '\"config.ini"�Ƿ����!') ;@ScriptDirΪ�ű�����Ŀ¼
	Exit
EndIf

$min= IniRead("config.ini", "��ֵ", "min", "")
$max= IniRead("config.ini", "��ֵ", "max", "")

$form				= Guicreate("��ǩ", 800, 600, -1, -1)

$Button1		= GuiCtrlCreateButton("��", 330, 420, 140, 80)

$Label1			= GuiCtrlCreateLabel("00",330, 110, 360, 230)
GUICtrlSetFont ($Label1, 96 )

$Label2			= GuiCtrlCreateLabel("2012-2���߶�һ��", 620, 530,120, 20)

GuiSetState(@SW_SHOW)

While $a=1
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
	$Label1	= GuiCtrlCreateLabel($result, 330, 110, 360, 230)
	GUICtrlSetFont ($Label1, 96 )
	$b=false
   EndIf
	sleep(100)
	$Msg = GUIGetMsg()
	Switch $Msg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
		    _start()
	EndSwitch
Wend

While $a=2
	$Msg = GUIGetMsg()
	Switch $Msg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
		    _start()
	EndSwitch
WEnd

Func _start()
	$b=False
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
	$Label1	= GuiCtrlCreateLabel($result, 330, 110, 360, 230)
	GUICtrlSetFont ($Label1, 96 )
	GUICtrlSetData($Button1,"�ٳ�")
	$a=2

	;GUISetState(@SW_LOCK)    
EndIf
EndFunc



