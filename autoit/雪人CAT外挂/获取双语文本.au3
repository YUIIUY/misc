#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_icon=..\..\..\..\autoit3\AU3TOOL.exe|-1
#PRE_UseX64=n
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=c:\users\xulihang\downloads\compressed\fd\forms\form1.kxf
$Form1_1 = GUICreate("��ȡ˫���ı�-ѩ��CAT���", 587, 435, 195, 146)
$ListView1 = GUICtrlCreateListView("ԭ��|����", 32, 16, 481, 321)
$Button1 = GUICtrlCreateButton("��ȡ������", 40, 368, 105, 41)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

MsgBox(64,"��ʾ","ʹ�øù��߻�ȡƽ���ı������ȿ���ѩ��CAT������༭���棬��������һ�����Ĳ��֣�ʹ�䱣�ּ���״̬��")

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Button1
			getBiText()

	EndSwitch
WEnd

Func getBiText()
	Dim $className="[CLASS:SnowmanTranslationFreeEditionMainFrame]"
	If winExists($className,"") Then	
		WinActivate($className,"")
		;Dim $sourceText()
		;Dim $targetText()
		Local $text = WinGetClassList($className, "")
		Local $ubound,$lbound,$atlName
		Local $j=0
		Local $repeatTimes=0
		While $j<>-1
			$j=$j+1
            $ubound = StringInStr($text, @LF,0, $j+1) 
		    $lbound = StringInStr($text, @LF,0, $j+2) 
			If StringMid($text,$ubound+1,$lbound-$ubound-1)=$atlName Then
				$repeatTimes=$repeatTimes+1
			Else
				$repeatTimes=0
			EndIf
		    $atlName= StringMid($text,$ubound+1,$lbound-$ubound-1)
			ConsoleWrite($atlName)
			If $repeatTimes=2 Then ;�������Ŀؼ��������Σ��Դ�����λ
				$j=-1
			EndIf
		Wend
		;If $atlname="SysHeader32" Then
		;	$ubound = StringInStr($text, @LF,0, 31) ; ����������ƥ����ַ���
		;    $lbound = StringInStr($text, @LF,0, 32) ; ����������ƥ����ַ���
		;    $atlName= StringMid($text,$ubound+1,$lbound-$ubound-1)
		;EndIf
		Local $line=""
		Local $i=0
		Local $file = FileOpen("out.csv", BitOR($FO_OVERWRITE,$FO_UTF8))
        ;MsgBox(0,"",$text)
		; ���򿪵��ļ��Ƿ��д
		If $file = -1 Then
			MsgBox(4096, "����", "���ܴ��ļ�.")
			Exit
		EndIf		
		ConsoleWrite("[CLASS:" & $atlName & ";INSTANCE:1]")
		Local $lines=0
		Local $statusbarText=StatusbarGetText($className,"",2)
		Local $current=StringMid($statusbarText,StringInStr($statusbarText,": ")+1,StringInStr($statusbarText,"/")-StringInStr($statusbarText,": ")-1): 
		Local $recordNum=StringMid($statusbarText,StringInStr($statusbarText,"/")+1) ;ͨ��״̬���ļ�¼�����ж�Ҫ��ȡ��������
		;ConsoleWrite(@CRLF&StringInStr($statusbarText,"/"))
		;ConsoleWrite(@CRLF&StringInStr($statusbarText,": "))		
		$current=Int($current)
		$recordNum=Int($recordNum)
		;MsgBox(64,"",$current&@CRLF&$recordNum)
        While $current<=$recordNum
            $current=$current+1
			$line=controlGettext($className,"","[CLASS:" & $atlName & ";INSTANCE:1]")
			$targetText=controlGettext($className,"","[CLASS:" & $atlName & ";INSTANCE:2]")
			If StringStripWS(StringStripCR($targetText),$STR_STRIPALL)="" Then
				$targetText="δ����"
			EndIf
			$item1 = GUICtrlCreateListViewItem($line&"|"&$targetText, $ListView1)
            FileWriteLine($file, $line&"	"&$targetText)
			;ConsoleWrite($targetText&@LF)
			sleep(100)
			send("{ENTER}")
			ConsoleWrite($i)
        WEnd
		FileClose($file)
		MsgBox(64,"","out.csv�ļ��ѱ����ڳ���Ŀ¼��")		
	Else
		MsgBox(16,"����","ѩ��CATû������")
	EndIf
EndFunc