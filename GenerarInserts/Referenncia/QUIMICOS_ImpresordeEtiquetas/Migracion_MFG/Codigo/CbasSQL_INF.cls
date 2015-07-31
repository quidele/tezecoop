VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CbasSQL_OYG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Public Sub CargarCombos(Combo As ComboBox)
    Dim rs As Recordset
    
    Set rs = aplicacion.m_con_OYG.Execute(CadenaParaCombos(Combo.Name))
       
    With Combo
        .Clear
        Do While Not rs.EOF
            .AddItem rs(1)
            .ItemData(.NewIndex) = rs(0)
            rs.MoveNext
        Loop
    End With

End Sub


Public Function CadenaParaCombos(Combo As String) As String
    Dim sSql As String
    
    If Combo = "cmbArticulo" Then
        sSql = " SELECT articulo, desc_abrev "
        sSql = sSql & " FROM articulos "
        sSql = sSql & " WHERE tipo_art = 'mp'"
        sSql = sSql & " AND activo = 's'"
        sSql = sSql & " AND articulo between 100000 AND 199999"
        sSql = sSql & " ORDER BY 2"
        ' Debug.Assert False
    Else
        sSql = " SELECT proveedor, razon_abrev "
        sSql = sSql & " FROM proveedor "
        sSql = sSql & " WHERE activo = 's'"
        sSql = sSql & " ORDER BY 2"
    End If
    
    CadenaParaCombos = sSql
    
    
End Function

Public Function obtenerNumeroLote() As Integer
    Dim Argumento As String
    Dim dAnio As Integer
    Dim iNumero As Integer
    Dim rs As Recordset
    Dim sSql As String
    Dim cmd As ADODB.Command
    
    dAnio = Year(Date)
    Argumento = "LOTE" & dAnio
    
    sSql = " SELECT numero"
    sSql = sSql & " FROM numero"
    sSql = sSql & " WHERE arg = 'LOTE" & dAnio & "'"
    
    Set rs = aplicacion.m_con_OYG.Execute(sSql)
    
    If Not rs.EOF Then
        iNumero = rs("numero") + 1
        obtenerNumeroLote = iNumero
        sSql = " UPDATE numero"
        sSql = sSql & " SET numero = ?" ' & iNumero
        sSql = sSql & " WHERE arg = ?" 'LOTE" & dAnio & "'"
    Else
        iNumero = 1
        obtenerNumeroLote = iNumero
        sSql = " INSERT INTO numero "
        sSql = sSql & " (numero,"
        sSql = sSql & " arg) "
        sSql = sSql & " VALUES (?,?)"
    End If
    
    Set cmd = New Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNumero)
        .Parameters.Append .CreateParameter("", adChar, adParamInput, 30, Argumento)
        .Execute
        
    End With
    
    Set rs = Nothing
    
    obtenerNumeroLote = iNumero
   
End Function


Public Function obtenerTxtVto(iCodigo As Long) As Integer
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim iCantDias As Integer
    
    On Error GoTo ErrorHandler
    
    sSql = " SELECT peso "
    sSql = sSql & " FROM art_fisicos "
    sSql = sSql & " WHERE articulo = ?"
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iCodigo)
        Set rs = .Execute
    End With
    
    If Not rs.EOF Then
        If rs("peso") = 0 Then
            iCantDias = Val(InputBox("Ingrese la cantidad de Dias para ese Articulo", "OyG"))
            obtenerTxtVto = iCantDias
            If iCantDias = 0 Then
                Exit Function
            End If
            If Not AgregarCantidadDias(iCodigo, iCantDias, aplicacion.m_con_OYG) Then
                MsgBox "No pudo insertar los dias para ese Atículo", vbInformation, "OyG"
            End If
        Else
            obtenerTxtVto = rs("peso")
        End If
    Else
        obtenerTxtVto = 0
    End If
    Exit Function
    
ErrorHandler:
    
End Function

Private Function AgregarCantidadDias(lCodigo As Long, iCantDias As Integer, con As Connection) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim oParam As Parameter
    
    On Error GoTo ErrorHandler
    
    sSql = " UPDATE art_fisicos"
    sSql = sSql & " SET peso= ?"
    sSql = sSql & " WHERE articulo = ?"
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iCantDias)
        Set oParam = .CreateParameter(, adNumeric, adParamInput, , lCodigo)
        oParam.Precision = 8
        .Parameters.Append oParam
        
        Set rs = .Execute
    End With
    
    AgregarCantidadDias = True
    Exit Function
    
