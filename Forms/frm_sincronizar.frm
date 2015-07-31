VERSION 5.00
Begin VB.Form frm_sincronizar 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFC0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Sincronizar Sistemas Puestos <-> Administración"
   ClientHeight    =   3225
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   7380
   Icon            =   "frm_sincronizar.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3225
   ScaleWidth      =   7380
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdSalir 
      Caption         =   "Salir"
      Height          =   390
      Left            =   3615
      TabIndex        =   3
      Top             =   2745
      Width           =   1155
   End
   Begin VB.CommandButton cmdProcesar 
      Caption         =   "Procesar"
      Height          =   390
      Left            =   2445
      TabIndex        =   2
      Top             =   2745
      Width           =   1140
   End
   Begin VB.PictureBox pnl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   2655
      Index           =   2
      Left            =   75
      ScaleHeight     =   2625
      ScaleWidth      =   7110
      TabIndex        =   0
      Top             =   45
      Width           =   7140
      Begin VB.ComboBox cbUnidadesRemovibles 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   180
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   405
         Width           =   6765
      End
      Begin VB.TextBox txtObservacion 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   1425
         Left            =   165
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   4
         Tag             =   "observaciones_sincronizar"
         Top             =   1050
         Width           =   6780
      End
      Begin VB.Label Label1 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Unidad de Disco USB utilizada"
         Height          =   255
         Left            =   180
         TabIndex        =   6
         Top             =   165
         Width           =   4080
      End
      Begin VB.Label Label2 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Observaciones"
         Height          =   255
         Left            =   165
         TabIndex        =   1
         Top             =   840
         Width           =   2040
      End
   End
End
Attribute VB_Name = "frm_sincronizar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim objUnidadesMoviles      As New CDrives
Dim objSincronizadorManual  As New CSincronizadorManual

Dim objMDB                As CMySQLBasededatos
Dim ObjMDBTablasIO        As CMySQLTablasIO
Dim objMDBDiccdeDatos     As CMySQLDiccDatos
Dim objMDBSPs             As CMySQLSPsIO
Dim dsError               As String



Private Function Configurando_MDB(pnMDB As String) As Boolean

    Configurando_MDB = False
        
    Set objMDB = New CMySQLBasededatos
    Set ObjMDBTablasIO = New CMySQLTablasIO
    Set objMDBDiccdeDatos = New CMySQLDiccDatos
    Set objMDBSPs = New CMySQLSPsIO


    objMDB.dsDSN = ""
    objMDB.dsUID = ""
    objMDB.dsMotorBD = "MDB"
    objMDB.nmBasededatos = pnMDB
    ' abriendo el sistema Remoto
    If Not objMDB.abrirBD Then
            dsError = "Error al realizar la apertura de la base Remota." + _
                   vbCrLf + "Error extendido" + objMDB.Error
            Exit Function
    End If
    ' configurando el diccionario del sistema Remoto
    Set objMDBDiccdeDatos.Basededatos = objMDB
    If Not objMDBDiccdeDatos.InicializarDiccionario() Then
        dsError = "Error al realizar la apertura de la base de tranferencia de la informacion (MDB)." + _
                   vbCrLf + "Error extendido" + objMDBDiccdeDatos.Error
        Exit Function
    End If
    
    Set objMDB.DiccionarioDeDatos = objMDBDiccdeDatos
    
    ObjMDBTablasIO.dsMotorBD = "MDB"
    Set ObjMDBTablasIO.Basededatos = objMDB
    
    Set ObjMDBTablasIO.DiccionarioDeDatos = objMDBDiccdeDatos
    Set objMDBDiccdeDatos.TablasIO = ObjMDBTablasIO
    
    ' inicializacion del objeto Stores Procedures
    objMDBSPs.dsMotorBD = "MDB"
    Set objMDBSPs.Basededatos = objMDB
    Set objMDBSPs.DiccionarioDeDatos = objMDBDiccdeDatos
    
    Configurando_MDB = True

End Function


