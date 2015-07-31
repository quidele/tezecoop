VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CSincronizadorManual"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Private Type rcUnidadTransaccional
      id                     As String
      nmTabla                As String
      tpSincronizacion       As String
      dtUltSincrozacion      As String
      flSincronizar          As Boolean
      flUnidadTransaccional  As Boolean
      nrOrdenTransaccional   As Integer
      flFiltrarporPuesto     As Boolean
End Type

Private Type rcTablasNoTransaccional
      id                     As String
      nmTabla                As String
      tpSincronizacion       As String
      dtUltSincrozacion      As String
      flSincronizar          As Boolean
      flUnidadTransaccional  As Boolean
      nrOrdenTransaccional   As Integer
      flFiltrarporPuesto     As Boolean
End Type


Public lobjLocalBD               As New CMySQLBasededatos
Public lobjLocalDiccdeDatos      As New CMySQLDiccDatos
Public lObjLocalTablasIO         As New CMySQLTablasIO


Public lobjRemotoBD                  As Object
Public LobjRemotoDiccdeDatos         As Object
Public lObjRemotoTablasIO            As Object

Dim vUnidadTransaccional(0 To 10)    As rcUnidadTransaccional
Dim vTablasNoTransaccional(0 To 20)  As rcTablasNoTransaccional
Dim objReplicador                    As New CReplicadorManual
Dim dtFechadeSincronizacion          As String

Private lerror                    As String


' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property




Public Function Inicializar() As Boolean
    
    Inicializar = False
    
    If Not obtenerUnidadTransacional() Then
        Exit Function
    End If
    
    If Not obtenerTablasNoTransacional() Then
        Exit Function
    End If

    ' seteamos el diccionario de datos remoto
    Set objReplicador.DiccionarioDeDatos = LobjRemotoDiccdeDatos
    
    Inicializar = True
    
End Function

' interfaz publica para realizar la sincronizacion
' pre condicion: el ambiente debe estar Inicializado
Public Function Sincronizar(pstrWherecajasaSincronizar As String) As Boolean

    Sincronizar = False
    
    
    ' hay que sincronizar por transacciones
    If Not sincronizarUnidadtransaccional(pstrWherecajasaSincronizar) Then Exit Function
    
    ' hay que sincronizar parametricas
    If Not sincronizarParametricas() Then Exit Function


    Sincronizar = True

End Function


Private Function sincronizarUnidadtransaccional(pstrWherecajasaSincronizar As String) As Boolean
Dim i As Integer
Dim ldsWhereUnidadTransaccional As String

    sincronizarUnidadtransaccional = False
    
    If lobjLocalBD.dsMotorBD <> "MDB" Then
        If Trim(pstrWherecajasaSincronizar) = "" Then
            sincronizarUnidadtransaccional = True
            Exit Function
        End If
    End If
    
    i = 0
    Do Until vUnidadTransaccional(i).nmTabla = ""
    DoEvents
        Select Case LCase(vUnidadTransaccional(i).nmTabla)
        Case "tb_cajas", "tb_comprobantes", "tb_comprobantesdetalle"
            ldsWhereUnidadTransaccional = pstrWherecajasaSincronizar
        Case "tb_cupones"
            ldsWhereUnidadTransaccional = Replace(pstrWherecajasaSincronizar, "nrCaja", "nrCajaCliente", 1, , vbTextCompare)
            ldsWhereUnidadTransaccional = ldsWhereUnidadTransaccional
        End Select

        ' tenemos que determinar si hay comprobantes a sincronizar
        If Not objReplicador.ReplicarTablaTransaccional(lobjLocalBD, lobjRemotoBD, vUnidadTransaccional(i).nmTabla, ldsWhereUnidadTransaccional, vUnidadTransaccional(i).flFiltrarporPuesto) Then
            lerror = "Error al replicar la tabla " + vUnidadTransaccional(i).nmTabla + ", comunique este error al administrador del sistema" + vbCrLf + "Error Extentido: " + objReplicador.Error
            Exit Function
        End If
        i = i + 1
    Loop
    
    sincronizarUnidadtransaccional = True

End Function


Private Function obtenerNuevaFechadeSincronizacion() As String

            ' getdate del servidor remoto
            obtenerNuevaFechadeSincronizacion = lobjRemotoBD.getDateasString()
            
End Function


