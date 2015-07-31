VERSION 5.00
Begin VB.Form Frm_Acceso_Operaciones 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Acceso - Version 2.0"
   ClientHeight    =   2325
   ClientLeft      =   6060
   ClientTop       =   2775
   ClientWidth     =   4095
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   HelpContextID   =   1
   Icon            =   "Frm_Acceso_Operaciones.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2325
   ScaleWidth      =   4095
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   45
      Left            =   30
      Top             =   4590
   End
   Begin VB.CommandButton cmd 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Index           =   0
      Left            =   2925
      TabIndex        =   0
      Top             =   105
      Width           =   1050
   End
   Begin VB.CommandButton cmd 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Index           =   1
      Left            =   2925
      TabIndex        =   1
      Top             =   540
      Width           =   1050
   End
   Begin VB.PictureBox Pic 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   150
      Picture         =   "Frm_Acceso_Operaciones.frx":000C
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   2
      Top             =   150
      Width           =   480
   End
   Begin VB.PictureBox pnl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   1140
      Index           =   2
      Left            =   105
      ScaleHeight     =   1110
      ScaleWidth      =   3840
      TabIndex        =   3
      Top             =   1080
      Width           =   3870
      Begin VB.TextBox txtPwd 
         Appearance      =   0  'Flat
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   765
         MaxLength       =   8
         PasswordChar    =   "*"
         TabIndex        =   8
         Top             =   480
         Width           =   2835
      End
      Begin VB.ComboBox cbusuarios 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   315
         ItemData        =   "Frm_Acceso_Operaciones.frx":0316
         Left            =   750
         List            =   "Frm_Acceso_Operaciones.frx":0320
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Tag             =   "tpCliente"
         Top             =   120
         Width           =   2865
      End
      Begin VB.CommandButton cmd 
         Caption         =   "..."
         Height          =   330
         Index           =   2
         Left            =   5955
         TabIndex        =   4
         Top             =   240
         Width           =   330
      End
      Begin VB.Label lbl 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Usuario"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   2
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   540
      End
      Begin VB.Label lbl 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Clave"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   0
         Left            =   255
         TabIndex        =   5
         Top             =   600
         Width           =   405
      End
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   0
      Left            =   6855
      Picture         =   "Frm_Acceso_Operaciones.frx":0339
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   1
      Left            =   7485
      Picture         =   "Frm_Acceso_Operaciones.frx":0643
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   2
      Left            =   8085
      Picture         =   "Frm_Acceso_Operaciones.frx":094D
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   3
      Left            =   8685
      Picture         =   "Frm_Acceso_Operaciones.frx":0C57
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   4
      Left            =   9285
      Picture         =   "Frm_Acceso_Operaciones.frx":0F61
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   5
      Left            =   6840
      Picture         =   "Frm_Acceso_Operaciones.frx":126B
      Top             =   870
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   6
      Left            =   7485
      Picture         =   "Frm_Acceso_Operaciones.frx":1575
      Top             =   870
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   7
      Left            =   8085
      Picture         =   "Frm_Acceso_Operaciones.frx":187F
      Top             =   855
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   8
      Left            =   8670
      Picture         =   "Frm_Acceso_Operaciones.frx":1B89
      Top             =   840
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   9
      Left            =   9270
      Picture         =   "Frm_Acceso_Operaciones.frx":1E93
      Top             =   840
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   10
      Left            =   6855
      Picture         =   "Frm_Acceso_Operaciones.frx":219D
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   11
      Left            =   7575
      Picture         =   "Frm_Acceso_Operaciones.frx":24A7
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   12
      Left            =   8100
      Picture         =   "Frm_Acceso_Operaciones.frx":27B1
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   13
      Left            =   8700
      Picture         =   "Frm_Acceso_Operaciones.frx":2ABB
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   14
      Left            =   9300
      Picture         =   "Frm_Acceso_Operaciones.frx":2DC5
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   15
      Left            =   6900
      Picture         =   "Frm_Acceso_Operaciones.frx":30CF
      Top             =   1830
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   16
      Left            =   7485
      Picture         =   "Frm_Acceso_Operaciones.frx":33D9
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   17
      Left            =   8085
      Picture         =   "Frm_Acceso_Operaciones.frx":36E3
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   18
      Left            =   8685
      Picture         =   "Frm_Acceso_Operaciones.frx":39ED
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   19
      Left            =   9285
      Picture         =   "Frm_Acceso_Operaciones.frx":3CF7
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   20
      Left            =   6900
      Picture         =   "Frm_Acceso_Operaciones.frx":4001
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   21
      Left            =   7530
      Picture         =   "Frm_Acceso_Operaciones.frx":430B
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   22
      Left            =   8130
      Picture         =   "Frm_Acceso_Operaciones.frx":4615
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   23
      Left            =   8730
      Picture         =   "Frm_Acceso_Operaciones.frx":491F
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   24
      Left            =   9300
      Picture         =   "Frm_Acceso_Operaciones.frx":4C29
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   25
      Left            =   6900
      Picture         =   "Frm_Acceso_Operaciones.frx":4F33
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   26
      Left            =   7515
      Picture         =   "Frm_Acceso_Operaciones.frx":523D
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   27
      Left            =   8130
      Picture         =   "Frm_Acceso_Operaciones.frx":5547
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   28
      Left            =   8730
      Picture         =   "Frm_Acceso_Operaciones.frx":5851
      Top             =   2820
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   29
      Left            =   9330
      Picture         =   "Frm_Acceso_Operaciones.frx":5B5B
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   30
      Left            =   6915
      Picture         =   "Frm_Acceso_Operaciones.frx":5E65
      Top             =   3360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   31
      Left            =   7530
      Picture         =   "Frm_Acceso_Operaciones.frx":616F
      Top             =   3390
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   32
      Left            =   8205
      Picture         =   "Frm_Acceso_Operaciones.frx":6479
      Top             =   3375
      Width           =   480
   End