ErrorHandler:
    AgregarCantidadDias = False
End Function

Public Sub CargarGrilla()
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim dAnio As Integer
    Dim i As Integer
    
    dAnio = Year(Date)
    
    sSql = " SELECT f.anio, f.nro_lote, f.fecha_recep, f.articulo,"
    sSql = sSql & " a.desc_abrev , f.fecha_vto, f.proveedor, p.razon_abrev, f.remito"
    sSql = sSql & " FROM foc_lote f, articulos a, proveedor p"
    sSql = sSql & " WHERE anio = ?"
    sSql = sSql & " and f.articulo = a.articulo"
    sSql = sSql & " and f.proveedor = p.proveedor"
    sSql = sSql & " AND f.anulado = 'n'"
    sSql = sSql & " ORDER BY nro_lote desc"

    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , dAnio)
        Set rs = .Execute
    End With
    

    
    If Not rs.EOF Then
        frmPrincipal.lblCantidadLotes = 0
        With frmPrincipal.grdPrincipal
            .Rows = 1
            .Row = 0
            Do While Not rs.EOF 'Or .Row = 100
                .Rows = .Rows + 1
                .Row = .Rows - 1
                .Col = 0: .Text = rs("anio")
                .Col = 1: .Text = rs("nro_lote")
                .Col = 2: .Text = Format$(rs("Fecha_recep"), "dd/mm/yyyy")
                .Col = 3: .Text = rs("articulo") ' Cod Oculto
                .Col = 4: .Text = rs("desc_abrev")
                .Col = 5: .Text = Format$(rs("fecha_vto"), "dd/mm/yyyy")
                .Col = 6: .Text = rs("proveedor") ' Cod Oculto
                .Col = 7: .Text = rs("razon_abrev")
                .Col = 8: .Text = rs("Remito")
                rs.MoveNext
                
                frmPrincipal.lblCantidadLotes = frmPrincipal.lblCantidadLotes + 1
                
            Loop
            .Row = 1
            .Col = 1
        End With
    End If
    
    
End Sub

Public Function InsertarLote(Anio As Integer, iNroLote As Integer, _
lArticulo As Long, dFechaLote As Date, dFechaVto As Date, lProveedor As Long, _
sRemito As String) As Boolean
    Dim rs As Recordset
    Dim sSql As String
    Dim cmd As Command
    Dim oParam As Parameter
    Dim User As String
    Dim cone As cConexion
    Dim dFechaAlta As Date
    
    On Error GoTo ErrorHandler
    
    sSql = " INSERT INTO foc_lote "
    sSql = sSql & "(anio, nro_lote, articulo, fecha_recep, "
    sSql = sSql & " fecha_vto, proveedor, remito, impreso,"
    sSql = sSql & " oper_alta, fecha_alta, anulado, enviado,"
    sSql = sSql & " cantidad, cant_ok, cant_rech)"
    sSql = sSql & " VALUES(?,?,?,?,"
    sSql = sSql & " ?,?,?,'n'"
    sSql = sSql & " ,?,?,'n','n'"
    sSql = sSql & " ,0,0,0)"
    
    Set cone = New cConexion
    
    User = cone.ObtenerValorReg("User_sesion", "Fonseca", "Opciones_OyG")
    dFechaAlta = CDate(Now)
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , Anio)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        Set oParam = .CreateParameter(, adNumeric, adParamInput, , lArticulo)
        oParam.Precision = 8
        .Parameters.Append oParam
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaLote)
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaVto)
        Set oParam = .CreateParameter(, adNumeric, adParamInput, , lProveedor)
        oParam.Precision = 8
        .Parameters.Append oParam
        .Parameters.Append .CreateParameter("", adChar, adParamInput, 15, sRemito)
        .Parameters.Append .CreateParameter("", adChar, adParamInput, 8, UCase(User))
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaLote)
        
        Set rs = .Execute
    End With
    
    InsertarLote = True
    Exit Function

ErrorHandler:
    InsertarLote = False
    
End Function

