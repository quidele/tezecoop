VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MsComCtl.ocx"
Begin VB.Form Frm_ResumenLicenciatarioCajaADM 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Pagos a Licenciatarios de la Caja Actual"
   ClientHeight    =   7335
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10230
   ClipControls    =   0   'False
   DrawStyle       =   5  'Transparent
   Icon            =   "Frm_ResumenLicenciatarioCajaADM.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7335
   ScaleWidth      =   10230
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fra_ProgressBar 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Exportando los datos ....."
      ForeColor       =   &H80000008&
      Height          =   1650
      Left            =   2475
      TabIndex        =   8
      Top             =   3585
      Visible         =   0   'False
      Width           =   5340
      Begin MSComctlLib.ProgressBar ProgressBar 
         Height          =   480
         Left            =   315
         TabIndex        =   9
         Top             =   615
         Width           =   4575
         _ExtentX        =   8070
         _ExtentY        =   847
         _Version        =   393216
         Appearance      =   0
      End
      Begin VB.Label Label1 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Porcentaje "
         Height          =   255
         Left            =   315
         TabIndex        =   12
         Top             =   375
         Width           =   855
      End
      Begin VB.Label lblvlPorcentaje 
         BackColor       =   &H00FFFFFF&
         Caption         =   "10 %"
         Height          =   255
         Left            =   1140
         TabIndex        =   11
         Top             =   375
         Width           =   510
      End
      Begin VB.Label Label2 
         BackColor       =   &H00FFFFFF&
         Caption         =   "100 %"
         Height          =   240
         Left            =   4380
         TabIndex        =   10
         Top             =   390
         Width           =   510
      End
   End
   Begin VB.CheckBox chkTodosLosLicenciatarios 
      Appearance      =   0  'Flat
      Caption         =   "Todos los Licenciatarios "
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   780
      Width           =   5415
   End
   Begin VB.CommandButton cmdBuscar 
      Height          =   375
      Left            =   5625
      Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":030A
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1320
      Width           =   375
   End
   Begin VB.TextBox txtFields 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
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
      Height          =   285
      Index           =   19
      Left            =   1380
      Locked          =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   4
      TabStop         =   0   'False
      Tag             =   "nmLicenciatario"
      Top             =   1350
      Width           =   4185
   End
   Begin VB.TextBox txtFields 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      Height          =   285
      Index           =   13
      Left            =   120
      TabIndex        =   1
      Tag             =   "nrLicencia"
      ToolTipText     =   "Ingrese una Licencia"
      Top             =   1350
      Width           =   1170
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10230
      _ExtentX        =   18045
      _ExtentY        =   1164
      ButtonWidth     =   2117
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgResumenLicenciatarios"
      HotImageList    =   "imgResumenLicenciatariosResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Caja"
            ImageKey        =   "Buscar"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Caja deseado"
            ImageKey        =   "Seleccionar"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Caja"
            ImageKey        =   "Agregar"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F5)"
            Key             =   "Exportar"
            ImageKey        =   "Exportar"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Aceptar(F4)"
            Key             =   "Aceptar"
            ImageKey        =   "Aceptar"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Cancelar(ESC)"
            Key             =   "Cancelar"
            ImageKey        =   "Cancelar"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Eliminar(F5)"
            Key             =   "Eliminar"
            ImageKey        =   "Eliminar"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Imprimir(F8)"
            Key             =   "Imprimir"
            ImageKey        =   "Imprimir"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Raya"
            Style           =   3
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Salir (ESC)"
            Key             =   "Salir"
            ImageKey        =   "Salir"
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_ResumenLicenciatarioCajaADM.frx":040C
      Begin MSComctlLib.ImageList imgResumenLicenciatariosResaltado 
         Left            =   5850
         Top             =   885
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   11
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":056E
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":068A
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":07DE
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":08EE
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":09F0
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":0B44
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":0C50
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":12CC
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":1434
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":1888
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":1CDC
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgResumenLicenciatarios 
         Left            =   5940
         Top             =   30
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   11
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":2356
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":246E
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":25C2
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":26DA
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":27E6
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":293A
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":2A42
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":30BE
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":321E
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":3672
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatarioCajaADM.frx":3AC6
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.ListView lstBusqueda 
      Height          =   5475
      Left            =   75
      TabIndex        =   6
      Top             =   1755
      Width           =   9990
      _ExtentX        =   17621
      _ExtentY        =   9657
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDragMode     =   1
      OLEDropMode     =   1
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDragMode     =   1
      OLEDropMode     =   1
      NumItems        =   14
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Tag             =   "nrLicencia"
         Text            =   "Licencia"
         Object.Width           =   1499
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Object.Tag             =   "dtComprobante"
         Text            =   "Fecha"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Object.Tag             =   "dsOpcional2"
         Text            =   "Destino"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Object.Tag             =   "vlMontoCupon"
         Text            =   "Total Fact."
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Object.Tag             =   "tpCupon"
         Text            =   "Cond. Venta"
         Object.Width           =   2822
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Object.Tag             =   "vlPagoPesos"
         Text            =   "Pago $"
         Object.Width           =   1587
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Object.Tag             =   "vlPagoDolares"
         Text            =   "Pago u$s"
         Object.Width           =   1587
      EndProperty
      BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   7
         Object.Tag             =   "vlPagoEuros"
         Text            =   "Pago EU"
         Object.Width           =   1587
      EndProperty
      BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   8
         Object.Tag             =   "vlComision"
         Text            =   "Comisión"
         Object.Width           =   1587
      EndProperty
      BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   9
         Object.Tag             =   "nrTalonarioCliente"
         Text            =   "Talonario"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   10
         Object.Tag             =   "nrComprabanteCliente"
         Text            =   "Comprabante"
         Object.Width           =   2646
      EndProperty
      BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   11
         Object.Tag             =   "flCompensado"
         Text            =   "Compensado"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   12
         Object.Tag             =   "nrCajaLicenciatario"
         Text            =   "Nro. de Caja"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(14) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   13
         Object.Tag             =   "nrCupon"
         Text            =   "Nro. Cupon"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label Label19 
      Caption         =   "Licenciatario"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   1365
      TabIndex        =   5
      Top             =   1095
      Width           =   1455
   End
   Begin VB.Label Label3 
      Caption         =   "Licencia"
      Height          =   300
      Left            =   120
      TabIndex        =   3
      Top             =   1125
      Width           =   825
   End
