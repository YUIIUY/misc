Attribute VB_Name = "ģ��1"
Public Function getHoroscope(month As Integer, bornDate As Integer) As String
    If (month = 1) And (bornDate <= 19) Then
        getHoroscope = "Ħ����"
    ElseIf (month = 1) And (bornDate > 19) Then
        getHoroscope = "ˮƿ��"
    ElseIf (month = 2) And (bornDate <= 18) Then
        getHoroscope = "ˮƿ��"
    ElseIf (month = 2) And (bornDate > 18) Then
        getHoroscope = "˫����"
    ElseIf (month = 3) And (bornDate <= 20) Then
        getHoroscope = "˫����"
    ElseIf (month = 3) And (bornDate > 20) Then
        getHoroscope = "������"
    ElseIf (month = 4) And (bornDate <= 19) Then
        getHoroscope = "������"
    ElseIf (month = 4) And (bornDate > 19) Then
        getHoroscope = "��ţ��"
    ElseIf (month = 5) And (bornDate <= 20) Then
        getHoroscope = "��ţ��"
    ElseIf (month = 5) And (bornDate > 20) Then
        getHoroscope = "˫����"
    ElseIf (month = 6) And (bornDate <= 21) Then
        getHoroscope = "˫����"
    ElseIf (month = 6) And (bornDate > 21) Then
        getHoroscope = "��з��"
    ElseIf (month = 7) And (bornDate <= 22) Then
        getHoroscope = "��з��"
    ElseIf (month = 7) And (bornDate > 22) Then
        getHoroscope = "ʨ����"
    ElseIf (month = 8) And (bornDate <= 22) Then
        getHoroscope = "ʨ����"
    ElseIf (month = 8) And (bornDate > 22) Then
        getHoroscope = "��Ů��"
    ElseIf (month = 9) And (bornDate <= 22) Then
        getHoroscope = "��Ů��"
    ElseIf (month = 9) And (bornDate > 22) Then
        getHoroscope = "������"
    ElseIf (month = 10) And (bornDate <= 23) Then
        getHoroscope = "������"
    ElseIf (month = 10) And (bornDate > 23) Then
        getHoroscope = "��Ы��"
    ElseIf (month = 11) And (bornDate <= 22) Then
        getHoroscope = "��Ы��"
    ElseIf (month = 11) And (bornDate > 22) Then
        getHoroscope = "������"
    ElseIf (month = 12) And (bornDate <= 21) Then
        getHoroscope = "������"
    ElseIf (month = 12) And (bornDate > 21) Then
        getHoroscope = "ħ����"
    Else
        getHoroscope = "����������"
    End If
End Function
