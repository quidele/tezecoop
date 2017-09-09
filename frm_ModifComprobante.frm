VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frm_ModifComprobante 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Modificación de Comprobantes"
   ClientHeight    =   4395
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7380
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4395
   ScaleWidth      =   7380
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtFields 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      CausesValidation=   0   'False
      Height          =   285
      Index           =   4
      Left            =   3510
      MaxLength       =   4
      ScrollBars      =   2  'Vertical
      TabIndex        =   6
      Tag             =   "@nrTalonario_new_param"
      Top             =   855
      Width           =   810
   End
   Begin VB.TextBox txtFields 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      CausesValidation=   0   'False
      Height          =   285
      Index           =   3
      Left            =   3525
      MaxLength       =   1
      TabIndex        =   8
      Tag             =   "@tpLetra_new_param"
      Text            =   "B"
      Top             =   1680
      Width           =   285
   End
   Begin VB.TextBox txtFields 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      CausesValidation=   0   'False
      Height          =   285
      Index           =   2
      Left            =   3510
      MaxLength       =   8
      ScrollBars      =   2  'Vertical
      TabIndex        =   7
      Tag             =   "@nrComprobante_new_param"
      Top             =   1290
      Width           =   1860
   End
   Begin VB.TextBox txtFields 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      CausesValidation=   0   'False
      Height          =   285
      Index           =   1
      Left            =   3510
      MaxLength       =   2
      TabIndex        =   5
      Tag             =   "@tpComprobante_new_param"
      Text            =   "FA"
      Top             =   435
      Width           =   510
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   4170
      Left            =   60
      ScaleHeight     =   4140
      ScaleWidth      =   7170
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   75
      Width           =   7200
      Begin VB.ComboBox Combox1 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   0
         ItemData        =   "frm_ModifComprobante.frx":0000
         Left            =   3420
         List            =   "frm_ModifComprobante.frx":0010
         Style           =   2  'Dropdown List
         TabIndex        =   21
         Tag             =   "@cdCondVenta_new_param"
         Top             =   2400
         Width           =   1725
      End
      Begin MSComCtl2.DTPicker dtComprobante_new_param 
         Height          =   330
         Left            =   3420
         TabIndex        =   19
         Tag             =   "@dtComprobante_new_param"
         Top             =   1965
         Width           =   1875
         _ExtentX        =   3307
         _ExtentY        =   582
         _Version        =   393216
         Format          =   132513793
         CurrentDate     =   42882
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         Height          =   285
         Index           =   0
         Left            =   945
         MaxLength       =   2
         TabIndex        =   1
         Tag             =   "@tpComprobante_param"
         Text            =   "FA"
         Top             =   330
         Width           =   510
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         Height          =   285
         Index           =   13
         Left            =   945
         MaxLength       =   8
         TabIndex        =   3
         Tag             =   "@nrComprobante_param"
         Top             =   1170
         Width           =   1860
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         Height          =   285
         Index           =   14
         Left            =   960
         MaxLength       =   1
         TabIndex        =   4
         Tag             =   "@tpLetra_param"
         Text            =   "B"
         Top             =   1575
         Width           =   285
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         Height          =   285
         Index           =   1000
         Left            =   945
         MaxLength       =   4
         TabIndex        =   2
         Tag             =   "@nrTalonario_param"
         Top             =   750
         Width           =   810
      End
      Begin VB.CommandButton cmdAceptar 
         Caption         =   "&Aceptar"
         Height          =   375
         Left            =   1710
         TabIndex        =   9
         Top             =   3510
         Width           =   1050
      End
      Begin VB.CommandButton cmdCancelar 
         Cancel          =   -1  'True
         Caption         =   "Cancelar"
         Height          =   375
         Left            =   2835
         TabIndex        =   11
         Top             =   3510
         Width           =   1050
      End
      Begin VB.Label Label14 
         BackColor       =   &H00FFC0C0&
         Caption         =   "FA / NC / ND"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   5370
         TabIndex        =   27
         Top             =   300
         Width           =   1455
      End
      Begin VB.Label Label13 
         BackColor       =   &H00FFC0C0&
         Caption         =   "00000000"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   5355
         TabIndex        =   26
         Top             =   1170
         Width           =   1305
      End
      Begin VB.Label Label12 
         BackColor       =   &H00FFC0C0&
         Caption         =   "0000"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   5355
         TabIndex        =   25
         Top             =   810
         Width           =   570
      End
      Begin VB.Label Label11 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Nuevos Datos"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   3405
         TabIndex        =   24
         Top             =   30
         Width           =   2085
      End
      Begin VB.Label Label10 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Datos Actuales"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   180
         TabIndex        =   23
         Top             =   45
         Width           =   2085
      End
      Begin VB.Label lblLabels 
         BackColor       =   &H00FFC0C0&
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
         Left            =   1800
         TabIndex        =   22
         Top             =   2475
         Width           =   1530
      End
      Begin VB.Label Label9 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Fecha"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   2685
         TabIndex        =   20
         Top             =   2025
         Width           =   570
      End
      Begin VB.Label Label4 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Nro."
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   180
         TabIndex        =   14
         Top             =   1230
         Width           =   570
      End
      Begin VB.Label Label3 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Tipo"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   180
         TabIndex        =   13
         Top             =   390
         Width           =   570
      End
      Begin VB.Label Label2 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Letra"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   165
         TabIndex        =   12
         Top             =   1620
         Width           =   570
      End
      Begin VB.Label Label1 
         BackColor       =   &H00FFC0C0&
         Caption         =   "PDV"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   180
         TabIndex        =   10
         Top             =   795
         Width           =   570
      End
   End
   Begin VB.Label Label8 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Nro."
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   2745
      TabIndex        =   18
      Top             =   1335
      Width           =   570
   End
   Begin VB.Label Label7 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Tipo"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   2745
      TabIndex        =   17
      Top             =   495
      Width           =   570
   End
   Begin VB.Label Label6 
      BackColor       =   &H00FFC0C0&
      Caption         =   "PDV"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   2745
      TabIndex        =   16
      Top             =   900
      Width           =   570
   End
   Begin VB.Label Label5 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Letra"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   2730
      TabIndex        =   15
      Top             =   1725
      Width           =   570
   End
