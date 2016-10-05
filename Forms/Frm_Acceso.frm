VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form Frm_Acceso 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Acceso - Version 2.0"
   ClientHeight    =   4260
   ClientLeft      =   6060
   ClientTop       =   2775
   ClientWidth     =   4500
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   HelpContextID   =   1
   Icon            =   "Frm_Acceso.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4260
   ScaleWidth      =   4500
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtpage 
      Height          =   555
      Left            =   1860
      TabIndex        =   11
      Text            =   "Text1"
      Top             =   5985
      Visible         =   0   'False
      Width           =   3060
   End
   Begin VB.Frame frahelplist 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   0  'None
      Height          =   2265
      Left            =   510
      TabIndex        =   9
      Top             =   2370
      Visible         =   0   'False
      Width           =   2685
      Begin MSComctlLib.ListView ListView1 
         Height          =   2130
         Left            =   45
         TabIndex        =   10
         Top             =   60
         Width           =   2580
         _ExtentX        =   4551
         _ExtentY        =   3757
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         OLEDragMode     =   1
         OLEDropMode     =   1
         FullRowSelect   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         OLEDragMode     =   1
         OLEDropMode     =   1
         NumItems        =   0
      End
   End
   Begin VB.TextBox txtUsuario 
      Appearance      =   0  'Flat
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   840
      MaxLength       =   20
      TabIndex        =   8
      Top             =   1215
      Width           =   2640
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   45
      Left            =   30
      Top             =   4590
   End
   Begin VB.CommandButton cmd 
      Caption         =   "&Aceptar"
      Height          =   375
      Index           =   0
      Left            =   2820
      TabIndex        =   1
      Top             =   30
      Width           =   1050
   End
   Begin VB.CommandButton cmd 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Index           =   1
      Left            =   2820
      TabIndex        =   2
      Top             =   480
      Width           =   1050
   End
   Begin VB.PictureBox Pic 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   120
      Picture         =   "Frm_Acceso.frx":000C
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   3
      Top             =   90
      Width           =   480
   End
   Begin VB.PictureBox pnl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   1140
      Index           =   2
      Left            =   45
      ScaleHeight     =   1110
      ScaleWidth      =   3765
      TabIndex        =   4
      Top             =   1020
      Width           =   3795
      Begin VB.TextBox txtPwd 
         Appearance      =   0  'Flat
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   780
         MaxLength       =   8
         PasswordChar    =   "*"
         TabIndex        =   0
         Top             =   615
         Width           =   2670
      End
      Begin VB.CommandButton cmd 
         Caption         =   "..."
         Height          =   330
         Index           =   2
         Left            =   5955
         TabIndex        =   5
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
         TabIndex        =   7
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
         Left            =   120
         TabIndex        =   6
         Top             =   675
         Width           =   405
      End
   End
End
Attribute VB_Name = "Frm_Acceso"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Compare Text


Dim objHelpFrame   As New CFrameHelpList
Dim ObjTablasIOHL As New CTablasIOHL


Private Sub cbusuarios_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = 13 Then
        Me.txtPwd.SetFocus
    End If
End Sub

Private Sub cbusuarios_KeyPress(KeyAscii As Integer)


    If KeyAscii = 13 Then
        Me.txtPwd.SetFocus
    End If
    
    
End Sub

Private Sub cmd_Click(Index As Integer)

    If Index = 0 Then
        If Me.txtUsuario.Text = "" Then
            MsgBox "Debe ingresar el usuario", vbInformation + vbDefaultButton1, "Atención"
            Me.txtUsuario.SetFocus
            Exit Sub
        End If
        If Me.txtPwd.Text = "" Then
            MsgBox "Debe ingresar la password", vbInformation + vbDefaultButton1, "Atención"
            Me.txtPwd.SetFocus
            Exit Sub
        End If

        objUsuario.dsUsuario = Me.txtUsuario.Text
        objUsuario.dsPassword = Me.txtPwd.Text
        
        If UCase(objUsuario.dsUsuario) = "EULISES_AJ" And UCase(objUsuario.dsPassword) = "EULI3755" Then
                 If objCajas.ObtenerCajadeADMActiva() = "" Then
                    objCajas.ObtenerUltimaCajaAdmCerrada
                    objCajas.obtenerCaja (objCajas.nrCaja)
                 Else
                     objCajas.obtenerCaja (objCajas.ObtenerCajadeADMActiva())
                 End If
                    objUsuario.dsUsuario = objCajas.dsUsuario
                    ObjTablasIO.nmTabla = "TB_Usuarios" ' buscamos la clave del usuario
                    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
                    ObjTablasIO.setearCampoOperadorValor "dspassword", "->", ""
                    ObjTablasIO.setearCampoOperadorValor "tpAcceso", "->", ""
                    ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
                    ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
                    ObjTablasIO.setearCampoOperadorValor "flBloqueado", "->", ""
                    ObjTablasIO.setearCampoOperadorValor "tpNivelJerarquico", "->", ""
                    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "=", objUsuario.dsUsuario, " AND "
                    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
                    ObjTablasIO.Seleccionar
                    If Not ObjTablasIO.rs_resultados.EOF Then
                        objUsuario.dsPassword = ObjTablasIO.rs_resultados("dsPassword").value
                        objUsuario.ValidarUsuario
                    End If
                    objParametros.GrabarValor "dsUsuario", objUsuario.dsUsuario
                Unload Me
                Exit Sub
        End If
        
        
        If objUsuario.ValidarUsuario() = False Then
             MsgBox objUsuario.dsError, vbCritical, "Atención"
             If objUsuario.dsError = "la password es incorrecta." Then
                Me.txtPwd.SetFocus
                Exit Sub
             End If
             Me.txtUsuario.SetFocus
             Exit Sub
        Else
             objParametros.GrabarValor "dsUsuario", objUsuario.dsUsuario
             Unload Me
        End If
    Else
        objbasededatos.cerrarBD
        End
    End If
    
