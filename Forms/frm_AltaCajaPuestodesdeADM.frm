VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frm_AltaCajaPuestodesdeADM 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Crear una caja puesto desde la Administración"
   ClientHeight    =   5625
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8235
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5625
   ScaleWidth      =   8235
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   5400
      Left            =   105
      ScaleHeight     =   5370
      ScaleWidth      =   7920
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   90
      Width           =   7950
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8,25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   3
         Left            =   5190
         TabIndex        =   26
         Tag             =   "vlFondoFijoReales"
         Top             =   810
         Width           =   1230
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   14
         Left            =   5145
         Locked          =   -1  'True
         TabIndex        =   24
         TabStop         =   0   'False
         Tag             =   "vlDiaReal"
         Top             =   2925
         Width           =   2430
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   7
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   21
         TabStop         =   0   'False
         Tag             =   "vlDiaDolar"
         Top             =   2925
         Width           =   2415
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   8
         Left            =   2685
         Locked          =   -1  'True
         TabIndex        =   20
         TabStop         =   0   'False
         Tag             =   "vlDiaEuro"
         Top             =   2925
         Width           =   2430
      End
      Begin VB.ComboBox cbPuestos 
         Height          =   315
         Left            =   180
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   465
         Width           =   3495
      End
      Begin VB.ComboBox cbusuarios 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   315
         ItemData        =   "frm_AltaCajaPuestodesdeADM.frx":0000
         Left            =   210
         List            =   "frm_AltaCajaPuestodesdeADM.frx":000A
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Tag             =   "tpCliente"
         Top             =   1170
         Width           =   3510
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8,25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   2
         Left            =   5190
         TabIndex        =   5
         Tag             =   "vlFondoFijoEuros"
         Top             =   1470
         Width           =   1230
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8,25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   1
         Left            =   5190
         TabIndex        =   4
         Tag             =   "vlFondoFijoDolares"
         Top             =   1155
         Width           =   1230
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8,25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Index           =   0
         Left            =   5190
         TabIndex        =   3
         Tag             =   "vlFondoFijoPesos"
         Top             =   465
         Width           =   1230
      End
      Begin VB.CommandButton cmdCancelar 
         Cancel          =   -1  'True
         Caption         =   "Cancelar"
         Height          =   375
         Left            =   2700
         TabIndex        =   12
         Top             =   4800
         Width           =   1050
      End
      Begin VB.CommandButton cmdAceptar 
         Caption         =   "&Aceptar"
         Height          =   375
         Left            =   1530
         TabIndex        =   11
         Top             =   4815
         Width           =   1050
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   990
         Index           =   25
         Left            =   195
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   10
         Tag             =   "dsObservacion"
         Top             =   3615
         Width           =   5220
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   360
         Index           =   0
         Left            =   1695
         TabIndex        =   6
         Tag             =   "dtApertura"
         Top             =   1740
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   635
         _Version        =   393216
         Format          =   111935489
         CurrentDate     =   38267
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   345
         Index           =   1
         Left            =   1710
         TabIndex        =   8
         Tag             =   "dtCierre"
         Top             =   2175
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   609
         _Version        =   393216
         Format          =   111935489
         CurrentDate     =   38267
      End
      Begin MSComCtl2.DTPicker nrHoraApertura 
         Height          =   315
         Left            =   3495
         TabIndex        =   7
         Tag             =   "hrApertura"
         Top             =   1770
         Width           =   765
         _ExtentX        =   1349
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "HH:MM"
         Format          =   111935490
         CurrentDate     =   36494
      End
      Begin MSComCtl2.DTPicker nrHoraCierre 
         Height          =   315
         Left            =   3495
         TabIndex        =   9
         Tag             =   "hrCierre"
         Top             =   2190
         Width           =   765
         _ExtentX        =   1349
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "HH:MM"
         Format          =   111935490
         CurrentDate     =   36494
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Valor Real"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   5145
         TabIndex        =   25
         Top             =   2700
         Width           =   1965
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Valor Dolar u$s"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   23
         Top             =   2670
         Width           =   1965
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Valor Euro"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   2685
         TabIndex        =   22
         Top             =   2700
         Width           =   1965
      End
      Begin VB.Label lblLabels 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Fecha Apertura"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   18
         Left            =   270
         TabIndex        =   19
         Top             =   1905
         Width           =   1350
      End
      Begin VB.Label lblLabels 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Fecha de Cierre"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   19
         Left            =   270
         TabIndex        =   18
         Top             =   2295
         Width           =   1380
      End
      Begin VB.Label Label3 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Puesto"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   180
         TabIndex        =   17
         Top             =   210
         Width           =   1230
      End
      Begin VB.Label Label2 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Usuario"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   210
         TabIndex        =   16
         Top             =   885
         Width           =   1230
      End
      Begin VB.Label lbldiferencia 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3300
         TabIndex        =   15
         Top             =   2190
         Visible         =   0   'False
         Width           =   2175
      End
      Begin VB.Label lblFondoFijo 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Fondo Fijo"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   5205
         TabIndex        =   14
         Top             =   195
         Width           =   1230
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Observación Cierre"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   210
         TabIndex        =   13
         Top             =   3330
         Width           =   3195
      End
   End
