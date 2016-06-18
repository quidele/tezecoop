VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form FrmAdmMetadata 
   Caption         =   "Genera Inserts"
   ClientHeight    =   5055
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7650
   LinkTopic       =   "Form1"
   ScaleHeight     =   5055
   ScaleWidth      =   7650
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdGenerarDDCamposLogicosdesdeDL 
      Caption         =   "Generar DD"
      Height          =   348
      Left            =   7116
      TabIndex        =   25
      Top             =   8520
      Width           =   1272
   End
   Begin VB.TextBox txtTablaObjetoDDdesdeDL 
      Appearance      =   0  'Flat
      Height          =   345
      Left            =   4140
      TabIndex        =   23
      Top             =   8544
      Width           =   2784
   End
   Begin VB.CommandButton cmdGenerarInsertDL 
      Caption         =   "Generar Inserts DL"
      Height          =   420
      Left            =   2256
      TabIndex        =   22
      Top             =   8472
      Width           =   1752
   End
   Begin VB.CommandButton cmdEliminarDD 
      Caption         =   "Eliminar DD"
      Height          =   336
      Left            =   11772
      TabIndex        =   21
      Top             =   3600
      Width           =   1272
   End
   Begin VB.TextBox txtTablaObjetoDD 
      Appearance      =   0  'Flat
      Height          =   345
      Left            =   7560
      TabIndex        =   19
      Top             =   3588
      Width           =   2784
   End
   Begin VB.CommandButton cmdActualizarCamposLogicosDD 
      Caption         =   "Actualizar Diccionario de Datos"
      Height          =   420
      Left            =   240
      TabIndex        =   18
      Top             =   8472
      Width           =   1932
   End
   Begin VB.CommandButton cmdConectar 
      Caption         =   "Conectar"
      Default         =   -1  'True
      Height          =   372
      Left            =   7275
      TabIndex        =   16
      Top             =   315
      Width           =   1500
   End
   Begin VB.CommandButton cmdGenerarDDCamposLogicos 
      Caption         =   "Generar DD"
      Height          =   348
      Left            =   10476
      TabIndex        =   15
      Top             =   3588
      Width           =   1272
   End
   Begin MSFlexGridLib.MSFlexGrid gri_campos_logicos 
      Height          =   3948
      Left            =   240
      TabIndex        =   12
      Top             =   4320
      Width           =   14820
      _ExtentX        =   26141
      _ExtentY        =   6959
      _Version        =   393216
      Appearance      =   0
   End
   Begin VB.CommandButton cmd_generar_tb_cajas 
      Caption         =   "Generar update tb_cajas"
      Height          =   465
      Left            =   3348
      TabIndex        =   11
      Top             =   3444
      Width           =   3075
   End
   Begin VB.ComboBox cbTablas 
      Height          =   288
      Left            =   228
      TabIndex        =   9
      Text            =   "cbTablas"
      Top             =   1020
      Width           =   7152
   End
   Begin VB.TextBox txtPassword 
      Appearance      =   0  'Flat
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   5220
      PasswordChar    =   "*"
      TabIndex        =   7
      Text            =   "sonrisa14"
      Top             =   348
      Width           =   1905
   End
   Begin VB.TextBox txtUsuario 
      Appearance      =   0  'Flat
      Height          =   345
      Left            =   3300
      TabIndex        =   5
      Text            =   "USRSG2006"
      Top             =   348
      Width           =   1905
   End
   Begin VB.TextBox txtDSN 
      Appearance      =   0  'Flat
      Height          =   345
      Left            =   210
      TabIndex        =   3
      Text            =   "SQL_Remoto"
      Top             =   345
      Width           =   3030
   End
   Begin VB.TextBox txtSQL 
      Appearance      =   0  'Flat
      Height          =   1680
      Left            =   216
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   1656
      Width           =   7170
   End
   Begin VB.CommandButton cmdGenerarInserts 
      Caption         =   "Generar Inserts "
      Height          =   465
      Left            =   204
      TabIndex        =   0
      Top             =   3432
      Width           =   3075
   End
   Begin MSFlexGridLib.MSFlexGrid gri_campos_fisicos 
      Height          =   2304
      Left            =   7548
      TabIndex        =   14
      Top             =   1020
      Width           =   7440
      _ExtentX        =   13123
      _ExtentY        =   4075
      _Version        =   393216
      Cols            =   4
      AllowBigSelection=   0   'False
      AllowUserResizing=   1
      Appearance      =   0
   End
   Begin VB.Label Label9 
      Caption         =   "Nueva tabla u Objeto a partir DL"
      Height          =   228
      Left            =   4140
      TabIndex        =   24
      Top             =   8328
      Width           =   2784
   End
   Begin VB.Label Label8 
      Caption         =   "Nueva tabla u Objeto"
      Height          =   228
      Left            =   7560
      TabIndex        =   20
      Top             =   3372
      Width           =   2784
   End
   Begin VB.Label Label7 
      Caption         =   "Campos Modelo Físico"
      Height          =   312
      Left            =   7548
      TabIndex        =   17
      Top             =   768
      Width           =   3336
   End
   Begin VB.Label Label6 
      Caption         =   "Listado de Campos - Diccionario de Sistema"
      Height          =   228
      Left            =   240
      TabIndex        =   13
      Top             =   4056
      Width           =   3924
   End
   Begin VB.Label Label5 
      Caption         =   "Tablas"
      Height          =   312
      Left            =   228
      TabIndex        =   10
      Top             =   768
      Width           =   3336
   End
   Begin VB.Label Label4 
      Caption         =   "Password"
      Height          =   228
      Left            =   5220
      TabIndex        =   8
      Top             =   132
      Width           =   3156
   End
   Begin VB.Label Label3 
      Caption         =   "Usuario"
      Height          =   228
      Left            =   3288
      TabIndex        =   6
      Top             =   132
      Width           =   1488
   End
   Begin VB.Label Label2 
      Caption         =   "DSN - Panel de Control ODBC"
      Height          =   225
      Left            =   210
      TabIndex        =   4
      Top             =   105
      Width           =   3150
   End
   Begin VB.Label Label1 
      Caption         =   "Nombre de la tabla o SQL"
      Height          =   252
      Left            =   216
      TabIndex        =   2
      Top             =   1440
      Width           =   3048
   End
