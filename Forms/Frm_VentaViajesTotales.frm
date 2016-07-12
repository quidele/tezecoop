VERSION 5.00
Begin VB.Form Frm_VentaViajesTotales 
   Appearance      =   0  'Flat
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "         Confirme los valores de Pago"
   ClientHeight    =   4125
   ClientLeft      =   6060
   ClientTop       =   2775
   ClientWidth     =   4680
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   HelpContextID   =   1
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4125
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
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
      Left            =   1020
      TabIndex        =   8
      Top             =   3435
      Width           =   1050
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   2340
      TabIndex        =   10
      Top             =   3435
      Width           =   1050
   End
   Begin VB.PictureBox pnl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   3060
      Index           =   2
      Left            =   90
      ScaleHeight     =   3030
      ScaleWidth      =   4410
      TabIndex        =   9
      Top             =   165
      Width           =   4440
      Begin VB.ComboBox Combox1 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   1
         ItemData        =   "Frm_VentaViajesTotales.frx":0000
         Left            =   120
         List            =   "Frm_VentaViajesTotales.frx":0013
         Locked          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Tag             =   "tpDocTarjeta"
         Top             =   2400
         Width           =   1725
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   5
         Left            =   1920
         MaxLength       =   20
         TabIndex        =   2
         Tag             =   "nrDocTarjeta"
         Top             =   2385
         Width           =   2385
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   4
         Left            =   2220
         MaxLength       =   4
         TabIndex        =   0
         Tag             =   "nrTarjeta"
         Top             =   1650
         Width           =   2025
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   435
         IMEMode         =   3  'DISABLE
         Index           =   3
         Left            =   1140
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   4
         Tag             =   "vlPagoReales"
         Text            =   "0,00"
         Top             =   360
         Width           =   1035
      End
      Begin VB.ComboBox Combox1 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   0
         ItemData        =   "Frm_VentaViajesTotales.frx":0033
         Left            =   75
         List            =   "Frm_VentaViajesTotales.frx":0049
         Locked          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Tag             =   "cdCondVenta"
         Top             =   1170
         Width           =   4245
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   435
         IMEMode         =   3  'DISABLE
         Index           =   2
         Left            =   3270
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   6
         Tag             =   "vlPagoPesos"
         Text            =   "0,00"
         Top             =   360
         Width           =   1035
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   435
         IMEMode         =   3  'DISABLE
         Index           =   1
         Left            =   2205
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   5
         Tag             =   "vlPagoDolares"
         Text            =   "0,00"
         Top             =   360
         Width           =   1035
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   435
         IMEMode         =   3  'DISABLE
         Index           =   0
         Left            =   75
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   3
         Tag             =   "vlPagoEuros"
         Text            =   "0,00"
         Top             =   360
         Width           =   1035
      End
      Begin VB.CommandButton cmd 
         Caption         =   "..."
         Height          =   330
         Index           =   2
         Left            =   5955
         TabIndex        =   11
         Top             =   240
         Width           =   330
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Tipo Doc."
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   6
         Left            =   180
         TabIndex        =   19
         Top             =   2160
         Width           =   720
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Documento"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   5
         Left            =   1800
         TabIndex        =   18
         Top             =   2160
         Width           =   840
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Ultimos 4 Nros de la Tarjeta"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   4
         Left            =   120
         TabIndex        =   17
         Top             =   1680
         Width           =   1950
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Total Reales"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   3
         Left            =   1200
         TabIndex        =   16
         Top             =   135
         Width           =   900
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Cond. de Venta"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   2
         Left            =   105
         TabIndex        =   15
         Top             =   960
         Width           =   3180
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Total Pesos"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   0
         Left            =   3330
         TabIndex        =   14
         Top             =   150
         Width           =   900
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Total u$s"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   1
         Left            =   2235
         TabIndex        =   13
         Top             =   135
         Width           =   1005
      End
      Begin VB.Label lbl 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Total Euros"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   2
         Left            =   30
         TabIndex        =   12
         Top             =   120
         Width           =   1050
      End
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   0
      Left            =   6855
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   1
      Left            =   7485
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   2
      Left            =   8085
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   3
      Left            =   8685
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   4
      Left            =   9285
      Top             =   360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   5
      Left            =   6840
      Top             =   870
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   6
      Left            =   7485
      Top             =   870
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   7
      Left            =   8085
      Top             =   855
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   8
      Left            =   8670
      Top             =   840
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   9
      Left            =   9270
      Top             =   840
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   10
      Left            =   6855
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   11
      Left            =   7575
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   12
      Left            =   8100
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   13
      Left            =   8700
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   14
      Left            =   9300
      Top             =   1365
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   15
      Left            =   6900
      Top             =   1830
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   16
      Left            =   7485
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   17
      Left            =   8085
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   18
      Left            =   8685
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   19
      Left            =   9285
      Top             =   1845
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   20
      Left            =   6900
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   21
      Left            =   7530
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   22
      Left            =   8130
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   23
      Left            =   8730
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   24
      Left            =   9300
      Top             =   2355
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   25
      Left            =   6900
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   26
      Left            =   7515
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   27
      Left            =   8130
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   28
      Left            =   8730
      Top             =   2820
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   29
      Left            =   9330
      Top             =   2835
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   30
      Left            =   6915
      Top             =   3360
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   31
      Left            =   7530
      Top             =   3390
      Width           =   480
   End
   Begin VB.Image ImgGrades 
      Height          =   480
      Index           =   32
      Left            =   8205
      Top             =   3375
      Width           =   480
   End
