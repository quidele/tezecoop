VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CReplicadorManual"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Private Type rcCampoReplicador
    nom_param           As String
    num_tamanio         As Integer
    tipo_dato           As Long
    esClave             As String
End Type

Private mCamposTablas_Destino()   As rcCampoReplicador
Private lerror                    As String
Private lrs                       As Object
' apunta al diccionario remoto
Private lDiccionariodedatos       As Object




Public Property Set DiccionarioDeDatos(pValor As Object)
    Set lDiccionariodedatos = pValor
End Property


' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property

' Obtenermos la metadata de una tabla de la base de datos Destino
Private Function obtenerCamposTablas(pCon As Object, pTablaDestino As String) As Boolean
Dim strSQL   As String
Dim i        As Integer
Dim rsCampos As Object


    obtenerCamposTablas = False


    If Not pCon.DiccionarioDeDatos.ObtenerTabla(pTablaDestino) Then
        lerror = "Error: No se pueden obtener los campo de la tabla " + pTablaDestino + " , Error extendido" + lDiccionariodedatos.Error
        Exit Function
    End If
    
    Select Case pCon.dsMotorBD
    Case "MY_SQL"
        strSQL = " SELECT  * FROM " + pTablaDestino + " LIMIT 1"
    Case "SQL_SERVER"
        strSQL = " SELECT  top 1 * FROM " + pTablaDestino
    Case "MDB"
        strSQL = " SELECT  top 1 * FROM " + pTablaDestino
    End Select
    
    ' On Error Resume Next
    
    If Not pCon.ExecuteSQL(strSQL) Then
        lerror = pCon.Error
        Exit Function
    End If
    
    Set rsCampos = pCon.rs_resultados
    
    If Err Then
        lerror = "Error, no se puede obtener la tabla " + pTablaDestino + ", " + Err.Description
        Exit Function
    End If
    
    
    ReDim mCamposTablas_Destino(0)
    ' obtengo la Metadata
    For i = 0 To rsCampos.Fields.Count - 1
        ReDim Preserve mCamposTablas_Destino(LBound(mCamposTablas_Destino) To UBound(mCamposTablas_Destino) + 1)
        mCamposTablas_Destino(i).nom_param = rsCampos.Fields(i).Name
        If UCase(rsCampos.Fields(i).Name) <> "flSincronizado" Then
            If pCon.DiccionarioDeDatos.ObtenerCampo_replicacion(pTablaDestino, rsCampos.Fields(i).Name) Then
                mCamposTablas_Destino(i).num_tamanio = pCon.DiccionarioDeDatos.nrTamanio
                If UCase(pCon.DiccionarioDeDatos.flClave) = "YES" Then
                    mCamposTablas_Destino(i).esClave = "S"
                Else
                    mCamposTablas_Destino(i).esClave = "N"
                End If
            Else
                mCamposTablas_Destino(i).esClave = "N"
            End If
        End If
    Next
    
    Set rsCampos = Nothing
    
    obtenerCamposTablas = True
    
    
End Function

' Eliminar el uso de esta funcion
Private Function FormatearValor(prs As Object, pnom_valor As String) As String

    If IsNull(prs(pnom_valor).Value) Then
        FormatearValor = "null"
    Else
        Select Case prs(pnom_valor).Type
        Case adChar, adLongVarChar, adLongVarWChar, adVarChar, adVarWChar, adWChar
             FormatearValor = "'" + Replace(Trim(prs(pnom_valor).Value), "'", "''") + "'"
        Case adBoolean
             If prs(pnom_valor).Value Then
                FormatearValor = "1"
             Else
                FormatearValor = "0"
             End If
        Case adDBDate, adDBTimeStamp, adDBTime
            FormatearValor = "'" + Replace(Trim(prs(pnom_valor).Value), "'", "''") + "'"
        Case Else
            FormatearValor = Replace(Replace(prs(pnom_valor).Value, ".", ""), ",", ".")
        End Select
    End If
    
End Function