End
Attribute VB_Name = "frm_ModifComprobante"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit



Private Function limpiarControles()
Dim Control As Object
Dim strtag  As String


    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                strtag = Mid(Control.Tag, 1, 2)
                Select Case strtag
                Case "dt"
                    On Error Resume Next
                    Control.Text = ""
                    On Error GoTo 0
                Case "fl"
                    Control.value = False
                Case Else
                    On Error Resume Next
                    Control.Text = ""
                    On Error GoTo 0
                End Select
            End If
        End If
    Next
        
End Function


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


Private Sub Form_Activate()

    ObtenerCampo("@tpComprobante_param").SetFocus
    
End Sub

Private Sub Form_Load()


                ObtenerCampo("@cdCondVenta_new_param").Clear
                ObtenerCampo("@cdCondVenta_new_param").AddItem "Contado"
                ObtenerCampo("@cdCondVenta_new_param").AddItem "Cuenta Corriente"
                ObtenerCampo("@cdCondVenta_new_param").AddItem "Tarjeta de Débito"
                ObtenerCampo("@cdCondVenta_new_param").AddItem "Tarjeta de Crédito"
                ObtenerCampo("@cdCondVenta_new_param").AddItem "Todo Pago"
                ObtenerCampo("@cdCondVenta_new_param").AddItem "Retorno"
                
                
End Sub

Private Sub Form_Unload(Cancel As Integer)

    objbasededatos.CommandTimeout = 120

End Sub

