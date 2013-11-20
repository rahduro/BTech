VERSION 5.00
Begin VB.Form Form3 
   Caption         =   "Form3"
   ClientHeight    =   4725
   ClientLeft      =   7905
   ClientTop       =   4125
   ClientWidth     =   6255
   LinkTopic       =   "Form3"
   ScaleHeight     =   4725
   ScaleWidth      =   6255
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
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
      TabIndex        =   6
      Top             =   3600
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Caption         =   "OPTIONS(Select Either of the two)"
      BeginProperty Font 
         Name            =   "Nyala"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   480
      TabIndex        =   0
      Top             =   1680
      Width           =   5295
      Begin VB.OptionButton Option2 
         Caption         =   "Option2"
         Height          =   195
         Left            =   3120
         TabIndex        =   4
         Top             =   600
         Width           =   255
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Option1"
         Height          =   195
         Left            =   480
         TabIndex        =   2
         Top             =   600
         Width           =   255
      End
      Begin VB.Label Label3 
         Caption         =   "Decryption"
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
         Left            =   3720
         TabIndex        =   5
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "Encryption"
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
         Left            =   960
         TabIndex        =   3
         Top             =   600
         Width           =   1095
      End
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Group Coding Main"
      BeginProperty Font 
         Name            =   "Niagara Engraved"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   1080
      TabIndex        =   1
      Top             =   360
      Width           =   3975
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim q As Integer

Private Sub Command1_Click()
If q = 1 Then
Form3.Hide
Form1.Show
End If
If q = 2 Then
Form3.Hide
Form4.Show
End If
End Sub

Private Sub Option1_Click()
q = 1
End Sub

Private Sub Option2_Click()
q = 2
End Sub
