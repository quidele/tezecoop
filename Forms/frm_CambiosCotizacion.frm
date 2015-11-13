VERSION 5.00
Begin VB.Form frm_CambiosCotizacion 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Carga de Montos por Cambios de Cotización"
   ClientHeight    =   4680
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8235
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4680
   ScaleWidth      =   8235
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   4365
      Left            =   120
      ScaleHeight     =   4335
      ScaleWidth      =   7920
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   90
      Width           =   7950
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   5
         Left            =   2745
         Locked          =   -1  'True
         TabIndex        =   2
         Tag             =   "vlDineroEuros"
         Top             =   1680
         Width           =   2430
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   4
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   1
         Tag             =   "vlDineroDolares"
         Top             =   1680
         Width           =   2415
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   3
         Left            =   5205
         Locked          =   -1  'True
         TabIndex        =   3
         Tag             =   "vlDineroReales"
         Top             =   1680
         Width           =   2430
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   2
         Left            =   2745
         Locked          =   -1  'True
         TabIndex        =   17
         TabStop         =   0   'False
         Tag             =   "vlDiaEuroNuevo"
         Top             =   1050
         Width           =   2430
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   1
         Left            =   315
         Locked          =   -1  'True
         TabIndex        =   16
         TabStop         =   0   'False
         Tag             =   "vlDiaDolarNuevo"
         Top             =   1050
         Width           =   2415
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   0
         Left            =   5205
         Locked          =   -1  'True
         TabIndex        =   15
         TabStop         =   0   'False
         Tag             =   "vlDiaRealNuevo"
         Top             =   1050
         Width           =   2430
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   14
         Left            =   5220
         Locked          =   -1  'True
         TabIndex        =   13
         TabStop         =   0   'False
         Tag             =   "vlDiaReal"
         Top             =   420
         Width           =   2430
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   7
         Left            =   315
         Locked          =   -1  'True
         TabIndex        =   10
         TabStop         =   0   'False
         Tag             =   "vlDiaDolar"
         Top             =   420
         Width           =   2415
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   8
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   9
         TabStop         =   0   'False
         Tag             =   "vlDiaEuro"
         Top             =   420
         Width           =   2430
      End
      Begin VB.CommandButton cmdCancelar 
         Cancel          =   -1  'True
         Caption         =   "Cancelar"
         Height          =   375
         Left            =   1455
         TabIndex        =   6
         Top             =   3660
         Width           =   1050
      End
      Begin VB.CommandButton cmdAceptar 
         Caption         =   "&Aceptar"
         Height          =   375
         Left            =   300
         TabIndex        =   5
         Top             =   3660
         Width           =   1050
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   990
         Index           =   25
         Left            =   240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   4
         Tag             =   "dsObservacionCC"
         Top             =   2490
         Width           =   5220
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Dinero en caja Euros"
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
         Index           =   9
         Left            =   2745
         TabIndex        =   23
         Top             =   1455
         Width           =   1965
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Dinero en Caja u$s"
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
         Index           =   8
         Left            =   300
         TabIndex        =   22
         Top             =   1425
         Width           =   1965
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Dinero en Caja Reales"
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
         Index           =   7
         Left            =   5205
         TabIndex        =   21
         Top             =   1455
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
         Index           =   6
         Left            =   2745
         TabIndex        =   20
         Tag             =   "lblvalorEuroNuevo"
         Top             =   825
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
         Index           =   5
         Left            =   300
         TabIndex        =   19
         Tag             =   "lblvalorDolarNuevo"
         Top             =   795
         Width           =   1965
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
         Index           =   2
         Left            =   5205
         TabIndex        =   18
         Tag             =   "lblvalorRealNuevo"
         Top             =   825
         Width           =   1965
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
         Left            =   5220
         TabIndex        =   14
         Tag             =   "lblvalorRealCaja"
         Top             =   195
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
         Left            =   315
         TabIndex        =   12
         Tag             =   "lblvalorDolarCaja"
         Top             =   165
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
         Left            =   2760
         TabIndex        =   11
         Tag             =   "lblvalorEuroCaja"
         Top             =   195
         Width           =   1965
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
         TabIndex        =   8
         Top             =   2190
         Visible         =   0   'False
         Width           =   2175
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Observación por cambio de cotización"
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
         Left            =   330
         TabIndex        =   7
         Top             =   2220
         Width           =   4575
      End
   End
End
Attribute VB_Name = "frm_CambiosCotizacion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Const FONDO_FIJO_MINIMO = 1
Const DIF_CAMBIO_COTIZ_POSITIVA = "2032"
Const DIF_CAMBIO_COTIZ_NEGATIVA = "2033"


