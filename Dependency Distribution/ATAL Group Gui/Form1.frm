VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6345
   ClientLeft      =   7035
   ClientTop       =   3255
   ClientWidth     =   7005
   LinkTopic       =   "Form1"
   ScaleHeight     =   6345
   ScaleWidth      =   7005
   Begin MSComDlg.CommonDialog CommonDialog2 
      Left            =   1200
      Top             =   5640
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      Filter          =   "text file(*.txt)|*.txt"
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   4920
      Top             =   5640
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      Filter          =   "text file(*.txt)|*.txt"
   End
   Begin VB.Frame Frame4 
      Caption         =   "Min required to open"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   3480
      TabIndex        =   8
      Top             =   2880
      Width           =   2415
      Begin VB.TextBox Text4 
         Height          =   405
         Left            =   240
         TabIndex        =   10
         Top             =   360
         Width           =   1815
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Divide"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2640
      TabIndex        =   3
      Top             =   5640
      Width           =   1455
   End
   Begin VB.Frame Frame3 
      Caption         =   "Save folder for divided files"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   240
      TabIndex        =   2
      Top             =   4080
      Width           =   6495
      Begin VB.CommandButton Command3 
         Caption         =   "Browse"
         Height          =   375
         Left            =   5280
         TabIndex        =   7
         Top             =   480
         Width           =   855
      End
      Begin VB.TextBox Text2 
         Height          =   375
         Left            =   240
         TabIndex        =   6
         Top             =   480
         Width           =   4695
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "No of Division"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   720
      TabIndex        =   1
      Top             =   2880
      Width           =   2295
      Begin VB.TextBox Text3 
         Height          =   405
         Left            =   240
         TabIndex        =   9
         Top             =   360
         Width           =   1815
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "The File For Division"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   240
      TabIndex        =   0
      Top             =   1320
      Width           =   6495
      Begin VB.CommandButton Command2 
         Caption         =   "Browse"
         Height          =   375
         Left            =   5280
         TabIndex        =   5
         Top             =   480
         Width           =   855
      End
      Begin VB.TextBox Text1 
         Height          =   375
         Left            =   360
         TabIndex        =   4
         Top             =   480
         Width           =   4575
      End
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Group Coding Encryption"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2400
      TabIndex        =   11
      Top             =   240
      Width           =   2055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function divide Lib "group.dll" (ByVal X As Long, ByVal Y As Long, ByVal z As String, ByVal d As String) As Long

Private Sub Command1_Click()
Dim b As Long
If Not Text1.Text = "" And Not Text2.Text = "" And Not Text3.Text = "" And Not Text4.Text = "" Then
    b = divide(Val(Text3.Text), Val(Text4.Text), Text1.Text, Text2.Text)
    If b = 1 Then
        stat = MsgBox("Message Division Done", vbOKOnly)
    Else
        stat = MsgBox("Input File Doesn't Exist", vbOKOnly)
    End If
    If stat = 1 Then
            Call Form_Unload(1)
    End If
End If
End Sub

Private Sub Command2_Click()
CommonDialog1.ShowOpen
Text1.Text = CommonDialog1.FileName
End Sub

Private Sub Command3_Click()
Form2.Show
End Sub

Private Sub Form_Unload(Cancel As Integer)
Unload Me
Form3.Show
End Sub