Public Function SeleccionarPorFiltros(dFechaDesde As Date, _
dFechaHasta As Date, dVtoFechaDesde As Date, VtoFechaHasta As Date _
, iAnoDesde As Integer, iAnoHasta As Integer, iLoteDesde As Integer, _
iLoteHasta As Integer) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    'Dim dAnio As Integer
    Dim i As Integer
    
    'dAnio = Year(Date)
    
    sSql = " SELECT f.anio, f.nro_lote, f.fecha_recep, f.articulo,"
    sSql = sSql & " a.desc_abrev , f.fecha_vto, f.proveedor, p.razon_abrev, f.remito"
    sSql = sSql & " FROM foc_lote f, articulos a, proveedor p"
    sSql = sSql & " WHERE "
    sSql = sSql & " f.fecha_recep between ? and ?"
    sSql = sSql & " AND f.fecha_vto between ? and ?"
    sSql = sSql & " AND f.anio between ? and ?"
    sSql = sSql & " AND f.nro_lote between ? and ?"
    sSql = sSql & " AND f.articulo = a.articulo"
    sSql = sSql & " AND f.proveedor = p.proveedor"
    sSql = sSql & " AND f.anulado = 'n'"
    sSql = sSql & " ORDER BY anio, nro_lote desc"


    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaDesde)
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaHasta)
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dVtoFechaDesde)
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , VtoFechaHasta)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnoDesde)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnoHasta)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iLoteDesde)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iLoteHasta)
        Set rs = .Execute
    End With
    If Not rs.EOF Then
        With frmPrincipal.grdPrincipal
            .Rows = 1
            .Row = 0
            Do While Not rs.EOF Or .Row = 100
                .Rows = .Rows + 1
                .Row = .Rows - 1
                .Col = 0: .Text = rs("anio")
                .Col = 1: .Text = rs("nro_lote")
                .Col = 2: .Text = Format$(rs("Fecha_recep"), "dd/mm/yyyy")
                .Col = 3: .Text = rs("articulo") ' Cod Oculto
                .Col = 4: .Text = rs("desc_abrev")
                .Col = 5: .Text = Format$(rs("fecha_vto"), "dd/mm/yyyy")
                .Col = 6: .Text = rs("proveedor") ' Cod Oculto
                .Col = 7: .Text = rs("razon_abrev")
                .Col = 8: .Text = rs("Remito")
                rs.MoveNext
            Loop
        End With
    Else
    End If
End Function

Public Function ObtenerFiltrosReport(dFechaDesde As Date, dFechaHasta As Date, dVtoFechaDesde As Date, VtoFechaHasta As Date, iAnoDesde As Integer, iAnoHasta As Integer, iLoteDesde As Integer, iLoteHasta As Integer, OpcionFecha As Boolean, OpcionFechaVto As Boolean, OpcionLotes As Boolean) As Recordset
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim i As Integer
    
    sSql = " SELECT f.anio, f.nro_lote, f.fecha_recep, f.articulo,"
    sSql = sSql & " a.desc_abrev , f.fecha_vto, f.proveedor, p.razon_abrev, f.remito"
    sSql = sSql & " FROM foc_lote f, articulos a, proveedor p"
    sSql = sSql & " WHERE "
    
    If OpcionFecha Then
        sSql = sSql & " f.fecha_recep between ? and ?"
    ElseIf OpcionFechaVto Then
        sSql = sSql & " f.fecha_vto between ? and ?"
    ElseIf OpcionLotes Then
        sSql = sSql & " f.anio between ? and ?"
        sSql = sSql & " AND f.nro_lote between ? and ?"
    End If
    sSql = sSql & " AND f.articulo = a.articulo"
    sSql = sSql & " AND f.proveedor = p.proveedor"
    sSql = sSql & " AND f.anulado = 'n'"
    sSql = sSql & " ORDER BY anio desc, nro_lote desc"


    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        If OpcionFecha Then
            .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaDesde)
            .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaHasta)
        ElseIf OpcionFechaVto Then
            .Parameters.Append .CreateParameter("", adDate, adParamInput, , dVtoFechaDesde)
            .Parameters.Append .CreateParameter("", adDate, adParamInput, , VtoFechaHasta)
        ElseIf OpcionLotes Then
            .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnoDesde)
            .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnoHasta)
            .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iLoteDesde)
            .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iLoteHasta)
        End If
        Set rs = .Execute
    End With
    Set ObtenerFiltrosReport = rs
    
    
End Function