End
Attribute VB_Name = "FrmAdmMetadata"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Dim objMetadata As New CMetadata
Dim objFlexUtil As New CFlexGridUtils


Private Sub bloquearCampos()

    Me.cbTablas.Enabled = False
    Me.txtSQL.Enabled = False
    Me.cmd_generar_tb_cajas.Enabled = False
    Me.cmdGenerarDDCamposLogicos.Enabled = False
    Me.cmdGenerarInserts.Enabled = False
    Me.txtTablaObjetoDD.Enabled = False
    Me.cmdEliminarDD.Enabled = False
    Me.cmdActualizarCamposLogicosDD.Enabled = False
    Me.cmdGenerarInsertDL.Enabled = False

End Sub


Private Sub HabilitarCampos()

    Me.cbTablas.Enabled = True
    Me.txtSQL.Enabled = True
    Me.cmd_generar_tb_cajas.Enabled = True
    Me.cmdGenerarDDCamposLogicos.Enabled = True
    Me.cmdGenerarInserts.Enabled = True
    Me.txtTablaObjetoDD.Enabled = True
    Me.cmdEliminarDD.Enabled = True
    Me.cmdActualizarCamposLogicosDD.Enabled = True
    Me.cmdGenerarInsertDL.Enabled = True


End Sub



