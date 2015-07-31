Attribute VB_Name = "basSql"
Option Explicit


Public lerror As String

Public Sub CargarCombos(Combo As ComboBox, con As Connection)
    Dim rs As Recordset
    
    Set rs = con.Execute(CadenaParaCombos(Combo.Name))
       
    With Combo
        .Clear
        Do While Not rs.EOF
            ' Eliminamos la letra P
            .AddItem rs(1)
            .ItemData(.NewIndex) = rs(0)
            rs.MoveNext
        Loop
    End With

End Sub


Public Function CadenaParaCombos(Combo As String) As String
    Dim sQL_MFG As String
    
    If Combo = "cmbArticulo" Then
        
        ' sSql_INF = " SELECT articulo, desc_abrev "
        ' sSql_INF = sSql_INF & " FROM articulos "
        ' sSql_INF = sSql_INF & " WHERE tipo_art = 'mp'"
        ' sSql_INF = sSql_INF & " AND activo = 's'"
        ' sSql_INF = sSql_INF & " AND articulo between 100000 AND 199999"
        ' sSql_INF = sSql_INF & " ORDER BY 2"
        
        sQL_MFG = " select  pt_part as articulo, pt_desc1 as desc_abrev  from PUB.pt_mstr  where pt_part>=100000  and    pt_part <=199999 order by pt_desc1 "
    Else
    
        ' sSql_INF = " SELECT proveedor, razon_abrev "
        ' sSql_INF = sSql_INF & " FROM proveedor "
        ' sSql_INF = sSql_INF & " WHERE activo = 's'"
        ' sSql_INF = sSql_INF & " ORDER BY 2"
        
        ' sQL_MFG = " SELECT proveedor, razon_abrev "
        ' sQL_MFG = sQL_MFG & " FROM PUB.zprov_quimicos "
        'sQL_MFG = sQL_MFG & " WHERE activo = 's'"
        ' sQL_MFG = sQL_MFG & " ORDER BY razon_abrev "
        sQL_MFG = "select cod_tit , "
        
    End If
    
    CadenaParaCombos = sQL_MFG
    
    
End Function

Public Function obtenerNumeroLote() As Integer
    Dim Argumento As String
    Dim dAnio As Integer
    Dim iNumero As Integer
    Dim rs As New Recordset
    Dim sSql As String
    Dim cmd As ADODB.Command
    Dim con As Connection
    
    dAnio = Year(Date)
    Argumento = dAnio
    
    sSql = " SELECT nro_lote_sig "
    sSql = sSql & " FROM PUB.znum_quimicos "
    sSql = sSql & " WHERE anio = " & dAnio
    
    Set con = aplicacion.m_con_mfg_cueros
    Set rs.ActiveConnection = con
    rs.Open (sSql)
    
    If Not rs.EOF Then
        iNumero = rs("nro_lote_sig") + 1
        obtenerNumeroLote = iNumero
        sSql = " UPDATE PUB.znum_quimicos "
        sSql = sSql & " SET nro_lote_sig = ?" ' & iNumero
        sSql = sSql & " WHERE anio = ?" 'LOTE" & dAnio & "'"
    Else
        iNumero = 1
        obtenerNumeroLote = iNumero
        sSql = " INSERT INTO PUB.znum_quimicos  "
        sSql = sSql & " (nro_lote_sig,anio) VALUES (?,?) "
    End If
    
    Set cmd = New Command
    With cmd
        Set .ActiveConnection = con
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNumero)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , Argumento)
        .Execute
    End With
    
    Set rs = Nothing
    
    obtenerNumeroLote = iNumero
   
End Function


Public Function obtenerTxtVto(iCodigo As Long, con As Connection) As Integer
    Dim sSql_MFG As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim iCantDias As Integer
    Dim sOpcion As String
    
    On Error GoTo ErrorHandler
    
    ' sSql = " SELECT peso "
    ' sSql = sSql & " FROM art_fisicos "
    ' sSql = sSql & " WHERE articulo = ?"
    
    
    sSql_MFG = " SELECT cant_dias "
    sSql_MFG = sSql_MFG & " FROM PUB.zarti_quimicos "
    sSql_MFG = sSql_MFG & " WHERE articulo = ? "
    
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
        .CommandType = adCmdText
        .CommandText = sSql_MFG
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iCodigo)
        Set rs = .Execute
    End With
    
    If Not rs.EOF Then
        If rs("cant_dias") = 0 Then
            iCantDias = Val(InputBox("Ingrese la cantidad de Dias para ese Articulo", "OyG"))
            obtenerTxtVto = iCantDias
            If iCantDias = 0 Then
                Exit Function
            End If
            If Not AgregarCantidadDias(iCodigo, iCantDias, con) Then
                MsgBox "No pudo insertar los dias para ese Atículo", vbInformation, "OyG"
            End If
        Else
            obtenerTxtVto = rs("cant_dias")
        End If
    Else
        obtenerTxtVto = 0
    End If
    Exit Function
    