Dim objCajas          As New CCajas
Dim lerror            As String




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


    HabilitarCampos "XXX", pbValor
    
    ObtenerCampo("XXXXX").Visible = pbValor

    
    
    
End Sub






Private Sub Form_Activate()

        
    If Not ObtenerCampo("vlDineroDolares").Locked Then
        HabilitarCampos "dsObservacionCC", True
        ObtenerCampo("vlDineroDolares").SetFocus
        Exit Sub
    End If
    
    
    If Not ObtenerCampo("vlDineroEuros").Locked Then
        HabilitarCampos "dsObservacionCC", True
        ObtenerCampo("vlDineroEuros").SetFocus
        Exit Sub
    End If
    
    
    If Not ObtenerCampo("vlDineroReales").Locked Then
        HabilitarCampos "dsObservacionCC", True
        ObtenerCampo("vlDineroReales").SetFocus
        Exit Sub
    End If
    
End Sub

Private Sub Form_Load()
Dim objControl As New CControl
Dim rs         As Object

   
    ObtenerCampo("vlDineroDolares") = FormatNumber(0, 2)
    ObtenerCampo("vlDineroEuros") = FormatNumber(0, 2)
    ObtenerCampo("vlDineroReales") = FormatNumber(0, 2)
    
    Select Case objParametros.ObtenerValor("frm_CambiosCotizacion.accion")
    Case "aperturadecaja"
        ' recuperar los valores de la ultima caja de la administracion
        ' obtenemos los valores de la caja  anterior
        objCajas.obtenerCaja objParametros.ObtenerValor("frm_CambiosCotizacion.nrCajaAnterior")
        
        ObtenerCampo("vlDiaDolar") = objCajas.vlDiaDolar  ' de la caja anterior
        ObtenerCampo("vlDiaEuro") = objCajas.vlDiaEuro    ' de la caja anterior
        ObtenerCampo("vlDiaReal") = objCajas.vlDiaReal    ' de la caja anterior
        
        ' nuevos valores de la caja que se abrio
        ObtenerCampo("vlDiaDolarNuevo") = objConfig.vlDiaDolar
        ObtenerCampo("vlDiaEuroNuevo") = objConfig.vlDiaEuro
        ObtenerCampo("vlDiaRealNuevo").Text = objConfig.vlDiaReal

    
    Case "cierredecaja"
    
        objCajas.obtenerCaja (objParametros.ObtenerValor("nrCaja"))
    
        ObtenerCampo("vlDiaDolar") = objCajas.vlDiaDolar
        ObtenerCampo("vlDiaEuro") = objCajas.vlDiaEuro
        ObtenerCampo("vlDiaReal") = objCajas.vlDiaReal
    
        ' Obtener lo nuevos valores de cotizacion
        ObtenerCampo("vlDiaDolarNuevo") = objConfig.vlDiaDolar
        ObtenerCampo("vlDiaEuroNuevo") = objConfig.vlDiaEuro
        ObtenerCampo("vlDiaRealNuevo").Text = objConfig.vlDiaReal
    
    End Select
 
    ObtenerCampo("vlDineroDolares") = FormatNumber(objCajas.vlDineroDolares, 2)
    ObtenerCampo("vlDineroEuros") = FormatNumber(objCajas.vlDineroEuros, 2)
    ObtenerCampo("vlDineroReales") = FormatNumber(objCajas.vlDineroReales, 2)
    ObtenerCampo("dsObservacionCC") = objCajas.dsObservacionCC
    
    HabilitarCampos "vlDineroDolares", False
    HabilitarCampos "vlDineroEuros", False
    HabilitarCampos "vlDineroReales", False
    HabilitarCampos "dsObservacionCC", False
        

    If CSng(ObtenerCampo("vlDiaDolar")) <> CSng(ObtenerCampo("vlDiaDolarNuevo")) Then
        HabilitarCampos "vlDineroDolares", True
    Else
        ObtenerCampo("vlDineroDolares") = FormatNumber(0, 2)
    End If
    
    If CSng(ObtenerCampo("vlDiaEuro")) <> CSng(ObtenerCampo("vlDiaEuroNuevo")) Then
        HabilitarCampos "vlDineroEuros", True
    Else
        ObtenerCampo("vlDineroEuros") = FormatNumber(0, 2)
    End If
    
    
    If CSng(ObtenerCampo("vlDiaReal")) <> CSng(ObtenerCampo("vlDiaRealNuevo")) Then
        HabilitarCampos "vlDineroReales", True
    Else
        ObtenerCampo("vlDineroReales") = FormatNumber(0, 2)
    End If


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
        DoEvents
    End If
    