Private Function actualizarFechadeSincronizacion(pid As String, pdtUltSincrozacion As String) As Boolean

            actualizarFechadeSincronizacion = False
            
            ' actualizamos la tabla local
            lObjLocalTablasIO.nmTabla = "tb_sincronizacion"
            lObjLocalTablasIO.setearCampoOperadorValor "dtUltSincrozacion", "<-", pdtUltSincrozacion
            lObjLocalTablasIO.setearCampoOperadorValor "id", "=", pid

            If Not lObjLocalTablasIO.Actualizar Then
                lerror = lObjLocalTablasIO.Error
                Exit Function
            End If

            ' actualizamos la tabla Remota
            lObjRemotoTablasIO.nmTabla = "tb_sincronizacion"
            lObjRemotoTablasIO.setearCampoOperadorValor "dtUltSincrozacion", "<-", pdtUltSincrozacion
            lObjRemotoTablasIO.setearCampoOperadorValor "id", "=", pid

            If Not lObjRemotoTablasIO.Actualizar Then
                lerror = lObjRemotoTablasIO.Error
                Exit Function
            End If
            
            ' actualizamos la tabla local
            lObjLocalTablasIO.nmTabla = "tb_puestos"
            lObjLocalTablasIO.setearCampoOperadorValor "dtActualizado", "<-", pdtUltSincrozacion
            lObjLocalTablasIO.setearCampoOperadorValor "nrPuesto", "=", objConfig.nrPuesto

            If Not lObjLocalTablasIO.Actualizar Then
                lerror = lObjLocalTablasIO.Error
                Exit Function
            End If

            ' actualizamos la tabla Remota
            lObjRemotoTablasIO.nmTabla = "tb_puestos"
            lObjRemotoTablasIO.setearCampoOperadorValor "dtActualizado", "<-", pdtUltSincrozacion
            lObjRemotoTablasIO.setearCampoOperadorValor "nrPuesto", "=", objConfig.nrPuesto

            If Not lObjRemotoTablasIO.Actualizar Then
                lerror = lObjRemotoTablasIO.Error
                Exit Function
            End If
            
            actualizarFechadeSincronizacion = True
            

End Function



' hay que sincronizar parametricas
Private Function sincronizarParametricas() As Boolean
Dim strError    As String
Dim i           As Integer
Dim bReplicar   As Boolean

    sincronizarParametricas = False
    
    i = 0
    ' Procesamos cada una de las tablas
    Do Until vTablasNoTransaccional(i).nmTabla = ""
    
        DoEvents
        bReplicar = False
        
        Select Case UCase(vTablasNoTransaccional(i).tpSincronizacion)
        Case "A_PUESTOS"
                If Not objReplicador.ReplicarTablaParametricas(lobjRemotoBD, lobjLocalBD, vTablasNoTransaccional(i).nmTabla, vTablasNoTransaccional(i).dtUltSincrozacion, vTablasNoTransaccional(i).flFiltrarporPuesto) Then
                    lerror = "Error al replicar la tabla " + vTablasNoTransaccional(i).nmTabla + ", comunique este error al administrador del sistema" + vbCrLf + "Error Extentido: " + objReplicador.Error
                    Exit Function
                Else
                    bReplicar = True
                End If
        Case "A_CENTRAL"
                If Not objReplicador.ReplicarTablaParametricas(lobjLocalBD, lobjRemotoBD, vTablasNoTransaccional(i).nmTabla, vTablasNoTransaccional(i).dtUltSincrozacion, vTablasNoTransaccional(i).flFiltrarporPuesto) Then
                    lerror = "Error al replicar la tabla " + vTablasNoTransaccional(i).nmTabla + ", comunique este error al administrador del sistema" + vbCrLf + "Error Extentido: " + objReplicador.Error
                    Exit Function
                Else
                    bReplicar = True
                End If
        Case "BIDIRECCIONAL"
                ' actualizamos primero con los datos de la base remota
                If Not objReplicador.ReplicarTablaParametricas(lobjRemotoBD, lobjLocalBD, vTablasNoTransaccional(i).nmTabla, vTablasNoTransaccional(i).dtUltSincrozacion, vTablasNoTransaccional(i).flFiltrarporPuesto) Then
                    lerror = "Error al replicar la tabla " + vTablasNoTransaccional(i).nmTabla + ", comunique este error al administrador del sistema" + vbCrLf + "Error Extentido: " + objReplicador.Error
                    Exit Function
                Else
                    bReplicar = True
                End If
                ' actualizamos la base local
                If Not objReplicador.ReplicarTablaParametricas(lobjLocalBD, lobjRemotoBD, vTablasNoTransaccional(i).nmTabla, vTablasNoTransaccional(i).dtUltSincrozacion, vTablasNoTransaccional(i).flFiltrarporPuesto) Then
                    lerror = "Error al replicar la tabla " + vTablasNoTransaccional(i).nmTabla + ", comunique este error al administrador del sistema" + vbCrLf + "Error Extentido: " + objReplicador.Error
                    Exit Function
                Else
                    bReplicar = True
                End If
        Case Else
            lerror = "No se ha definido la acción para tabla '" + vTablasNoTransaccional(i).nmTabla + "'."
        End Select
        i = i + 1
    Loop
    
    
    
    

    sincronizarParametricas = True

End Function




