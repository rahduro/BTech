Option Strict Off
Option Explicit On
Friend Class Form4
	Inherits System.Windows.Forms.Form
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		If Not Text1.Text = "" And Not Text2.Text = "" And Not Text3.Text = "" And Text1.Text = Text2.Text Then
			Form5.Show()
			Me.Hide()
		End If
	End Sub
	
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		CommonDialog1Save.ShowDialog()
		Text3.Text = CommonDialog1Save.FileName
	End Sub
	
	Private Sub Form4_FormClosed(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
		Me.Close()
		Form3.Show()
	End Sub
End Class