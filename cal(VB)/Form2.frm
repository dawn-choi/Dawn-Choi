VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6810
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   6810
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows 기본값
   Begin VB.CommandButton bNum 
      Caption         =   "0"
      Height          =   495
      Index           =   0
      Left            =   1440
      TabIndex        =   21
      Top             =   3840
      Width           =   735
   End
   Begin VB.CommandButton cComma 
      Caption         =   "."
      Height          =   495
      Index           =   18
      Left            =   2160
      TabIndex        =   20
      Top             =   3840
      Width           =   735
   End
   Begin VB.CommandButton cEqual 
      Caption         =   "="
      Height          =   495
      Index           =   5
      Left            =   2880
      TabIndex        =   19
      Top             =   3840
      Width           =   855
   End
   Begin VB.CommandButton bSachic 
      Caption         =   "+/-"
      Height          =   495
      Index           =   16
      Left            =   720
      TabIndex        =   18
      Top             =   3840
      Width           =   735
   End
   Begin VB.CommandButton bNum 
      Caption         =   "2"
      Height          =   495
      Index           =   2
      Left            =   1440
      TabIndex        =   17
      Top             =   3360
      Width           =   735
   End
   Begin VB.CommandButton bNum 
      Caption         =   "3"
      Height          =   495
      Index           =   3
      Left            =   2160
      TabIndex        =   16
      Top             =   3360
      Width           =   735
   End
   Begin VB.CommandButton bSachic 
      Caption         =   "+"
      Height          =   495
      Index           =   4
      Left            =   2880
      TabIndex        =   15
      Top             =   3360
      Width           =   855
   End
   Begin VB.CommandButton bNum 
      Caption         =   "1"
      Height          =   495
      Index           =   1
      Left            =   720
      TabIndex        =   14
      Top             =   3360
      Width           =   735
   End
   Begin VB.CommandButton bNum 
      Caption         =   "5"
      Height          =   495
      Index           =   5
      Left            =   1440
      TabIndex        =   13
      Top             =   2880
      Width           =   735
   End
   Begin VB.CommandButton bNum 
      Caption         =   "6"
      Height          =   495
      Index           =   6
      Left            =   2160
      TabIndex        =   12
      Top             =   2880
      Width           =   735
   End
   Begin VB.CommandButton bSachic 
      Caption         =   "-"
      Height          =   495
      Index           =   3
      Left            =   2880
      TabIndex        =   11
      Top             =   2880
      Width           =   855
   End
   Begin VB.CommandButton bNum 
      Caption         =   "4"
      Height          =   495
      Index           =   4
      Left            =   720
      TabIndex        =   10
      Top             =   2880
      Width           =   735
   End
   Begin VB.CommandButton bNum 
      Caption         =   "8"
      Height          =   495
      Index           =   8
      Left            =   1440
      TabIndex        =   9
      Top             =   2400
      Width           =   735
   End
   Begin VB.CommandButton bNum 
      Caption         =   "9"
      Height          =   495
      Index           =   9
      Left            =   2160
      TabIndex        =   8
      Top             =   2400
      Width           =   735
   End
   Begin VB.CommandButton bSachic 
      Caption         =   "X"
      Height          =   495
      Index           =   2
      Left            =   2880
      TabIndex        =   7
      Top             =   2400
      Width           =   855
   End
   Begin VB.CommandButton bNum 
      Caption         =   "7"
      Height          =   495
      Index           =   7
      Left            =   720
      TabIndex        =   6
      Top             =   2400
      Width           =   735
   End
   Begin VB.CommandButton cCe 
      Caption         =   "CE"
      Height          =   495
      Index           =   4
      Left            =   720
      TabIndex        =   5
      Top             =   1920
      Width           =   735
   End
   Begin VB.CommandButton cC 
      Caption         =   "C"
      Height          =   495
      Index           =   3
      Left            =   1440
      TabIndex        =   4
      Top             =   1920
      Width           =   735
   End
   Begin VB.CommandButton cCancel 
      Caption         =   "Cancel"
      Height          =   495
      Index           =   2
      Left            =   2160
      TabIndex        =   3
      Top             =   1920
      Width           =   735
   End
   Begin VB.CommandButton bSachic 
      Caption         =   "/"
      Height          =   495
      Index           =   1
      Left            =   2880
      TabIndex        =   2
      Top             =   1920
      Width           =   855
   End
   Begin VB.TextBox box2 
      Height          =   735
      Left            =   720
      TabIndex        =   1
      Text            =   "0"
      Top             =   1200
      Width           =   3015
   End
   Begin VB.TextBox box1 
      Height          =   735
      Left            =   720
      TabIndex        =   0
      Top             =   480
      Width           =   3015
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim display As String
Dim thisNum As String
Dim result  As Double
Dim cMod As Boolean
Dim oper As String
Dim fNumber As Double
Dim bNumber As Double

Private Sub Form1_load()

    thisNum = "0"
    reuslt = 0
    display = ""
    cMod = False

End Sub

     


Public Sub number(number As String)
    
    If thisNum = "0" Then
        thisNum = number
    Else
    thisNum = thisNum + number
    End If
    box2.Text = thisNum
    
End Sub


Private Sub bNum_Click(Index As Integer)
    Call number(bNum(Index).Caption)
End Sub

Private Sub bSachic_Click(Index As Integer)
    Call sachic(bSachic(Index).Caption, CDbl(thisNum))
End Sub

Private Sub cCancel_Click(Index As Integer)
    thisNum = "0"
    result = 0
    display = ""
    box1.Text = ""
    box2.Text = ""
End Sub

Private Sub cComma_Click(Index As Integer)
 Call number(cComma(Index).Caption)
End Sub

'숫자버튼 끝
'기능 버튼 시작

Private Sub cCe_Click(Index As Integer)
thisNum = "0"
box2.Text = thisNum
End Sub

Private Sub cEqual_Click(Index As Integer)

    box2.Text = result
    
End Sub

