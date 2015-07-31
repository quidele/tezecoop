Attribute VB_Name = "Conexion"
Option Explicit

Global oEmpresa As New cEmpresa
Global aplicacion As New cAplicacion
Global oBasSQLOYG As New CbasSQL_OYG
Global oImprimeEtiqueta As New CImprimeEtiqueta

Public valor As Integer


Sub Main()

    

    With aplicacion
        .base = "oygbase"
        .proyecto_ebfonse = "Fonseca"
        .proyecto_Cueros = "Fonseca"
        .proyecto_Magma = "Fonseca"
        ' .proyecto_OYG = "Fonseca"
        frmLogin.Show vbModal
        .base = oEmpresa.database
        '.proyecto_OYG = "Fonseca"
        frmPrincipal.Caption = frmPrincipal.Caption & " - " & oEmpresa.nombre
        frmPrincipal.Caption = frmPrincipal.Caption + " - Versión " + CStr(App.Major) + "." + CStr(App.Minor)
        TitulosGrilla
        ' oBasSQLOYG.CargarCombos frmPrincipal.cmbArticulo
        ' oBasSQLOYG.CargarCombos frmPrincipal.cmbProveedor
        CargarCombos frmPrincipal.cmbArticulo, .m_con_mfg_ebfonse
        CargarCombos frmPrincipal.cmbProveedor, .m_con_MAGMA
        CargarGrilla .m_con_mfg_cueros
        frmPrincipal.Show
    End With
    
End Sub

Public Function IncrementoNroLote() As Integer
    Dim aplicacion As cAplicacion
    
    Set aplicacion = New cAplicacion
    aplicacion.base = "oygbase" 'oEmpresa.database
    aplicacion.proyecto_ebfonse = "Fonseca"
    IncrementoNroLote = obtenerNumeroLote()
    
    
End Function

Private Sub TitulosGrilla()
    With frmPrincipal.grdPrincipal
    
        .Row = 0
        .Cols = 9
        
        .Col = 0: .Text = "Año"
        .Col = 1: .Text = "Lote"
        .Col = 2: .Text = "Fecha"
        .Col = 3: .Text = "articulo (cod)"
        .Col = 4: .Text = "artículo"
        .Col = 5: .Text = "vto"
        .Col = 6: .Text = "Proveedor (cod)"
        .Col = 7: .Text = "Proveedor"
        .Col = 8: .Text = "Remito"
        .ColWidth(0) = 500
        .ColWidth(1) = 700
        .ColWidth(2) = 980
        .ColWidth(3) = 0   'codigo de artículo
        .ColWidth(4) = 2200 'descripción de artículo
        .ColWidth(5) = 980
        .ColWidth(6) = 0    'codigo de proveedor
        .ColWidth(7) = 2200 'descripcion de proveedor
        .ColWidth(8) = 1500
        .ColAlignment(0) = flexAlignCenterTop
        .ColAlignment(1) = flexAlignCenterBottom
        .ColAlignment(2) = flexAlignCenterCenter
        .ColAlignment(3) = flexAlignGeneral
        .ColAlignment(4) = flexAlignLeftCenter
        .ColAlignment(5) = flexAlignCenterCenter
        .ColAlignment(6) = flexAlignGeneral
        .ColAlignment(7) = flexAlignLeftCenter
        .ColAlignment(8) = flexAlignCenterCenter
    End With
End Sub

Public Function obtenerVto(iCodigo As Long) As Integer

    
    ' obtenerVto = obtenerTxtVto(iCodigo, aplicacion.m_con_mfg_cueros)
    
    obtenerVto = oBasSQLOYG.obtenerTxtVto(iCodigo)
    
End Function
      

Public Function Refrescar_con_mfg_cueros()

    CargarGrilla aplicacion.m_con_mfg_cueros
    
End Function

Public Function SeleccionarFiltros(dFechaDesde As Date, dFechaHasta As Date, dVtoFechaDesde As Date, VtoFechaHasta As Date, iAnoDesde As Integer, iAnoHasta As Integer, iLoteDesde As Integer, iLoteHasta As Integer)
    
    SeleccionarPorFiltros dFechaDesde, dFechaHasta, dVtoFechaDesde, VtoFechaHasta, iAnoDesde, iAnoHasta, iLoteDesde, iLoteHasta, aplicacion.m_con_mfg_cueros