End
Attribute VB_Name = "frm_AltaCajaPuestodesdeADM"
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


    Me.lblFondoFijo.Visible = pbValor

    HabilitarCampos "vlFondoFijoPesos", pbValor
    HabilitarCampos "vlFondoFijoDolares", pbValor
    HabilitarCampos "vlFondoFijoEuros", pbValor

    ObtenerCampo("vlFondoFijoPesos").Visible = pbValor
    ObtenerCampo("vlFondoFijoDolares").Visible = pbValor
    ObtenerCampo("vlFondoFijoEuros").Visible = pbValor
    
    
    
End Sub


Private Sub cbPuestos_Change()

    If Me.cbPuestos.Text <> "" Then
        objCajas.ObtenerFondoCajaAnterior objPuestos.obtenerNroPuesto(Me.cbPuestos.Text)
        ObtenerCampo("vlFondoFijoPesos") = objCajas.vlFondoFijoPesos
        ObtenerCampo("vlFondoFijoDolares") = objCajas.vlFondoFijoDolares
        ObtenerCampo("vlFondoFijoEuros") = objCajas.vlFondoFijoEuros
        ObtenerCampo("vlFondoFijoReales") = objCajas.vlFondoFijoReales
        
    End If
    
    
End Sub

Private Sub cbPuestos_Click()

    If Me.cbPuestos.Text <> "" Then
        objCajas.ObtenerFondoCajaAnterior objPuestos.obtenerNroPuesto(Me.cbPuestos.Text)
        ObtenerCampo("vlFondoFijoPesos") = objCajas.vlFondoFijoPesos
        ObtenerCampo("vlFondoFijoDolares") = objCajas.vlFondoFijoDolares
        ObtenerCampo("vlFondoFijoEuros") = objCajas.vlFondoFijoEuros
        ObtenerCampo("vlFondoFijoReales") = objCajas.vlFondoFijoReales
    End If
    
End Sub



