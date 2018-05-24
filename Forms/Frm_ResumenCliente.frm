VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "MSCOMCTL.OCX"
Begin VB.Form Frm_ResumenCliente 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Resumenes Clientes"
   ClientHeight    =   7335
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10230
   ClipControls    =   0   'False
   DrawStyle       =   5  'Transparent
   Icon            =   "Frm_ResumenCliente.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
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
      TabIndex        =   12
      Top             =   3780
      Visible         =   0   'False
      Width           =   5340
      Begin MSComctlLib.ProgressBar ProgressBar 
         Height          =   480
         Left            =   315
         TabIndex        =   13
         Top             =   615
         Width           =   4575
         _ExtentX        =   8070
         _ExtentY        =   847
         _Version        =   393216
         Appearance      =   0
         Scrolling       =   1
      End
      Begin VB.Label Label1 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Porcentaje "
         Height          =   255
         Left            =   315
         TabIndex        =   16
         Top             =   375
         Width           =   855
      End
      Begin VB.Label lblvlPorcentaje 
         BackColor       =   &H00FFFFFF&
         Caption         =   "10 %"
         Height          =   255
         Left            =   1155
         TabIndex        =   15
         Top             =   375
         Width           =   510
      End
      Begin VB.Label Label2 
         BackColor       =   &H00FFFFFF&
         Caption         =   "100 %"
         Height          =   240
         Left            =   4380
         TabIndex        =   14
         Top             =   390
         Width           =   510
      End
   End
   Begin VB.CheckBox chkTodosLosClientes 
      Appearance      =   0  'Flat
      BackColor       =   &H80000000&
      Caption         =   "Todos los Clientes "
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   780
      Width           =   5415
   End
   Begin VB.CommandButton cmdBuscar 
      Height          =   375
      Left            =   5760
      Picture         =   "Frm_ResumenCliente.frx":030A
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1800
      Width           =   375
   End
   Begin VB.TextBox txtFields 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
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
      Height          =   285
      Index           =   19
      Left            =   1380
      Locked          =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   8
      TabStop         =   0   'False
      Tag             =   "dsRazonSocial"
      Top             =   1332
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
      Tag             =   "cdCliente"
      ToolTipText     =   "Ingrese una Licencia"
      Top             =   1335
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
      ImageList       =   "imgResumenClientes"
      HotImageList    =   "imgResumenClientesResaltado"
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
      MouseIcon       =   "Frm_ResumenCliente.frx":040C
      Begin MSComctlLib.ImageList imgResumenClientesResaltado 
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
               Picture         =   "Frm_ResumenCliente.frx":056E
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":068A
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":07DE
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":08EE
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":09F0
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":0B44
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":0C50
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":12CC
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":1434
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":1888
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":1CDC
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgResumenClientes 
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
               Picture         =   "Frm_ResumenCliente.frx":2356
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":246E
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":25C2
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":26DA
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":27E6
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":293A
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":2A42
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":30BE
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":321E
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":3672
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCliente.frx":3AC6
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   360
      Index           =   0
      Left            =   1410
      TabIndex        =   2
      Tag             =   "dtDesde"
      Top             =   1755
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   635
      _Version        =   393216
      Format          =   149553153
      CurrentDate     =   38267
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   345
      Index           =   1
      Left            =   3915
      TabIndex        =   3
      Tag             =   "dtHasta"
      Top             =   1785
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   609
      _Version        =   393216
      Format          =   149553153
      CurrentDate     =   38267
   End
   Begin MSComctlLib.ListView lstBusqueda 
      Height          =   4950
      Left            =   105
      TabIndex        =   10
      Top             =   2280
      Width           =   9990
      _ExtentX        =   17621
      _ExtentY        =   8731
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
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDragMode     =   1
      OLEDropMode     =   1
      NumItems        =   12
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Tag             =   "cdCliente"
         Text            =   "Cod. Cliente"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Object.Tag             =   "nrTalonarioCliente"
         Text            =   "Talonario"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Object.Tag             =   "nrComprabanteCliente"
         Text            =   "Comprobante"
         Object.Width           =   2293
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Object.Tag             =   "vlMontoCupon"
         Text            =   "Total Fact."
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Object.Tag             =   "dtCupon"
         Text            =   "Fecha"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Object.Tag             =   "flCompensado"
         Text            =   "Compensado"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Object.Tag             =   "dtCompensado"
         Text            =   "Fecha"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   7
         Object.Tag             =   "flAnulado"
         Text            =   "Anulado"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   8
         Object.Tag             =   "dsDestino"
         Text            =   "Descripción"
         Object.Width           =   6350
      EndProperty
      BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   9
         Object.Tag             =   "nrLicencia"
         Text            =   "Licencia"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   10
         Object.Tag             =   "nmLicenciatario"
         Text            =   "Licenciatario"
         Object.Width           =   2999
      EndProperty
      BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   11
         Object.Tag             =   "tpCupon"
         Text            =   "Cond. Venta"
         Object.Width           =   2822
      EndProperty
   End
   Begin VB.Label Label19 
      Caption         =   "Cliente"
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
      Left            =   1365
      TabIndex        =   9
      Top             =   1095
      Width           =   1455
   End
   Begin VB.Label Label3 
      Caption         =   "Codigo"
      Height          =   300
      Left            =   120
      TabIndex        =   7
      Top             =   1125
      Width           =   825
   End
   Begin VB.Label lblLabels 
      Caption         =   "Hasta"
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
      Index           =   9
      Left            =   3195
      TabIndex        =   6
      Top             =   1860
      Width           =   645
   End
   Begin VB.Label lblLabels 
      Caption         =   "Fecha Desde"
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
      Index           =   10
      Left            =   90
      TabIndex        =   5
      Top             =   1875
      Width           =   1200
   End
