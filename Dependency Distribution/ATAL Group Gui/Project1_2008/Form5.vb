Option Strict Off
Option Explicit On
Friend Class Form5
	Inherits System.Windows.Forms.Form
	Private Declare Function conq Lib "group.dll" (ByVal X As Integer, ByVal Y As Integer, ByVal z As String, ByVal d As String, ByVal j As String) As Integer
	Dim n As Short
	Dim q As Short
	Dim m As Short
	Dim small As String
	Dim op As String
	Dim save As String
	
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		Dim Index As Short = Command1.GetIndex(eventSender)
		CommonDialog1Open.ShowDialog()
		Text1(Index).Text = CommonDialog1Open.FileName
	End Sub
	
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		Dim w As Object
		Dim i As Object
		
		For i = 0 To 5
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			'UPGRADE_WARNING: Couldn't resolve default property of object w. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			w = q * 6 + i
			Frame1(w).Visible = False
			Text1(w).Visible = False
			Text2(w).Visible = False
			Command1(w).Visible = False
		Next i
		
		If n > 6 Then
			Command2.Visible = True
		Else
			Command2.Visible = False
			command3.Visible = True
		End If
		
		q = q + 1
		
		If (n > 6) Then
			m = 6
		Else
			m = n
		End If
		
		n = n - m
		Call Display(m, q)
		
	End Sub
	
	Private Sub Command3_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command3.Click
		Dim don As Object
		Dim r As Object
		Dim i As Object
		Dim a As String
		Dim b As String
		
		
		For i = 0 To Val(op) - 1
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			If Not i = 0 Then
				a = a & "?" & Text2(i).Text
				b = b & "?" & Text1(i).Text
			Else
				a = Text2(i).Text
				b = Text1(i).Text
			End If
		Next i
		
		a = a & "?"
		b = b & "?"
		
		'UPGRADE_WARNING: Couldn't resolve default property of object r. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		r = conq(Val(small), Val(op), a, b, save)
		'UPGRADE_WARNING: Couldn't resolve default property of object r. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		If r = 1 Then
			'UPGRADE_WARNING: Couldn't resolve default property of object don. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			don = MsgBox("Message Decryption Done", MsgBoxStyle.OKOnly)
			'UPGRADE_WARNING: Couldn't resolve default property of object don. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			If don = 1 Then
				Me.Close()
				Form4.Close()
			End If
		End If
	End Sub
	
	Private Sub Form5_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		small = Form4.Text1.Text
		op = Form4.Text2.Text
		save = Form4.Text3.Text
		
		n = CShort(op)
		
		If n > 6 Then
			Command2.Visible = True
		Else
			Command2.Visible = False
			command3.Visible = True
		End If
		
		If (n > 6) Then
			m = 6
		Else
			m = n
		End If
		
		n = n - m
		q = 0
		Call Display(m, q)
		
		
	End Sub
	Public Sub Display(ByVal X As Short, ByVal Y As Short)
		Dim i As Object
		
		If Y > 0 Then
			
			Frame1.Load(Y * 6)
			Text1.Load(Y * 6)
			Text2.Load(Y * 6)
			Command1.Load(Y * 6)
			
			Text1(Y * 6).Parent = Frame1(Y * 6)
			Text2(Y * 6).Parent = Frame1(Y * 6)
			Command1(Y * 6).Parent = Frame1(Y * 6)
			
			Frame1(Y * 6).Visible = True
			Text1(Y * 6).Visible = True
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Text1(Y * 6 + i).Text = ""
			Text2(Y * 6).Visible = True
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Text2(Y * 6 + i).Text = ""
			Command1(Y * 6).Visible = True
			
			Frame1(Y * 6).Text = CStr(Y * 6 + 1)
			
			Frame1(Y * 6).Top = VB6.TwipsToPixelsY(720)
			Frame1(Y * 6).Left = VB6.TwipsToPixelsX(240)
			
		End If
		
		For i = 1 To X - 1
			
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Frame1.Load(Y * 6 + i)
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Text1.Load(Y * 6 + i)
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Text2.Load(Y * 6 + i)
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Command1.Load(Y * 6 + i)
			
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Text1(Y * 6 + i).Parent = Frame1(Y * 6 + i)
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Text2(Y * 6 + i).Parent = Frame1(Y * 6 + i)
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Command1(Y * 6 + i).Parent = Frame1(Y * 6 + i)
			
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Frame1(Y * 6 + i).Visible = True
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Text1(Y * 6 + i).Visible = True
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Text1(Y * 6 + i).Text = ""
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Text2(Y * 6 + i).Visible = True
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Text2(Y * 6 + i).Text = ""
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Command1(Y * 6 + i).Visible = True
			
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Frame1(Y * 6 + i).Text = Y * 6 + i + 1
			
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Frame1(Y * 6 + i).Top = VB6.TwipsToPixelsY(VB6.PixelsToTwipsY(Frame1(Y * 6 + i - 1).Top) + 1100)
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Frame1(Y * 6 + i).Left = VB6.TwipsToPixelsX(240)
		Next i
	End Sub
	
	Private Sub Form5_FormClosed(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
		Me.Close()
		Form4.Show()
	End Sub
End Class