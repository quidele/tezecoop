VERSION 5.00
Begin VB.Form frm_ABMCajaPuesto 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cierre de Caja "
   ClientHeight    =   5820
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8490
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5820
   ScaleMode       =   0  'User
   ScaleWidth      =   8490
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   5610
      Left            =   105
      ScaleHeight     =   5580
      ScaleWidth      =   8325
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   90
      Width           =   8355
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
         Index           =   9
         Left            =   5520
         TabIndex        =   32
         Tag             =   "vlFondoFijoReales"
         Top             =   1095
         Width           =   1230
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
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
         Index           =   8
         Left            =   1710
         Locked          =   -1  'True
         TabIndex        =   31
         Tag             =   "vlTotalSaldoFinal"
         Top             =   2145
         Width           =   1230
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
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
         Index           =   4
         Left            =   1710
         Locked          =   -1  'True
         TabIndex        =   29
         Tag             =   "vlSaldoFinalReales"
         Top             =   1110
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
         Index           =   3
         Left            =   3495
         TabIndex        =   28
         Tag             =   "vlSaldoFinalRealReales"
         Top             =   1095
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
         Index           =   7
         Left            =   3495
         TabIndex        =   25
         Tag             =   "vlSaldoFinalRealEuros"
         Top             =   1755
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
         Index           =   6
         Left            =   3495
         TabIndex        =   24
         Tag             =   "vlSaldoFinalRealDolares"
         Top             =   1440
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
         Index           =   5
         Left            =   3495
         TabIndex        =   23
         Tag             =   "vlSaldoFinalRealPesos"
         Top             =   750
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
         Index           =   2
         Left            =   5520
         TabIndex        =   20
         Tag             =   "vlFondoFijoEuros"
         Top             =   1770
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
         Left            =   5520
         TabIndex        =   19
         Tag             =   "vlFondoFijoDolares"
         Top             =   1425
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
         Left            =   5520
         TabIndex        =   18
         Tag             =   "vlFondoFijoPesos"
         Top             =   735
         Width           =   1230
      End
      Begin VB.CommandButton cmdCancelar 
         Cancel          =   -1  'True
         Caption         =   "Cancelar"
         Height          =   405
         Left            =   4185
         TabIndex        =   9
         Top             =   5100
         Width           =   1050
      End
      Begin VB.CommandButton cmdAceptar 
         Caption         =   "&Aceptar"
         Height          =   405
         Left            =   3015
         TabIndex        =   8
         Top             =   5100
         Width           =   1050
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
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
         Index           =   11
         Left            =   1710
         Locked          =   -1  'True
         TabIndex        =   1
         Tag             =   "vlSaldoFinalPesos"
         Top             =   765
         Width           =   1230
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
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
         Index           =   15
         Left            =   1710
         Locked          =   -1  'True
         TabIndex        =   2
         Tag             =   "vlSaldoFinalDolares"
         Top             =   1455
         Width           =   1230
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
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
         Index           =   16
         Left            =   1710
         Locked          =   -1  'True
         TabIndex        =   3
         Tag             =   "vlSaldoFinalEuros"
         Top             =   1800
         Width           =   1230
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
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
         Index           =   17
         Left            =   3495
         Locked          =   -1  'True
         TabIndex        =   4
         TabStop         =   0   'False
         Tag             =   "vlTotalSaldoFinalReal"
         Top             =   2100
         Width           =   1230
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8,25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   360
         Index           =   21
         Left            =   3495
         Locked          =   -1  'True
         TabIndex        =   5
         TabStop         =   0   'False
         Tag             =   "vlDiferenciaDeCierre"
         Top             =   2430
         Width           =   1230
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   13
         Left            =   165
         TabIndex        =   6
         TabStop         =   0   'False
         Tag             =   "dsDiferenciaDeCierre"
         Top             =   3330
         Width           =   7995
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   990
         Index           =   25
         Left            =   195
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         Tag             =   "dsObservacion"
         Top             =   3885
         Width           =   7980
      End
      Begin VB.Label lblLabels 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Reales"
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
         Left            =   615
         TabIndex        =   30
         Top             =   1230
         Width           =   1005
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "Total Real"
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
         Left            =   3495
         TabIndex        =   27
         Top             =   480
         Width           =   1185
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00FFC0C0&
         Caption         =   "Total Sist."
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
         Left            =   1695
         TabIndex        =   26
         Top             =   510
         Width           =   1185
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
         Left            =   5640
         TabIndex        =   22
         Top             =   3105
         Visible         =   0   'False
         Width           =   2175
      End
      Begin VB.Label lblFondoFijo 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Fondo Fijo próxima Caja"
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
         Left            =   5280
         TabIndex        =   21
         Top             =   450
         Width           =   2325
      End
      Begin VB.Label Label1 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Saldos Finales (incluido el fondo fijo)"
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
         Left            =   150
         TabIndex        =   17
         Top             =   120
         Width           =   3480
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
         Left            =   180
         TabIndex        =   16
         Top             =   3645
         Width           =   3195
      End
      Begin VB.Label lblLabels 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Totales Pesos"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   15
         Left            =   390
         TabIndex        =   15
         Top             =   2295
         Width           =   1230
      End
      Begin VB.Label lblLabels 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Euros"
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
         Left            =   615
         TabIndex        =   14
         Top             =   1905
         Width           =   1005
      End
      Begin VB.Label lblLabels 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "U$s"
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
         Left            =   615
         TabIndex        =   13
         Top             =   1560
         Width           =   1005
      End
      Begin VB.Label lblLabels 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Pesos"
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
         Left            =   615
         TabIndex        =   12
         Top             =   855
         Width           =   1005
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Diferencia"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   8
         Left            =   1200
         TabIndex        =   11
         Top             =   2625
         Width           =   930
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Motivo en Diferencia de Cierre"
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
         Left            =   195
         TabIndex        =   10
         Top             =   3105
         Width           =   2775
      End
   End
