VERSION 5.00
Begin VB.Form frm_SalidasAFIP 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Salidas AFIP"
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
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   0
         Left            =   975
         TabIndex        =   7
         Tag             =   "anio"
         Top             =   1170
         Width           =   810
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   13
         Left            =   150
         TabIndex        =   6
         Tag             =   "mes"
         Top             =   1170
         Width           =   810
      End
      Begin VB.CommandButton cmdAceptar 
         Caption         =   "&Aceptar"
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   1995
         Width           =   1050
      End
      Begin VB.CommandButton cmdCancelar 
         Cancel          =   -1  'True
         Caption         =   "Cancelar"
         Height          =   375
         Left            =   1230
         TabIndex        =   2
         Top             =   1995
         Width           =   1050
      End
      Begin VB.ComboBox cbSoportes 
         Height          =   315
         ItemData        =   "frm_SalidasAFIP.frx":0000
         Left            =   180
         List            =   "frm_SalidasAFIP.frx":0007
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   465
         Width           =   5325
      End
      Begin VB.Label Label2 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Año"
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
         Left            =   990
         TabIndex        =   9
         Top             =   930
         Width           =   570
      End
      Begin VB.Label Label1 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Mes"
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
         TabIndex        =   8
         Top             =   915
         Width           =   570
      End
      Begin VB.Label lbldiferencia 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3300
         TabIndex        =   5
         Top             =   2190
         Visible         =   0   'False
         Width           =   2175
      End
      Begin VB.Label Label3 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Aplicativo"
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
         TabIndex        =   4
         Top             =   210
         Width           =   1230
      End
   End
End
Attribute VB_Name = "frm_SalidasAFIP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Const FONDO_FIJO_MINIMO = 1

Dim objCajas          As New CCajas



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

Private Sub BloquearControles(pbValor As Boolean)


    

End Sub







Private Sub cbPuestos_Change()

End Sub

Private Sub Form_Load()
Dim objControl As New CControl
Dim rs         As Object

    
    
    objbasededatos.CommandTimeout = 120 * 10
    
    ' cargmos los puestos de facturacion
    'Set rs = objPuestos.obtenerPuestosDisponibles
    'objControl.CargarComboConData Me.cbPuestos, rs, rs("dsPuesto"), rs("nrPuesto")
    


End Sub






Private Sub Form_Unload(Cancel As Integer)

    objbasededatos.CommandTimeout = 120

End Sub

Private Sub txtFields_Change(Index As Integer)

'If Me.txtFields(Index).Tag <> "" Then
'End If
    
End Sub


'Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
'Dim tabindexsig As Integer
'
'    If Not KeyAscii = vbKeyReturn Then
'       If Me.txtFields(Index).Tag <> "" Then
'        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cajas", _
'                            Me.txtFields(Index), KeyAscii)
'       End If
'    End If
'
'End Sub

'
'Private Sub txtFields_LostFocus(Index As Integer)
'
'    If Me.txtFields(Index).Tag <> "" Then
'        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
'                              Me.txtFields(Index), "LostFocus"
'    End If
'
'End Sub
'
'
'Private Sub txtFields_GotFocus(Index As Integer)
'
'
'    DoEvents
'
'    If Me.txtFields(Index).Tag <> "" Then
'        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
'                                  Me.txtFields(Index), "GotFocus"
'    End If
'
'
'End Sub

Private Sub cmdAceptar_Click()
Dim resp As Byte


        resp = MsgBox("Confirma la generación del archivo", vbQuestion + vbYesNo, "Atención")
        
        If resp = vbNo Then Exit Sub
        
        MousePointer = vbHourglass
        
        Select Case Me.cbSoportes.Text
            Case "CITI Ventas Comprobantes y Alicuotas"
                    If Not generarArchivo_CITI_Ventas_Comprobantes() Then
                        MousePointer = vbDefault
                        Exit Sub
                    End If
                    If Not generarArchivo_CITI_Ventas_Alicuotas() Then
                        MousePointer = vbDefault
                        Exit Sub
                    End If
                    MousePointer = vbDefault
                    MsgBox "El proceso se ha generado con éxito, verifique la generación del archivo en la carpeta AFIP.", vbInformation, "Atención"
                    Exit Sub
        End Select
        MousePointer = vbDefault
        
        
End Sub




Private Function generarArchivo_CITI_Ventas_Comprobantes() As Boolean
Dim Control     As Control
Dim strtag      As String
Dim strPrefijo  As String
Dim strValor    As Variant
Dim strCaja     As String
Dim nrPuesto    As String
Dim objControl  As New CControl


    generarArchivo_CITI_Ventas_Comprobantes = False

    
    
    objSPs.nmStoredProcedure = "spu_obtieneDatosCITIVentas_v4_9"
    objSPs.setearCampoValor "@mes", ObtenerCampo("mes")
    objSPs.setearCampoValor "@anio", ObtenerCampo("anio")
    
    If Not objSPs.ExecSP() Then
        MsgBox "ERROR: " + objSPs.Error, vbCritical, "Atención"
        Exit Function
    End If

    
    
    generarArchivo_CITI_Ventas_Comprobantes = True
    
    
    
End Function


Private Function generarArchivo_CITI_Ventas_Alicuotas() As Boolean
Dim Control     As Control
Dim strtag      As String
Dim strPrefijo  As String
Dim strValor    As Variant
Dim strCaja     As String
Dim nrPuesto    As String
Dim objControl  As New CControl


    generarArchivo_CITI_Ventas_Alicuotas = False

    
    objSPs.nmStoredProcedure = "spu_obtieneDatosCITIVentas_Alicuotas_v4_9"
    objSPs.setearCampoValor "@mes", ObtenerCampo("mes")
    objSPs.setearCampoValor "@anio", ObtenerCampo("anio")
    
    If Not objSPs.ExecSP() Then
        MsgBox "ERROR: " + objSPs.Error, vbCritical, "Atención"
        Exit Function
    End If

    
    
    generarArchivo_CITI_Ventas_Alicuotas = True
    
    
    
End Function



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


