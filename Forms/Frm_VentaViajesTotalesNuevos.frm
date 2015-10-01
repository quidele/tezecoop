VERSION 5.00
Begin VB.Form Frm_VentaViajesTotalesNuevos 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "         Confirme Valores de Pago"
   ClientHeight    =   3090
   ClientLeft      =   6060
   ClientTop       =   2775
   ClientWidth     =   5340
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   HelpContextID   =   1
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3090
   ScaleWidth      =   5340
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
      Height          =   495
      Left            =   60
      TabIndex        =   1
      Top             =   2430
      Width           =   2500
   End
   Begin VB.CommandButton cmdCancelar 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   495
      Left            =   2685
      TabIndex        =   3
      Top             =   2430
      Width           =   2500
   End
   Begin VB.PictureBox pnl 
      BackColor       =   &H00FFC0C0&
      Height          =   2235
      Index           =   2
      Left            =   90
      ScaleHeight     =   2175
      ScaleWidth      =   5070
      TabIndex        =   2
      Top             =   105
      Width           =   5130
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   7
         Left            =   3585
         Locked          =   -1  'True
         TabIndex        =   15
         TabStop         =   0   'False
         Tag             =   "vlTotalGeneral"
         Text            =   "0"
         Top             =   375
         Width           =   1095
      End
      Begin VB.TextBox txtTotales 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   20
         Left            =   2205
         Locked          =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   14
         TabStop         =   0   'False
         Tag             =   "vlTotalDolares"
         Text            =   "0"
         Top             =   360
         Width           =   1200
      End
      Begin VB.TextBox txtTotales 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   21
         Left            =   930
         Locked          =   -1  'True
         TabIndex        =   13
         TabStop         =   0   'False
         Tag             =   "vlTotalEuros"
         Text            =   "0"
         Top             =   360
         Width           =   1110
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   9
         Left            =   915
         TabIndex        =   12
         Tag             =   "vlPagoEuros"
         Text            =   "0"
         Top             =   690
         Width           =   1110
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   17
         Left            =   2205
         TabIndex        =   11
         Tag             =   "vlPagoDolares"
         Text            =   "0"
         Top             =   705
         Width           =   1200
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   18
         Left            =   3585
         ScrollBars      =   2  'Vertical
         TabIndex        =   10
         TabStop         =   0   'False
         Tag             =   "vlPagoPesos"
         Text            =   "0"
         Top             =   690
         Width           =   1095
      End
      Begin VB.TextBox txtSaldos 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   21
         Left            =   3585
         Locked          =   -1  'True
         TabIndex        =   9
         TabStop         =   0   'False
         Tag             =   "vlSaldoPesos"
         Text            =   "0"
         Top             =   1020
         Width           =   1095
      End
      Begin VB.TextBox txtSaldos 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   22
         Left            =   2205
         Locked          =   -1  'True
         TabIndex        =   8
         TabStop         =   0   'False
         Tag             =   "vlSaldoDolares"
         Text            =   "0"
         Top             =   1020
         Width           =   1200
      End
      Begin VB.TextBox txtSaldos 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Index           =   24
         Left            =   930
         Locked          =   -1  'True
         TabIndex        =   7
         TabStop         =   0   'False
         Tag             =   "vlSaldoEuros"
         Text            =   "0"
         Top             =   1020
         Width           =   1110
      End
      Begin VB.CommandButton cmdCalcular 
         Height          =   285
         Left            =   4695
         Picture         =   "Frm_VentaViajesTotalesNuevos.frx":0000
         Style           =   1  'Graphical
         TabIndex        =   6
         TabStop         =   0   'False
         ToolTipText     =   "Borrar Valores"
         Top             =   705
         Width           =   285
      End
      Begin VB.ComboBox Combox1 
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
         ItemData        =   "Frm_VentaViajesTotalesNuevos.frx":00F2
         Left            =   180
         List            =   "Frm_VentaViajesTotalesNuevos.frx":0108
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Tag             =   "cdCondVenta"
         Top             =   1635
         Width           =   4545
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
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Caption         =   "ó"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   3420
         TabIndex        =   27
         Top             =   1080
         Width           =   165
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "ó"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   2040
         TabIndex        =   26
         Top             =   1080
         Width           =   165
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "Total Pesos"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   3330
         TabIndex        =   25
         Top             =   150
         Width           =   1245
      End
      Begin VB.Label Label21 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "Total u$s"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   2250
         TabIndex        =   24
         Top             =   150
         Width           =   945
      End
      Begin VB.Label Label22 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "Total Euros"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   1110
         TabIndex        =   23
         Top             =   150
         Width           =   1050
      End
      Begin VB.Label Label24 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFC0C0&
         Caption         =   "A Cobrar"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   -75
         TabIndex        =   22
         Top             =   450
         Width           =   915
      End
      Begin VB.Label Label25 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFC0C0&
         Caption         =   "A Pagar"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   -90
         TabIndex        =   21
         Top             =   765
         Width           =   915
      End
      Begin VB.Label Label26 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFC0C0&
         Caption         =   "Vuelto"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   -105
         TabIndex        =   20
         Top             =   1065
         Width           =   915
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         Caption         =   "ó"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   3420
         TabIndex        =   19
         Top             =   420
         Width           =   165
      End
      Begin VB.Label Label16 
         Alignment       =   2  'Center
         Caption         =   "ó"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   2040
         TabIndex        =   18
         Top             =   420
         Width           =   165
      End
      Begin VB.Label Label17 
         Alignment       =   2  'Center
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   3420
         TabIndex        =   17
         Top             =   750
         Width           =   165
      End
      Begin VB.Label Label20 
         Alignment       =   2  'Center
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   2055
         TabIndex        =   16
         Top             =   780
         Width           =   165
      End
      Begin VB.Label lblLabels 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Cond. de Venta"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   2
         Left            =   165
         TabIndex        =   5
         Top             =   1440
         Width           =   4530
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
Attribute VB_Name = "Frm_VentaViajesTotalesNuevos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Compare Text