Private Sub cbTablas_Click()
Dim strComando As String
Dim i          As Integer

    If Me.cbTablas.Text = "" Then
        Me.txtTablaObjetoDD.Text = ""
        Exit Sub
    End If
    
    objBasededatos.ExecSQL_directo (" select top 1  * from " + Me.cbTablas.Text)
    strComando = "SELECT "
    
    On Error Resume Next
    For i = 0 To objBasededatos.rsResultados.Fields.Count - 1
        strComando = strComando + objBasededatos.rsResultados.Fields(i).Name + ", "
    Next
    strComando = Left(strComando, Len(strComando) - 2)
    Me.txtSQL.Text = strComando + " from " + Me.cbTablas.Text
    On Error GoTo 0
    
    Me.txtTablaObjetoDD.Text = Me.cbTablas.Text
    
    If Not objMetadata.obtenerCamposFisicos(Me.cbTablas.Text) Then
        MsgBox objBasededatos.Error, vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If

    cargarGrillaCamposFisicos
    
    If Not objMetadata.obtenerCamposLogicos(Me.cbTablas.Text) Then
        MsgBox objBasededatos.Error, vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    cargarGrillaCamposLogicos
    
End Sub

Private Sub cmd_generar_tb_cajas_Click()
Dim objArchivoSalida As New CArchivo
Dim strLineaArchivo  As String
Dim strEncabezado    As String
Dim strValores       As String
Dim i                As Integer


    If Not objBasededatos.abrirBD_Directo(Me.txtDSN.Text, Me.txtUsuario.Text, Me.txtPassword.Text) Then
        MsgBox objBasededatos.Error + ", no se puede Incorporar al sistema.", vbCritical, " SALMA - Atención"
        bloquearCampos
        End
    End If


    If Not objBasededatos.ExecSQL_directo(Me.txtSQL.Text) Then
        MsgBox "Error: " + objBasededatos.Error
        Exit Sub
    End If
    
    objArchivoSalida.Abrir_Escritura App.Path + "\Salida_tabla_" + Me.cbTablas.Text + ".txt"
    
    Do Until objBasededatos.rsResultados.EOF
        
        strLineaArchivo = "UPDATE " + Me.cbTablas.Text + " SET "
        strEncabezado = " "
        strValores = " "
        For i = 1 To objBasededatos.rsResultados.Fields.Count - 1
        
            strEncabezado = strEncabezado + objBasededatos.rsResultados.Fields(i).Name + " = "
            Select Case objBasededatos.rsResultados.Fields(i).Type
            Case adChar, adBSTR, _
                 adLongVarChar, adLongVarWChar, adLongVarBinary, adVarBinary, _
                 adVarChar, adVarWChar, adWChar
                    strEncabezado = strEncabezado + objBasededatos.FormatearValorSQL(objBasededatos.rsResultados_Valor(i), "VARCHAR") + ","
            Case adDate, adDBDate, adDBTimeStamp, adDBTime
                    strEncabezado = strEncabezado + objBasededatos.FormatearValorSQL(objBasededatos.rsResultados_Valor(i), "VARCHAR") + ","
            Case adCurrency, adDecimal, adDouble, adNumeric, adSingle, _
                 adVariant, adBigInt, adInteger, adSmallInt, adTinyInt, _
                 adUnsignedBigInt, adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt
                    strEncabezado = strEncabezado + objBasededatos.FormatearValorSQL(objBasededatos.rsResultados_Valor(i), "INT") + ","
            Case adBoolean
                    strEncabezado = strEncabezado + objBasededatos.FormatearValorSQL(objBasededatos.rsResultados_Valor(i), "BIT") + ","
            End Select
            
        Next
        
        strLineaArchivo = strLineaArchivo + Left(strEncabezado, Len(strEncabezado) - 1) + " WHERE nrCaja = " + objBasededatos.rsResultados_Valor("nrcaja") + ";"
        objArchivoSalida.Grabar strLineaArchivo
        objBasededatos.rsResultados.MoveNext
    Loop

    objArchivoSalida.Cerrar
    
    MsgBox "Proceso Terminado!!!"
End Sub