End
Attribute VB_Name = "frm_ABMCajaPuesto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim FONDO_FIJO_MINIMO As Single

Dim objCajas          As New CCajas
Dim cantidad_intentos As Integer

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

        Select Case objParametros.ObtenerValor("frm_ABMCajaPuesto.modo")
        Case "administracion.moficacion"
            If Not objCajas.obtenerCaja(objParametros.ObtenerValor("frm_ABMCajaPuesto.nrcaja")) Then
                MsgBox "Error: " + objCajas.Error
                Exit Sub
            End If
            ObtenerCampo("vlSaldoFinalRealPesos") = objCajas.vlSaldoFinalRealPesos
            ObtenerCampo("vlSaldoFinalRealEuros") = objCajas.vlSaldoFinalRealEuros
            ObtenerCampo("vlSaldoFinalRealDolares") = objCajas.vlSaldoFinalRealDolares
            ObtenerCampo("vlSaldoFinalRealReales") = objCajas.vlSaldoFinalRealReales
            ObtenerCampo("vlTotalSaldoFinalReal") = objCajas.vlTotalSaldoFinalReal
            
            ' ObtenerCampo("vlDiferenciaDeCierre") = objCajas.vlDiferenciaDeCierre
            ObtenerCampo("dsDiferenciaDeCierre") = objCajas.dsDiferenciaDeCierre
            ObtenerCampo("vlSaldoFinalPesos") = objCajas.vlSaldoFinalPesos
            ObtenerCampo("vlSaldoFinalDolares") = objCajas.vlSaldoFinalDolares
            ObtenerCampo("vlSaldoFinalEuros") = objCajas.vlSaldoFinalEuros
            ObtenerCampo("vlSaldoFinalReales") = objCajas.vlSaldoFinalReales
            ObtenerCampo("dsObservacion") = objCajas.dsObservacion
            ObtenerCampo("vlTotalSaldoFinal") = FormatNumber(ObtenerPesosSaldoSistema(), 2)
            ExisteDiferencia
            BloquearControles False
        Case Else
     
        
            If Not objCajas.obtenerCaja(objParametros.ObtenerValor("frm_ABMCajaPuesto.nrcaja")) Then
                MsgBox "Error: " + objCajas.Error
                Exit Sub
            End If
            
            ObtenerCampo("vlFondoFijoPesos") = FormatNumber(objCajas.vlSaldoInicialPesos, 2)
            ObtenerCampo("vlFondoFijoDolares") = FormatNumber(objCajas.vlSaldoInicialDolares, 2)
            ObtenerCampo("vlFondoFijoEuros") = FormatNumber(objCajas.vlSaldoInicialEuros, 2)
            ObtenerCampo("vlFondoFijoReales") = FormatNumber(objCajas.vlSaldoInicialReales, 2)
            
            ObtenerCampo("vlTotalSaldoFinalReal") = FormatNumber(objCajas.vlTotalSaldoFinalReal, 2)
            ObtenerCampo("vlDiferenciaDeCierre") = FormatNumber(objCajas.vlDiferenciaDeCierre, 2)
            ObtenerCampo("vlDiferenciaDeCierre") = FormatNumber(objCajas.vlDiferenciaDeCierre, 2)
            ObtenerCampo("dsDiferenciaDeCierre") = objCajas.dsDiferenciaDeCierre
            ObtenerCampo("vlSaldoFinalPesos") = FormatNumber(objCajas.vlSaldoFinalPesos, 2)
            ObtenerCampo("vlSaldoFinalDolares") = FormatNumber(objCajas.vlSaldoFinalDolares, 2)
            ObtenerCampo("vlSaldoFinalReales") = FormatNumber(objCajas.vlSaldoFinalReales, 2)
            ObtenerCampo("vlSaldoFinalEuros") = FormatNumber(objCajas.vlSaldoFinalEuros, 2)
            ObtenerCampo("dsObservacion") = objCajas.dsObservacion
            ObtenerCampo("vlSaldoFinalRealReales") = FormatNumber(0, 2)
            ObtenerCampo("vlTotalSaldoFinal") = FormatNumber(ObtenerPesosSaldoSistema(), 2)
        End Select
        
        ObtenerCampo("vlSaldoFinalRealPesos").SetFocus