End Sub



Private Function validarEntradaUsuario()

    If Not ObtenerCampo("vlDineroDolares").Locked Then
        If Not IsNumeric(ObtenerCampo("vlDineroDolares")) Then
            MsgBox "Ingrese el monto en dolares", vbInformation, "Atención"
            ObtenerCampo("vlDineroDolares").SetFocus
            Exit Function
        End If
        If ObtenerCampo("vlDineroDolares") <= 0 Then
                MsgBox "el monto en dolares es incorrecto.", vbInformation, "Atención"
                ObtenerCampo("vlDineroDolares").SetFocus
            Exit Function
        End If
    End If
    
    
    
    If Not ObtenerCampo("vlDineroEuros").Locked Then
        If Not IsNumeric(ObtenerCampo("vlDineroEuros")) Then
            MsgBox "Ingrese el monto en Euros", vbInformation, "Atención"
            ObtenerCampo("vlDineroEuros").SetFocus
            Exit Function
        End If
        If ObtenerCampo("vlDineroEuros") <= 0 Then
                MsgBox "el monto en euros es incorrecto.", vbInformation, "Atención"
                ObtenerCampo("vlDineroEuros").SetFocus
            Exit Function
        End If
    End If


        
    If Not ObtenerCampo("vlDineroReales").Locked Then
        If Not IsNumeric(ObtenerCampo("vlDineroReales")) Then
            MsgBox "Ingrese el monto en Reales", vbInformation, "Atención"
            ObtenerCampo("vlDineroEuros").SetFocus
            Exit Function
        End If
        If ObtenerCampo("vlDineroReales") <= 0 Then
                MsgBox "el monto en reales es incorrecto.", vbInformation, "Atención"
                ObtenerCampo("vlDineroReales").SetFocus
            Exit Function
        End If
    End If

    validarEntradaUsuario = True


End Function



Private Sub cmdAceptar_Click()
Dim resp As Byte
Dim vlDineroDolares As Single
Dim vlDineroEuros As Single
Dim vlDineroReales As Single
Dim vlDiaDolarNuevo As Single
Dim vlDiaEuroNuevo As Single
Dim vlDiaRealNuevo As Single
Dim vlDiaDolar As Single
Dim vlDiaEuro As Single
Dim vlDiaReal As Single
Dim grabarDolares As Boolean
Dim grabarEuros As Boolean
Dim grabarReales As Boolean
Dim vlPesos      As Single
Dim dsObservacionCC As String

         
        Set objCajas.ObjTablasIO = ObjTablasIO
            
        resp = MsgBox("Confirma la acción?", vbQuestion + vbYesNo, "Atención")
        If resp = vbNo Then Exit Sub
        
        
        
        Select Case objParametros.ObtenerValor("frm_CambiosCotizacion.accion")
        Case "aperturadecaja"
            If Not validarEntradaUsuario() Then
                Exit Sub
            End If
                  
            grabarDolares = Not ObtenerCampo("vlDineroDolares").Locked
            grabarEuros = Not ObtenerCampo("vlDineroEuros").Locked
            grabarReales = Not ObtenerCampo("vlDineroReales").Locked
            vlDineroDolares = ObtenerCampo("vlDineroDolares")
            vlDineroEuros = ObtenerCampo("vlDineroEuros")
            vlDineroReales = ObtenerCampo("vlDineroReales")
            dsObservacionCC = ObtenerCampo("dsObservacionCC")
            vlDiaDolarNuevo = ObtenerCampo("vlDiaDolarNuevo")
            vlDiaEuroNuevo = ObtenerCampo("vlDiaEuroNuevo")
            vlDiaRealNuevo = ObtenerCampo("vlDiaRealNuevo")
            vlDiaDolar = ObtenerCampo("vlDiaDolar")
            vlDiaEuro = ObtenerCampo("vlDiaEuro")
            vlDiaReal = ObtenerCampo("vlDiaReal")

            objbasededatos.BeginTrans
            
            If grabarDolares Then
                ' redondeamos a dos decimales
                vlPesos = FormatNumber(vlDineroDolares * CSng(vlDiaDolarNuevo - vlDiaDolar), 2)
                If Not grabarAsientosporDiferencia(vlPesos, " Dolar - " + dsObservacionCC) Then
                    objbasededatos.RollBackTrans
                    MsgBox lerror, vbCritical, "Atención"
                    Exit Sub
                End If
            End If
            If grabarEuros Then
                 ' redondeamos a dos decimales
                 vlPesos = FormatNumber(vlDineroEuros * CSng(vlDiaEuroNuevo - vlDiaEuro), 2)
                 If Not grabarAsientosporDiferencia(vlPesos, " Euro - " + dsObservacionCC) Then
                    objbasededatos.RollBackTrans
                    MsgBox lerror, vbCritical, "Atención"
                    Exit Sub
                End If
            End If
            If grabarReales Then
                ' redondeamos a dos decimales
                vlPesos = FormatNumber(vlDineroReales * CSng(vlDiaRealNuevo - vlDiaReal), 2)
                If Not grabarAsientosporDiferencia(vlPesos, " Real - " + dsObservacionCC) Then
                    objbasededatos.RollBackTrans
                    MsgBox lerror, vbCritical, "Atención"
                    Exit Sub
                End If
            End If
     
            objCajas.nrCaja = objParametros.ObtenerValor("nrCaja")
            objCajas.vlDineroDolares = vlDineroDolares
            objCajas.vlDineroEuros = vlDineroEuros
            objCajas.vlDineroReales = vlDineroReales
            objCajas.dsObservacionCC = dsObservacionCC
   
            If Not objCajas.grabarDatosCotizacionesMontos() Then
                objbasededatos.RollBackTrans
                MsgBox objCajas.Error, vbCritical, "Atención"
                Exit Sub
            End If
            objbasededatos.CommitTrans
            MsgBox "El asiento contable se ha realizado con éxito.", vbInformation, "Atención"
            objParametros.GrabarValor "frm_CambiosCotizacion.accion.resultado", "OK"
        Case "cierredecaja"
            If Not validarEntradaUsuario() Then
                Exit Sub
            End If
            
            vlDineroDolares = ObtenerCampo("vlDineroDolares")
            vlDineroEuros = ObtenerCampo("vlDineroEuros")
            vlDineroReales = ObtenerCampo("vlDineroReales")
            dsObservacionCC = ObtenerCampo("dsObservacionCC")
            objCajas.nrCaja = objParametros.ObtenerValor("nrCaja")
            objCajas.vlDineroDolares = vlDineroDolares
            objCajas.vlDineroEuros = vlDineroEuros
            objCajas.vlDineroReales = vlDineroReales
            objCajas.dsObservacionCC = dsObservacionCC
            If Not objCajas.grabarDatosCotizacionesMontos() Then
                MsgBox objCajas.Error, vbCritical, "Atención"
                Exit Sub
            End If
            MsgBox "La información ha sido guardada con éxito.", vbInformation, "Atención"
            
        End Select
    
        
        Unload Me
        
        