Private Sub cmdActualizarCamposLogicosDD_Click()
Dim resp    As Integer
Dim i       As Integer

    resp = MsgBox("Esta seguro que desea actualizar los campos lógicos?", vbQuestion + vbYesNo, "Atención")
    
    If resp = vbNo Then Exit Sub
    
    objBasededatos.BeginTrans
    
    For i = 1 To Me.gri_campos_logicos.Rows - 1
        Me.gri_campos_logicos.Row = i
        Me.gri_campos_logicos.Col = 0
        objMetadata.idCampo = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 1
        objMetadata.nmTabla = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 2
        objMetadata.nmCampo = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 3
        objMetadata.nmCampoExterno = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 4
        objMetadata.tpTipo = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 5
        objMetadata.nrTamanio = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 6
        objMetadata.flClave = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 7
        objMetadata.flClaveForanea = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 8
        objMetadata.flBusqueda = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 9
        objMetadata.nrOrdenBusqueda = Me.gri_campos_logicos.Text
        
        
        If Not objMetadata.ActualizarCampoLogico() Then
            objBasededatos.RollBackTrans
            MsgBox "Error al intentar actualizar el campo ID=" + objMetadata.idCampo + ".", vbInformation + vbDefaultButton1, "Error"
            Exit Sub
        End If
        
    Next
    
    
    objBasededatos.CommitTrans
    
    
    
    
End Sub

Private Sub cmdConectar_Click()

    If Me.cmdConectar.Caption = "Conectar" Then
        objBasededatos.dsDSN = Me.txtDSN
        objBasededatos.dsUID = Me.txtUsuario
        objBasededatos.dsPassword = Me.txtPassword
        
        If Not objBasededatos.abrirBD_Directo(Me.txtDSN.Text, Me.txtUsuario.Text, Me.txtPassword.Text) Then
            MsgBox objBasededatos.Error + ", no se puede Incorporar al sistema.", vbCritical, "Atención"
            Exit Sub
        End If
        
        If Not objBasededatos.obtenerMetadataTablas() Then
            MsgBox objBasededatos.Error + ", no se puede Incorporar al sistema.", vbCritical, "Atención"
            Exit Sub
        End If
        
        Do Until objBasededatos.rsResultados.EOF
            Me.cbTablas.AddItem objBasededatos.rsResultados("name")
            objBasededatos.rsResultados.MoveNext
        Loop
        
        objMetadata.obtenerTablasObjetosLogicos
        
        Do Until objBasededatos.rsResultados.EOF
            Me.cbTablas.AddItem objBasededatos.rsResultados("nmTabla")
            objBasededatos.rsResultados.MoveNext
        Loop
        
        Me.cmdConectar.Caption = "Desconectar"
        HabilitarCampos
    Else
        Me.cmdConectar.Caption = "Conectar"
        bloquearCampos
    End If
        
    
End Sub



Private Sub cmdEliminarDD_Click()
Dim resp  As Byte

    If Me.txtTablaObjetoDD.Text = "" Then
        MsgBox "Debe ingresar el Nombre de la tabla u objeto para el diccionario de datos lógico", vbInformation + vbDefaultButton1, "Atención"
        Me.txtTablaObjetoDD.SetFocus
        Exit Sub
    End If
    
    resp = MsgBox("Esta seguro que desea eliminar los campos logicos de dicha tabla", vbQuestion + vbYesNo)
    If resp = vbNo Then Exit Sub
    
    objMetadata.nmTabla = Me.txtTablaObjetoDD.Text
    objMetadata.EliminarTablaLogico
    
    If Not objMetadata.obtenerCamposLogicos(Me.cbTablas.Text) Then
        MsgBox objBasededatos.Error, vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    cargarGrillaCamposLogicos
    
    
    
End Sub