ErrorHandler:
    
End Function

Private Function Actualizar_CantidadDias(lCodigo As Long, iCantDias As Integer, con As Connection, sOpcion As String) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim oParam As Parameter
    
    On Error GoTo ErrorHandler
    
    sSql = " UPDATE PUB.zarti_quimicos "
    sSql = sSql & " SET cant_dias= ?"
    sSql = sSql & " WHERE articulo = ?"
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iCantDias)
        Set oParam = .CreateParameter(, adNumeric, adParamInput, , lCodigo)
        oParam.Precision = 8
        .Parameters.Append oParam
        Set rs = .Execute
    End With
    
    Actualizar_CantidadDias = True
    Exit Function
    
ErrorHandler:
    Actualizar_CantidadDias = False
End Function



Private Function AgregarCantidadDias(iCodigo As Long, iCantDias As Integer, con As Connection) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim sSql_MFG As String
    Dim sOpcion  As String
    Dim cmd      As ADODB.Command
    
    sOpcion = "Opciones_MFG_BD_EBCUEROS"
    
    sSql_MFG = " SELECT cant_dias "
    sSql_MFG = sSql_MFG & " FROM PUB.zarti_quimicos "
    sSql_MFG = sSql_MFG & " WHERE articulo = ? "
    
   Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
        .CommandType = adCmdText
        .CommandText = sSql_MFG
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iCodigo)
        Set rs = .Execute
    End With
    
    If rs.EOF Then
        Agregar_CantidadDias iCodigo, iCantDias, con, sOpcion
    Else
        Actualizar_CantidadDias iCodigo, iCantDias, con, sOpcion
    End If
    
End Function


Private Function Agregar_CantidadDias(lCodigo As Long, iCantDias As Integer, con As Connection, sOpcion As String) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim oParam As Parameter
    
    On Error GoTo ErrorHandler
    
    sSql = " INSERT INTO  PUB.zarti_quimicos  (articulo, cant_dias) VALUES (?,?) "
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iCantDias)
        Set oParam = .CreateParameter(, adNumeric, adParamInput, , lCodigo)
        oParam.Precision = 8
        .Parameters.Append oParam
        Set rs = .Execute
    End With
    
    Agregar_CantidadDias = True
    Exit Function
    
ErrorHandler:
    Agregar_CantidadDias = False
End Function



Public Sub CargarGrilla(con As Connection)
    Dim sSql_MFG As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim dAnio As Integer
    Dim i As Integer
    
    dAnio = Year(Date)
    
