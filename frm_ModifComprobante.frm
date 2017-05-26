VERSION 5.00
Begin VB.Form frm_ModifComprobante 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Modificación de Comprobantes"
   ClientHeight    =   3255
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6045
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3255
   ScaleWidth      =   6045
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
      Tag             =   "nrTalonario_nuevo"
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
      Tag             =   "tpLetra_nuevo"
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
      Tag             =   "nrComprobante_nuevo"
      Top             =   1275
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
      Tag             =   "tpComprobante_nuevo"
      Top             =   435
      Width           =   510
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   3030
      Left            =   90
      ScaleHeight     =   3000
      ScaleWidth      =   5820
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   105
      Width           =   5850
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         Height          =   285
         Index           =   0
         Left            =   945
         MaxLength       =   2
         TabIndex        =   1
         Tag             =   "@tpComprobante"
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
         Tag             =   "nrComprobante"
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
         Tag             =   "tpLetra"
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
         Tag             =   "nrTalonario"
         Top             =   750
         Width           =   810
      End
      Begin VB.CommandButton cmdAceptar 
         Caption         =   "&Aceptar"
         Height          =   375
         Left            =   135
         TabIndex        =   9
         Top             =   2235
         Width           =   1050
      End
      Begin VB.CommandButton cmdCancelar 
         Cancel          =   -1  'True
         Caption         =   "Cancelar"
         Height          =   375
         Left            =   1260
         TabIndex        =   11
         Top             =   2235
         Width           =   1050
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

    ObtenerCampo("tpComprobante").SetFocus
    
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
        Else
            MsgBox "Error: " + objbasededatos.Error, vbCritical, "Atención"
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
    objSPs.setearCampoValor "@nrTalonario_param", ObtenerCampo("nrTalonario")
    objSPs.setearCampoValor "@nrComprobante_param", ObtenerCampo("nrComprobante")
        objSPs.setearCampoValor "@tpComprobante_param", ObtenerCampo("tpComprobante")
        objSPs.setearCampoValor "@tpLetra_param", ObtenerCampo("tpLetra")
        objSPs.setearCampoValor "@nrTalonario_new_param", ObtenerCampo("nrTalonario_nuevo")
        objSPs.setearCampoValor "@nrComprobante_new_param", ObtenerCampo("nrComprobante_nuevo")
        objSPs.setearCampoValor "@tpComprobante_new_param", ObtenerCampo("tpComprobante_nuevo")
        objSPs.setearCampoValor "@tpLetra_new_param", ObtenerCampo("tpLetra_nuevo")
        objSPs.setearCampoValor "@dtComprobante_new_param", ObtenerCampo("dtComprobante_nuevo")
        objSPs.setearCampoValor "@solo_cambio_cabecera_comprobante", "SI"
        

    If Not objSPs.ExecSP() Then
        MsgBox "ERROR: " + objSPs.Error, vbCritical, "Atención"
        Exit Function
    End If

    
    
    relizarModificacionenBD = True
    
    
    
End Function