Private Sub cmdGenerarDDCamposLogicos_Click()
Dim resp As Byte
Dim i    As Integer

    
    If Me.txtTablaObjetoDD.Text = "" Then
        MsgBox "Debe ingresar el Nombre de la tabla u objeto para el diccionario de datos lógico", vbInformation + vbDefaultButton1, "Atención"
        Me.txtTablaObjetoDD.SetFocus
        Exit Sub
    End If
    
    resp = MsgBox("Esta seguro que desea generar los campos logicos de dicha tabla", vbQuestion + vbYesNo)
    
    If resp = vbNo Then Exit Sub
    
    For i = 1 To Me.gri_campos_fisicos.Rows - 1
        Me.gri_campos_fisicos.Row = i
        Me.gri_campos_fisicos.Col = 0
        objMetadata.nmTabla = Me.txtTablaObjetoDD.Text
        ' campo tabla
        Me.gri_campos_fisicos.Col = 1
        objMetadata.nmCampo = Me.gri_campos_fisicos.Text
        ' campo
        Me.gri_campos_fisicos.Col = 1
        objMetadata.nmCampoExterno = Me.gri_campos_fisicos.Text
        ' tipo de dato
        Me.gri_campos_fisicos.Col = 2
        objMetadata.tpTipo = Me.gri_campos_fisicos.Text
        ' tamanio
        Me.gri_campos_fisicos.Col = 3
        objMetadata.nrTamanio = Me.gri_campos_fisicos.Text
        objMetadata.flClave = "No"
        objMetadata.flBusqueda = "No"
        objMetadata.flClaveForanea = "No"
        objMetadata.nrOrdenBusqueda = ""
        
        If Not objMetadata.InsertarCampoLogico() Then
            MsgBox "Error al insertar el campo logico, nombre campo " + objMetadata.nmCampo, vbInformation + vbDefaultButton1, "Atención"
            Exit Sub
        End If
    Next
    
    If Not objMetadata.obtenerCamposLogicos(Me.txtTablaObjetoDD.Text) Then
        MsgBox objBasededatos.Error, vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    Me.cbTablas.AddItem Me.txtTablaObjetoDD.Text
    Me.cbTablas.Text = Me.txtTablaObjetoDD.Text
    cbTablas_Click
    
    
End Sub

Private Sub cmdGenerarInsertDL_Click()
Dim objArchivoSalida As New CArchivo
Dim strLineaArchivo  As String
Dim strEncabezado    As String
Dim strValores       As String
Dim i                As Integer
Dim strSQL           As String

     If Me.gri_campos_logicos.Rows = 1 Then Exit Sub

    If Not objBasededatos.abrirBD_Directo(Me.txtDSN.Text, Me.txtUsuario.Text, Me.txtPassword.Text) Then
        MsgBox objBasededatos.Error + ", no se puede Incorporar al sistema.", vbCritical, " SALMA - Atención"
        End
    End If



    Me.gri_campos_logicos.Row = 1
    Me.gri_campos_logicos.Col = 1
    

    strSQL = "select * from diccionariodedatos where nmtabla ='" + Me.gri_campos_logicos.Text + "'"

    
    If Not objBasededatos.ExecSQL_directo(strSQL) Then
        MsgBox "Error: " + objBasededatos.Error
        Exit Sub
    End If
    
    Dim nombreArchivo As String
    
    nombreArchivo = App.Path + "\Salida_tabla_" + Me.cbTablas.Text + ".txt"
    objArchivoSalida.Abrir_Escritura App.Path + "\Salida_tabla_" + Me.cbTablas.Text + ".txt"
    
    Do Until objBasededatos.rsResultados.EOF
        
        strLineaArchivo = "INSERT INTO  diccionariodedatos "
        strEncabezado = " ("
        strValores = " VALUES ("
        For i = 1 To objBasededatos.rsResultados.Fields.Count - 1
        
            strEncabezado = strEncabezado + objBasededatos.rsResultados.Fields(i).Name + ","
            Select Case objBasededatos.rsResultados.Fields(i).Type
            Case adChar, adBSTR, _
                 adLongVarChar, adLongVarWChar, adLongVarBinary, adVarBinary, _
                 adVarChar, adVarWChar, adWChar, adDate, adDBTimeStamp, adDBDate, adDBTime
                     
                    strValores = strValores + objBasededatos.FormatearValorSQL(objBasededatos.rsResultados_Valor(i), "VARCHAR") + ","
                    
            Case adCurrency, adDecimal, adDouble, adNumeric, adSingle, _
                 adVariant, adBigInt, adInteger, adSmallInt, adTinyInt, _
                 adUnsignedBigInt, adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt
                 
                    strValores = strValores + objBasededatos.FormatearValorSQL(objBasededatos.rsResultados_Valor(i), "INT") + ","
                    
            Case adBoolean
                    
                    strValores = strValores + objBasededatos.FormatearValorSQL(objBasededatos.rsResultados_Valor(i), "BIT") + ","
                    
            End Select
            
        Next
        
        strLineaArchivo = strLineaArchivo + Left(strEncabezado, Len(strEncabezado) - 1) + ") "
        strLineaArchivo = strLineaArchivo + Left(strValores, Len(strValores) - 1) + ")" + ";"
        objArchivoSalida.Grabar strLineaArchivo
        objBasededatos.rsResultados.MoveNext
    Loop

    objArchivoSalida.Cerrar
    MsgBox "Proceso Terminado!  Archivo generado: " + vbCrLf + nombreArchivo, vbExclamation, "Atención"