Private Sub txtFields_Change(Index As Integer)

'If Me.txtFields(Index).Tag <> "" Then
'End If
    
End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
       If Me.txtFields(Index).Tag <> "" Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("SP_ActualizarComprobante_v4_9_7", _
                            Me.txtFields(Index), KeyAscii)
       End If
    End If

End Sub


Private Sub txtFields_LostFocus(Index As Integer)

    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "SP_ActualizarComprobante_v4_9_7", _
                              Me.txtFields(Index), "LostFocus"
    End If

End Sub


Private Sub txtFields_GotFocus(Index As Integer)


    DoEvents

    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "SP_ActualizarComprobante_v4_9_7", _
                                  Me.txtFields(Index), "GotFocus"
    End If


End Sub

Private Sub cmdAceptar_Click()
Dim resp As Byte


        resp = MsgBox("Confirma la modificación del comprobante", vbQuestion + vbYesNo, "Atención")
        
        If resp = vbNo Then Exit Sub
        
        MousePointer = vbHourglass
        If relizarModificacionenBD() Then
            MsgBox "La modificación se ha realizado con éxito.", vbInformation, "Atención"
        End If
        MousePointer = vbDefault
        
        
End Sub


Private Function ValidarEntrada() As Boolean

   
   ' Falta validar usuario y puesto
   
   ValidarEntrada = True

End Function



Private Sub cmdCancelar_Click()

    objParametros.GrabarValor "Cancela", "SI"
    Unload Me
    
End Sub

Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If
    
End Sub

Private Sub HabilitarCampos(nmCampo As String, habilitar As Boolean)
    ' Habilitar = True Habilita
    ' Habilitar = False Deshabilita
    If Not habilitar Then
          ObtenerCampo(nmCampo).Locked = True
          ObtenerCampo(nmCampo).BackColor = Gris '&HE0E0E0
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
          ObtenerCampo(nmCampo).Locked = False
    End If

End Sub




Private Function relizarModificacionenBD() As Boolean

    relizarModificacionenBD = False

    
    
    objSPs.nmStoredProcedure = "SP_ActualizarComprobante_v4_9_7"
    objSPs.setearCampoValor "@nrTalonario_param", ObtenerCampo("@nrTalonario_param")
    objSPs.setearCampoValor "@nrComprobante_param", ObtenerCampo("@nrComprobante_param")
        objSPs.setearCampoValor "@tpComprobante_param", ObtenerCampo("@tpComprobante_param")
        objSPs.setearCampoValor "@tpLetra_param", ObtenerCampo("@tpLetra_param")
        objSPs.setearCampoValor "@nrTalonario_new_param", ObtenerCampo("@nrTalonario_new_param")
        objSPs.setearCampoValor "@nrComprobante_new_param", ObtenerCampo("@nrComprobante_new_param")
        objSPs.setearCampoValor "@tpComprobante_new_param", ObtenerCampo("@tpComprobante_new_param")
        objSPs.setearCampoValor "@tpLetra_new_param", ObtenerCampo("@tpLetra_new_param")
        objSPs.setearCampoValor "@dtComprobante_new_param", ObtenerCampo("@dtComprobante_new_param")
        ' objSPs.setearCampoValor "@vlComision_new_param", "null"
        objSPs.setearCampoValor "@cdCondVenta_new_param", ObtenerCampo("@cdCondVenta_new_param")
        
        objSPs.setearCampoValor "@solo_cambio_cabecera_comprobante", "NO"
        

    If Not objSPs.ExecSP() Then
        MsgBox "ERROR: " + objSPs.Error, vbCritical, "Atención"
        Exit Function
    End If


    If objSPs.rs_resultados("Resultado") = "ERROR" Then
        MsgBox "ERROR: " + objSPs.rs_resultados("DescripcionError"), vbCritical, "Atención"
        Exit Function
    End If
    
    
    relizarModificacionenBD = True
    
    
    
End Function