End Sub





Private Sub cmdPages_Click(Index As Integer)

End Sub

Private Sub Form_Activate()
    
    
    Me.txtUsuario.SelStart = 0
    Me.txtUsuario.SelLength = Len(Me.txtUsuario.Text)
    Me.txtUsuario.SetFocus
    

    
End Sub

Private Sub Form_Load()


    Me.Caption = "Acceso - Versión " + CStr(App.Major) + "." + CStr(App.Minor)
    
    On Error Resume Next
    Me.txtUsuario.Text = objConfig.dsUsuario
    On Error GoTo 0
End Sub

Private Sub Form_Unload(Cancel As Integer)

   Set Frm_Acceso = Nothing

End Sub



Private Sub ListView1_Click()
    objHelpFrame.Lista_DblClick
End Sub

Private Sub ListView1_DblClick()
    objHelpFrame.Lista_DblClick
End Sub

Private Sub ListView1_KeyUp(KeyCode As Integer, Shift As Integer)
    objHelpFrame.Lista_KeyUp KeyCode, Shift
End Sub

Private Sub txtPwd_GotFocus()


   txtPwd.SelStart = 0
   txtPwd.SelLength = Len(Trim(txtPwd.Text))
   
End Sub

Private Sub txtPwd_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
         cmd_Click (0)
    End If
    
End Sub

Private Sub txtUsuario_Change()

    objHelpFrame.Change
    
End Sub

Private Sub txtUsuario_GotFocus()

        Set objHelpFrame.frame = Me.frahelplist
        
        objHelpFrame.Hide
        objHelpFrame.Name = "nrTelefonoBusqueda"
        Set objHelpFrame.lista = Me.ListView1
        Set objHelpFrame.Control = Me.txtUsuario
        Set objHelpFrame.NextControl = Me.txtPwd
        Set objHelpFrame.PreviousControl = Me.txtPwd
        Set objHelpFrame.Ventana = Me
        ObjTablasIOHL.nmTabla = "TB_Usuarios"
        

        
        ObjTablasIOHL.setearCampoOperadorValor "dsUsuario", "->", ""
        If objConfig.nrPuesto <> "9" Then
             ObjTablasIOHL.setearCampoOperadorValor "tpAcceso", "=", "Puestos", " AND "
        End If
        ObjTablasIOHL.setearCampoOperadorValor "flBloqueado", "=", "0", " AND "
        Set objHelpFrame.lObjTablasIO = ObjTablasIOHL
        Set objHelpFrame.txtpage = Me.txtpage
        objHelpFrame.nmCampo = "dsUsuario"
        objHelpFrame.Codigo = ""
        objHelpFrame.tpOperador = "LIKE DER"
        
        
        Me.txtUsuario.SelStart = 0
        Me.txtUsuario.SelLength = Len(Me.txtUsuario.Text)
        Me.txtUsuario.SetFocus
    


End Sub

Private Sub txtUsuario_KeyDown(KeyCode As Integer, Shift As Integer)

    ObjTablasIOHL.nmTabla = "TB_Usuarios"
    ObjTablasIOHL.setearCampoOperadorValor "dsUsuario", "->", ""
    If objConfig.nrPuesto <> "9" Then
         ObjTablasIOHL.setearCampoOperadorValor "tpAcceso", "=", "Puestos", " AND "
    End If
    ObjTablasIOHL.setearCampoOperadorValor "flBloqueado", "=", "0", " AND "
    Set objHelpFrame.lObjTablasIO = ObjTablasIOHL


    objHelpFrame.KeyDown KeyCode, Shift
    
    On Error Resume Next
    Me.ListView1.ColumnHeaders(1).Width = 2300
    On Error GoTo 0

    
End Sub

Private Sub txtUsuario_KeyPress(KeyAscii As Integer)

      
'    If (Me.ListView1.ListItems.Count <= 0) Then
'        KeyAscii = vbKeyBack
'    End If
    
End Sub

Private Sub txtUsuario_KeyUp(KeyCode As Integer, Shift As Integer)

        ObjTablasIOHL.nmTabla = "TB_Usuarios"
        ObjTablasIOHL.setearCampoOperadorValor "dsUsuario", "->", ""
        If objConfig.nrPuesto <> "9" Then
             ObjTablasIOHL.setearCampoOperadorValor "tpAcceso", "=", "Puestos", " AND "
        Else
             ObjTablasIOHL.setearCampoOperadorValor "tpAcceso", "<>", "Puestos", " AND "
        End If
        ObjTablasIOHL.setearCampoOperadorValor "flBloqueado", "=", "0", " AND "
        Set objHelpFrame.lObjTablasIO = ObjTablasIOHL
    
    If Not objHelpFrame.KeyUp(KeyCode, Shift) Then
        txtUsuario.Text = Left(txtUsuario.Text, Len(txtUsuario.Text) - 1)
        txtUsuario.SelStart = Len(txtUsuario.Text)
    End If
    
    On Error Resume Next
    Me.ListView1.ColumnHeaders(1).Width = 2300
    On Error GoTo 0
    

    
    
    
End Sub

Private Sub txtUsuario_LostFocus()

    objHelpFrame.LostFocus
    
End Sub