' Armar SQL String para realizar insert
Private Function ArmarInsercion(pCon As Object, prs As Object, pTablaDestino) As String
Dim i           As Integer
Dim strField    As String
Dim strValues   As String

    For i = 0 To prs.Fields.Count - 1
        If LCase(prs.Fields(i).Name) <> "flsincronizado" Then
            If BuscarCamposEnTablaDestino(prs.Fields(i).Name) > -1 Then
                strField = strField + prs.Fields(i).Name + " ,"
                If pCon.DiccionarioDeDatos.ObtenerCampo_replicacion(pTablaDestino, prs.Fields(i).Name) Then
                    strValues = strValues + pCon.FormatearValorSQL(prs(i), pCon.DiccionarioDeDatos.tpTipo, prs.Fields(i).Name) + " ,"
                End If
            End If
        End If
    Next
    
    If Not strField = "" Then
       ArmarInsercion = " (" + Left(strField, Len(strField) - 1) + ") "
       ArmarInsercion = ArmarInsercion + " VALUES (" + Left(strValues, Len(strValues) - 1) + ")"
    End If
    
End Function

' Armar SQL String para realizar insert
Private Function ArmarInsercionParametricas(prs As Object, pCon As CMySQLBasededatos, pDic As CMySQLDiccDatos, pnmTabla As String) As String
Dim i           As Integer
Dim strField    As String
Dim strValues   As String

    ArmarInsercionParametricas = ""
    For i = 0 To prs.Fields.Count - 1
        If UCase(prs.Fields(i).Name) <> "flSincronizado" And UCase(prs.Fields(i).Name) <> "dtSincronizacion" Then
            If BuscarCamposEnTablaDestino(prs.Fields(i).Name) > -1 Then
                strField = strField + prs.Fields(i).Name + " ,"
                If Not pDic.ObtenerCampo(pnmTabla, prs.Fields(i).Name) Then
                    lerror = "No se pudo obtener el campo '" + prs.Fields(i).Name + "' de la tabla '" + pnmTabla + "'."
                    Exit Function
                End If
                strValues = strValues + pCon.FormatearValorSQL(prs.Fields(i).Value, pDic.tpTipo, prs.Fields(i).Name) + " ,"
            End If
        End If
    Next
    
    If Not strField = "" Then
       ArmarInsercionParametricas = " (" + Left(strField, Len(strField) - 1) + ") "
       ArmarInsercionParametricas = ArmarInsercionParametricas + " VALUES (" + Left(strValues, Len(strValues) - 1) + ")"
    End If
    
End Function

' Armar SQL String para realizar el WHERE
Private Function ArmarWHERE(prs As Object) As String
Dim i           As Integer
Dim strWhere    As String
Dim ipos        As Integer
    
    strWhere = ""
    For i = 0 To prs.Fields.Count - 1
        If LCase(prs.Fields(i).Name) <> "flsincronizado" Then
            ipos = BuscarCamposEnTablaDestino(prs.Fields(i).Name)
            If ipos > -1 Then
                If mCamposTablas_Destino(ipos).esClave = "S" Then
                    strWhere = strWhere + prs.Fields(i).Name + " = " + FormatearValor(prs, prs.Fields(i).Name) + " AND "
                End If
            End If
        End If
    Next
    
    If Not strWhere = "" Then
       ArmarWHERE = " " + Left(strWhere, Len(strWhere) - 4) + " "
    End If
    
End Function


' Armar SQL String para realizar el WHERE
Private Function ArmarWHEREParametricas(prs As Object) As String
Dim i           As Integer
Dim strWhere    As String
Dim ipos        As Integer
    
    strWhere = ""
    For i = 0 To prs.Fields.Count - 1
        If LCase(prs.Fields(i).Name) <> "flsincronizado" Then
            ipos = BuscarCamposEnTablaDestino(prs.Fields(i).Name)
            If ipos > -1 Then
                If mCamposTablas_Destino(ipos).esClave = "S" Then
                    strWhere = strWhere + prs.Fields(i).Name + " = " + FormatearValor(prs, prs.Fields(i).Name) + " AND "
                End If
            End If
        End If
    Next
    
    If Not strWhere = "" Then
       ArmarWHEREParametricas = " " + Left(strWhere, Len(strWhere) - 4) + " "
    End If
    
End Function

