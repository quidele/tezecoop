
Option Strict Off
'Imports Excel
Imports System.Data.OleDb
Imports Microsoft.Office
'Imports Microsoft.Office.Interop.Excel
Imports fonseca_libDatos
Public Class ExcelDAO

    Private _error As String
    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property

    Private _listaHojas As ArrayList
    Public ReadOnly Property ListaHojas() As ArrayList
        Get
            Return _listaHojas
        End Get
    End Property

    Private _listaColumnas As ArrayList
    Public ReadOnly Property ListaColumnas() As ArrayList
        Get
            Return _listaColumnas
        End Get
    End Property



    ''' <summary>
    ''' _ListaHojas con en nombre de las hojas de la planilla excel
    ''' </summary>
    ''' <param name="pPath"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function TraerNombresHojas(ByVal pPath As String) As Boolean
        TraerNombresHojas = False
        Dim objExcel As Object ' Excel.Application
        Try

            objExcel = CreateObject("Excel.Application")
            Dim hoja As Object ' Excel.Worksheet

            objExcel.Workbooks.Open(pPath)

            _listaHojas = New ArrayList()

            For Each hoja In objExcel.Sheets
                ListaHojas.Add(hoja.Name)
            Next

            objExcel.Workbooks(1).Close()

            TraerNombresHojas = True
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("Error", Me._error)
        Finally
            objExcel = Nothing
        End Try

    End Function

    ''' <summary>
    ''' Trae el nombre de las columnas (1er Renglon)
    ''' </summary>
    ''' <param name="pPath"></param>
    ''' <param name="pHoja"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function TraerNombresColumnas(ByVal pPath As String, ByVal pHoja As String) As Boolean
        TraerNombresColumnas = False
        Dim MyConnection As System.Data.OleDb.OleDbConnection = Nothing
        Dim DtSet As System.Data.DataSet = Nothing
        Dim MyCommand As System.Data.OleDb.OleDbDataAdapter = Nothing
        Try

            MyConnection = New System.Data.OleDb.OleDbConnection("provider=Microsoft.Jet.OLEDB.4.0;" & _
                                                                 " Data Source='" & pPath & "'; " & _
                                                                 "Extended Properties=Excel 8.0;")

            MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [" + pHoja + "$]", MyConnection)

            DtSet = New System.Data.DataSet

            MyCommand.Fill(DtSet)

            _listaColumnas = New ArrayList()

            For Each col As DataColumn In DtSet.Tables(0).Columns
                _listaColumnas.Add(col.ColumnName)
            Next
            TraerNombresColumnas = True
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("Error", Me._error)
        Finally
            MyConnection.Dispose()
            DtSet.Dispose()
            MyCommand.Dispose()
        End Try
    End Function


    Public Function TraerCantidadColumnas(ByVal pPath As String, ByVal pHoja As String) As Integer
        Dim MyConnection As System.Data.OleDb.OleDbConnection = Nothing
        Dim DtSet As System.Data.DataSet = Nothing
        Dim MyCommand As System.Data.OleDb.OleDbDataAdapter = Nothing
        Try

            MyConnection = New System.Data.OleDb.OleDbConnection("provider=Microsoft.Jet.OLEDB.4.0;" & _
                                                                 " Data Source='" & pPath & "'; " & _
                                                                 "Extended Properties=Excel 8.0;")

            MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [" + pHoja + "$]", MyConnection)

            DtSet = New System.Data.DataSet

            MyCommand.Fill(DtSet)

            Return DtSet.Tables(0).Columns.Count()

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("Error", Me._error)
            Return 0
        Finally
            MyConnection.Dispose()
            DtSet.Dispose()
            MyCommand.Dispose()
        End Try

    End Function



   
    Public Function TraerCantidadFilas(ByVal pPath As String, ByVal pHoja As String) As Integer

        'HDR=YES : Con encabezado  
        Dim cs As String = "Provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & pPath & ";" & "Extended Properties=""Excel 8.0;HDR=YES"""
        Dim cn As New OleDbConnection(cs)
        Dim dAdapter As OleDbDataAdapter = Nothing
        Dim datos As New DataSet
        Try
            ' cadena de conexión  
            If Not System.IO.File.Exists(pPath) Then
                MsgBox("No se encontró el Libro: " & pPath, MsgBoxStyle.Critical, "Ruta inválida")
                Exit Function
            End If

            ' se conecta con la hoja sheet 1  
            dAdapter = New OleDbDataAdapter("Select * From [" & pHoja & "$]", cs)

            ' agrega los datos  
            dAdapter.Fill(datos)

            Return datos.Tables(0).Rows.Count

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("Error", Me._error)
        Finally
            cn.Dispose()
            dAdapter.Dispose()
        End Try
    End Function

End Class
