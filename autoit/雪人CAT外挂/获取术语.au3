#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_icon=..\..\..\autoit3\AU3TOOL.exe|-1
#PRE_UseX64=n
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=c:\users\xulihang\downloads\compressed\fd\forms\form1.kxf
$Form1_1 = GUICreate("��ȡ����-ѩ��CAT���", 587, 435, 195, 146)
$ListView1 = GUICtrlCreateListView("ԭ��|����", 32, 16, 481, 321)
$Button1 = GUICtrlCreateButton("��ȡ������", 40, 368, 105, 41)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

MsgBox(64,"��ʾ","ʹ�øù��߻�ȡ������ȿ���ѩ��CAT��������Ŀ�ʵ���棬��˫����һ�����ʹ�䴦�ڱ༭״̬��")

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Button1
			getTerms()

	EndSwitch
WEnd

Func getTerms()
	Dim $className="[CLASS:SnowmanTranslationFreeEditionMainFrame]"
	If winExists($className,"") Then	
		WinActivate($className,"")
		;Dim $sourceText()
		;Dim $targetText()
		Local $text = WinGetClassList($className, "")

		Local $ubound = StringInStr($text, @LF,0, 15) ; ����������ƥ����ַ���
		Local $lbound = StringInStr($text, @LF,0, 16) ; ����������ƥ����ַ���
		Local $atlName= StringMid($text,$ubound+1,$lbound-$ubound-1)
		MsgBox(0,"",$text)
		msgbox(0,"",$atlName)
        Local $line=""
		Local $i=0
		Local $file = FileOpen("terms.csv", BitOR($FO_OVERWRITE,$FO_ANSI))

		; ���򿪵��ļ��Ƿ��д
		If $file = -1 Then
			MsgBox(4096, "����", "���ܴ��ļ�.")
			Exit
		EndIf		
        While $i=0
			If $line=controlGettext($className,"","[CLASS:" & $atlName & ";INSTANCE:1]") Then
				$i=1
				FileClose($file)
				MsgBox(64,"","terms.csv�ļ��ѱ����ڳ���Ŀ¼��")
			Else
				send("{F2}")
			    $line=controlGettext($className,"","[CLASS:" & $atlName & ";INSTANCE:1]")
				send("{TAB}")
			    send("{TAB}")
				sleep(100)
				
				send("{F2}")
				ConsoleWrite($line)
			    $targetText=controlGettext($className,"","[CLASS:" & $atlName & ";INSTANCE:1]")

				send("{TAB}")
			    send("{TAB}")				

				$item1 = GUICtrlCreateListViewItem($line&"|"&$targetText, $ListView1)
                FileWriteLine($file, $line&"	"&$targetText)
		    EndIf
        WEnd		
	Else
		MsgBox(16,"����","ѩ��CATû������")
	EndIf
EndFunc