End Sub

Private Sub cmdGenerarInserts_Click()
Dim objArchivoSalida As New CArchivo
Dim strLineaArchivo  As String
Dim strEncabezado    As String
Dim strValores       As String
Dim i                As Integer


    If Not objBasededatos.abrirBD_Directo(Me.txtDSN.Text, Me.txtUsuario.Text, Me.txtPassword.Text) Then
        MsgBox objBasededatos.Error + ", no se puede Incorporar al sistema.", vbCritical, " SALMA - Atención"
        End
    End If


    If Not objBasededatos.ExecSQL_directo(Me.txtSQL.Text) Then
        MsgBox "Error: " + objBasededatos.Error
        Exit Sub
    End If
    
    
    Dim nombreArchivo As String
    
    nombreArchivo = App.Path + "\Salida_tabla_" + Me.cbTablas.Text + ".txt"
    
    
    objArchivoSalida.Abrir_Escritura nombreArchivo
    
    Do Until objBasededatos.rsResultados.EOF
        
        strLineaArchivo = "INSERT INTO " + Me.cbTablas.Text
        strEncabezado = " ("
        strValores = " VALUES ("
        For i = 0 To objBasededatos.rsResultados.Fields.Count - 1
        
            strEncabezado = strEncabezado + objBasededatos.rsResultados.Fields(i).Name + ","
            Select Case objBasededatos.rsResultados.Fields(i).Type
            Case adChar, adBSTR, _
                 adLongVarChar, adLongVarWChar, adLongVarBinary, adVarBinary, _
                 adVariant, adVarChar, adVarWChar, adWChar, adDate, adDBTimeStamp, adDBDate, adDBTime
                     
                    strValores = strValores + objBasededatos.FormatearValorSQL(objBasededatos.rsResultados_Valor(i), "VARCHAR") + ","
                    
            Case adCurrency, adDecimal, adDouble, adNumeric, adSingle, _
                 adBigInt, adInteger, adSmallInt, adTinyInt, _
                 adUnsignedBigInt, adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt
                 
                    strValores = strValores + Replace(Replace(objBasededatos.FormatearValorSQL(objBasededatos.rsResultados_Valor(i), "DECIMAL"), ".", ""), ",", ".") + ","
                    
            Case adBoolean
                    
                    strValores = strValores + objBasededatos.FormatearValorSQL(objBasededatos.rsResultados_Valor(i), "BIT") + ","
                    
            End Select
            
        Next
        
        strLineaArchivo = strLineaArchivo + Left(strEncabezado, Len(strEncabezado) - 1) + ") "
        strLineaArchivo = strLineaArchivo + Left(strValores, Len(strValores) - 1) + ")" + ";"
        objArchivoSalida.Grabar strLineaArchivo
        objBasededatos.rsResultados.MoveNext
    Loop

    objArchivoSalida.Cerrar
    
    MsgBox "Proceso Terminado!  Archivo generado: " + vbCrLf + nombreArchivo, vbExclamation, "Atención"
    

