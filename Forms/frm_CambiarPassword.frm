VERSION 5.00
Begin VB.Form frm_CambiarPassword 
   Appearance      =   0  'Flat
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cambiar Clave de Acceso"
   ClientHeight    =   2415
   ClientLeft      =   6060
   ClientTop       =   2775
   ClientWidth     =   4050
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   HelpContextID   =   1
   Icon            =   "frm_CambiarPassword.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2415
   ScaleWidth      =   4050
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
      Left            =   108
      TabIndex        =   3
      Top             =   1890
      Width           =   1050
   End
   Begin VB.CommandButton cmd 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Index           =   1
      Left            =   1260
      TabIndex        =   5
      Top             =   1872
      Width           =   1050
   End
   Begin VB.PictureBox Pic 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   3420
      Picture         =   "frm_CambiarPassword.frx":000C
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   4
      Top             =   1896
      Width           =   480
   End
   Begin VB.PictureBox pnl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   1644
      Index           =   2
      Left            =   132
      ScaleHeight     =   1620
      ScaleWidth      =   3765
      TabIndex        =   6
      Top             =   120
      Width           =   3795
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   315
         IMEMode         =   3  'DISABLE
         Index           =   0
         Left            =   1344
         MaxLength       =   8
         PasswordChar    =   "*"
         TabIndex        =   0
         Tag             =   "clave_actual"
         Top             =   204
         Width           =   2124
      End
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   315
         IMEMode         =   3  'DISABLE
         Index           =   2
         Left            =   1344
         MaxLength       =   8
         PasswordChar    =   "*"
         TabIndex        =   2
         Tag             =   "clave_actual_re"
         Top             =   1008
         Width           =   2124
      End
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   315
         IMEMode         =   3  'DISABLE
         Index           =   1
         Left            =   1344
         MaxLength       =   8
         PasswordChar    =   "*"
         TabIndex        =   1
         Tag             =   "clave_nueva"
         Top             =   600
         Width           =   2124
      End
      Begin VB.CommandButton cmd 
         Caption         =   "..."
         Height          =   330
         Index           =   2
         Left            =   5955
         TabIndex        =   7
         Top             =   240
         Width           =   330
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Confirmación"
         ForeColor       =   &H00000000&
         Height          =   192
         Index           =   1
         Left            =   180
         TabIndex        =   10
         Top             =   1068
         Width           =   936
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Clave Actual"
         ForeColor       =   &H00000000&
         Height          =   192
         Index           =   2
         Left            =   204
         TabIndex        =   9
         Top             =   348
         Width           =   900
      End
      Begin VB.Label lbl 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Clave nueva"
         ForeColor       =   &H00000000&
         Height          =   192
         Index           =   0
         Left            =   192
         TabIndex        =   8
         Top             =   732
         Width           =   900
      End
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   0
      Left            =   6855
      Picture         =   "frm_CambiarPassword.frx":0316
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   1
      Left            =   7485
      Picture         =   "frm_CambiarPassword.frx":0620
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   2
      Left            =   8085
      Picture         =   "frm_CambiarPassword.frx":092A
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   3
      Left            =   8685
      Picture         =   "frm_CambiarPassword.frx":0C34
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   4
      Left            =   9285
      Picture         =   "frm_CambiarPassword.frx":0F3E
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   5
      Left            =   6840
      Picture         =   "frm_CambiarPassword.frx":1248
      Top             =   870
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   6
      Left            =   7485
      Picture         =   "frm_CambiarPassword.frx":1552
      Top             =   870
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   7
      Left            =   8085
      Picture         =   "frm_CambiarPassword.frx":185C
      Top             =   855
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   8
      Left            =   8670
      Picture         =   "frm_CambiarPassword.frx":1B66
      Top             =   840
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   9
      Left            =   9270
      Picture         =   "frm_CambiarPassword.frx":1E70
      Top             =   840
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   10
      Left            =   6855
      Picture         =   "frm_CambiarPassword.frx":217A
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   11
      Left            =   7575
      Picture         =   "frm_CambiarPassword.frx":2484
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   12
      Left            =   8100
      Picture         =   "frm_CambiarPassword.frx":278E
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   13
      Left            =   8700
      Picture         =   "frm_CambiarPassword.frx":2A98
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   14
      Left            =   9300
      Picture         =   "frm_CambiarPassword.frx":2DA2
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   15
      Left            =   6900
      Picture         =   "frm_CambiarPassword.frx":30AC
      Top             =   1830
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   16
      Left            =   7485
      Picture         =   "frm_CambiarPassword.frx":33B6
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   17
      Left            =   8085
      Picture         =   "frm_CambiarPassword.frx":36C0
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   18
      Left            =   8685
      Picture         =   "frm_CambiarPassword.frx":39CA
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   19
      Left            =   9285
      Picture         =   "frm_CambiarPassword.frx":3CD4
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   20
      Left            =   6900
      Picture         =   "frm_CambiarPassword.frx":3FDE
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   21
      Left            =   7530
      Picture         =   "frm_CambiarPassword.frx":42E8
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   22
      Left            =   8130
      Picture         =   "frm_CambiarPassword.frx":45F2
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   23
      Left            =   8730
      Picture         =   "frm_CambiarPassword.frx":48FC
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   24
      Left            =   9300
      Picture         =   "frm_CambiarPassword.frx":4C06
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   25
      Left            =   6900
      Picture         =   "frm_CambiarPassword.frx":4F10
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   26
      Left            =   7515
      Picture         =   "frm_CambiarPassword.frx":521A
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   27
      Left            =   8130
      Picture         =   "frm_CambiarPassword.frx":5524
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   28
      Left            =   8730
      Picture         =   "frm_CambiarPassword.frx":582E
      Top             =   2820
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   29
      Left            =   9330
      Picture         =   "frm_CambiarPassword.frx":5B38
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   30
      Left            =   6915
      Picture         =   "frm_CambiarPassword.frx":5E42
      Top             =   3360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   31
      Left            =   7530
      Picture         =   "frm_CambiarPassword.frx":614C
      Top             =   3390
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   32
      Left            =   8205
      Picture         =   "frm_CambiarPassword.frx":6456
      Top             =   3375
      Width           =   480
   End