End
Attribute VB_Name = "Frm_ResumenCliente"
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


Private Sub chkTodosLosClientes_Click()

    If chkTodosLosClientes.value = vbUnchecked Then
        HabilitarCampos "cdCliente", True
    Else
        ObtenerCampo("dsRazonSocial").Text = ""
        ObtenerCampo("cdCliente").Text = ""
        HabilitarCampos "cdCliente", False
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


    If Me.chkTodosLosClientes.value = vbUnchecked And Trim(ObtenerCampo("cdCliente").Text) = "" Then
        MsgBox "Debe completar el campo de Cliente.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("cdCliente").SetFocus
        Exit Sub
    End If
    
    
    If ObtenerCampo("dtDesde").value > ObtenerCampo("dtHasta").value Then
        MsgBox "La fecha desde no puede ser mayor a la fecha hasta.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("dtDesde").SetFocus
        Exit Sub
    End If
    
         Me.lstBusqueda.ListItems.Clear
         ObjTablasIO.nmTabla = "TB_Cupones"
         
         ObjTablasIO.setearCampoOperadorValor "cdCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlMontoCupon", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dtCupon", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dsDestino", "->", ""
         ObjTablasIO.setearCampoOperadorValor "flCompensado", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dtCompensado", "->", ""
         ObjTablasIO.setearCampoOperadorValor "flAnulado", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dtAnulado", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrLicencia", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nmLicenciatario", "->", ""
         ObjTablasIO.setearCampoOperadorValor "tpCupon", "->", ""
         
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         
         ObjTablasIO.setearCampoOperadorValor "tpCupon", "=", "Contado", " AND "
         If Me.chkTodosLosClientes.value = vbChecked Then
             ObjTablasIO.setearCampoOperadorValor "cdCliente", "LIKE", "*", " AND ", " ASC "
         Else
             ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", ObtenerCampo("cdCliente"), " AND "
         End If
        
         ObjTablasIO.setearCampoOperadorValor "dtCupon", ">=", Format(ObtenerCampo("dtDesde").value, "DD/MM/YYYY 00:00:00.000"), " AND "
         ObjTablasIO.setearCampoOperadorValor "dtCupon", "<=", Format(ObtenerCampo("dtHasta").value, "DD/MM/YYYY 23:59:59.000")
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Cupones"
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
             MsgBox "No existe datos para la selección, por favor verifique el rango de fecha ingresado.", vbInformation, "Atención"
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
    ObtenerCampo("dtDesde").value = "01/" + CStr(Month(Date)) + "/" + CStr(Year(Date))
    ObtenerCampo("dtHasta").value = Date
    
