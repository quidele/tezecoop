VERSION 5.00
Begin VB.Form Frm_TraspasodeCaja 
   Appearance      =   0  'Flat
   BackColor       =   &H80000000&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Traspaso de Caja"
   ClientHeight    =   4245
   ClientLeft      =   6060
   ClientTop       =   2775
   ClientWidth     =   4635
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   HelpContextID   =   1
   Icon            =   "Frm_TraspasodeCaja.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4245
   ScaleWidth      =   4635
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cbusuarios 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   315
      ItemData        =   "Frm_TraspasodeCaja.frx":000C
      Left            =   1590
      List            =   "Frm_TraspasodeCaja.frx":0016
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Tag             =   "dsUsuarioNuevo"
      Top             =   2310
      Width           =   2700
   End
   Begin VB.TextBox txtFields 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "dsRazonSocial"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   10
      Left            =   1470
      Locked          =   -1  'True
      TabIndex        =   15
      TabStop         =   0   'False
      Tag             =   "nrCaja"
      Top             =   150
      Width           =   2670
   End
   Begin VB.PictureBox pnl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   1140
      Index           =   0
      Left            =   195
      ScaleHeight     =   1110
      ScaleWidth      =   4275
      TabIndex        =   10
      Top             =   660
      Width           =   4305
      Begin VB.CommandButton cmd 
         Caption         =   "..."
         Height          =   330
         Index           =   3
         Left            =   5955
         TabIndex        =   12
         Top             =   240
         Width           =   330
      End
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         Height          =   315
         IMEMode         =   3  'DISABLE
         Index           =   3
         Left            =   1365
         MaxLength       =   8
         PasswordChar    =   "*"
         TabIndex        =   1
         Tag             =   "dsPassword"
         Top             =   570
         Width           =   2745
      End
      Begin VB.TextBox txt 
         Appearance      =   0  'Flat
         BackColor       =   &H80000000&
         Height          =   315
         IMEMode         =   3  'DISABLE
         Index           =   2
         Left            =   1380
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   11
         Tag             =   "dsUsuario"
         Top             =   150
         Width           =   2730
      End
      Begin VB.Label lbl 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Clave"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   3
         Left            =   855
         TabIndex        =   14
         Top             =   630
         Width           =   405
      End
      Begin VB.Label lbl 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Usuario Actual"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   1
         Left            =   225
         TabIndex        =   13
         Top             =   195
         Width           =   1035
      End
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   45
      Left            =   30
      Top             =   4590
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   870
      TabIndex        =   4
      Top             =   3495
      Width           =   1050
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   2055
      TabIndex        =   6
      Top             =   3480
      Width           =   1050
   End
   Begin VB.PictureBox pnl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   1140
      Index           =   2
      Left            =   195
      ScaleHeight     =   1110
      ScaleWidth      =   4260
      TabIndex        =   5
      Top             =   2160
      Width           =   4290
      Begin VB.TextBox txtPwd 
         Appearance      =   0  'Flat
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   1365
         MaxLength       =   8
         PasswordChar    =   "*"
         TabIndex        =   3
         Tag             =   "dsPasswordNuevo"
         Top             =   555
         Width           =   2730
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
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Usuario Destino"
         ForeColor       =   &H00000000&
         Height          =   300
         Index           =   2
         Left            =   75
         TabIndex        =   9
         Top             =   255
         Width           =   1200
      End
      Begin VB.Label lbl 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Clave"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   0
         Left            =   600
         TabIndex        =   8
         Top             =   660
         Width           =   660
      End
   End
   Begin VB.Label Label1 
      Caption         =   "Se traspasa esta caja a:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   225
      TabIndex        =   16
      Top             =   1875
      Width           =   2805
   End
   Begin VB.Label Label10 
      Caption         =   "Caja Nro."
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   240
      TabIndex        =   0
      Top             =   195
      Width           =   1245
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   0
      Left            =   6855
      Picture         =   "Frm_TraspasodeCaja.frx":002F
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   1
      Left            =   7485
      Picture         =   "Frm_TraspasodeCaja.frx":0339
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   2
      Left            =   8085
      Picture         =   "Frm_TraspasodeCaja.frx":0643
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   3
      Left            =   8685
      Picture         =   "Frm_TraspasodeCaja.frx":094D
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   4
      Left            =   9285
      Picture         =   "Frm_TraspasodeCaja.frx":0C57
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   5
      Left            =   6840
      Picture         =   "Frm_TraspasodeCaja.frx":0F61
      Top             =   870
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   6
      Left            =   7485
      Picture         =   "Frm_TraspasodeCaja.frx":126B
      Top             =   870
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   7
      Left            =   8085
      Picture         =   "Frm_TraspasodeCaja.frx":1575
      Top             =   855
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   8
      Left            =   8670
      Picture         =   "Frm_TraspasodeCaja.frx":187F
      Top             =   840
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   9
      Left            =   9270
      Picture         =   "Frm_TraspasodeCaja.frx":1B89
      Top             =   840
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   10
      Left            =   6855
      Picture         =   "Frm_TraspasodeCaja.frx":1E93
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   11
      Left            =   7575
      Picture         =   "Frm_TraspasodeCaja.frx":219D
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   12
      Left            =   8100
      Picture         =   "Frm_TraspasodeCaja.frx":24A7
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   13
      Left            =   8700
      Picture         =   "Frm_TraspasodeCaja.frx":27B1
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   14
      Left            =   9300
      Picture         =   "Frm_TraspasodeCaja.frx":2ABB
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   15
      Left            =   6900
      Picture         =   "Frm_TraspasodeCaja.frx":2DC5
      Top             =   1830
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   16
      Left            =   7485
      Picture         =   "Frm_TraspasodeCaja.frx":30CF
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   17
      Left            =   8085
      Picture         =   "Frm_TraspasodeCaja.frx":33D9
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   18
      Left            =   8685
      Picture         =   "Frm_TraspasodeCaja.frx":36E3
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   19
      Left            =   9285
      Picture         =   "Frm_TraspasodeCaja.frx":39ED
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   20
      Left            =   6900
      Picture         =   "Frm_TraspasodeCaja.frx":3CF7
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   21
      Left            =   7530
      Picture         =   "Frm_TraspasodeCaja.frx":4001
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   22
      Left            =   8130
      Picture         =   "Frm_TraspasodeCaja.frx":430B
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   23
      Left            =   8730
      Picture         =   "Frm_TraspasodeCaja.frx":4615
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   24
      Left            =   9300
      Picture         =   "Frm_TraspasodeCaja.frx":491F
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   25
      Left            =   6900
      Picture         =   "Frm_TraspasodeCaja.frx":4C29
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   26
      Left            =   7515
      Picture         =   "Frm_TraspasodeCaja.frx":4F33
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   27
      Left            =   8130
      Picture         =   "Frm_TraspasodeCaja.frx":523D
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   28
      Left            =   8730
      Picture         =   "Frm_TraspasodeCaja.frx":5547
      Top             =   2820
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   29
      Left            =   9330
      Picture         =   "Frm_TraspasodeCaja.frx":5851
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   30
      Left            =   6915
      Picture         =   "Frm_TraspasodeCaja.frx":5B5B
      Top             =   3360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   31
      Left            =   7530
      Picture         =   "Frm_TraspasodeCaja.frx":5E65
      Top             =   3390
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   32
      Left            =   8205
      Picture         =   "Frm_TraspasodeCaja.frx":616F
      Top             =   3375
      Width           =   480
   End
