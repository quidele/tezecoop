VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Begin VB.Form Frm_Recaudaciones 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Resumen Recaudaciones"
   ClientHeight    =   7095
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10485
   ClipControls    =   0   'False
   Icon            =   "Frm_Recaudaciones.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7095
   ScaleWidth      =   10485
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtBusqueda 
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
      Left            =   6636
      Locked          =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   13
      TabStop         =   0   'False
      Tag             =   "nmLicenciatario"
      Top             =   1020
      Width           =   3732
   End
   Begin VB.TextBox txtBusqueda 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      Height          =   285
      Index           =   1
      Left            =   5736
      TabIndex        =   12
      Tag             =   "nrLicencia"
      ToolTipText     =   "Ingrese una Licencia"
      Top             =   1020
      Width           =   915
   End
   Begin VB.Frame fra_ProgressBar 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Exportando los datos ....."
      ForeColor       =   &H80000008&
      Height          =   1650
      Left            =   2820
      TabIndex        =   7
      Top             =   3096
      Visible         =   0   'False
      Width           =   5340
      Begin MSComctlLib.ProgressBar ProgressBar 
         Height          =   480
         Left            =   315
         TabIndex        =   8
         Top             =   615
         Width           =   4575
         _ExtentX        =   8070
         _ExtentY        =   847
         _Version        =   393216
         Appearance      =   0
      End
      Begin VB.Label Label4 
         BackColor       =   &H00FFFFFF&
         Caption         =   "100 %"
         Height          =   240
         Left            =   4380
         TabIndex        =   11
         Top             =   390
         Width           =   510
      End
      Begin VB.Label lblvlPorcentaje 
         BackColor       =   &H00FFFFFF&
         Caption         =   "10 %"
         Height          =   255
         Left            =   1140
         TabIndex        =   10
         Top             =   375
         Width           =   510
      End
      Begin VB.Label Label3 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Porcentaje "
         Height          =   255
         Left            =   315
         TabIndex        =   9
         Top             =   375
         Width           =   855
      End
   End
   Begin VB.CommandButton cmdBuscar 
      Height          =   375
      Left            =   5244
      Picture         =   "Frm_Recaudaciones.frx":030A
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   948
      Width           =   375
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10485
      _ExtentX        =   18494
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgRecaudaciones"
      DisabledImageList=   "imgResaltado"
      HotImageList    =   "imgResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Recaudacion"
            ImageKey        =   "Buscar"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Recaudacion deseado"
            ImageKey        =   "Seleccionar"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Recaudacion"
            ImageKey        =   "Agregar"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F5)"
            Key             =   "Exportar"
            ImageKey        =   "Exportar"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Reporte(F6)"
            Key             =   "Reporte"
            ImageKey        =   "Reporte"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Aceptar(F4)"
            Key             =   "Aceptar"
            ImageKey        =   "Aceptar"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Cancelar(ESC)"
            Key             =   "Cancelar"
            ImageKey        =   "Cancelar"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Eliminar(F5)"
            Key             =   "Eliminar"
            ImageKey        =   "Eliminar"
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
      MouseIcon       =   "Frm_Recaudaciones.frx":040C
      Begin MSComctlLib.ImageList imgResaltado 
         Left            =   6840
         Top             =   870
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
               Picture         =   "Frm_Recaudaciones.frx":056E
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":068A
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":07DE
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":08EE
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":09F0
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":0B44
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":0C50
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":12CC
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":1434
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":1888
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":1CDC
               Key             =   "Reporte"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgRecaudaciones 
         Left            =   8010
         Top             =   15
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
               Picture         =   "Frm_Recaudaciones.frx":1DEE
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":1F06
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":205A
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":2172
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":227E
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":23D2
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":24DA
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":2B56
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":2CB6
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":310A
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Recaudaciones.frx":355E
               Key             =   "Reporte"
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.ListView lstBusqueda 
      Height          =   5556
      Left            =   84
      TabIndex        =   2
      Top             =   1440
      Width           =   10296
      _ExtentX        =   18150
      _ExtentY        =   9790
      View            =   3
      LabelEdit       =   1
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
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Tag             =   "tpCupon"
         Text            =   "Condición de Venta"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Object.Tag             =   "vlCantidad"
         Text            =   "Cantidad de Viajes"
         Object.Width           =   2822
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Object.Tag             =   "vlMontoCupon"
         Text            =   "Facturación"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Object.Tag             =   "vlComision"
         Text            =   "Recaudación"
         Object.Width           =   2646
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Object.Tag             =   "vlIVA"
         Text            =   "IVA"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   360
      Index           =   0
      Left            =   1176
      TabIndex        =   3
      Tag             =   "dtDesde"
      Top             =   948
      Width           =   1692
      _ExtentX        =   2990
      _ExtentY        =   635
      _Version        =   393216
      Format          =   216006657
      CurrentDate     =   38267
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   348
      Index           =   1
      Left            =   3480
      TabIndex        =   4
      Tag             =   "dtHasta"
      Top             =   984
      Width           =   1692
      _ExtentX        =   2990
      _ExtentY        =   609
      _Version        =   393216
      Format          =   216006657
      CurrentDate     =   38267
   End
   Begin MSComctlLib.ImageList ImgOperadores 
      Left            =   2130
      Top             =   15
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483648
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":3670
            Key             =   "Similar"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":3782
            Key             =   "Igual"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":3894
            Key             =   "MayoroIgual"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":39A6
            Key             =   "Mayor"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":3AB8
            Key             =   "MenoroIgual"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":3BCA
            Key             =   "Menor"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   8820
      Top             =   624
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483648
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":3CDC
            Key             =   "Similar"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":3DEE
            Key             =   "Igual"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":3F00
            Key             =   "MayoroIgual"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":4012
            Key             =   "Mayor"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":4124
            Key             =   "MenoroIgual"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Recaudaciones.frx":4236
            Key             =   "Menor"
         EndProperty
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
      Height          =   228
      Left            =   6672
      TabIndex        =   15
      Top             =   684
      Width           =   1452
   End
   Begin VB.Label Label1 
      Caption         =   "Licencia"
      Height          =   300
      Left            =   5772
      TabIndex        =   14
      Top             =   696
      Width           =   828
   End
   Begin VB.Label lblLabels 
      Caption         =   "Fecha Desde"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Index           =   12
      Left            =   60
      TabIndex        =   6
      Top             =   1104
      Width           =   1200
   End
   Begin VB.Label lblLabels 
      Caption         =   "Hasta"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Index           =   13
      Left            =   2928
      TabIndex        =   5
      Top             =   1104
      Width           =   648
   End