'    sSql = " SELECT f.anio, f.nro_lote, f.fecha_recep, f.articulo,"
'    sSql = sSql & " a.desc_abrev , f.fecha_vto, f.proveedor, p.razon_abrev, f.remito"
'    sSql = sSql & " FROM foc_lote f, articulos a, proveedor p"
'    sSql = sSql & " WHERE anio = ?"
'    sSql = sSql & " and f.articulo = a.articulo"
'    sSql = sSql & " and f.proveedor = p.proveedor"
'    sSql = sSql & " AND f.anulado = 'n'"
'    sSql = sSql & " ORDER BY nro_lote desc"

    sSql_MFG = " SELECT f.anio, f.nro_lote, f.fecha_recep, f.articulo,"
    sSql_MFG = sSql_MFG & " f.arti_desc_abrev , f.fecha_vto, f.proveedor, f.prov_razon_abrev, f.remito "
    sSql_MFG = sSql_MFG & " FROM PUB.zfoc_lote f "
    sSql_MFG = sSql_MFG & " WHERE anio = ?   "
    sSql_MFG = sSql_MFG & " AND f.anulado = 'n'"
    sSql_MFG = sSql_MFG & " ORDER BY nro_lote desc"
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
        .CommandType = adCmdText
        .CommandText = sSql_MFG
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , dAnio)
        Set rs = .Execute
    End With
    
    frmPrincipal.grdPrincipal.Rows = 0
    
    If Not rs.EOF Then
        frmPrincipal.lblCantidadLotes = 0
        With frmPrincipal.grdPrincipal
            .Rows = 0
            Do While Not rs.EOF 'Or .Row = 100
                .Rows = .Rows + 1
                .Row = .Rows - 1
                .Col = 0: .Text = rs("anio")
                .Col = 1: .Text = rs("nro_lote")
                .Col = 2: .Text = Format$(rs("Fecha_recep"), "dd/mm/yyyy")
                .Col = 3: .Text = rs("articulo") ' Cod Oculto
                .Col = 4: .Text = rs("arti_desc_abrev")
                .Col = 5: .Text = Format$(rs("fecha_vto"), "dd/mm/yyyy")
                .Col = 6: .Text = rs("proveedor") ' Cod Oculto
                .Col = 7: .Text = rs("prov_razon_abrev")
                .Col = 8: .Text = rs("Remito")
                rs.MoveNext
                
                frmPrincipal.lblCantidadLotes = frmPrincipal.lblCantidadLotes + 1
                
            Loop
            .Row = 0
            .Col = 0
        End With
    End If
End Sub

Public Function InsertarLote(Anio As Integer, iNroLote As Integer, _
lArticulo As Long, dFechaLote As Date, dFechaVto As Date, lProveedor As Long, _
sRemito As String, sArticulo_descripcion As String, sProveedor_descripcion As String) As Boolean
    Dim rs As Recordset
    Dim sSql As String
    Dim cmd As Command
    Dim oParam As Parameter
    Dim User As String
    Dim cone As cConexion
    Dim dFechaAlta As Date
    
    On Error GoTo ErrorHandler
    
    sSql = " INSERT INTO PUB.zfoc_lote "
    sSql = sSql & "(anio, nro_lote, articulo, fecha_recep, "
    sSql = sSql & " fecha_vto, proveedor, remito, impreso,"
    sSql = sSql & " oper_alta, fecha_alta, anulado, enviado,"
    sSql = sSql & " cantidad, cant_ok, cant_rech,arti_desc_abrev,prov_razon_abrev)"
    sSql = sSql & " VALUES(?,?,?,?,"
    sSql = sSql & " ?,?,?,'n'"
    sSql = sSql & " ,?,?,'n','n'"
    sSql = sSql & " ,0,0,0,?,?)"
    
    Set cone = New cConexion
    
    User = cone.ObtenerValorReg("Usuario", "Fonseca", "Opciones_MFG_BD_EBCUEROS")
    dFechaAlta = CDate(Now)
    
    Set cmd = New ADODB.Command
    
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
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
        .Parameters.Append .CreateParameter("", adChar, adParamInput, 12, UCase(User))
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaLote)
        .Parameters.Append .CreateParameter("", adChar, adParamInput, 80, sArticulo_descripcion)
        .Parameters.Append .CreateParameter("", adChar, adParamInput, 80, sProveedor_descripcion)
        
        ' sArticulo_descripcion As String, sProveedor_descripcion
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
iLoteHasta As Integer, con As Connection) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    'Dim dAnio As Integer
    Dim i As Integer
    
    'dAnio = Year(Date)
    
    sSql = " SELECT f.anio, f.nro_lote, f.fecha_recep, f.articulo,"
    sSql = sSql & " f.arti_desc_abrev , f.fecha_vto, f.proveedor, f.prov_razon_abrev, f.remito"
    sSql = sSql & " FROM PUB.zfoc_lote f "
    sSql = sSql & " WHERE "
    sSql = sSql & " f.fecha_recep between ? and ? "
    sSql = sSql & " AND f.fecha_vto between ? and ? "
    sSql = sSql & " AND f.anio between ? and ? "
    sSql = sSql & " AND f.nro_lote between ? and ? "
    sSql = sSql & " AND f.anulado = 'n' "
    sSql = sSql & " ORDER BY anio, nro_lote desc "


    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
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
    
    frmPrincipal.grdPrincipal.Rows = 0
    
      If Not rs.EOF Then
        frmPrincipal.lblCantidadLotes = 0
        With frmPrincipal.grdPrincipal
            .Rows = 0
            Do While Not rs.EOF 'Or .Row = 100
                .Rows = .Rows + 1
                .Row = .Rows - 1
                .Col = 0: .Text = rs("anio")
                .Col = 1: .Text = rs("nro_lote")
                .Col = 2: .Text = Format$(rs("Fecha_recep"), "dd/mm/yyyy")
                .Col = 3: .Text = rs("articulo") ' Cod Oculto
                .Col = 4: .Text = rs("arti_desc_abrev")
                .Col = 5: .Text = Format$(rs("fecha_vto"), "dd/mm/yyyy")
                .Col = 6: .Text = rs("proveedor") ' Cod Oculto
                .Col = 7: .Text = rs("prov_razon_abrev")
                .Col = 8: .Text = rs("Remito")
                rs.MoveNext
                
                frmPrincipal.lblCantidadLotes = frmPrincipal.lblCantidadLotes + 1
                
            Loop
            .Row = 0
            .Col = 0
        End With
    End If
    
