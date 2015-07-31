VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CMetadata"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Public idCampo         As String
Public nmTabla         As String
Public nmCampo         As String
Public nmCampoExterno  As String
Public tpTipo          As String
Public nrTamanio       As String
Public flClave         As String
Public flClaveForanea  As String
Public flBusqueda      As String
Public nrOrdenBusqueda As String



Public Function obtenerCamposFisicos(pnmTabla As String) As Boolean
Dim strSQL As String

    strSQL = " select  "
    strSQL = strSQL + " TABLE_NAME as TABLA, COLUMN_NAME as COLUMNA, DATA_TYPE as TIPO,"
    strSQL = strSQL + "  'TAMANIO'  = case DATA_TYPE"
    strSQL = strSQL + "  when 'date' THEN 10"
    strSQL = strSQL + "  when 'datetime' THEN 16"
    strSQL = strSQL + "  ELSE isnull(isnull(isnull(CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH),NUMERIC_PRECISION),NUMERIC_PRECISION_RADIX)"
     strSQL = strSQL + "  End "
    strSQL = strSQL + " From INFORMATION_SCHEMA.Columns where TABLE_NAME ='" + pnmTabla + "'"
    strSQL = strSQL + " ORDER BY COLUMNA "

    If Not objBasededatos.ExecuteSQL(strSQL) Then
        obtenerCamposFisicos = False
    Else
        obtenerCamposFisicos = True
    End If
  
    
End Function


' PENDIENTE
Public Function obtenerCamposLogicos(pnmTabla As String) As Boolean
Dim strSQL As String


    strSQL = " select "
    strSQL = strSQL + " IdCampo,"
    strSQL = strSQL + " nmTabla,"
    strSQL = strSQL + " nmCampo,"
    strSQL = strSQL + " nmCampoExterno,"
    strSQL = strSQL + " tpTipo,"
    strSQL = strSQL + " nrTamanio,"
    strSQL = strSQL + " flClave,"
    strSQL = strSQL + " flClaveForanea,"
    strSQL = strSQL + " flBusqueda,"
    strSQL = strSQL + " nrOrdenBusqueda"
    strSQL = strSQL + " From DiccionarioDeDatos  where nmtabla='" + pnmTabla + "'"
    strSQL = strSQL + " order by nmCampo "

    If Not objBasededatos.ExecuteSQL(strSQL) Then
        obtenerCamposLogicos = False
    Else
        obtenerCamposLogicos = True
    End If
  
    
End Function

Public Function InsertarCampoLogico() As Boolean
Dim strSQL As String

    strSQL = " Insert Into Diccionariodedatos "
    strSQL = strSQL + " ("
    strSQL = strSQL + " nmTabla,"
    strSQL = strSQL + " nmCampo,"
    strSQL = strSQL + " nmCampoExterno,"
    strSQL = strSQL + " tpTipo,"
    strSQL = strSQL + " nrTamanio,"
    strSQL = strSQL + " flClave,"
    strSQL = strSQL + " flClaveForanea,"
    strSQL = strSQL + " flBusqueda,"
    strSQL = strSQL + " nrOrdenBusqueda"
    strSQL = strSQL + " ) VALUES ("

    strSQL = strSQL + "'" + Me.nmTabla + "',"
    strSQL = strSQL + "'" + Me.nmCampo + "' ,"
    strSQL = strSQL + "'" + Me.nmCampoExterno + "' ,"
    strSQL = strSQL + "'" + UCase(Me.tpTipo) + "' ,"
    strSQL = strSQL + Me.nrTamanio + ","
    strSQL = strSQL + IIf(Me.flClave = "", "null", "'" + Me.flClave + "'") + ","
    strSQL = strSQL + IIf(Me.flClaveForanea = "", "null", "'" + Me.flClaveForanea + "'") + ","
    strSQL = strSQL + IIf(Me.flBusqueda = "", "null", "'" + Me.flBusqueda + "'") + ","
    strSQL = strSQL + IIf(Me.nrOrdenBusqueda = "", "null", "'" + Me.nrOrdenBusqueda + "'") + ")"
    
    
    If Not objBasededatos.ExecuteSQL(strSQL) Then
        InsertarCampoLogico = False
    Else
        InsertarCampoLogico = True
    End If
  
  
    

End Function


Public Function EliminarTablaLogico() As Boolean
Dim strSQL As String
    
    strSQL = " Delete Diccionariodedatos where nmtabla ='" + Me.nmTabla + "'"
    
    If Not objBasededatos.ExecuteSQL(strSQL) Then
        EliminarTablaLogico = False
    Else
        EliminarTablaLogico = True
    End If
  
  
End Function



Public Function ActualizarCampoLogico() As Boolean
Dim strSQL As String

    strSQL = " Update Diccionariodedatos "
    strSQL = strSQL + " set "
    strSQL = strSQL + " nmCampo="
    strSQL = strSQL + "'" + Me.nmCampo + "' ,"
    strSQL = strSQL + " nmCampoExterno="
    strSQL = strSQL + "'" + Me.nmCampoExterno + "' ,"
    strSQL = strSQL + " tpTipo="
    strSQL = strSQL + "'" + UCase(Me.tpTipo) + "' ,"
    strSQL = strSQL + " nrTamanio="
    strSQL = strSQL + Me.nrTamanio + ","
    strSQL = strSQL + " flClave="
    strSQL = strSQL + IIf(Me.flClave = "", "null", "'" + Me.flClave + "'") + ","
    strSQL = strSQL + " flClaveForanea="
    strSQL = strSQL + IIf(Me.flClaveForanea = "", "null", "'" + Me.flClaveForanea + "'") + ","
    strSQL = strSQL + " flBusqueda="
    strSQL = strSQL + IIf(Me.flBusqueda = "", "null", "'" + Me.flBusqueda + "'") + ","
    strSQL = strSQL + " nrOrdenBusqueda="
    strSQL = strSQL + IIf(Me.nrOrdenBusqueda = "", "null", "'" + Me.nrOrdenBusqueda + "'")
    strSQL = strSQL + " where "
    strSQL = strSQL + " idCampo =" + Me.idCampo
    
    
    
    If Not objBasededatos.ExecuteSQL(strSQL) Then
        ActualizarCampoLogico = False
    Else
        ActualizarCampoLogico = True
    End If
  
  
    

End Function


Public Function obtenerTablasObjetosLogicos() As Boolean
Dim strSQL As String

    strSQL = " select Distinct  "
    strSQL = strSQL + " nmTabla "
    strSQL = strSQL + " From DiccionarioDeDatos  "

    If Not objBasededatos.ExecuteSQL(strSQL) Then
        obtenerTablasObjetosLogicos = False
    Else
        obtenerTablasObjetosLogicos = True
    End If
    
End Function