End
Attribute VB_Name = "Frm_VentaViajesTotales"
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



Private Function validarEntradadedatos() As Boolean
    
    If ObtenerCampo("cdCondVenta").Text = "Tarjeta de Débito" Or _
                        ObtenerCampo("cdCondVenta").Text = "Tarjeta de Crédito" Then
       If ObtenerCampo("nrTarjeta").Text = "" Then
            MsgBox "Debe completar el número de la tajeta", vbInformation + vbDefaultButton1
            Exit Function
       End If
       If ObtenerCampo("tpDocTarjeta").Text = "" Then
            MsgBox "Debe completar el tipo de documento del titular de la tarjeta", vbInformation + vbDefaultButton1
            Exit Function
       End If
             If ObtenerCampo("nrDocTarjeta").Text = "" Then
            MsgBox "Debe completar el número de documento del titular de la tarjeta", vbInformation + vbDefaultButton1
            Exit Function
       End If
    End If
                        
    validarEntradadedatos = True

End Function




Private Sub cmdAceptar_Click()


    If Not validarEntradadedatos() Then
        Exit Sub
    End If

    

    objParametros.GrabarValor "vlPagoEuros", FormatNumber(AdaptarValorNumerico(ObtenerCampo("vlPagoEuros").Text), 2)
    objParametros.GrabarValor "vlPagoDolares", FormatNumber(AdaptarValorNumerico(ObtenerCampo("vlPagoDolares").Text), 2)
    objParametros.GrabarValor "vlPagoPesos", FormatNumber(AdaptarValorNumerico(ObtenerCampo("vlPagoPesos").Text), 2)
    objParametros.GrabarValor "vlPagoReales", FormatNumber(AdaptarValorNumerico(ObtenerCampo("vlPagoReales").Text), 2)
    objParametros.GrabarValor "cdCondVenta", ObtenerCampo("cdCondVenta").Text
    objParametros.GrabarValor "Facturar", "SI"
    
    objParametros.GrabarValor "Frm_VentaViajesTotales.nrTarjeta", ObtenerCampo("nrTarjeta").Text
    objParametros.GrabarValor "Frm_VentaViajesTotales.tpDocTarjeta", ObtenerCampo("tpDocTarjeta").Text
    objParametros.GrabarValor "Frm_VentaViajesTotales.nrDocTarjeta", ObtenerCampo("nrDocTarjeta").Text

       
    
    Unload Me
    
End Sub


Private Sub HabilitarCampos(nmCampo As String, habilitar As Boolean)
    'habilitar = True Habilita
    'habilitar = False Deshabilita
    If Not habilitar Then
          ObtenerCampo(nmCampo).Locked = True
          ObtenerCampo(nmCampo).BackColor = Gris '&HE0E0E0
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
          ObtenerCampo(nmCampo).Locked = False
    End If

End Sub

Private Sub cmdCancelar_Click()

         
    objParametros.GrabarValor "Facturar", "NO"
    
    Unload Me
    
End Sub