End Function

Public Function EliminarLote(iAnio As Integer, ilote As Integer) As Boolean


    If EliminarUltimoLote(iAnio, ilote) Then
        EliminarLote = True
    Else
        EliminarLote = False
    End If
    
     
End Function

Public Function AnularLote(iNroLote As Integer, iAnio As Integer) As Boolean

    AnularLote = True
    
    If Not AnularSelectLote(iNroLote, iAnio, aplicacion.m_con_mfg_cueros) Then
        AnularLote = False
    End If
End Function

Public Function SeleccionarLote(iNroLote As Integer, iAnio As Integer, _
    lArticulo As Long, dFechaLote As Date, dFechaVto As Date, _
    lProveedor As Long, sRemito As String, sArticulo_descripcion As String, _
    sProveedor_descripcion As String) As Boolean

    SeleccionarLote = True
    
    If Not SeleccionarloteModificar(iNroLote, iAnio, lArticulo, dFechaLote, dFechaVto, lProveedor, sRemito, aplicacion.m_con_mfg_cueros, sArticulo_descripcion, sProveedor_descripcion) Then
        SeleccionarLote = False
    End If
End Function

Public Function SeleccionarLoteVto(iAnio As Integer, iNroLote As Integer, dFechaVto As Date) As Boolean

    SeleccionarLoteVto = True
    
    If Not SeleccionarloteModificarVto(iAnio, iNroLote, dFechaVto) Then
        SeleccionarLoteVto = False
    End If
    
End Function

Public Function ObtenerLetraDeLote() As String

    ObtenerLetraDeLote = ObtenerLetraPorEmpresa(aplicacion.m_con_mfg_ebfonse)
    
End Function

Public Function ForzarItemdata(cmb As ComboBox, valor As Long) As Integer
    Dim i As Integer

    With cmb
        If .ListCount = 0 Then
            ForzarItemdata = 1
            Exit Function
        End If
        For i = 0 To .ListCount - 1
            If .ItemData(i) = valor Then
                .ListIndex = i
                ForzarItemdata = 0
                Exit Function
            End If
        Next i
        ForzarItemdata = 1
    End With
End Function

Public Sub LimpiarControles()
    With frmPrincipal
        .txtCodigo = ""
        .cmbArticulo.ListIndex = -1
        .cmbProveedor.ListIndex = -1
        .txtRemito1 = ""
        .txtRemito2 = ""
        .txtRemito3 = ""
        .txtCodProveedor.Text = ""
        
        '.mskRemito.Text = " -    -        "
'        .txtFechaLote = ""
        '.mskVto = ""
        
    End With
End Sub

Public Function ValidarString(KeyCode As Integer)
    If KeyCode < 65 Or KeyCode > 90 Then
        If KeyCode < 97 Or KeyCode > 122 Then
            If Not KeyCode = 8 Then
                KeyCode = 0
                Beep
            End If
        End If
    End If
End Function

Public Function Validar(KeyCode As Integer)
    If Chr(KeyCode) < "0" Or Chr(KeyCode) > "9" Then
        If Not KeyCode = 8 Then
            KeyCode = 0
            Beep
        End If
    End If
End Function

Public Sub SeleccionText(UnControl As Control)
    UnControl.SelStart = 0
    UnControl.SelLength = Len(UnControl.Text)
End Sub
'Public Function SacarPunto(sNumero As String) As Long
'    Dim sFormarNumero As String
'    Dim i As Integer
'
'    For i = 1 To Len(sNumero)
'        If Not Mid(sNumero, i, 1) = "." Then
'            sFormarNumero = sFormarNumero & Mid(sNumero, i, 1)
'        End If
'    Next
'    SacarPunto = sFormarNumero
'End Function
'
'Public Function PenerPunto(sNumero As String) As String
'    Dim sFormarNumero As String
'    Dim i As Integer
'
'    Replace snumero,".",
'    For i = Len(sNumero) To 1 Step -1
'        If i = 3 Then
'            sFormarNumero = sFormarNumero & "."
'        Else
'            sFormarNumero = sFormarNumero & Mid(sNumero, i, 1)
'        End If
'    Next
'    ponerPunto = sFormarNumero
'End Function