'Public Function ObtenerVtoDesdeHasta(dVtoFechaDesde As Date, VtoFechaHasta As Date) As Recordset
'Public Function ObtenerDesdeHasta(dFechaDesde As Date, dFechaHasta As Date, dVtoFechaDesde As Date, VtoFechaHasta As Date) As Recordset
'    Dim sSql As String
'    Dim rs As Recordset
'    Dim cmd As ADODB.Command
'    Dim i As Integer
'
'    sSql = " SELECT f.anio, f.nro_lote, f.fecha_recep, f.articulo,"
'    sSql = sSql & " a.desc_abrev , f.fecha_vto, f.proveedor, p.razon_abrev, f.remito"
'    sSql = sSql & " FROM foc_lote f, articulos a, proveedor p"
'    sSql = sSql & " WHERE "
'    sSql = sSql & " f.fecha_recep between ? and ?"
'    sSql = sSql & " AND f.fecha_vto between ? and ?"
'    'sSql = sSql & " AND f.anio between ? and ?"
'    'sSql = sSql & " AND f.nro_lote between ? and ?"
'    sSql = sSql & " AND f.articulo = a.articulo"
'    sSql = sSql & " AND f.proveedor = p.proveedor"
'    sSql = sSql & " AND f.anulado = 'n'"
'    sSql = sSql & " ORDER BY anio, nro_lote desc"
'
'
'    Set cmd = New ADODB.Command
'    With cmd
'        Set .ActiveConnection = AbrirConexion("fonseca")
'        .CommandType = adCmdText
'        .CommandText = sSql
'        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaDesde)
'        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaHasta)
'        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dVtoFechaDesde)
'        .Parameters.Append .CreateParameter("", adDate, adParamInput, , VtoFechaHasta)
'        '.Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnoDesde)
'        '.Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnoHasta)
'        '.Parameters.Append .CreateParameter("", adInteger, adParamInput, , iLoteDesde)
'        '.Parameters.Append .CreateParameter("", adInteger, adParamInput, , iLoteHasta)
'        Set rs = .Execute
'    End With
'    Set ObtenerDesdeHasta = rs
'End Function

Public Function SeleccionarloteModificar(iNroLote As Integer, iAnio As Integer, _
    lArticulo As Long, dFechaLote As Date, dFechaVto As Date, _
    lProveedor As Long, sRemito As String) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim User As String
    Dim dFechaAlta As Date
    Dim oParam As Object
    
    SeleccionarloteModificar = False

    On Error GoTo ErrorHandler
    
    sSql = " SELECT * "
    sSql = sSql & " FROM foc_lote where nro_lote = ?"
    sSql = sSql & " AND enviado = 'n' "
    sSql = sSql & " AND informe_rec is null"
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        Set rs = .Execute
    End With
    
    If rs.EOF Then
        MsgBox "El Lote " & iNroLote & " no puede ser modificado", vbInformation, "Oyg"
        Exit Function
    End If
    
    sSql = " UPDATE  foc_lote "
    sSql = sSql & "Set anio = ?,  articulo = ?, fecha_recep = ? "
    sSql = sSql & " ,fecha_vto = ?, proveedor = ?, remito = ? "
    sSql = sSql & " WHERE nro_lote = ?" '& iNroLote
    sSql = sSql & " AND anio = ?" 'anio
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnio)
        Set oParam = .CreateParameter(, adNumeric, adParamInput, , lArticulo)
        oParam.Precision = 8
        .Parameters.Append oParam
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaLote)
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaVto)
        Set oParam = .CreateParameter(, adNumeric, adParamInput, , lProveedor)
        oParam.Precision = 8
        .Parameters.Append oParam
        .Parameters.Append .CreateParameter("", adChar, adParamInput, 15, sRemito)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnio)
        
        Set rs = .Execute
    End With
    SeleccionarloteModificar = True
    Exit Function
    
ErrorHandler:
    SeleccionarloteModificar = False
End Function

Public Function SeleccionarloteModificarVto(iNroLote As Integer, dFechaVto As Date) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim User As String
    Dim dFechaAlta As Date
    
    On Error GoTo ErrorHandler
    
    sSql = " SELECT * "
    sSql = sSql & " FROM foc_lote where nro_lote = ?"
    'sSql = sSql & " AND enviado = 'n' "
    'sSql = sSql & " AND informe_rec is null"
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        Set rs = .Execute
    End With
    
    If rs.EOF Then
        MsgBox "El Lote " & iNroLote & " no puede ser modificado", vbInformation, "Oyg"
        Exit Function
    End If
    
    sSql = " UPDATE  foc_lote "
    sSql = sSql & "Set fecha_vto = ? "
    sSql = sSql & " WHERE "
    sSql = sSql & " nro_lote = ?" '& iNroLote
    'sSql = sSql & " AND anio = ?" 'anio
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaVto)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        Set rs = .Execute
    End With
    SeleccionarloteModificarVto = True
    Exit Function
    