End
Attribute VB_Name = "Frm_Recaudaciones"
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



Private Sub cmdBuscar_Click()
Dim strSQL  As String




        Me.lstBusqueda.ListItems.Clear
        
        ' MsgBox "Falta programar"

'        strSQL = strSQL + "@dtCupon_desde_param='" + Format(ObtenerCampo("dtDesde").value, "DD-MM-YYYY 00:00:00.000") + "',"
'        strSQL = strSQL + "@dtCupon_hasta_param='" + Format(ObtenerCampo("dtHasta").value, "DD-MM-YYYY 23:59:59.000") + "',"

        objSPs.nmStoredProcedure = "SP_rpt_recaudacion_v3_5"
        objSPs.setearCampoValor "@dtCupon_desde_param", Format(ObtenerCampo("dtDesde").value, "DD-MM-YYYY 00:00:00.000")
        objSPs.setearCampoValor "@dtCupon_hasta_param", Format(ObtenerCampo("dthasta").value, "DD-MM-YYYY 23:59:59.000")
        
        If Trim(Me.txtBusqueda(1).Text) <> "" Then
            objSPs.setearCampoValor "@nrLicencia_param", Me.txtBusqueda(1).Text
        Else
            objSPs.setearCampoValor "@nrLicencia_param", "0"
        End If
        
        If Not objSPs.ExecSP() Then
            MsgBox "Error al obtener los datos." + vbCrLf + "Error extendido: " + objSPs.Error, vbInformation + vbDefaultButton1, "Atención"
            Exit Sub
        End If
        
        
        If Not objSPs.rs_resultados.EOF Then
           objControl.CargarListView_SG objbasededatos.rs_resultados, Me.lstBusqueda, 0, "SP_rpt_recaudacion_v3_5"
        Else
            MsgBox "No existe datos para la selección, por favor verifique el rango de fecha ingresado.", vbInformation, "Atención"
        End If
        

       
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)


    Select Case KeyCode
    Case vbKeyEscape
            If EstadoABM = Consulta Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Salir")
            Else
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Cancelar")
            End If
    Case vbKeyF1
    Case vbKeyF2
        tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    Case vbKeyF3
        tlb_ABM_ButtonClick tlb_ABM.Buttons("Seleccionar")
    Case vbKeyF4
        If EstadoABM = Consulta Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Agregar")
        Else
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Aceptar")
        End If
    Case vbKeyF5
        If EstadoABM = Consulta Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
        Else
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Eliminar")
        End If
    Case vbKeyF6
        If tlb_ABM.Buttons("Reporte").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
        End If
    End Select