' devuelve un vector con las tablas que conforman la unidad transaccional
Private Function obtenerUnidadTransacional() As Boolean
Dim i As Integer

    obtenerUnidadTransacional = False

    lObjLocalTablasIO.nmTabla = "tb_sincronizacion"
    lObjLocalTablasIO.setearCampoOperadorValor "id", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "nmTabla", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "tpSincronizacion", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "dtUltSincrozacion", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "flSincronizar", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "flUnidadTransaccional", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "nrOrdenTransaccional", "->", "", , " ASC "
    lObjLocalTablasIO.setearCampoOperadorValor "flFiltrarporPuesto", "->", ""
    
    If lObjLocalTablasIO.dsMotorBD = "MDB" Then
        lObjLocalTablasIO.setearCampoOperadorValor "flSincronizar", "=", "-1", " AND "
        lObjLocalTablasIO.setearCampoOperadorValor "flUnidadTransaccional", "=", "-1"
    Else
        lObjLocalTablasIO.setearCampoOperadorValor "flSincronizar", "=", "1", " AND "
        lObjLocalTablasIO.setearCampoOperadorValor "flUnidadTransaccional", "=", "1"
    End If
    
    
    If Not lObjLocalTablasIO.Seleccionar() Then
        lerror = "Error: no se pudo seleccionar la unidad transaccional"
        Exit Function
    End If
  
    If lObjLocalTablasIO.rs_resultados.EOF Then
        lerror = "Error: la unidad transaccional no se encuentra definida"
        Exit Function
    End If
    
    i = 0
    Do Until lObjLocalTablasIO.rs_resultados.EOF
        vUnidadTransaccional(i).id = lObjLocalTablasIO.rs_resultados("id")
        vUnidadTransaccional(i).nmTabla = lObjLocalTablasIO.rs_resultados("nmTabla")
        vUnidadTransaccional(i).tpSincronizacion = lObjLocalTablasIO.rs_resultados("tpSincronizacion")
        vUnidadTransaccional(i).dtUltSincrozacion = lObjLocalTablasIO.rs_resultados_valor("dtUltSincrozacion")
        vUnidadTransaccional(i).flSincronizar = lObjLocalTablasIO.rs_resultados_valor("flSincronizar")
        vUnidadTransaccional(i).flUnidadTransaccional = lObjLocalTablasIO.rs_resultados("flUnidadTransaccional")
        vUnidadTransaccional(i).nrOrdenTransaccional = lObjLocalTablasIO.rs_resultados("nrOrdenTransaccional")
        vUnidadTransaccional(i).flFiltrarporPuesto = lObjLocalTablasIO.rs_resultados("flFiltrarporPuesto")
        i = i + 1
        lObjLocalTablasIO.rs_resultados.MoveNext
    Loop

    obtenerUnidadTransacional = True
    

End Function



' devuelve un vector con las tablas que conforman la unidad transaccional
Private Function obtenerTablasNoTransacional() As Boolean
Dim i As Integer

    obtenerTablasNoTransacional = False

    lObjLocalTablasIO.nmTabla = "tb_sincronizacion"
    lObjLocalTablasIO.setearCampoOperadorValor "id", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "nmTabla", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "tpSincronizacion", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "dtUltSincrozacion", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "flSincronizar", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "flUnidadTransaccional", "->", ""
    lObjLocalTablasIO.setearCampoOperadorValor "nrOrdenTransaccional", "->", "", , " ASC "
    lObjLocalTablasIO.setearCampoOperadorValor "flFiltrarporPuesto", "->", ""
    
    
    If lObjLocalTablasIO.dsMotorBD = "MDB" Then
        lObjLocalTablasIO.setearCampoOperadorValor "flSincronizar", "=", "-1", " AND "
        lObjLocalTablasIO.setearCampoOperadorValor "flUnidadTransaccional", "=", "0"
    Else
        lObjLocalTablasIO.setearCampoOperadorValor "flSincronizar", "=", "1", " AND "
        lObjLocalTablasIO.setearCampoOperadorValor "flUnidadTransaccional", "=", "0"
    End If
    
    
    
    
    
    
    If Not lObjLocalTablasIO.Seleccionar() Then
        lerror = "Error: no se pudo seleccionar la tablas de sincronizacion"
        Exit Function
    End If
  
    If lObjLocalTablasIO.rs_resultados.EOF Then
        lerror = "Error: la tablas de sincronizacion no se encuentran definidas"
        Exit Function
    End If
    
    i = 0
    Do Until lObjLocalTablasIO.rs_resultados.EOF
        vTablasNoTransaccional(i).id = lObjLocalTablasIO.rs_resultados("id")
        vTablasNoTransaccional(i).nmTabla = lObjLocalTablasIO.rs_resultados("nmTabla")
        vTablasNoTransaccional(i).tpSincronizacion = lObjLocalTablasIO.rs_resultados("tpSincronizacion")
        vTablasNoTransaccional(i).dtUltSincrozacion = lObjLocalTablasIO.rs_resultados_valor("dtUltSincrozacion")
        vTablasNoTransaccional(i).flSincronizar = lObjLocalTablasIO.rs_resultados("flSincronizar")
        vTablasNoTransaccional(i).flUnidadTransaccional = lObjLocalTablasIO.rs_resultados("flUnidadTransaccional")
         vTablasNoTransaccional(i).nrOrdenTransaccional = lObjLocalTablasIO.rs_resultados_valor("nrOrdenTransaccional")
         vTablasNoTransaccional(i).flFiltrarporPuesto = lObjLocalTablasIO.rs_resultados("flFiltrarporPuesto")
        i = i + 1
        lObjLocalTablasIO.rs_resultados.MoveNext
    Loop

    obtenerTablasNoTransacional = True
    

End Function