End Sub


Private Sub BloquearControles(pbValor As Boolean)


    Me.lblFondoFijo.Visible = pbValor

    HabilitarCampos "vlFondoFijoPesos", pbValor
    HabilitarCampos "vlFondoFijoDolares", pbValor
    HabilitarCampos "vlFondoFijoEuros", pbValor
    HabilitarCampos "vlFondoFijoReales", pbValor

    ObtenerCampo("vlFondoFijoPesos").Visible = pbValor
    ObtenerCampo("vlFondoFijoDolares").Visible = pbValor
    ObtenerCampo("vlFondoFijoEuros").Visible = pbValor
    ObtenerCampo("vlFondoFijoReales").Visible = pbValor
    
    
End Sub


Private Sub Form_Load()


    FONDO_FIJO_MINIMO = objParametros.ObtenerValorBD("FONDO_FIJO_MINIMO")
    
    Me.Caption = Me.Caption + " - " + objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    Set objCajas.ObjTablasIO = ObjTablasIO
    
    If Not objCajas.ObtenerSaldosdeInicioyValores(objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")) Then
        Call Error_de_Conexion
    End If
    
    If Not objCajas.SumarCajaPuestos(objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")) Then
        Call Error_de_Conexion
    End If
    
    ObtenerCampo("vlSaldoFinalRealPesos").Text = "0,00"
    ObtenerCampo("vlSaldoFinalRealDolares").Text = "0,00"
    ObtenerCampo("vlSaldoFinalRealEuros").Text = "0,00"
    ObtenerCampo("vlTotalSaldoFinalReal").Text = "0,00"
    ObtenerCampo("vlDiferenciaDeCierre").Text = "0,00"
    
    cantidad_intentos = 0
 
End Sub

Private Function ObtenerValoresNumericos(pTag As String) As Single

    On Error Resume Next
    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerValoresNumericos = 0
    Else
        ObtenerValoresNumericos = CSng(ObtenerCampo(pTag).Text)
    End If
    
    If Err Then
        ObtenerValoresNumericos = 0
    End If
    
    
End Function



Private Function ObtenerPesos(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single
Dim vlDiaReal As Single

    vlDiaEuro = objCajas.vlDiaEuro
    vlDiaDolar = objCajas.vlDiaDolar
    vlDiaReal = objCajas.vlDiaReal
 
        
    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerPesos = 0
    Else
        Select Case pTag
        Case "vlTotalSaldoFinalReal"
            ObtenerPesos = ObtenerValoresNumericos("vlSaldoFinalRealEuros") * vlDiaEuro
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealDolares") * vlDiaDolar
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealReales") * vlDiaReal
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealPesos")
        End Select
    End If
    
End Function


Private Function ObtenerPesosSaldoSistema() As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single
Dim vlDiaReal  As Single


        vlDiaEuro = objCajas.vlDiaEuro
        vlDiaDolar = objCajas.vlDiaDolar
        vlDiaReal = objCajas.vlDiaReal
        
        Dim vlSaldoFinalReales As Single
        
        vlSaldoFinalReales = AdaptarNulos(ObtenerCampo("vlSaldoFinalReales"), 0)
        
        ObtenerPesosSaldoSistema = objCajas.vlSaldoFinalEuros * vlDiaEuro
        ObtenerPesosSaldoSistema = ObtenerPesosSaldoSistema + objCajas.vlSaldoFinalDolares * vlDiaDolar
        ObtenerPesosSaldoSistema = ObtenerPesosSaldoSistema + objCajas.vlSaldoFinalReales * vlDiaReal
        ObtenerPesosSaldoSistema = ObtenerPesosSaldoSistema + objCajas.vlSaldoFinalPesos



End Function


Private Sub txtFields_Change(Index As Integer)

If Me.txtFields(Index).Tag <> "" Then
    Select Case Me.txtFields(Index).Tag
    Case "vlSaldoFinalRealPesos", "vlSaldoFinalRealDolares", "vlSaldoFinalRealEuros", "vlSaldoFinalRealReales"
        Me.lbldiferencia.Caption = ""
        AvisarError "vlSaldoFinalRealPesos", False
        AvisarError "vlSaldoFinalRealDolares", False
        AvisarError "vlSaldoFinalRealReales", False
        AvisarError "vlSaldoFinalRealEuros", False
    End Select
        
End If
    
End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
       If Me.txtFields(Index).Tag <> "" Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cajas", _
                            Me.txtFields(Index), KeyAscii)
       End If
    Else
       Select Case Me.txtFields(Index).Tag
       Case "vlSaldoFinalRealPesos"
            ObtenerCampo("vlSaldoFinalRealReales").SetFocus
        Case "vlSaldoFinalRealReales"
            ObtenerCampo("vlSaldoFinalRealDolares").SetFocus
        Case "vlSaldoFinalRealDolares"
            ObtenerCampo("vlSaldoFinalRealEuros").SetFocus
        Case "vlSaldoFinalRealEuros"
            If Not ObtenerCampo("vlFondoFijoPesos").Visible Then
                ObtenerCampo("vlSaldoFinalRealPesos").SetFocus
            Else
                ObtenerCampo("vlFondoFijoPesos").SetFocus
            End If
        Case "vlFondoFijoPesos"
            ObtenerCampo("vlFondoFijoReales").SetFocus
        Case "vlFondoFijoReales"
            ObtenerCampo("vlFondoFijoDolares").SetFocus
        Case "vlFondoFijoDolares"
            ObtenerCampo("vlFondoFijoEuros").SetFocus
        Case "vlFondoFijoEuros"
            ObtenerCampo("vlSaldoFinalRealPesos").SetFocus
       End Select
       
    End If
    
End Sub


Private Sub txtFields_LostFocus(Index As Integer)
    
    If Me.txtFields(Index).Tag <> "" Then
        ObtenerCampo("vlTotalSaldoFinalReal").Text = FormatNumber(ObtenerPesos("vlTotalSaldoFinalReal"), 2)
        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
                              Me.txtFields(Index), "LostFocus"
        If ExisteDiferencia() Then
            HabilitarCampos "dsDiferenciaDeCierre", True
        Else
            ObtenerCampo("dsDiferenciaDeCierre").Text = ""
            HabilitarCampos ("dsDiferenciaDeCierre"), False
        End If
            
    End If
    
End Sub


Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    
    If Me.txtFields(Index).Tag <> "" Then
        ObtenerCampo("vlTotalSaldoFinalReal").Text = FormatNumber(ObtenerPesos("vlTotalSaldoFinalReal"), 2)
        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
                                  Me.txtFields(Index), "GotFocus"
    End If
    

End Sub

Private Sub cmdAceptar_Click()

        Select Case objParametros.ObtenerValor("frm_ABMCajaPuesto.modo")
        Case "administracion.moficacion"
            cmdAceptarCajaPuestoReapertura
        Case Else
            cmdAceptarCajaPuestoInicial
        End Select
        
End Sub

Private Function ValidarEntrada() As Boolean
Dim vlFondoFijoPesos As Single
Dim vlFondoFijoDolares As Single
Dim vlFondoFijoEuros As Single

   ValidarEntrada = False
   vlFondoFijoPesos = ObtenerCampo("vlFondoFijoPesos")
   vlFondoFijoDolares = ObtenerCampo("vlFondoFijoDolares")
   vlFondoFijoEuros = ObtenerCampo("vlFondoFijoEuros")
    
   If vlFondoFijoPesos + vlFondoFijoDolares + vlFondoFijoEuros < FONDO_FIJO_MINIMO Then
        MsgBox "Debe completar los valores del fondo fijo que quedará para la próxima caja.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("vlFondoFijoPesos").SetFocus
        Exit Function
   End If
   
   Dim vlTotalIngresadoPesificado As Single
   Dim vlSaldoInicialPesificado As Single
   
   
   vlTotalIngresadoPesificado = FormatNumber(ObtenerPesos("vlTotalSaldoFinalReal"), 2)

   vlSaldoInicialPesificado = objCajas.obtenerSaldoInicialPesificado(objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja"))
   
   If vlTotalIngresadoPesificado < vlSaldoInicialPesificado Then
        MsgBox "ERROR: Los valores ingresados no son válidos, el total ingresado no puede ser menor al fondo fijo de la caja.", vbInformation + vbDefaultButton1, "Atención"
        Exit Function
   End If
   
   
   ValidarEntrada = True

End Function


Private Sub cmdAceptarCajaPuestoInicial()
Dim resp As Byte
Dim bDiferencia As Boolean
Dim vlTotalSaldoCierre As Single
Dim vlTotalSaldoFinal  As Single


    If Not ValidarEntrada() Then
        Exit Sub
    End If

    
    
    bDiferencia = ExisteDiferencia()
    
    If bDiferencia Then
        resp = MsgBox("Existe una diferencia de caja. Desea cerrar la caja de todas maneras?", vbQuestion + vbYesNo + vbDefaultButton2, "Atención")
        
        cantidad_intentos = cantidad_intentos + 1
        AvisarError "vlSaldoFinalRealPesos", True
        AvisarError "vlSaldoFinalRealDolares", True
        AvisarError "vlSaldoFinalRealReales", True
        AvisarError "vlSaldoFinalRealEuros", True
        If cantidad_intentos >= CInt(objConfig.Cantidad_Intentos_Cierre) Then
            MsgBox "Ha realizado los '" + objConfig.Cantidad_Intentos_Cierre + "' intentos permitidos. El sistema cerrará la caja.", vbInformation, "Atención"
        Else
            If resp = vbNo Then Exit Sub
        End If
        
    Else
        resp = MsgBox("Los valores ingresados son correctos. Esta segura que desea cerrar esta caja?", vbQuestion + vbYesNo, "Cierre de Caja")
        If resp = vbNo Then Exit Sub
    End If

    ' Grabar la base de datos
    
    Me.Enabled = False
    objbasededatos.BeginTrans
    
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    ObjTablasIO.setearCampoOperadorValor "flEstado", "<-", "1"
    ObjTablasIO.setearCampoOperadorValor "hrCierre", "<-", CStr(Format(Now, "HH:MM"))
    
    If objConfig.tpModo_Operacion <> FACTURACION_REMOTA Then
        ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "1"
    End If
    
    ObjTablasIO.setearCampoOperadorValor "vlDiferenciaDeCierre", "<-", ObtenerCampo("vlDiferenciaDeCierre").Text
    ObjTablasIO.setearCampoOperadorValor "dsDiferenciaDeCierre", "<-", ObtenerCampo("dsDiferenciaDeCierre").Text
    
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalPesos", "<-", CStr(objCajas.vlSaldoFinalPesos)
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalDolares", "<-", CStr(objCajas.vlSaldoFinalDolares)
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalEuros", "<-", CStr(objCajas.vlSaldoFinalEuros)
    


    vlTotalSaldoFinal = objCajas.vlSaldoFinalPesos + _
                       (objCajas.vlSaldoFinalDolares * objCajas.vlDiaDolar) + _
                       (objCajas.vlSaldoFinalReales * objCajas.vlDiaReal) + _
                       (objCajas.vlSaldoFinalEuros * objCajas.vlDiaEuro)
    
    ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoFinal", "<-", CStr(FormatNumber(vlTotalSaldoFinal, 2))
    
    
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealPesos", "<-", ObtenerValoresNumericos("vlSaldoFinalRealPesos")
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealDolares", "<-", ObtenerCampo("vlSaldoFinalRealDolares").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealEuros", "<-", ObtenerCampo("vlSaldoFinalRealEuros").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealReales", "<-", ObtenerCampo("vlSaldoFinalRealReales").Text
    
    
    ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoFinalReal", "<-", ObtenerCampo("vlTotalSaldoFinalReal").Text
    
    ObjTablasIO.setearCampoOperadorValor "dsObservacion", "<-", ObtenerCampo("dsObservacion").Text
    ObjTablasIO.setearCampoOperadorValor "dtObservacion", "<-", Now()
    
    ' tengo que pesificarCStr(FormatNumber(objCajas.vlSaldoFinalRealPesos - objCajas.vlSaldoInicialPesos, 2))
    ObjTablasIO.setearCampoOperadorValor "vlCierrePesos", "<-", CStr(FormatNumber(ObtenerValoresNumericos("vlSaldoFinalRealPesos") - objCajas.vlSaldoInicialPesos, 2))
    ObjTablasIO.setearCampoOperadorValor "vlCierreDolares", "<-", CStr(FormatNumber(ObtenerValoresNumericos("vlSaldoFinalRealDolares") - objCajas.vlSaldoInicialDolares, 2))
    ObjTablasIO.setearCampoOperadorValor "vlCierreEuros", "<-", CStr(FormatNumber(ObtenerValoresNumericos("vlSaldoFinalRealEuros") - objCajas.vlSaldoInicialEuros, 2))
    ObjTablasIO.setearCampoOperadorValor "vlCierreReales", "<-", CStr(FormatNumber(ObtenerValoresNumericos("vlSaldoFinalRealReales") - objCajas.vlSaldoInicialReales, 2))
   
    vlTotalSaldoCierre = (ObtenerValoresNumericos("vlSaldoFinalRealPesos")) - objCajas.vlSaldoInicialPesos + _
                         (ObtenerValoresNumericos("vlSaldoFinalRealDolares") - objCajas.vlSaldoInicialDolares) * objCajas.vlDiaDolar + _
                         (ObtenerValoresNumericos("vlSaldoFinalRealEuros") - objCajas.vlSaldoInicialEuros) * objCajas.vlDiaEuro + _
                         (ObtenerValoresNumericos("vlSaldoFinalRealReales") - objCajas.vlSaldoInicialReales) * objCajas.vlDiaReal

    
    ObjTablasIO.setearCampoOperadorValor "vlFondoFijoPesos", "<-", ObtenerCampo("vlFondoFijoPesos")
    ObjTablasIO.setearCampoOperadorValor "vlFondoFijoDolares", "<-", ObtenerCampo("vlFondoFijoDolares")
    ObjTablasIO.setearCampoOperadorValor "vlFondoFijoEuros", "<-", ObtenerCampo("vlFondoFijoEuros")
    ObjTablasIO.setearCampoOperadorValor "vlFondoFijoReales", "<-", ObtenerCampo("vlFondoFijoReales")
    
    
    ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoCierre", "<-", CStr(FormatNumber(vlTotalSaldoCierre, 2))
    ObjTablasIO.setearCampoOperadorValor "dtCierre", "<-", Now()
    
    If Not ObjTablasIO.Actualizar() Then
            objbasededatos.RollBackTrans
            MsgBox "Error: no se pudo insertar el registro. " + _
            ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
            Me.Enabled = True
            Exit Sub
    End If
    
    objbasededatos.CommitTrans
    
    If bDiferencia Then
        MsgBox "La caja ha sido cerrada con diferencia.", vbInformation + vbDefaultButton1, "Atención"
    Else
        MsgBox "La caja ha sido cerrada con éxito.", vbInformation + vbDefaultButton1, "Atención"
    End If
    Sleep (1000)
    
    MsgBox "Verifique la alimentación de hojas de papel de la impresora.", vbInformation + vbDefaultButton1, "Impresión del cierre de caja"
    
    imprimirCaja False
    
    
    objParametros.GrabarValor "nrCaja", ""
    objParametros.GrabarValor "Cancela", "NO"
    Me.Enabled = True
    Unload Me
    
End Sub



Private Sub cmdAceptarCajaPuestoReapertura()
Dim resp                    As Byte
Dim bDiferencia             As Boolean
Dim vlDiaEuro               As Single
Dim vlDiaDolar              As Single
Dim vlTotalSaldoCierre      As Single
Dim vlTotalSaldoFinal       As Single
Dim vlDiaReal               As Single

    vlDiaEuro = objCajas.vlDiaEuro
    vlDiaDolar = objCajas.vlDiaDolar
    vlDiaReal = objCajas.vlDiaReal
    
    bDiferencia = ExisteDiferencia()
    
    If bDiferencia Then
        resp = MsgBox("Existe una diferencia de caja respecto al saldo del sistema, desea corregirla?", vbQuestion + vbYesNo, "Atención")
        If resp = vbYes Then Exit Sub
    Else
        MsgBox "Los valores ingresados son correctos.", vbDefaultButton1 + vbInformation, "Modificación de Saldos"
    End If

    ' Grabar la base de datos
    Me.Enabled = False
    
    objbasededatos.BeginTrans
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")

    ObjTablasIO.setearCampoOperadorValor "vlDiferenciaDeCierre", "<-", ObtenerCampo("vlDiferenciaDeCierre").Text
    ObjTablasIO.setearCampoOperadorValor "dsDiferenciaDeCierre", "<-", ObtenerCampo("dsDiferenciaDeCierre").Text
    

    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealPesos", "<-", ObtenerValoresNumericos("vlSaldoFinalRealPesos")
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealDolares", "<-", ObtenerCampo("vlSaldoFinalRealDolares").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealEuros", "<-", ObtenerCampo("vlSaldoFinalRealEuros").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealReales", "<-", ObtenerCampo("vlSaldoFinalRealReales").Text
    ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoFinalReal", "<-", ObtenerCampo("vlTotalSaldoFinalReal").Text
    ObjTablasIO.setearCampoOperadorValor "dsObservacion", "<-", ObtenerCampo("dsObservacion").Text
    ObjTablasIO.setearCampoOperadorValor "dtObservacion", "<-", Now()
    
    ' tengo que pesificarCStr(FormatNumber(objCajas.vlSaldoFinalRealPesos - objCajas.vlSaldoInicialPesos, 2))
    ObjTablasIO.setearCampoOperadorValor "vlCierrePesos", "<-", CStr(FormatNumber(ObtenerValoresNumericos("vlSaldoFinalRealPesos") - objCajas.vlSaldoInicialPesos, 2))
    ObjTablasIO.setearCampoOperadorValor "vlCierreDolares", "<-", CStr(FormatNumber(ObtenerValoresNumericos("vlSaldoFinalRealDolares") - objCajas.vlSaldoInicialDolares, 2))
    ObjTablasIO.setearCampoOperadorValor "vlCierreEuros", "<-", CStr(FormatNumber(ObtenerValoresNumericos("vlSaldoFinalRealEuros") - objCajas.vlSaldoInicialEuros, 2))
    ObjTablasIO.setearCampoOperadorValor "vlCierreReales", "<-", CStr(FormatNumber(ObtenerValoresNumericos("vlSaldoFinalRealReales") - objCajas.vlSaldoInicialReales, 2))
    
    
   vlTotalSaldoCierre = (ObtenerValoresNumericos("vlSaldoFinalRealPesos")) - objCajas.vlSaldoInicialPesos + _
                        (ObtenerValoresNumericos("vlSaldoFinalRealDolares") - objCajas.vlSaldoInicialDolares) * objCajas.vlDiaDolar + _
                        (ObtenerValoresNumericos("vlSaldoFinalRealEuros") - objCajas.vlSaldoInicialEuros) * objCajas.vlDiaEuro + _
                        (ObtenerValoresNumericos("vlSaldoFinalRealReales") - objCajas.vlSaldoInicialReales) * objCajas.vlDiaReal

    vlTotalSaldoFinal = objCajas.vlSaldoFinalPesos + _
                        (objCajas.vlSaldoFinalDolares * objCajas.vlDiaDolar) + _
                        (objCajas.vlSaldoFinalReales * objCajas.vlDiaReal) + _
                        (objCajas.vlSaldoFinalEuros * objCajas.vlDiaEuro)
     
     
    ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoFinal", "<-", CStr(FormatNumber(vlTotalSaldoFinal, 2))
       
    ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoCierre", "<-", CStr(FormatNumber(vlTotalSaldoCierre, 2))
    
    If Not ObjTablasIO.Actualizar() Then
            objbasededatos.RollBackTrans
            MsgBox "Error: no se pudo insertar el registro. " + _
            ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
            Me.Enabled = True
            Exit Sub
    End If
    objbasededatos.CommitTrans
    
    Me.Enabled = True
    Unload Me
    


End Sub


Private Sub cmdCancelar_Click()

    objParametros.GrabarValor "Cancela", "SI"
    Unload Me
    
End Sub


Private Function ExisteDiferencia() As Boolean
Dim vlTotalSaldoFinal     As Single
Dim vlTotalSaldoFinalReal As Single

    ' Calculamos los datos del sistema
    objCajas.SumarCajaPuestos (objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja"))

    ObtenerCampo("vlTotalSaldoFinalReal").Text = FormatNumber(ObtenerPesos("vlTotalSaldoFinalReal"), 2)

    If CDbl(FormatNumber(ObtenerPesos("vlTotalSaldoFinalReal"), 2)) = CDbl(FormatNumber(ObtenerPesosSaldoSistema(), 2)) Then
        ObtenerCampo("vlDiferenciaDeCierre").ForeColor = vbBlack
        ObtenerCampo("vlDiferenciaDeCierre").Text = FormatNumber("0", 2)
        Me.lbldiferencia = ""
        ObtenerCampo("dsDiferenciaDeCierre").Text = ""
        ExisteDiferencia = False
    Else
        If ObtenerPesosSaldoSistema() > ObtenerPesos("vlTotalSaldoFinalReal") Then
            ObtenerCampo("vlDiferenciaDeCierre").ForeColor = Rojo
            Me.lbldiferencia = "Faltante"
            ObtenerCampo("dsDiferenciaDeCierre").Text = "Faltante de dinero"
        Else
            ObtenerCampo("vlDiferenciaDeCierre").ForeColor = vbBlack
            Me.lbldiferencia = "Sobrante"
            ObtenerCampo("dsDiferenciaDeCierre").Text = "Sobrante de dinero"
        End If
        ObtenerCampo("vlDiferenciaDeCierre").Text = FormatNumber(ObtenerValoresNumericos("vlTotalSaldoFinalReal") - ObtenerPesosSaldoSistema())
        ExisteDiferencia = True
    End If

End Function


Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If
    
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


Private Sub imprimirCaja(porpantalla As Boolean)

    Frm_Principal.LimpiarReporte
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_cierredecaja_imprimev3_7.rpt"
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    
    objSPs.nmStoredProcedure = "rpt_cierredecaja_v3_7"
    objSPs.setearCampoValor "@nrCaja_param", objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    If Not objSPs.ExecSP() Then
        MsgBox "Error: " + objSPs.Error + ", función:rpt_cierredecaja_v3_7", vbCritical, "Atención"
        Exit Sub
    End If
    
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión del Cierre de Caja"
    
    Frm_Principal.CrystalReport1.StoredProcParam(0) = objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    Frm_Principal.CrystalReport1.Formulas(0) = "nrCajaManual=" + objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")

    ' Aparece la venta original
    On Error Resume Next
    ' hacer dinamica la cantidad de copias
    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    On Error GoTo 0
    
    
    ' Comentado en la <<version 4.1>> evitamos la impresion del duplicado
    ' solicitado por Sergio
'    Select Case objUsuario.tpAcceso
'    Case "Puestos"
'        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_ComprobantesManuales_cajapuesto_v3_7.rpt"
'    End Select
'
'    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
'    Frm_Principal.CrystalReport1.WindowTitle = "Comprobantes Manuales - Caja Nro: " + objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
'    Frm_Principal.CrystalReport1.StoredProcParam(0) = objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
'    Frm_Principal.CrystalReport1.Formulas(0) = ""
'
'    Frm_Principal.CrystalReport1.CopiesToPrinter = 1
'    On Error Resume Next
'    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
'    Frm_Principal.CrystalReport1.Action = 1
'    If Err Then
'        MsgBox "ERROR: " + Err.Description + " -  Nombre del reporte:  " + Frm_Principal.CrystalReport1.ReportFileName, vbInformation + vbDefaultButton1, "Atención"
'    End If
'    On Error GoTo 0

End Sub