' Armar SQL String para realizar update
Private Function ArmarActualizacion(prs As Object) As String
Dim i As Integer
Dim strSET As String
Dim ipos        As Integer

    For i = 0 To prs.Fields.Count - 1
        If LCase(prs.Fields(i).Name) <> "flsincronizado" Then
            ipos = BuscarCamposEnTablaDestino(prs.Fields(i).Name)
            If ipos > -1 Then
                If mCamposTablas_Destino(ipos).esClave <> "S" Then
                    strSET = strSET + prs.Fields(i).Name + " "
                    strSET = strSET + " = "
                    strSET = strSET + FormatearValor(prs, prs.Fields(i).Name) + " ,"
                End If
            End If
        End If
    Next
    
    If Not strSET = "" Then
       ArmarActualizacion = Left(strSET, Len(strSET) - 1)
    End If
    
End Function


' Armar SQL String para realizar update
Private Function ArmarActualizacionParametricas(prs As Object, pCon As Object, pDic As Object, pnmTabla As String) As String
Dim i As Integer
Dim strSET As String
Dim ipos        As Integer

    ArmarActualizacionParametricas = ""
    
    For i = 0 To prs.Fields.Count - 1
        If LCase(prs.Fields(i).Name) <> "flsincronizado" Then
            ipos = BuscarCamposEnTablaDestino(prs.Fields(i).Name)
            If ipos > -1 Then
                If mCamposTablas_Destino(ipos).esClave <> "S" Then
                    strSET = strSET + prs.Fields(i).Name + " "
                    strSET = strSET + " = "
                    If Not pDic.ObtenerCampo(pnmTabla, prs.Fields(i).Name) Then
                        lerror = "No se pudo obtener el campo '" + prs.Fields(i).Name + "' de la tabla '" + pnmTabla + "'."
                        Exit Function
                    End If
                    strSET = strSET + pCon.FormatearValorSQL(prs.Fields(i).Value, pDic.tpTipo, prs.Fields(i).Name) + " ,"
                End If
            End If
        End If
    Next
    
    If Not strSET = "" Then
       ArmarActualizacionParametricas = Left(strSET, Len(strSET) - 1)
    End If
    
End Function

' Buscar los campos en la definicion de las tablas Destino
Private Function BuscarCamposEnTablaDestino(pnmCampo As String) As Long
Dim i As Integer

    BuscarCamposEnTablaDestino = -1

    For i = LBound(mCamposTablas_Destino) To UBound(mCamposTablas_Destino)
        If UCase(mCamposTablas_Destino(i).nom_param) = UCase(pnmCampo) Then
            BuscarCamposEnTablaDestino = i
            Exit Function
        End If
    Next
    
End Function


' Realiza la eliminacion fisica en las tablas Destino
Private Function Eliminar_En_Tabla(pCon As CMySQLBasededatos, pnmTabla As String, pstrCondicion As String) As Boolean
Dim strSQL As String

    strSQL = " DELETE  FROM " + pnmTabla + " " + pstrCondicion
    On Error Resume Next
    
    If Not pCon.ExecuteSQL(strSQL) Then
        lerror = pCon.Error
        Exit Function
    End If
    
    If Err Then
        lerror = Err.Description
        Eliminar_En_Tabla = False
        Exit Function
    End If
    On Error GoTo 0
    
    Eliminar_En_Tabla = True

End Function



Private Function ExecuteSP(pObjConn As Object, pstrSQL As String) As Boolean
    On Error Resume Next
    Set lrs = pObjConn.Execute("EXEC " + pstrSQL)
    If Err Then
        lerror = Err.Description
        ExecuteSP = False
    Else
        ExecuteSP = True
    End If
    On Error GoTo 0
End Function

Private Function ExecuteSQL(pObjConn As Object, pstrSQL As String) As Boolean
    
    On Error Resume Next
    Set lrs = pObjConn.Execute(" " + pstrSQL)
    If Err Then
        lerror = Err.Description
        ExecuteSQL = False
    Else
        ExecuteSQL = True
    End If
    On Error GoTo 0
    
End Function



Private Function ArmarCountReplicacion(pnmTabla As String) As String
Dim strSQL As String

    strSQL = " SELECT count(*) FROM " + pnmTabla + " Where flSincronizado=1 "
    ArmarCountReplicacion = strSQL