End
Attribute VB_Name = "Frm_TraspasodeCaja"
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
    Debug.Assert "hola"
    
End Function

Private Sub cbusuarios_KeyPress(KeyAscii As Integer)


   If KeyAscii = 13 Then
        Me.txtPwd.SetFocus
    End If
    
End Sub

Private Sub cmdAceptar_Click()
Dim objUsuarioOrigen   As New CUsuario
Dim objUsuarioDestino  As New CUsuario
Dim resp               As Byte


    objUsuarioOrigen.dsUsuario = ObtenerCampo("dsUsuario").Text
    objUsuarioOrigen.dsPassword = ObtenerCampo("dsPassword").Text
    objUsuarioDestino.dsUsuario = ObtenerCampo("dsUsuarioNuevo").Text
    objUsuarioDestino.dsPassword = ObtenerCampo("dsPasswordNuevo").Text

    If ObtenerCampo("dsPassword").Text = "" Then
        MsgBox "Ingrese la clave", vbInformation, "Atenciòn"
        ObtenerCampo("dsPassword").SetFocus
        Exit Sub
    End If
    
    If ObtenerCampo("dsUsuarioNuevo").Text = "" Then
        MsgBox "Ingrese el usuario destino", vbInformation, "Atenciòn"
        ObtenerCampo("dsUsuarioNuevo").SetFocus
        Exit Sub
    End If
    
    If ObtenerCampo("dsPasswordNuevo").Text = "" Then
        MsgBox "Ingrese el clave del usuario destino", vbCritical, "Atenciòn"
        ObtenerCampo("dsPasswordNuevo").SetFocus
        Exit Sub
    End If
    
    
    MsgBox "Confirma el traspaso de esta caja al usuario '" + objUsuarioDestino.dsUsuario + "'. ", vbQuestion + vbYesNo, "Atención"
    
    If resp = vbNo Then Exit Sub
    
    
    If Not objUsuarioOrigen.ValidarUsuario() Then
        MsgBox "la Contraseña del usuario " + objUsuarioOrigen.dsUsuario + " no es válida.", vbCritical + vbDefaultButton1, "Atención"
        ObtenerCampo("dsPassword").SetFocus
        Exit Sub
    End If
       
    
    If Not objUsuarioDestino.ValidarUsuario() Then
        MsgBox "la Contraseña del usuario " + objUsuarioDestino.dsUsuario + " no es válida.", vbCritical + vbDefaultButton1, "Atención"
        ObtenerCampo("dsPasswordNuevo").SetFocus
        Exit Sub
    End If
    
    If objUsuarioDestino.tpAcceso <> "Puestos" Then
        MsgBox "El usuario destino no es válido, " + objUsuarioDestino.dsUsuario + " es un usuario de la administración", vbCritical, "Atención"
        Exit Sub
    End If
    
    If objCajas.VerificarUsuariotieneCajaAbierta(ObtenerCampo("nrCaja").Text, objUsuarioDestino.dsUsuario) Then
        MsgBox "El usuario " + objUsuarioDestino.dsUsuario + " tiene una caja abierta, no puede asignarle esta caja.", vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    objbasededatos.BeginTrans
    If objCajas.CambiarUsuariodelaCaja(ObtenerCampo("nrCaja").Text, objUsuarioDestino.dsUsuario) Then
        Set objUsuario = objUsuarioDestino
        objParametros.GrabarValor "dsUsuario", objUsuario.dsUsuario

        ' grabamos la tabla de auditorias
        objAuditorias.dsAuditoria = "Traspaso de caja Nro " + ObtenerCampo("nrCaja").Text
        objAuditorias.dsAuditoria = objAuditorias.dsAuditoria + " de " + objUsuarioOrigen.dsUsuario + " a "
        objAuditorias.dsAuditoria = objAuditorias.dsAuditoria + objUsuarioDestino.dsUsuario
        objAuditorias.Modulo = "Ventas Caja Puestos"
        objAuditorias.funcion = "Traspaso de Caja Puesto"
        objAuditorias.nrPuesto = objConfig.nrPuesto
        objAuditorias.dsUsuario = objUsuarioOrigen.dsUsuario
        objAuditorias.nrCaja = ObtenerCampo("nrCaja").Text
        objAuditorias.grabarAuditoria
        
        objbasededatos.CommitTrans
        
        MsgBox "El Cambio se efectuó exitosamente al usuario " + objUsuarioDestino.dsUsuario + ". ", vbInformation + vbDefaultButton1, "Atención"
        Unload Me
    Else
        objbasededatos.RollBackTrans
        MsgBox "Se produjo un error al tratar de realizar el cambio.", vbInformation + vbDefaultButton1, "Atención"
    End If
    
End Sub

Private Sub cmdCancelar_Click()

    Unload Me

    
End Sub

Private Sub Form_Load()
Dim objControl As New CControl
Dim rs         As Object

    Me.Caption = "Acceso - Versión " + CStr(App.Major) + "." + CStr(App.Minor)
    
    
    
    ' Cargmos los usuarios activos de cajas de
    Set rs = objUsuario.obtenerUsuariosActivosCajasPuestos
    objControl.CargarCombo Me.cbusuarios, rs, rs(0)
    ObtenerCampo("nrCaja") = objParametros.ObtenerValor("nrCaja")
    ObtenerCampo("dsUsuario") = objUsuario.dsUsuario
    
    
End Sub