End Sub

Private Sub Form_Load()

    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    EstadoABM = Consulta
    limpiarControles
    ObtenerCampo("dtDesde").value = "01/" + CStr(Month(Date)) + "/" + CStr(Year(Date))
    ObtenerCampo("dtHasta").value = Date
    PresentarPantalla Me.tlb_ABM.Buttons("Buscar")
    
    
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



Private Sub HabilitarCampos(nmCampo As String, habilitar As Boolean)
    
    If Not habilitar Then
          ObtenerCampo(nmCampo).Locked = True
          ObtenerCampo(nmCampo).BackColor = Gris '&HE0E0E0
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
          ObtenerCampo(nmCampo).Locked = False
    End If

End Sub





Private Sub lstBusqueda_DblClick()


'    If Me.lstBusqueda.ListItems.Count < 1 Then Exit Sub
'    objParametros.GrabarValor "Precede_Resumen", "SI"
'    objParametros.GrabarValor "dsConcepto", Me.lstBusqueda.SelectedItem.SubItems(2)
'    objParametros.GrabarValor "tpConcepto", Me.lstBusqueda.SelectedItem.Text
'    objParametros.GrabarValor "tpOperacion", Me.lstBusqueda.SelectedItem.SubItems(1)
'    objParametros.GrabarValor "dtDesde", ObtenerCampo("dtDesde").value
'    objParametros.GrabarValor "dtHasta", ObtenerCampo("dtHasta").value
'
'    Frm_BusquedaRecaudaciones.Show vbModal
        
End Sub

Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
Dim resp        As Byte

    Select Case Button.Key
    Case "Buscar"
           ' buscar en la base de datos
           cmdBuscar_Click
           PresentarPantalla Me.tlb_ABM.Buttons("Buscar")
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           limpiarControles
           ' Pasar datos
           ' lstBusqueda_DblClick
    Case "Agregar"
           EstadoABM = alta
           limpiarControles
           PresentarPantalla Button
    Case "Eliminar"
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
    Case "Reporte"
         MostrarReporte
         cmdBuscar_Click
    Case "Cancelar"
            PresentarPantalla Button
            EstadoABM = Consulta
    End Select
    
End Sub



Private Sub MostrarReporte()
Dim strSQL As String

        txtBusqueda_LostFocus 1
                
        Frm_Principal.LimpiarReporte
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_recaudacion_v3_5.rpt"
        
        Frm_Principal.CrystalReport1.WindowState = crptMaximized
        Frm_Principal.CrystalReport1.Destination = crptToWindow
        Frm_Principal.CrystalReport1.WindowTitle = "Resúmenes Recaudaciones"
        Frm_Principal.CrystalReport1.StoredProcParam(0) = Format(ObtenerCampo("dtDesde").value, "YYYY-MM-DD 00:00:00.000")
        Frm_Principal.CrystalReport1.StoredProcParam(1) = Format(ObtenerCampo("dtHasta").value, "YYYY-MM-DD 23:59:59.000")
        
                
        If Trim(Me.txtBusqueda(1).Text) <> "" Then
            Frm_Principal.CrystalReport1.StoredProcParam(2) = Me.txtBusqueda(1).Text
        Else
            Frm_Principal.CrystalReport1.StoredProcParam(2) = "0"
        End If
        
        
        Frm_Principal.CrystalReport1.Formulas(0) = "fechadesde='" + CStr(ObtenerCampo("dtDesde").value) + "'"
        Frm_Principal.CrystalReport1.Formulas(1) = "fechahasta='" + CStr(ObtenerCampo("dtHasta").value) + "'"
        
        If Trim(Me.txtBusqueda(1).Text) <> "" Then
            Frm_Principal.CrystalReport1.Formulas(2) = "Licenciatario='LIC: " + Me.txtBusqueda(1).Text + " - " + ObtenerCampo("nmLicenciatario") + "'"
        Else
            Frm_Principal.CrystalReport1.Formulas(2) = "Licenciatario=' Todos los licenciatarios'"
        End If
        
        
        
        
        ' On Error Resume Next
        Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
        Frm_Principal.CrystalReport1.Action = 1
        If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
        End If
        On Error GoTo 0