End
Attribute VB_Name = "Frm_Acceso_Operaciones"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Compare Text


Private Sub cbusuarios_KeyPress(KeyAscii As Integer)


   If KeyAscii = 13 Then
        Me.txtPwd.SetFocus
    End If
    
    
    
End Sub

Private Sub cmd_Click(Index As Integer)

    objParametros.GrabarValor "CANCELA", "SI"

    If Index = 0 Then
        If Me.cbusuarios.Text = "" Then
            MsgBox "Debe ingresar el usuario", vbInformation + vbDefaultButton1, "Atención"
            Exit Sub
        End If
        If cbusuarios.Text = "" Then
            MsgBox "Debe ingresar la password", vbInformation + vbDefaultButton1, "Atención"
            Me.cbusuarios.SetFocus
            Exit Sub
        End If

        objParametros.GrabarValor "CANCELA", "NO"
        objParametros.GrabarValor "dsUsuario_Acceso_Supervisor", Me.cbusuarios.Text
        objParametros.GrabarValor "dsPassword_Acceso_Supervisor", UCase(Me.txtPwd.Text)
        Unload Me
    Else
        objParametros.GrabarValor "dsUsuario_Acceso_Supervisor", ""
        objParametros.GrabarValor "dsPassword_Acceso_Supervisor", ""
        objParametros.GrabarValor "CANCELA", "SI"
        Unload Me
    End If
    
End Sub



Private Sub Form_Load()
Dim objControl As New CControl
Dim rs         As Object


    Me.cbusuarios.Clear
    Me.Caption = "Acceso - Versión " + CStr(App.Major) + "." + CStr(App.Minor)
    objParametros.GrabarValor "dsUsuario_Acceso_Supervisor", ""
    objParametros.GrabarValor "dsPassword_Acceso_Supervisor", ""
             
    
    ' Cargmos los usuarios activos de cajas de
    Set rs = objUsuario.obtenerUsuariosSupervisores()
    objControl.CargarCombo Me.cbusuarios, rs, rs(0)
    
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
   Set Frm_Acceso_Operaciones = Nothing
End Sub


Private Sub txtPwd_GotFocus()


   txtPwd.SelStart = 0
   txtPwd.SelLength = Len(Trim(txtPwd.Text))
   
End Sub



Private Sub txtPwd_LostFocus()

    txtPwd.Text = UCase(txtPwd.Text)
    
End Sub