End Sub





Private Function grabarAsientosporDiferencia(pvlPesos As Single, pdsObservacionCC As String) As Boolean

    Set objMovimientos.ObjTablasIO = ObjTablasIO

    ' agregado en la version 4
    objMovimientos.limpiarObjeto
   
    objMovimientos.nrCaja = objParametros.ObtenerValor("nrCaja")
    
    If pvlPesos > 0 Then
        objMovimientos.cdConcepto = DIF_CAMBIO_COTIZ_POSITIVA
    Else
        objMovimientos.cdConcepto = DIF_CAMBIO_COTIZ_NEGATIVA
    End If
    
    If Right(pdsObservacionCC, 2) = "- " Then
        pdsObservacionCC = Left(pdsObservacionCC, Len(pdsObservacionCC) - 2)
    End If
    
            
    objMovimientos.dsMovimiento = "Cambio de Cotización en moneda " + pdsObservacionCC
    ' objMovimientos.tpOperacion se obtiene a partir de conceptos
    objMovimientos.dsProveedor = "Automático Version3.9"
    objMovimientos.dsUsuario = objUsuario.dsUsuario
    objMovimientos.dtMovimiento = CStr(Now)
    objMovimientos.nrFactura = ""
    objMovimientos.IdProveedor = ""
    objMovimientos.vlDolares = 0
    objMovimientos.vlPesos = Abs(pvlPesos) ' siempre grabaamos en valor absoluto
    objMovimientos.vlEuros = 0

    
    If objMovimientos.grabarMovimientoContable() Then
        lerror = 0
        grabarAsientosporDiferencia = True
    Else
        lerror = "Error al realizar el movimiento contable '" + objMovimientos.dsMovimiento + "'." + vbCrLf + "Error Extendido: " + objMovimientos.Error
        grabarAsientosporDiferencia = False
    End If
    
End Function




Private Sub cmdCancelar_Click()

    objParametros.GrabarValor "frm_CambiosCotizacion.Cancela", "SI"
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


