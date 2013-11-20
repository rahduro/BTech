VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form5 
   Caption         =   "Form5"
   ClientHeight    =   8115
   ClientLeft      =   7380
   ClientTop       =   2025
   ClientWidth     =   6420
   LinkTopic       =   "Form5"
   ScaleHeight     =   8115
   ScaleWidth      =   6420
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   5640
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton command3 
      Caption         =   "Decrypt"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   7
      Top             =   7440
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Next >>"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4920
      TabIndex        =   6
      Top             =   7560
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "1"
      Height          =   975
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   720
      Width           =   5895
      Begin VB.TextBox Text1 
         Height          =   375
         Index           =   0
         Left            =   1320
         TabIndex        =   3
         Top             =   360
         Width           =   3495
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Browse"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   4920
         TabIndex        =   2
         Top             =   360
         Width           =   855
      End
      Begin VB.TextBox Text2 
         Height          =   405
         Index           =   0
         Left            =   240
         TabIndex        =   1
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Path of the respective File"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1560
      TabIndex        =   5
      Top             =   240
      Width           =   3375
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Serial No"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   480
      TabIndex        =   4
      Top             =   240
      Width           =   975
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function conq Lib "group.dll" (ByVal X As Long, ByVal Y As Long, ByVal z As String, ByVal d As String, ByVal j As String) As Long
Dim n As Integer
Dim q As Integer
Dim m As Integer
Dim small As String
Dim op As String
Dim save As String

Private Sub Command1_Click(Index As Integer)
CommonDialog1.ShowOpen
Text1(Index).Text = CommonDialog1.FileName
End Sub

Private Sub Command2_Click()

For i = 0 To 5
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

Private Sub Command3_Click()
Dim a As String
Dim b As String


For i = 0 To Val(op) - 1
    If Not i = 0 Then
        a = a + "?" + Text2(i).Text
        b = b + "?" + Text1(i).Text
    Else
         a = Text2(i).Text
         b = Text1(i).Text
    End If
Next i

a = a + "?"
b = b + "?"

r = conq(Val(small), Val(op), a, b, save)
If r = 1 Then
don = MsgBox("Message Decryption Done", vbOKOnly)
If don = 1 Then
Unload Me
Unload Form4
End If
End If
End Sub

Private Sub Form_Load()
small = Form4.Text1.Text
op = Form4.Text2.Text
save = Form4.Text3.Text

n = op

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
Public Sub Display(ByVal X As Integer, ByVal Y As Integer)

    If Y > 0 Then
    
        Load Frame1(Y * 6)
        Load Text1(Y * 6)
        Load Text2(Y * 6)
        Load Command1(Y * 6)
    
        Set Text1(Y * 6).Container = Frame1(Y * 6)
        Set Text2(Y * 6).Container = Frame1(Y * 6)
        Set Command1(Y * 6).Container = Frame1(Y * 6)
        
        Frame1(Y * 6).Visible = True
        Text1(Y * 6).Visible = True
        Text1(Y * 6 + i).Text = ""
        Text2(Y * 6).Visible = True
        Text2(Y * 6 + i).Text = ""
        Command1(Y * 6).Visible = True
        
        Frame1(Y * 6).Caption = Y * 6 + 1
        
        Frame1(Y * 6).Top = 720
        Frame1(Y * 6).Left = 240
    
    End If
    
    For i = 1 To X - 1
        
        Load Frame1(Y * 6 + i)
        Load Text1(Y * 6 + i)
        Load Text2(Y * 6 + i)
        Load Command1(Y * 6 + i)
    
        Set Text1(Y * 6 + i).Container = Frame1(Y * 6 + i)
        Set Text2(Y * 6 + i).Container = Frame1(Y * 6 + i)
        Set Command1(Y * 6 + i).Container = Frame1(Y * 6 + i)
        
        Frame1(Y * 6 + i).Visible = True
        Text1(Y * 6 + i).Visible = True
        Text1(Y * 6 + i).Text = ""
        Text2(Y * 6 + i).Visible = True
        Text2(Y * 6 + i).Text = ""
        Command1(Y * 6 + i).Visible = True
        
        Frame1(Y * 6 + i).Caption = Y * 6 + i + 1
        
        Frame1(Y * 6 + i).Top = Frame1(Y * 6 + i - 1).Top + 1100
        Frame1(Y * 6 + i).Left = 240
   Next i
End Sub

Private Sub Form_Unload(Cancel As Integer)
Unload Me
Form4.Show
End Sub