Private Sub Combox1_Click(Index As Integer)

    If ObtenerCampo("cdCondVenta").Text = "Cuenta Corriente" Or _
     objParametros.ObtenerValor("cdCondVenta") = "Cobro en Destino" Or _
     objParametros.ObtenerValor("cdCondVenta") = "Retorno" Or _
     objParametros.ObtenerValor("cdCondVenta") = "Tarjeta de Débito" Or _
     objParametros.ObtenerValor("cdCondVenta") = "Tarjeta de Crédito" Then
        ObtenerCampo("vlPagoEuros").Text = "0,00"
        ObtenerCampo("vlPagoDolares").Text = "0,00"
        ObtenerCampo("vlPagoPesos").Text = "0,00"
        HabilitarCampos "vlPagoEuros", False
        HabilitarCampos "vlPagoDolares", False
        HabilitarCampos "vlPagoPesos", False
        HabilitarCampos "vlPagoReales", False
    End If
    
    If objParametros.ObtenerValor("cdCondVenta") = "Tarjeta de Débito" Or _
                        objParametros.ObtenerValor("cdCondVenta") = "Tarjeta de Crédito" Then
        HabilitarCampos "nrTarjeta", True
        HabilitarCampos "tpDocTarjeta", True
        HabilitarCampos "nrDocTarjeta", True
    Else
        HabilitarCampos "nrTarjeta", False
        HabilitarCampos "tpDocTarjeta", False
        HabilitarCampos "nrDocTarjeta", False
    End If
       
End Sub

Private Sub Combox1_KeyPress(Index As Integer, KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        cmdAceptar_Click
    End If

End Sub

Private Sub Form_Load()
    
    
    objParametros.GrabarValor "Frm_VentaViajesTotales.nrTarjeta", ""
    objParametros.GrabarValor "Frm_VentaViajesTotales.tpDocTarjeta", ""
    objParametros.GrabarValor "Frm_VentaViajesTotales.nrDocTarjeta", ""
    
    
    objParametros.GrabarValor "Facturar", "NO"
    If objParametros.ObtenerValor("cdCondVenta") = "Cuenta Corriente" Or _
       objParametros.ObtenerValor("cdCondVenta") = "Cobro en Destino" Or _
       objParametros.ObtenerValor("cdCondVenta") = "Retorno" Or _
       objParametros.ObtenerValor("cdCondVenta") = "Tarjeta de Débito" Or _
       objParametros.ObtenerValor("cdCondVenta") = "Tarjeta de Crédito" Then
        HabilitarCampos "vlPagoEuros", False
        HabilitarCampos "vlPagoDolares", False
        HabilitarCampos "vlPagoPesos", False
        HabilitarCampos "vlPagoReales", False
    End If
    
    ObtenerCampo("vlPagoReales").Text = FormatNumber(AdaptarValorNumerico(objParametros.ObtenerValor("vlPagoReales")), 2)
    ObtenerCampo("vlPagoEuros").Text = FormatNumber(AdaptarValorNumerico(objParametros.ObtenerValor("vlPagoEuros")), 2)
    ObtenerCampo("vlPagoDolares").Text = FormatNumber(AdaptarValorNumerico(objParametros.ObtenerValor("vlPagoDolares")), 2)
    ObtenerCampo("vlPagoPesos").Text = FormatNumber(AdaptarValorNumerico(objParametros.ObtenerValor("vlPagoPesos")), 2)
    ObtenerCampo("cdCondVenta").Text = objParametros.ObtenerValor("cdCondVenta")
    

End Sub

Private Sub txtFields_GotFocus(Index As Integer)

   If Me.txtFields(Index).Tag <> "" And Me.txtFields(Index).Text <> "" Then
            objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                                      Me.txtFields(Index), "GotFocus"

    End If
    
End Sub

Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)


    If Not KeyAscii = vbKeyReturn Then
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Comprobantes", _
                                Me.txtFields(Index), KeyAscii)
    Else
                
        Select Case txtFields(Index).Tag
        Case "vlPagoEuros"
            ObtenerCampo("vlPagoReales").SetFocus
        Case "vlPagoReales"
            ObtenerCampo("vlPagoDolares").SetFocus
        Case "vlPagoDolares"
            ObtenerCampo("vlPagoPesos").SetFocus
        Case "vlPagoPesos"
            Me.Combox1(0).SetFocus
        End Select
    End If
    
End Sub

Private Sub txtFields_LostFocus(Index As Integer)
   If Me.txtFields(Index).Tag <> "" And Me.txtFields(Index).Text <> "" Then
            objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                                      Me.txtFields(Index), "GotFocus"

    End If
End Sub