End
Attribute VB_Name = "Frm_ResumenLicenciatarioCajaADM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

    
Dim EstadoABM As Byte
Dim objControl As New CControl


Public Sub RefrescarProgressbar(pAvance As Long)

    DoEvents
    On Error Resume Next
    Me.ProgressBar.value = pAvance
    Me.lblvlPorcentaje.Caption = CStr(pAvance) + " %"
    On Error GoTo 0
    Me.Visible = True
    DoEvents

End Sub

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


Private Sub chkTodosLosLicenciatarios_Click()

    If chkTodosLosLicenciatarios.value = vbUnchecked Then
        HabilitarCampos "nrLicencia", True
    Else
        ObtenerCampo("nrLicencia").Locked = False
        ObtenerCampo("nrLicencia").Text = ""
        ObtenerCampo("nmLicenciatario").Text = ""
        ObtenerCampo("nrLicencia").Text = ""
        HabilitarCampos "nrLicencia", False
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

Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
          ' ObtenerCampo(nmCampo).SetFocus
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub

Private Sub cmdBuscar_Click()


    If Me.chkTodosLosLicenciatarios.value = vbUnchecked And Trim(ObtenerCampo("nrLicencia").Text) = "" Then
        MsgBox "Debe completar el campo de licencia.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrLicencia").SetFocus
        Exit Sub
    End If
    

    
         Me.lstBusqueda.ListItems.Clear
         ObjTablasIO.nmTabla = "VW_Cupones"
         ObjTablasIO.setearCampoOperadorValor "nrLicencia", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlMontoCupon", "->", ""
         ObjTablasIO.setearCampoOperadorValor "tpCupon", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlPagoPesos", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlPagoDolares", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlPagoEuros", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlComision", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "->", ""
         
         ObjTablasIO.setearCampoOperadorValor "flCompensado", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dtComprobante", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dsOpcional2", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrCajaLicenciatario", "->", "", , " ASC "
         ObjTablasIO.setearCampoOperadorValor "nrCupon", "->", ""
         
         If Me.chkTodosLosLicenciatarios.value = vbChecked Then
             ObjTablasIO.setearCampoOperadorValor "nrLicencia", "LIKE", "*", " AND ", " ASC "
         Else
             ObjTablasIO.setearCampoOperadorValor "nrLicencia", "=", ObtenerCampo("nrLicencia"), " AND "
         End If
         
         ObjTablasIO.setearCampoOperadorValor "dtCupon", "->", "", "ASC"
         ObjTablasIO.setearCampoOperadorValor "flCompensado", "=", "1", " AND "
         ObjTablasIO.setearCampoOperadorValor "nrCajaLicenciatario", "=", objParametros.ObtenerValor("nrCaja")
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "VW_Cupones"
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
             MsgBox "No existen datos para la selección", vbInformation, "Atención"
         End If
    

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)


    Select Case KeyCode
    Case vbKeyEscape
            If EstadoABM = Consulta Then
                If tlb_ABM.Buttons("Salir").Visible Then
                    tlb_ABM_ButtonClick tlb_ABM.Buttons("Salir")
                End If
            Else
                If tlb_ABM.Buttons("Cancelar").Visible Then
                    tlb_ABM_ButtonClick tlb_ABM.Buttons("Cancelar")
                End If
            End If
    Case vbKeyF2
            If tlb_ABM.Buttons("Buscar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
            End If
    Case vbKeyF5
        If EstadoABM = Consulta Then
            If tlb_ABM.Buttons("Exportar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
            End If
        Else
            If tlb_ABM.Buttons("Eliminar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Eliminar")
            End If
        End If
    End Select


End Sub

Private Sub Form_Load()

    
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    EstadoABM = Consulta
End Sub







Private Sub BusquedaporClave(pClave As String)
Dim Control As Control
Dim Valor   As Variant
    
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", pClave, " AND "
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
    
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                ObjTablasIO.setearCampoOperadorValor _
                Control.Tag, _
                "->", ""
            End If
        End If
    Next
    ObjTablasIO.Seleccionar
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                    On Error Resume Next
                    Valor = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_Cupones", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    Control.Text = Valor
                    If Err Then
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
End Sub




Private Sub lstBusqueda_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)

    If lstBusqueda.SortKey = ColumnHeader.Index - 1 Then
        If lstBusqueda.SortOrder = lvwAscending And lstBusqueda.Sorted Then
            lstBusqueda.SortOrder = lvwDescending
        Else
            lstBusqueda.SortOrder = lvwAscending
        End If
        lstBusqueda.SortKey = ColumnHeader.Index - 1
    Else
       lstBusqueda.SortOrder = lvwAscending
       lstBusqueda.SortKey = ColumnHeader.Index - 1
    End If
    ' lstBusqueda.Refresh
    lstBusqueda.Sorted = True
End Sub

Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
    
    Select Case Button.Key
    Case "Buscar"
           cmdBuscar_Click
           PresentarPantalla Button
           ' buscar en la base de datos
           EstadoABM = Consulta
    Case "Seleccionar"
                EstadoABM = Consulta
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
           If Guardarregistro(EstadoABM) Then
                If objConfig.AbreCaja = "SI" Then
                    Unload Me
                    Exit Sub
                End If
                PresentarPantalla Button
                EstadoABM = Consulta
           End If
    Case "Cancelar"
                Unload Me
                PresentarPantalla Button
                EstadoABM = Consulta
    End Select
    
End Sub



Private Sub ExportaraExcel()
Dim strError  As String



    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Cupones") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
End Sub


Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control As Control
Dim strtag  As String
Dim strPrefijo As String

    ObjTablasIO.nmTabla = "TB_Cupones"
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            strPrefijo = Mid(Control.Tag, 1, 3)
            If Not strPrefijo = "lbl" Then
                If Not Control.Tag = "" Then
                    strtag = Mid(Control.Tag, 1, 2)
                        If strtag = "fl" Then
                            ObjTablasIO.setearCampoOperadorValor _
                            Control.Tag, _
                            "<-", Control.value
                        Else
                            ObjTablasIO.setearCampoOperadorValor _
                            Control.Tag, _
                            "<-", Trim(Control.Text)
                        End If
                End If
             End If
        End If
    Next

    Select Case EstadoABM
    Case modificacion
            ObjTablasIO.setearCampoOperadorValor "nrCaja", _
            "=", ObtenerCampo("nrCaja").Text
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                Guardarregistro = True
            End If
    Case alta
            If Not ObjTablasIO.Insertar Then
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Cupones", "nrCaja", objConfig.nrPuesto
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                
                Guardarregistro = True
            End If
    Case CerrarCaja
            ObjTablasIO.setearCampoOperadorValor "nrCaja", _
            "=", ObtenerCampo("nrCaja").Text
            ObjTablasIO.setearCampoOperadorValor "flEstado", _
            "<-", "1"
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                Guardarregistro = True
            End If
    End Select

End Function




Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
    End Select
    

End Sub





Private Sub txtFields_GotFocus(Index As Integer)

    DoEvents
    If Me.txtFields(Index).Tag <> "" Then
            objDiccionariodeDatos.FormatearCampoControl "TB_Cupones", _
                                      Me.txtFields(Index), "GotFocus"
    End If
    
End Sub

Private Sub txtFields_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyF1 Then
          Select Case UCase(txtFields(Index).Tag)
          Case UCase("nrLicencia")
            ObtenerCampo("nrLicencia").Text = "(Borrar)"
            objParametros.GrabarValor "nmTablaBusqueda", "TB_Proveedores"
            objParametros.GrabarValor "nmCampoClaveBusqueda", "nrLicencia"
            objParametros.GrabarValor "vlCampoClaveBusqueda", ""
            Frm_Busquedas.Show 1
            ObtenerCampo("nrLicencia").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
            If Trim(ObtenerCampo("nrLicencia").Text) = "(Nuevo)" Then
                ObtenerCampo("nrLicencia").Text = ""
            Else
                buscarlicencia
            End If
          End Select
    End If
End Sub





Private Function buscarlicencia() As Boolean
Dim strNombreCompleto As String

    
    ObjTablasIO.nmTabla = "TB_Proveedores"
    ObjTablasIO.setearCampoOperadorValor "tpCategoria", "=", "Licenciatario", " AND "
    ObjTablasIO.setearCampoOperadorValor _
    "nrLicencia", "=", ObtenerCampo("nrLicencia").Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
    ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
    ObjTablasIO.Seleccionar
    If Not ObjTablasIO.rs_resultados.EOF Then
        strNombreCompleto = IIf(IsNull(ObjTablasIO.rs_resultados("nmApellido").value), "", ObjTablasIO.rs_resultados("nmApellido").value) + " "
        strNombreCompleto = strNombreCompleto & IIf(IsNull(ObjTablasIO.rs_resultados("nmNombre").value), "", ObjTablasIO.rs_resultados("nmNombre").value)
        ObtenerCampo("nmLicenciatario").Text = strNombreCompleto
        buscarlicencia = True
    Else
        MsgBox "La licencia es invalida, por favor ingrese una correcta", vbCritical + vbDefaultButton1, "Atención"
        ObtenerCampo("nrLicencia").BackColor = Rojo
        buscarlicencia = False
    End If
         
End Function

Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cupones", _
                            Me.txtFields(Index), KeyAscii)
    End If
    
End Sub


Private Sub txtFields_LostFocus(Index As Integer)
    
    Select Case txtFields(Index).Tag
    Case "nrLicencia"
        If (Not txtFields(Index).Text = "(Borrar)") And _
            Trim(txtFields(Index).Text) <> "" And Trim(txtFields(Index).Text) <> "*" Then
            buscarlicencia
            objDiccionariodeDatos.FormatearCampoControl "TB_Cupones", _
                              Me.txtFields(Index), "LostFocus"
        End If
 
    End Select
    
End Sub