Dim flModificado As Boolean





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


Private Sub cmdAceptar_Click()

    objParametros.GrabarValor "vlPagoEuros", FormatNumber(AdaptarValorNumerico(ObtenerCampo("vlPagoEuros").Text), 2)
    objParametros.GrabarValor "vlPagoDolares", FormatNumber(AdaptarValorNumerico(ObtenerCampo("vlPagoDolares").Text), 2)
    objParametros.GrabarValor "vlPagoPesos", FormatNumber(AdaptarValorNumerico(ObtenerCampo("vlPagoPesos").Text), 2)
    objParametros.GrabarValor "cdCondVenta", ObtenerCampo("cdCondVenta").Text
    objParametros.GrabarValor "Facturar", "SI"
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
    Else
        HabilitarCampos "vlPagoEuros", True
        HabilitarCampos "vlPagoDolares", True
        HabilitarCampos "vlPagoPesos", True
    End If
    
    
End Sub

Private Sub Combox1_KeyPress(Index As Integer, KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        cmdAceptar_Click
    End If

End Sub

Private Sub Form_Load()

    flModificado = False
    
    objParametros.GrabarValor "Facturar", "NO"
    If objParametros.ObtenerValor("cdCondVenta") = "Cuenta Corriente" Or _
       objParametros.ObtenerValor("cdCondVenta") = "Cobro en Destino" Or _
       objParametros.ObtenerValor("cdCondVenta") = "Retorno" Or _
       objParametros.ObtenerValor("cdCondVenta") = "Tarjeta de Débito" Or _
       objParametros.ObtenerValor("cdCondVenta") = "Tarjeta de Crédito" Then
        HabilitarCampos "vlPagoEuros", False
        HabilitarCampos "vlPagoDolares", False
        HabilitarCampos "vlPagoPesos", False
    End If
    
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
                            
            Select Case txtFields(Index).Tag
            Case "vlPagoEuros"
                If Not flModificado Then
                    ObtenerCampo("vlPagoDolares").Text = "0,00"
                    ObtenerCampo("vlPagoPesos").Text = "0,00"
                    flModificado = True
                End If
                
            Case "vlPagoDolares"
                If Not flModificado Then
                    ObtenerCampo("vlPagoEuros").Text = "0,00"
                    ObtenerCampo("vlPagoPesos").Text = "0,00"
                    flModificado = True
                End If
            Case "vlPagoPesos"
                If Not flModificado Then
                    ObtenerCampo("vlPagoEuros").Text = "0,00"
                    ObtenerCampo("vlPagoDolares").Text = "0,00"
                    flModificado = True
                End If
            End Select
    Else
                
        Select Case txtFields(Index).Tag
        Case "vlPagoEuros"
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