Private Function asignarDatosObjetosSincronizador() As Boolean

    asignarDatosObjetosSincronizador = False
    
    Set objMDB.DiccionarioDeDatos = objMDBDiccdeDatos
    Set objSincronizadorManual.lobjRemotoBD = objMDB
    Set objSincronizadorManual.lObjRemotoTablasIO = ObjMDBTablasIO
    Set objSincronizadorManual.LobjRemotoDiccdeDatos = objMDBDiccdeDatos
    
    Set objbasededatos.DiccionarioDeDatos = objDiccionariodeDatos
    Set objSincronizadorManual.lobjLocalBD = objbasededatos
    Set objSincronizadorManual.lobjLocalDiccdeDatos = objDiccionariodeDatos
    Set objSincronizadorManual.lObjLocalTablasIO = ObjTablasIO
    
    If Not objSincronizadorManual.Inicializar() Then
        dsError = objSincronizadorManual.Error
        Exit Function
    End If
    
    asignarDatosObjetosSincronizador = True

End Function



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
                    Control.Value = False
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


Private Sub cmdProcesar_Click()
Dim l_strWherecajasaSincronizar As String
Dim hayBaseADMPuesto            As Boolean

    If Me.cbUnidadesRemovibles.Text = "" Then
        MsgBox "Debe ingresar la Unidad de Disco USB-Pendrive.", vbInformation + vbDefaultButton1, "Atención"
        Me.cbUnidadesRemovibles.SetFocus
        Exit Sub
    End If

    l_strWherecajasaSincronizar = objParametros.ObtenerValor("WherecajasaSincronizar")
    
    ' Puedo hacer realizar Puesto <-> Administracion
    
    If objUnidadesMoviles.CopiarMDBPendriveaDisco(Me.cbUnidadesRemovibles.Text) Then
        If Not Configurando_MDB(App.Path + "\SincroManual\Puesto_ADM.mdb") Then
            ' No se pudo realizar de ADM a Puesto
            MsgBox dsError
        Else
            ' Hacer sincronización ADM -> Puesto
            hayBaseADMPuesto = True
        End If
    End If
    
    If Not hayBaseADMPuesto Then
        If Not objUnidadesMoviles.CopiarMDBPlantillaDisco() Then
            MsgBox objUnidadesMoviles.Error, vbInformation, "Atencion"
        End If
    End If
        
    ' Puesto -> Administracion
    If Not Configurando_MDB(App.Path + "\SincroManual\Puesto_ADM.mdb") Then
        MsgBox "Error: " + dsError, vbInformation, "Atencion"
        Exit Sub
    End If
    
    
    If Not asignarDatosObjetosSincronizador Then
        MsgBox "Error: " + dsError, vbInformation, "Atencion"
        Exit Sub
    End If
    
    ' realizar sincronizacion
     If Not objSincronizadorManual.Sincronizar(l_strWherecajasaSincronizar) Then
        MsgBox objSincronizadorManual.Error, vbInformation, "Atencion"
        Exit Sub
     End If
    
    
    ' Copiar MDB a Pendrive
    If Not objUnidadesMoviles.CopiarMDBaPendrive(Me.cbUnidadesRemovibles.Text) Then
        MsgBox "Error: " + dsError, vbInformation, "Atencion"
        Exit Sub
    End If
    
    MsgBox "Proceso Finalizado.", vbInformation + vbDefaultButton1, "Atención"
    
    Unload Me
        

End Sub




Private Sub cmdSalir_Click()

    Unload Me

End Sub

Private Sub Form_Activate()

    If Me.cbUnidadesRemovibles.ListCount = 0 Then
        MsgBox "Por favor ingrese la unidad de disco extraible y luego realice click en el botón 'Aceptar'.", vbInformation + vbOKOnly, "Disco USB"
    End If
    DoEvents
    Sleep (1000)
    DoEvents
    
    Me.cbUnidadesRemovibles.Clear
    objUnidadesMoviles.ObtenerUnidadesMovilesDisponibles Me.cbUnidadesRemovibles, objConfig.nmUnidadxDefecto
           
End Sub

Private Sub Form_Load()

    Me.cbUnidadesRemovibles.Clear
    objUnidadesMoviles.ObtenerUnidadesMovilesDisponibles Me.cbUnidadesRemovibles, objConfig.nmUnidadxDefecto
        
    ObtenerCampo("observaciones_sincronizar") = objParametros.ObtenerValor("observaciones_sincronizar")
    
    
End Sub