End
Attribute VB_Name = "frm_CambiarPassword"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Compare Text


Private Function ObtenerCampo(pstrtag As String) As Control
Dim Control As Object

    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If UCase(Control.Tag) = UCase(pstrtag) Then
               Set ObtenerCampo = Control
               Exit Function
            End If
        End If
    Next
    
    MsgBox "No se encuentra el campo " + pstrtag + " en el formulario actual", vbInformation + vbDefaultButton1, "Atención"
    
End Function


Private Sub cmd_Click(Index As Integer)
Dim newUsuario As New CUsuario

    If Index = 0 Then
    
        If ObtenerCampo("clave_actual") = "" Then
            MsgBox "Debe ingresar su clave actual.", vbInformation + vbDefaultButton1, "Atención"
            ObtenerCampo("clave_actual").SetFocus
            Exit Sub
        End If
        
        newUsuario.dsUsuario = objUsuario.dsUsuario
        newUsuario.dsPassword = ObtenerCampo("clave_actual")
        
        If Not newUsuario.ValidarUsuario() Then
            MsgBox "La clave actual ingresada no es valida.", vbInformation + vbDefaultButton1, "Atención"
            ObtenerCampo("clave_actual").SetFocus
            Exit Sub
        End If
            
        If ObtenerCampo("clave_actual") = ObtenerCampo("clave_nueva") Then
            MsgBox "Debe ingresar una clave distinta a la actual.", vbInformation + vbDefaultButton1, "Atención"
            ObtenerCampo("clave_nueva").SetFocus
            Exit Sub
        End If
        
        ' clave_nueva
        ' clave_actual_re
        
        If ObtenerCampo("clave_nueva") = "" Then
            MsgBox "Debe ingresar su nueva clave.", vbInformation + vbDefaultButton1, "Atención"
            ObtenerCampo("clave_nueva").SetFocus
            Exit Sub
        End If

        If ObtenerCampo("clave_actual_re") = "" Then
            MsgBox "Debe confirmar su nueva clave.", vbInformation + vbDefaultButton1, "Atención"
            ObtenerCampo("clave_actual_re").SetFocus
            Exit Sub
        End If
        
        If ObtenerCampo("clave_nueva") <> ObtenerCampo("clave_actual_re") Then
            MsgBox "No coincide la confirmación de la nueva clave con la nueva clave.", vbInformation + vbDefaultButton1, "Atención"
            ObtenerCampo("clave_actual_re").SetFocus
            Exit Sub
        End If
        
        ObtenerCampo("clave_nueva").Text = objbasededatos.hashCadena(UCase(ObtenerCampo("clave_nueva").Text))
        
        ObjTablasIO.nmTabla = "TB_Usuarios"
        ObjTablasIO.setearCampoOperadorValor "dsUsuario", "=", objUsuario.dsUsuario
        ObjTablasIO.setearCampoOperadorValor "dsPassword", "<-", ObtenerCampo("clave_nueva").Text
        
        If Not ObjTablasIO.Actualizar() Then
            objParametros.GrabarValor "CAMBIO_CLAVE", "NO"
            MsgBox "Error " + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
        Else
            objParametros.GrabarValor "CAMBIO_CLAVE", "SI"
            MsgBox "La clave ha sido cambiado con éxito", _
                    vbInformation + vbDefaultButton1, "Atención"
        End If
        Unload Me
    Else
        objParametros.GrabarValor "CAMBIO_CLAVE", "NO"
        Unload Me
    End If
    
End Sub


Private Sub Form_Load()
    objParametros.GrabarValor "CAMBIO_CLAVE", "NO"
End Sub

Private Sub Form_Unload(Cancel As Integer)
   Set frm_CambiarPassword = Nothing
End Sub


Private Sub txt_GotFocus(Index As Integer)

   txt(Index).SelStart = 0
   txt(Index).SelLength = Len(Trim(txt(Index)))

End Sub