End Function


Private Function ArmarSelectReplicacionParametricas(pnmTabla As String, pdtUltSincronizacion As String, pCon As Object) As String
Dim strSQL As String

    If pdtUltSincronizacion = "" Then
        ' a lo sumo actualizazamos de dos dias atras
        Select Case pCon.dsMotorBD
        Case "MY_SQL"
            strSQL = " SELECT * FROM " + pnmTabla + " Where dtActualizacion >=CURDATE()-2 "
        Case "SQL_SERVER"
            strSQL = " SELECT * FROM " + pnmTabla + " Where dtActualizacion>=getdate()-2 "
        Case "MDB"
            strSQL = " SELECT * FROM " + pnmTabla + " Where dtActualizacion >=now()-2 "
        End Select
    Else
        Select Case pCon.dsMotorBD
        Case "MY_SQL"
            strSQL = " SELECT * FROM " + pnmTabla + " Where dtActualizacion>=" + pCon.FormatearValorSQL(pdtUltSincronizacion, "DATETIME", "dtActualizacion")
        Case "SQL_SERVER"
            strSQL = " SELECT * FROM " + pnmTabla + " Where dtActualizacion>='" + pdtUltSincronizacion + "'"
        Case "MDB"
            strSQL = " SELECT * FROM " + pnmTabla + " Where dtActualizacion>=" + pCon.FormatearValorSQL(pdtUltSincronizacion, "DATETIME", "dtActualizacion")
        End Select
        
    End If
    
    ArmarSelectReplicacionParametricas = strSQL

End Function


Private Function ArmarSelectReplicacion(pnmTabla As String) As String
Dim strSQL As String

    strSQL = " SELECT * FROM " + pnmTabla
    ArmarSelectReplicacion = strSQL

End Function
Private Function ArmarUpdateCambiarEstadoReplicacion(pnmTabla As String) As String
Dim strSQL As String

    strSQL = " UPDATE " + pnmTabla
    strSQL = strSQL + " SET   flSincronizado=0 "
    strSQL = strSQL + " WHERE flSincronizado=1 "

    ArmarUpdateCambiarEstadoReplicacion = strSQL

End Function



'/*********************************************************************/
'/*********************************************************************/
Public Function ReplicarTablaParametricas(pCon_Origen As Object, _
                                         pCon_Destino As Object, _
                                         pnmTabla As String, _
                                         pdtUltimaSincro As String, _
                                         flFiltrarporPuesto As Boolean) As Boolean
Dim strSQL            As String
Dim rsOrigen          As Object
Dim rsDestino         As Object
Dim strSelect         As String
Dim strWhere          As String
Dim bExisteDatos      As Boolean

    ReplicarTablaParametricas = False
    
    ' Obtenemos la metada de la tabla en cuestion
    If Not obtenerCamposTablas(pCon_Destino, pnmTabla) Then Exit Function

          
    strSQL = ArmarSelectReplicacionParametricas(pnmTabla, pdtUltimaSincro, pCon_Origen)
    
    ' filtramos por puesto de facturacion
    If flFiltrarporPuesto Then
            strSQL = strSQL + " AND nrPuesto = " + objConfig.nrPuesto
    End If
    
    
    If Not pCon_Origen.ExecuteSQL(strSQL) Then
        lerror = pCon_Origen.Error + vbCrLf + "SQL: " + vbCrLf + strSQL
        Exit Function
    End If
    
    Set rsOrigen = pCon_Origen.rs_resultados
    
    Do Until rsOrigen.EOF
    
        DoEvents

        ' Armar el where segun la clave primaria de la tabla
        strWhere = ArmarWHEREParametricas(rsOrigen)

        
        ' buscamos el dato en la tabla destino
        strSelect = " SELECT * FROM " + pnmTabla + " WHERE " + strWhere
         
        If Not pCon_Destino.ExecuteSQL(strSelect) Then
            lerror = pCon_Destino.Error + vbCrLf + "SQL: " + vbCrLf + strSelect
            Exit Function
        End If
    
        Set rsDestino = pCon_Destino.rs_resultados
        
        ' Verificamos la existencia del dato en la tabla destino
        If rsDestino.EOF Then
            ' Si el dato no existe en la tabla destino lo insertamos
           strSQL = " INSERT INTO " + pnmTabla + ArmarInsercionParametricas(rsOrigen, pCon_Destino, pCon_Destino.DiccionarioDeDatos, pnmTabla)
        Else
           ' si el dato existe realizamos una actualización
           strSQL = " UPDATE " + pnmTabla + " SET " + ArmarActualizacionParametricas(rsOrigen, pCon_Destino, pCon_Destino.DiccionarioDeDatos, pnmTabla) + " WHERE " + strWhere
        End If
        
        
        ' insetamos el dato en el destino
        If Not pCon_Destino.ExecuteSQL(strSQL) Then
            lerror = pCon_Destino.Error + vbCrLf + "SQL: " + vbCrLf + strSQL
            Exit Function
        End If
        
        Set rsDestino = Nothing
        ' avanzamos al siguiente registro
        rsOrigen.MoveNext
        
    Loop
    
    Set rsOrigen = Nothing
    
    ReplicarTablaParametricas = True
    