End Sub

Private Sub cmdGenerarDDCamposLogicosdesdeDL_Click()

Dim resp    As Integer
Dim i       As Integer

    resp = MsgBox("Esta seguro que desea crear nuevos los campos lógicos a partir del DL?", vbQuestion + vbYesNo, "Atención")
    
    If txtTablaObjetoDDdesdeDL.Text = "" Then
        MsgBox "Debe ingresar el nombre del nuevo objeto/tabla", vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    
    If resp = vbNo Then Exit Sub
    
    objBasededatos.BeginTrans
    
    For i = 1 To Me.gri_campos_logicos.Rows - 1
        Me.gri_campos_logicos.Row = i
        Me.gri_campos_logicos.Col = 0
        objMetadata.idCampo = ""
        Me.gri_campos_logicos.Col = 1
        objMetadata.nmTabla = txtTablaObjetoDDdesdeDL.Text
        Me.gri_campos_logicos.Col = 2
        objMetadata.nmCampo = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 3
        objMetadata.nmCampoExterno = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 4
        objMetadata.tpTipo = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 5
        objMetadata.nrTamanio = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 6
        objMetadata.flClave = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 7
        objMetadata.flClaveForanea = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 8
        objMetadata.flBusqueda = Me.gri_campos_logicos.Text
        Me.gri_campos_logicos.Col = 9
        objMetadata.nrOrdenBusqueda = Me.gri_campos_logicos.Text
        
        
        If Not objMetadata.InsertarCampoLogico() Then
            objBasededatos.RollBackTrans
            MsgBox "Error al intentar agregar el campo el campo =" + objMetadata.nmCampo + ".", vbInformation + vbDefaultButton1, "Error"
            Exit Sub
        End If
        
    Next
    
    
    objBasededatos.CommitTrans
    
    
    Me.cbTablas.AddItem txtTablaObjetoDDdesdeDL.Text
    Me.cbTablas.Text = txtTablaObjetoDDdesdeDL.Text
    cbTablas_Click
    
    



End Sub

Private Sub Form_Load()

    
    Me.cbTablas.Text = ""
    
    objBasededatos.dsDSN = Me.txtDSN.Text
    objBasededatos.dsUID = Me.txtUsuario.Text
    objBasededatos.dsPassword = Me.txtPassword.Text
    
    If Not objBasededatos.abrirBD_Directo(Me.txtDSN.Text, Me.txtUsuario.Text, Me.txtPassword.Text) Then
        bloquearCampos
        Exit Sub
    End If
    
    HabilitarCampos

    
    objBasededatos.ExecSQL_directo (" select [name] from dbo.sysobjects where  OBJECTPROPERTY(id, N'IsUserTable') = 1  order by name ")
    Do Until objBasededatos.rsResultados.EOF
        Me.cbTablas.AddItem objBasededatos.rsResultados("name")
        objBasededatos.rsResultados.MoveNext
    Loop
    
    objMetadata.obtenerTablasObjetosLogicos
    
    Do Until objBasededatos.rsResultados.EOF
        Me.cbTablas.AddItem objBasededatos.rsResultados("nmTabla")
        objBasededatos.rsResultados.MoveNext
    Loop
    
    Me.cbTablas.Text = ""

    Me.cmdConectar.Caption = "Desconectar"
            
    

End Sub


Private Sub cargarGrillaCamposLogicos()
Dim i As Integer


    objFlexUtil.AsignarTitulosColumnasCamposLogicos Me.gri_campos_logicos
    Me.gri_campos_logicos.Rows = 1
    
    Do Until objBasededatos.rsResultados.EOF
        Me.gri_campos_logicos.Rows = gri_campos_logicos.Rows + 1
        Me.gri_campos_logicos.Row = Me.gri_campos_logicos.Rows - 1
        For i = 0 To objBasededatos.rsResultados.Fields.Count - 1
            Me.gri_campos_logicos.Col = i
            Me.gri_campos_logicos.Text = CStr(objBasededatos.rs_resultados_valor(i))
        Next
        objBasededatos.rsResultados.MoveNext
    Loop
    
    objFlexUtil.Ajustar_Columnas Me.gri_campos_logicos, Me
    
    