End Sub







Private Sub BusquedaporClave(pClave As String)
Dim Control As Control
Dim Valor   As Variant
    
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", pClave
    
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
    Case "Imprimir"
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

    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
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
           Me.tlb_ABM.Buttons("imprimir").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
    End Select
    

End Sub





Private Sub txtFields_GotFocus(Index As Integer)

    DoEvents
    If Me.txtFields(Index).Tag <> "" Then
            objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                                      Me.txtFields(Index), "GotFocus"
    End If
    
End Sub

Private Sub txtFields_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyF1 Then
          Select Case UCase(txtFields(Index).Tag)
          Case UCase("cdCliente")
            ObtenerCampo("cdCliente").Text = ""
            objParametros.GrabarValor "nmTablaBusqueda", "TB_Clientes"
            objParametros.GrabarValor "nmCampoClaveBusqueda", "cdCliente"
            objParametros.GrabarValor "vlCampoClaveBusqueda", ""
            Frm_Busquedas.Show 1
            ObtenerCampo("cdCliente").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
            buscarcampocliente
          End Select
    End If
End Sub





Private Sub buscarcampocliente()
Dim Control As Control
Dim Valor   As Variant
Dim i       As Integer


         If Not ObtenerCampo("cdCliente").Text = "(Nuevo)" Then
                ObjTablasIO.nmTabla = "TB_Clientes"
                ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
                ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", ObtenerCampo("cdCliente").Text
                ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "->", ""
                
                If Not ObjTablasIO.Seleccionar Then
                    MsgBox "El cliente no existe, por favor ingrese un nuevo valor.", vbInformation + vbDefaultButton1, "Atención"
                    Exit Sub
                End If
                
                If Not ObjTablasIO.rs_resultados.EOF Then
                    For Each Control In Me.Controls
                        If Not IsMissing(Control.Tag) Then
                            If Not Control.Tag = "" Then
                                    If Control.Tag <> "cdCliente" Then
                                        For i = 0 To ObjTablasIO.rs_resultados.Fields.Count - 1
                                            If Control.Tag = ObjTablasIO.rs_resultados.Fields(i).Name Then
                                                Valor = objDiccionariodeDatos.FormatearCampoValor _
                                                        ("TB_Clientes", Control.Tag, _
                                                        CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                                                Control.Text = Valor
                                            End If
                                        Next i
                                    End If
                                End If
                            End If
                    Next
                    ObtenerCampo("cdCliente").BackColor = Blanco
                Else
                    ObtenerCampo("cdCliente").BackColor = Rojo
                    ObtenerCampo("cdCliente").SetFocus
                End If
            Else
                ObtenerCampo("cdCliente").BackColor = Blanco
            End If
            
   
End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cupones", _
                            Me.txtFields(Index), KeyAscii)
    End If
    
End Sub


Private Sub txtFields_LostFocus(Index As Integer)
    
    Select Case txtFields(Index).Tag
    Case "cdCliente"
        If (Not txtFields(Index).Text = "(Borrar)") And _
            Trim(txtFields(Index).Text) <> "" And Trim(txtFields(Index).Text) <> "*" Then
            buscarcampocliente
            objDiccionariodeDatos.FormatearCampoControl "TB_Cupones", _
                              Me.txtFields(Index), "LostFocus"
        End If
 
    End Select
    
End Sub