Private Sub Form_Load()
Dim objControl As New CControl
Dim rs         As Object

    Set objCajas.ObjTablasIO = ObjTablasIO
    
    Me.cbusuarios.Clear
    
    
    ' Cargmos los usuarios activos de cajas de
    Set rs = objUsuario.obtenerUsuariosActivosCajasPuestos()
    objControl.CargarCombo Me.cbusuarios, rs, rs(0)
    
    ' cargmos los puestos de facturacion
    Set rs = objPuestos.obtenerPuestosDisponibles
    objControl.CargarComboConData Me.cbPuestos, rs, rs("dsPuesto"), rs("nrPuesto")
    
    
    ' Obtener lo valores
    ObtenerCampo("vlDiaDolar") = objConfig.vlDiaDolar
    ObtenerCampo("vlDiaEuro") = objConfig.vlDiaEuro
    ObtenerCampo("vlDiaReal").Text = objConfig.vlDiaReal
           
    ' Asignar las fechas
    ObtenerCampo("dtApertura") = objbasededatos.getDateasString()
    ObtenerCampo("dtCierre") = objbasededatos.getDateasString()
    
    
    HabilitarCampos "vlDiaDolar", True
    HabilitarCampos "vlDiaEuro", True
    HabilitarCampos "vlDiaReal", True
    
    ObtenerCampo("hrApertura") = "06:00"
    ObtenerCampo("hrCierre") = "14:00"
    




End Sub

Private Function ObtenerValoresNumericos(pTag As String) As Single

    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerValoresNumericos = 0
    Else
        ObtenerValoresNumericos = CSng(ObtenerCampo(pTag).Text)
    End If
    
End Function


Private Function ObtenerPesos(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single

    vlDiaEuro = objCajas.vlDiaEuro
    vlDiaDolar = objCajas.vlDiaDolar
        
    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerPesos = 0
    Else
        Select Case pTag
        Case "vlTotalSaldoFinalReal"
            ObtenerPesos = ObtenerValoresNumericos("vlSaldoFinalRealEuros") * vlDiaEuro
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealDolares") * vlDiaDolar
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealPesos")
        End Select
    End If
    
End Function


Private Function ObtenerPesosSaldoSistema() As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single

        vlDiaEuro = objCajas.vlDiaEuro
        vlDiaDolar = objCajas.vlDiaDolar
        
        ObtenerPesosSaldoSistema = objCajas.vlSaldoFinalEuros * vlDiaEuro
        ObtenerPesosSaldoSistema = ObtenerPesosSaldoSistema + objCajas.vlSaldoFinalDolares * vlDiaDolar
        ObtenerPesosSaldoSistema = ObtenerPesosSaldoSistema + objCajas.vlSaldoFinalPesos

End Function



Private Sub txtFields_Change(Index As Integer)

If Me.txtFields(Index).Tag <> "" Then
End If
    
End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
       If Me.txtFields(Index).Tag <> "" Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cajas", _
                            Me.txtFields(Index), KeyAscii)
       End If
    End If
    
End Sub


Private Sub txtFields_LostFocus(Index As Integer)
    
    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
                              Me.txtFields(Index), "LostFocus"
    End If
    
End Sub


Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    
    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
                                  Me.txtFields(Index), "GotFocus"
    End If
    

End Sub

Private Sub cmdAceptar_Click()
Dim resp As Byte


        resp = MsgBox("Cofirma la creación de la caja", vbQuestion + vbYesNo, "Atención")
        
        If resp = vbNo Then Exit Sub
        
        
        If Guardarregistro() Then
            Unload Me
        End If
        
        
        
End Sub