End Sub
Private Sub cargarGrillaCamposFisicos()
Dim i As Integer


    objFlexUtil.AsignarTitulosColumnasCamposFisicos Me.gri_campos_fisicos
    Me.gri_campos_fisicos.Rows = 1
    
    Do Until objBasededatos.rsResultados.EOF
        Me.gri_campos_fisicos.Rows = gri_campos_fisicos.Rows + 1
        Me.gri_campos_fisicos.Row = Me.gri_campos_fisicos.Rows - 1
        For i = 0 To objBasededatos.rsResultados.Fields.Count - 1
            Me.gri_campos_fisicos.Col = i
            Me.gri_campos_fisicos.Text = CStr(objBasededatos.rs_resultados_valor(i))
        Next
        objBasededatos.rsResultados.MoveNext
    Loop
    
    objFlexUtil.Ajustar_Columnas Me.gri_campos_fisicos, Me
    
'    If Not rs.EOF Then
'        frmPrincipal.lblCantidadLotes = 0
'        With frmPrincipal.grdPrincipal
'            .Rows = 1
'            .Row = 0
'            Do While Not rs.EOF 'Or .Row = 100
'                .Rows = .Rows + 1
'                .Row = .Rows - 1
'                .Col = 0: .Text = rs("anio")
'                .Col = 1: .Text = rs("nro_lote")
'                .Col = 2: .Text = Format$(rs("Fecha_recep"), "dd/mm/yyyy")
'                .Col = 3: .Text = rs("articulo") ' Cod Oculto
'                .Col = 4: .Text = rs("desc_abrev")
'                .Col = 5: .Text = Format$(rs("fecha_vto"), "dd/mm/yyyy")
'                .Col = 6: .Text = rs("proveedor") ' Cod Oculto
'                .Col = 7: .Text = rs("razon_abrev")
'                .Col = 8: .Text = rs("Remito")
'                rs.MoveNext
'
'                frmPrincipal.lblCantidadLotes = frmPrincipal.lblCantidadLotes + 1
'
'            Loop
'            .Row = 1
'            .Col = 1
'        End With
'    End If


        
End Sub



Private Sub gri_campos_fisicos_DblClick()
    ' MsgBox "Item " & Format$(Me.gri_campos_fisicos.Row) & " seleccionado"
End Sub

Private Sub gri_campos_fisicos_KeyDown(KeyCode As Integer, Shift As Integer)
Dim resp As String

    If KeyCode = vbKeyDelete Then
        Me.gri_campos_fisicos.Col = 1
        resp = MsgBox("Esta seguro que desea eliminar el campo '" + Me.gri_campos_fisicos.Text + "'.", vbQuestion + vbYesNo, "Atención")
        If resp = vbNo Then Exit Sub
        If Me.gri_campos_fisicos.Rows = 2 Then
            Me.gri_campos_fisicos.Rows = 1
            Exit Sub
        End If
        Me.gri_campos_fisicos.RemoveItem Me.gri_campos_fisicos.Row
    End If
End Sub

Private Sub gri_campos_logicos_KeyPress(KeyAscii As Integer)

        If KeyAscii >= 32 And KeyAscii <= 127 Then
            gri_campos_logicos.Text = gri_campos_logicos.Text & Chr(KeyAscii)
        End If
   
End Sub


Private Sub gri_campos_logicos_KeyUp(KeyCode As Integer, Shift As Integer)

       Select Case KeyCode
           Case vbKeyDelete
               gri_campos_logicos.Text = ""
           Case vbKeyBack
               If Len(gri_campos_logicos.Text) > 0 Then
                   gri_campos_logicos.Text = Left(gri_campos_logicos.Text, Len(gri_campos_logicos.Text) - 1)
               End If
       End Select

End Sub