End Function

Public Function ObtenerFiltrosReport(dFechaDesde As Date, dFechaHasta As Date, dVtoFechaDesde As Date, VtoFechaHasta As Date, iAnoDesde As Integer, iAnoHasta As Integer, iLoteDesde As Integer, iLoteHasta As Integer, OpcionFecha As Boolean, OpcionFechaVto As Boolean, OpcionLotes As Boolean) As Recordset
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim i As Integer
    
    sSql = " SELECT f.anio, f.nro_lote, f.fecha_recep, f.articulo,"
    sSql = sSql & " f.arti_desc_abrev , f.fecha_vto, f.proveedor, f.prov_razon_abrev, f.remito"
    sSql = sSql & " FROM PUB.zfoc_lote f "
    sSql = sSql & " WHERE "
    
    If OpcionFecha Then
        sSql = sSql & " f.fecha_recep between ? and ?"
    ElseIf OpcionFechaVto Then
        sSql = sSql & " f.fecha_vto between ? and ?"
    ElseIf OpcionLotes Then
        sSql = sSql & " f.anio between ? and ?"
        sSql = sSql & " AND f.nro_lote between ? and ?"
    End If
    sSql = sSql & " AND f.articulo = a.articulo "
    sSql = sSql & " AND f.proveedor = p.proveedor "
    sSql = sSql & " AND f.anulado = 'n'"
    sSql = sSql & " ORDER BY anio desc, nro_lote desc"


    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
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



Public Function SeleccionarloteModificar(iNroLote As Integer, iAnio As Integer, _
    lArticulo As Long, dFechaLote As Date, dFechaVto As Date, _
    lProveedor As Long, sRemito As String, con As Connection, _
     sArticulo_descripcion As String, sProveedor_descripcion As String) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim User As String
    Dim dFechaAlta As Date
    Dim oParam As Object
    
    SeleccionarloteModificar = False

    On Error GoTo ErrorHandler
    
    sSql = " SELECT * "
    sSql = sSql & " FROM PUB.zfoc_lote where nro_lote = ?"
    sSql = sSql & " AND enviado = 'n' "
    sSql = sSql & " AND informe_rec = 0 AND anio = ? "
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnio)
        Set rs = .Execute
    End With
    
    If rs.EOF Then
        MsgBox "El Lote " & iNroLote & " no puede ser modificado", vbInformation, "Oyg"
        Exit Function
    End If
    
    sSql = " UPDATE  PUB.zfoc_lote "
    sSql = sSql & "Set anio = ?,  articulo = ?, fecha_recep = ? "
    sSql = sSql & " ,fecha_vto = ?, proveedor = ?, remito = ? , "
    sSql = sSql & " arti_desc_abrev = ? , prov_razon_abrev = ? "
    sSql = sSql & " WHERE nro_lote = ?" '& iNroLote
    sSql = sSql & " AND anio = ?" 'anio
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
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
        .Parameters.Append .CreateParameter("", adChar, adParamInput, 80, sArticulo_descripcion)
        .Parameters.Append .CreateParameter("", adChar, adParamInput, 80, sProveedor_descripcion)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnio)
        
        
        
         
        Set rs = .Execute
    End With
    SeleccionarloteModificar = True
    Exit Function
    
ErrorHandler:
    SeleccionarloteModificar = False
End Function

