VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "select folder"
   ClientHeight    =   5220
   ClientLeft      =   8490
   ClientTop       =   3090
   ClientWidth     =   3810
   LinkTopic       =   "Form2"
   ScaleHeight     =   5220
   ScaleWidth      =   3810
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   3720
      Width           =   3495
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Select folder"
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
      Left            =   1080
      TabIndex        =   2
      Top             =   4440
      Width           =   1695
   End
   Begin VB.DirListBox Dir1 
      Height          =   2340
      Left            =   240
      TabIndex        =   1
      Top             =   1080
      Width           =   3255
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   240
      TabIndex        =   0
      Top             =   600
      Width           =   3255
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Form1.Text2.Text = Text1.Text
Call Form_Unload(1)
End Sub

Private Sub Dir1_Change()
Text1.Text = Dir1.Path + "\"
End Sub

Private Sub Drive1_Change()
Dir1.Path = Drive1.Drive
Text1.Text = Drive1.Drive + "\"
End Sub

Private Sub Form_Load()
Text1.Text = Dir1.Path
End Sub

Private Sub Form_Unload(Cancel As Integer)
Unload Me
End Sub