ErrorHandler:
    SeleccionarloteModificarVto = False
End Function

Public Function EliminarUltimoLote(iAnio As Integer, ilote As Integer) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim sArgumento As String
    Dim dAnio
    
    On Error GoTo ErrorHandler
    
    sArgumento = "LOTE" & iAnio
    
    sSql = " SELECT * "
    sSql = sSql & " FROM foc_lote "
    sSql = sSql & " WHERE nro_lote = ?"
    sSql = sSql & " AND anio = ?"
    sSql = sSql & " AND enviado = 'n' "
    sSql = sSql & " AND informe_rec is null"
    
    Set cmd = New Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , ilote)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnio)
        Set rs = cmd.Execute
    End With
    
    If rs.EOF Then
        MsgBox "El Lote " & ilote & " no puede ser Eliminado", vbInformation, "Oyg"
        Exit Function
    End If
    
    rs.Close
    
    sSql = " DELETE FROM foc_lote "
    sSql = sSql & " WHERE nro_lote =" & ilote
    sSql = sSql & " AND anio =" & iAnio
    Set rs = aplicacion.m_con_OYG.Execute(sSql)
    
    If ilote = 1 Then
        sSql = " DELETE FROM numero"
        sSql = sSql & " WHERE numero =" & ilote
        sSql = sSql & " AND arg = LOTE" & dAnio & "'"
        Set rs = aplicacion.m_con_OYG.Execute(sSql)
    Else
        ilote = ilote - 1
        sSql = " UPDATE numero"
        sSql = sSql & " SET numero =?" ' & iNumero
        sSql = sSql & " WHERE arg =?" 'LOTE" & dAnio & "'"
    End If
    
    

    Set cmd = New Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , ilote)
        .Parameters.Append .CreateParameter("", adChar, adParamInput, 16, sArgumento)
        .Execute
    End With
  
    EliminarUltimoLote = True
    Exit Function

ErrorHandler:
    EliminarUltimoLote = False
    
    
End Function

Public Function AnularSelectLote(iNroLote As Integer, iAnio As Integer) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim User As String
    Dim dFechaAlta As Date
    
    On Error GoTo ErrorHandler
    
    sSql = " SELECT * "
    sSql = sSql & " FROM foc_lote where nro_lote = ?"
    sSql = sSql & " AND enviado = 'n' "
    sSql = sSql & " AND informe_rec is null"
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        Set rs = .Execute
    End With
    
    If rs.EOF Then
        lerror = "El Lote " & iNroLote & " no puede ser Anulado"
        Exit Function
    End If
    
    sSql = " UPDATE  foc_lote "
    sSql = sSql & "Set anulado = 's'"
    sSql = sSql & " WHERE nro_lote = ?" '& iNroLote
    sSql = sSql & " AND anio = ?" 'Anio
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_OYG
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnio)
        
        Set rs = .Execute
    End With
    AnularSelectLote = True
    Exit Function
    
ErrorHandler:
    AnularSelectLote = False
End Function

Public Function ObtenerLetraPorEmpresa(conn As Connection) As String
    Dim sSql As String
    Dim argParam As String
    Dim cmd As Command
    Dim rs As Recordset

    On Error GoTo ErrorHandler
    
    sSql = "SELECT alfa FROM param WHERE arg = ?"
    
    argParam = "fo_letra_emp"
    
    Set cmd = New Command
    
    With cmd
        .ActiveConnection = conn
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("arg", adChar, adParamInput, 16, argParam)
        Set rs = .Execute
    End With
    
    If rs Is Nothing Then
        ObtenerLetraPorEmpresa = "/"
    ElseIf rs.EOF Then
        ObtenerLetraPorEmpresa = "/"
    Else
        ObtenerLetraPorEmpresa = Trim(rs("alfa"))
    End If
    
    If cmd.ActiveConnection.State = adStateOpen Then cmd.ActiveConnection.Close
    Set cmd = Nothing
    Set rs = Nothing
    Set conn = Nothing
    
    Exit Function
    
ErrorHandler:
    
    If Not rs Is Nothing Then
        If cmd.ActiveConnection.State = adStateOpen Then cmd.ActiveConnection.Close
        Set cmd = Nothing
        Set rs = Nothing
        Set conn = Nothing
    End If

    ObtenerLetraPorEmpresa = "/"
    
End Function

