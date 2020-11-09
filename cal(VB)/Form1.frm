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
      Index           =   17
      Left            =   2880
      TabIndex        =   19
      Top             =   3840
      Width           =   855
   End
   Begin VB.CommandButton bExchange 
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
      Index           =   1
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
      Index           =   2
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
      Index           =   3
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
   Begin VB.CommandButton bDelete 
      Caption         =   "delete"
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
      Index           =   4
      Left            =   2880
      TabIndex        =   2
      Top             =   1920
      Width           =   855
   End
   Begin VB.TextBox box2 
      Height          =   735
      Left            =   720
      Locked          =   -1  'True
      TabIndex        =   1
      Text            =   "0"
      Top             =   1200
      Width           =   3015
   End
   Begin VB.TextBox box1 
      Height          =   735
      Left            =   720
      Locked          =   -1  'True
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
Dim oper As Integer
Dim result As Double
Dim cMod As Boolean
Dim cMod2 As Boolean



Private Sub bExchange_Click(Index As Integer)
    box2.Text = CDbl(box2.Text) * -1
    
End Sub

' 화면 로드시
Private Sub Form_Load()
    oper = 0
    box2.Text = 0
    result = 0
    cMod = False
    cMod2 = False
End Sub


'숫자버튼 클릭시
Private Sub bNum_Click(Index As Integer)
On Error Resume Next
    If cMod Then
        box2.Text = 0
        cMod = False
    End If
    
    If box2.Text = 0 Then
        box2.Text = Index
    Else
        box2.Text = box2.Text + CStr(Index)
    End If
    cMod2 = True
    
End Sub


'전체 초기화
Private Sub cCancel_Click(Index As Integer)
    box2.Text = 0
    box1.Text = ""
    oper = 0
    result = 0
End Sub

'텍스트만 초기화
Private Sub cCe_Click(Index As Integer)
    box2.Text = 0
End Sub

Private Sub cComma_Click(Index As Integer)
    If InStr(1, box2.Text, ".", vbTextCompare) = 0 Then
        box2.Text = box2.Text + "."
    End If
    
End Sub
'= 버튼 클릭시
Private Sub cEqual_Click(Index As Integer)
    Call calc
    box1.Text = ""
    oper = 0
    result = 0
End Sub

'사칙버튼 클릭시
Private Sub bSachic_Click(Index As Integer)
    On Error Resume Next
    If cMod2 Then
        box1.Text = box1.Text + box2.Text + bSachic(Index).Caption
        Call calc
        oper = Index
        cMod2 = False
   Else
        Dim length As Integer
        length = Len(box1.Text)
        box1.Text = Left(box1.Text, length - 1) + bSachic(Index).Caption
        oper = Index
    End If
End Sub

Sub calc()
'On Error Resume Next
On Error GoTo s_Error
        Select Case oper
        Case 1, 0
            result = result + CDbl(box2.Text)
        Case 2
            result = result - CDbl(box2.Text)
        Case 3
            result = result * CDbl(box2.Text)
        Case 4
            If box2.Text = "0" Then
                
                MsgBox ("0으로는 나눌 수 없습니다")
            Else
                result = result / CDbl(box2.Text)
            End If
        End Select
        
        cMod = True
        box2.Text = result
    Exit Sub
s_Error:
    Call MsgBox("Error")
End Sub


'삭제 버튼 클릭시
Private Sub bDelete_Click(Index As Integer)
On Error Resume Next
    Dim length As Integer
    length = Len(box2.Text)
    box2.Text = Left(box2.Text, length - 1)
End Sub