End Function



'/*********************************************************************/
'/*********************************************************************/
Public Function ReplicarTablaTransaccional(pCon_Origen As Object, _
                                           pCon_Destino As Object, _
                                           pnmTabla As String, _
                                           pdsWhereUnidadTrama As String, _
                                           flFiltrarporPuesto As Boolean) As Boolean
Dim strSQL            As String
Dim rsOrigen          As Object
Dim rsDestino         As Object
Dim strSelect         As String
Dim strWhere          As String

    ReplicarTablaTransaccional = False
    
    ' Obtenemos la metada de la tabla en cuestion
    If Not obtenerCamposTablas(pCon_Destino, pnmTabla) Then Exit Function

       
    strSQL = ArmarSelectReplicacion(pnmTabla)
    
    If pCon_Origen.dsMotorBD <> "MDB" Then
           strSQL = strSQL + " WHERE " + pdsWhereUnidadTrama
    End If
    
    
    
    If Not pCon_Origen.ExecuteSQL(strSQL) Then
        lerror = pCon_Origen.Error + vbCrLf + "SQL: " + vbCrLf + strSQL
        Exit Function
    End If
    
    
    Set rsOrigen = pCon_Origen.rs_resultados
    
    
    Do Until rsOrigen.EOF
    
        DoEvents
    
        ' Armar el where segun la clave primaria de la tabla
        strWhere = ArmarWHERE(rsOrigen)
        
        ' filtramos por puesto de facturacion
        If pCon_Origen.dsMotorBD <> "MDB" Then
            If flFiltrarporPuesto Then
                strWhere = " AND nrPuesto = " + objConfig.nrPuesto
            End If
            ' buscamos el dato en la tabla destino
            strSelect = " SELECT * FROM " + pnmTabla + " WHERE " + pdsWhereUnidadTrama + " AND " + strWhere
        Else
            strSelect = " SELECT * FROM " + pnmTabla + " WHERE " + strWhere
        End If
        
         
        If Not pCon_Destino.ExecuteSQL(strSelect) Then
            lerror = pCon_Destino.Error + vbCrLf + "SQL: " + vbCrLf + strSelect
            Exit Function
        End If
    
        Set rsDestino = pCon_Destino.rs_resultados
        
        ' Verificamos la existencia del dato en la tabla destino
        If rsDestino.EOF Then
            ' Si el dato no existe en la tabla destino lo insertamos
           strSQL = " INSERT INTO " + pnmTabla + ArmarInsercion(pCon_Destino, rsOrigen, pnmTabla)
           ' insertamos el dato en el destino
            If Not pCon_Destino.ExecuteSQL(strSQL) Then
                lerror = pCon_Destino.Error + vbCrLf + "SQL: " + vbCrLf + strSQL
                Exit Function
            End If
        End If
        
        Set rsDestino = Nothing
        ' avanzamos al siguiente registro
        rsOrigen.MoveNext
        
    Loop
    
    Set rsOrigen = Nothing
    
    ReplicarTablaTransaccional = True
    
End Function