End Sub






Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
          ' ObtenerCampo(nmCampo).SetFocus
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub




Private Sub ExportaraExcel()
Dim strError  As String

    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "SP_rpt_recaudacion_v3_5") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    
End Sub





Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.lstBusqueda.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           If objCajas.puedeOperar(ObtenerCampo("nrCaja"), ObtenerCampo("cdConcepto")) Then
                Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Else
                Me.tlb_ABM.Buttons("Eliminar").Visible = False
           End If
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
    Case "Agregar"
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Enabled = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
    Case "Eliminar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
    Case "Aceptar"
           If objParametros.ObtenerValor("CajaAbierta") = "SI" Then
                Me.tlb_ABM.Buttons("Agregar").Visible = True
           Else
                Me.tlb_ABM.Buttons("Agregar").Visible = False
           End If
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.lstBusqueda.Visible = True
    Case "Cancelar"
           If objParametros.ObtenerValor("CajaAbierta") = "NO" Then
             Me.tlb_ABM.Buttons("Agregar").Visible = False
           Else
             Me.tlb_ABM.Buttons("Agregar").Visible = True
           End If
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.lstBusqueda.Visible = True
    End Select

End Sub




Private Sub ColorearLineas()
Dim i As Integer
Dim j As Integer
Dim ItemList  As ListItem

    For i = 1 To Me.lstBusqueda.ListItems.Count
        
        For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
            If j = 1 Then
                If Me.lstBusqueda.ListItems(i).SubItems(1) = "Salida de Dinero" Then
                     Me.lstBusqueda.ListItems(i).ForeColor = Rojo
                     Me.lstBusqueda.ListItems(i).Bold = True
                     Me.lstBusqueda.ListItems(i).ListSubItems.Item(3).Text = -Abs(CSng(Me.lstBusqueda.ListItems(i).ListSubItems.Item(3).Text))
                     Me.lstBusqueda.ListItems(i).ListSubItems.Item(4).Text = -Abs(CSng(Me.lstBusqueda.ListItems(i).ListSubItems.Item(4).Text))
                     Me.lstBusqueda.ListItems(i).ListSubItems.Item(5).Text = -Abs(CSng(Me.lstBusqueda.ListItems(i).ListSubItems.Item(5).Text))
                Else
                     Me.lstBusqueda.ListItems(i).ForeColor = Azul
                     Me.lstBusqueda.ListItems(i).Bold = False
                End If
            End If
            If Me.lstBusqueda.ListItems(i).SubItems(1) = "Salida de Dinero" Then
                 Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Rojo
                 Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Bold = True
            Else
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Azul
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Bold = False
            End If
        Next j
        
    Next i

End Sub




Private Sub txtBusqueda_Change(Index As Integer)

    Select Case UCase(txtBusqueda(Index).Tag)
    Case UCase("nrLicencia")
        AvisarError "nrLicencia", False
    End Select

End Sub



Private Sub txtBusqueda_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)


    If KeyCode = vbKeyF1 Then
          Select Case UCase(txtBusqueda(Index).Tag)
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

Private Sub txtBusqueda_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cupones", _
                            Me.txtBusqueda(Index), KeyAscii)
    End If
End Sub

Private Sub txtBusqueda_LostFocus(Index As Integer)
    Select Case txtBusqueda(Index).Tag
    Case "nrLicencia"
        If (Not txtBusqueda(Index).Text = "(Borrar)") And _
            Trim(txtBusqueda(Index).Text) <> "" And Trim(txtBusqueda(Index).Text) <> "*" Then
            buscarlicencia
            objDiccionariodeDatos.FormatearCampoControl "TB_Cupones", _
                              Me.txtBusqueda(Index), "LostFocus"
        End If
 
    End Select

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
        MsgBox "La licencia es invalida, por favor ingrese una correcta", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nmLicenciatario").Text = ""
        AvisarError "nrLicencia", True
        ObtenerCampo("nrLicencia").SetFocus
        buscarlicencia = False
    End If
         
End Function