Public Function SeleccionarloteModificarVto(iAnio As Integer, iNroLote As Integer, dFechaVto As Date) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim User As String
    Dim dFechaAlta As Date
    
    On Error GoTo ErrorHandler
    
    sSql = " SELECT * "
    sSql = sSql & " FROM PUB.zfoc_lote where nro_lote = ? and anio=? "
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnio)
        Set rs = .Execute
    End With
    
    If rs.EOF Then
        MsgBox "El Lote " & iNroLote & " no puede ser modificado", vbInformation, "Oyg"
        Exit Function
    End If
    
    rs.Close
    
    sSql = " UPDATE  PUB.zfoc_lote "
    sSql = sSql & "Set fecha_vto = ? "
    sSql = sSql & " WHERE "
    sSql = sSql & " nro_lote = ?" '& iNroLote
    sSql = sSql & " AND anio = ?" 'anio
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adDate, adParamInput, , dFechaVto)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnio)
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
    Dim con As Connection
    
    On Error GoTo ErrorHandler
    
    Set con = aplicacion.m_con_mfg_cueros
    

    sArgumento = iAnio
    
    sSql = " SELECT * "
    sSql = sSql & " FROM PUB.zfoc_lote "
    sSql = sSql & " WHERE nro_lote = ?"
    sSql = sSql & " AND anio = ?"
    sSql = sSql & " AND enviado = 'n' "
    sSql = sSql & " AND informe_rec=0 "
    
    Set cmd = New Command
    With cmd
        Set .ActiveConnection = con
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , ilote)
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iAnio)
        Set rs = .Execute
    End With
    
    If rs.EOF Then
        MsgBox "El Lote " & ilote & " no puede ser Eliminado", vbInformation, "Oyg"
        Exit Function
    End If
    
    rs.Close
    
    sSql = " DELETE FROM PUB.zfoc_lote "
    sSql = sSql & " WHERE nro_lote =" & ilote
    sSql = sSql & " AND anio =" & iAnio
    Set rs = con.Execute(sSql)
    
'    If ilote = 1 Then
'        sSql = " DELETE FROM numero"
'        sSql = sSql & " WHERE numero =" & ilote
'        sSql = sSql & " AND anio = " & CStr(iAnio)
'        Set rs = con.Execute(sSql)
'    Else
'        ilote = ilote - 1
'        sSql = " UPDATE PUB.znum_quimicos "
'        sSql = sSql & " SET nro_lote_sig =? "
'        sSql = sSql & " WHERE anio =? "
'    End If
'
'
'    Set cmd = New Command
'    With cmd
'        Set .ActiveConnection = con
'        .CommandType = adCmdText
'        .CommandText = sSql
'        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , ilote)
'        .Parameters.Append .CreateParameter("", adChar, adParamInput, 16, sArgumento)
'        .Execute
'    End With
  
    EliminarUltimoLote = True
    
    Exit Function

ErrorHandler:

    EliminarUltimoLote = False
    
    
End Function

Public Function AnularSelectLote(iNroLote As Integer, iAnio As Integer, con As Connection) As Boolean
    Dim sSql As String
    Dim rs As Recordset
    Dim cmd As ADODB.Command
    Dim User As String
    Dim dFechaAlta As Date
    
    On Error GoTo ErrorHandler
    
    sSql = " SELECT * "
    sSql = sSql & " FROM PUB.zfoc_lote where nro_lote = ?"
    sSql = sSql & " AND enviado = 'n' "
    sSql = sSql & " AND informe_rec = 0 "
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
        .CommandType = adCmdText
        .CommandText = sSql
        .Parameters.Append .CreateParameter("", adInteger, adParamInput, , iNroLote)
        Set rs = .Execute
    End With
    
    If rs.EOF Then
        lerror = "El Lote " & iNroLote & " no puede ser Anulado"
        Exit Function
    End If
    
    sSql = " UPDATE  PUB.zfoc_lote "
    sSql = sSql & "Set anulado = 's'"
    sSql = sSql & " WHERE nro_lote = ?" '& iNroLote
    sSql = sSql & " AND anio = ?" 'Anio
    
    Set cmd = New ADODB.Command
    With cmd
        Set .ActiveConnection = aplicacion.m_con_mfg_cueros
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
    
    sSql = "SELECT code_cmmt FROM PUB.code_mstr WHERE code_fldname='fo_letra_emp' "
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
        ObtenerLetraPorEmpresa = Trim(rs("code_cmmt"))
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