Private Function Guardarregistro() As Boolean
Dim Control     As Control
Dim strtag      As String
Dim strPrefijo  As String
Dim strValor    As Variant
Dim strCaja     As String
Dim nrPuesto    As String
Dim objControl  As New CControl

    Guardarregistro = False

    nrPuesto = objPuestos.obtenerNroPuesto(Me.cbPuestos.Text)
 
    objSPs.nmStoredProcedure = "SP_ObtenerMaxnrCaja_v2_8"
    objSPs.setearCampoValor "@nrPuesto", nrPuesto
    If Not objSPs.ExecSP() Then
        MsgBox "ERROR: " + objSPs.Error, vbCritical, "Atención"
        Exit Function
    End If
     strValor = objSPs.rs_resultados("MaxnrCaja") + 1
    strValor = strValor * -1
    
    
    
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "vlSaldoInicialPesos", "<-", ObtenerCampo("vlFondoFijoPesos")
    ObjTablasIO.setearCampoOperadorValor "vlSaldoInicialDolares", "<-", ObtenerCampo("vlFondoFijoDolares")
    ObjTablasIO.setearCampoOperadorValor "vlSaldoInicialEuros", "<-", ObtenerCampo("vlFondoFijoEuros")
    ObjTablasIO.setearCampoOperadorValor "vlSaldoInicialReales", "<-", ObtenerCampo("vlFondoFijoReales") ' agregado 3.7 delay
    
    
    
    ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoFinal", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealPesos", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealDolares", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealEuros", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealReales", "<-", "0" ' agregado 3.7 delay
  
  
    ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoFinalReal", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlCierrePesos", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlCierreDolares", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlCierreEuros", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlCierreReales", "<-", "0"
    
    ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoCierre", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "hrApertura", "<-", objControl.obtenerHoraDTpicker(Me.nrHoraApertura)
    ObjTablasIO.setearCampoOperadorValor "hrCierre", "<-", objControl.obtenerHoraDTpicker(Me.nrHoraCierre)
    ObjTablasIO.setearCampoOperadorValor "dtApertura", "<-", Split(ObtenerCampo("dtApertura"), " ")(0) + " " + CStr(objControl.obtenerHoraDTpicker(Me.nrHoraApertura))
    ObjTablasIO.setearCampoOperadorValor "dtCierre", "<-", Split(ObtenerCampo("dtCierre"), " ")(0) + " " + CStr(objControl.obtenerHoraDTpicker(Me.nrHoraCierre))
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "<-", Me.cbusuarios.Text
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "<-", CStr(strValor)
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<-", nrPuesto
    ObjTablasIO.setearCampoOperadorValor "vlDiaDolar", "<-", ObtenerCampo("vlDiaDolar")
    ObjTablasIO.setearCampoOperadorValor "vlDiaEuro", "<-", ObtenerCampo("vlDiaEuro")
    ObjTablasIO.setearCampoOperadorValor "vlDiaReal", "<-", ObtenerCampo("vlDiaReal") ' agregado 3.7 delay
    
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalPesos", "<-", ObtenerCampo("vlFondoFijoPesos")
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalDolares", "<-", ObtenerCampo("vlFondoFijoDolares")
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalEuros", "<-", ObtenerCampo("vlFondoFijoEuros")
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalReales", "<-", ObtenerCampo("vlFondoFijoReales") ' agregado 3.7 delay
    
    ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoInicial", "<-", 0
    
    
    
    
    
    
    
    
    
    
    
        
    If Not ObjTablasIO.Insertar Then
        MsgBox "Error: no se pudo insertar el registro, " _
        + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
        Guardarregistro = False
    Else
        objParametros.GrabarValor "frm_AltaCajaPuestodesdeADM.cajacreada", "SI"
        objParametros.GrabarValor "frm_AltaCajaPuestodesdeADM.cajacreada.nrcaja", CStr(strValor)
        MsgBox "Caja creada con éxito, número asignado  '" + CStr(strValor) + "'. ", _
            vbInformation + vbDefaultButton1, "Atención"
        Guardarregistro = True
        
    End If
    
End Function



Private Function ValidarEntrada() As Boolean
Dim vlFondoFijoPesos As Single
Dim vlFondoFijoDolares As Single
Dim vlFondoFijoEuros As Single

   ValidarEntrada = False
   vlFondoFijoPesos = ObtenerCampo("vlFondoFijoPesos")
   vlFondoFijoDolares = ObtenerCampo("vlFondoFijoDolares")
   vlFondoFijoEuros = ObtenerCampo("vlFondoFijoEuros")
    
   If vlFondoFijoPesos + vlFondoFijoDolares + vlFondoFijoEuros <= FONDO_FIJO_MINIMO Then
        MsgBox "Debe completar los valores del fondo fijo de la caja.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("vlFondoFijoPesos").SetFocus
        Exit Function
   End If
   
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


