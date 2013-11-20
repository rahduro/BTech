Option Strict Off
Option Explicit On
Friend Class Form1
	Inherits System.Windows.Forms.Form
	Private Declare Function divide Lib "group.dll" (ByVal X As Integer, ByVal Y As Integer, ByVal z As String, ByVal d As String) As Integer
	
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		Dim stat As Object
		Dim b As Integer
		If Not Text1.Text = "" And Not Text2.Text = "" And Not Text3.Text = "" And Not Text4.Text = "" Then
			b = divide(Val(Text3.Text), Val(Text4.Text), Text1.Text, Text2.Text)
			If b = 1 Then
				'UPGRADE_WARNING: Couldn't resolve default property of object stat. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				stat = MsgBox("Message Division Done", MsgBoxStyle.OKOnly)
			Else
				'UPGRADE_WARNING: Couldn't resolve default property of object stat. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				stat = MsgBox("Input File Doesn't Exist", MsgBoxStyle.OKOnly)
			End If
			'UPGRADE_WARNING: Couldn't resolve default property of object stat. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			If stat = 1 Then
				Call Form1_FormClosed(Me, New System.Windows.Forms.FormClosedEventArgs(1, FormAction.Closed))
			End If
		End If
	End Sub
	
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		CommonDialog1Open.ShowDialog()
		Text1.Text = CommonDialog1Open.FileName
	End Sub
	
	Private Sub Command3_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command3.Click
		Form2.Show()
	End Sub
	
	Private Sub Form1_FormClosed(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
		Me.Close()
		Form3.Show()
	End Sub
End Class