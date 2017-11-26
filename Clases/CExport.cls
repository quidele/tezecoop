VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CExport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Dim xlApp()                   As Object ' Excel.Application
Dim xlBook()                  As Object ' Excel.Workbook
Dim xlSheet()                 As Object ' Excel.Worksheet
Dim nmFiles()                 As String
Dim nrCantApp                 As Integer
Public posFilaInicial         As Integer
Public posColumnaInicial      As Integer
Public Ventana                As Object
Dim nrCantwdApp               As Integer
Public objDiccionariodeDatos  As Object
Dim lConProgressBar           As Boolean
Public bCancelar              As Boolean

Property Let ConProgressBar(pValor As Boolean)
    lConProgressBar = True
End Property


Public Function aExcel_FromListView_ConFormato(pnmFile As String, bOpenxls As Boolean, _
pPlantilla As String, pError As String, pLista As ListView, pnmTabla As String) As Boolean
Dim nI                      As Long
Dim nJ                      As Long
Dim Porcentaje              As Double
Dim totalPorcentaje         As Double
Dim resp                    As Byte
Dim cantidadItems           As Long
Dim strDato                 As String


    If pLista.ListItems.Count < 1 Then
        pError = "No hay datos para exportar."
        aExcel_FromListView_ConFormato = True
        Exit Function
    End If



    Me.bCancelar = False
    Screen.MousePointer = vbHourglass
    
    
    
    On Error Resume Next
    FileCopy App.Path + "\" + pPlantilla, pnmFile + ".xls"
    If Err Then
        If Err.Number = 70 Then
            pError = "El archivo ha reemplazar se encuentra abierto, debe cerrarlo."
        Else
            pError = Err.Description
        End If
        aExcel_FromListView_ConFormato = False
        Screen.MousePointer = vbDefault
        Exit Function
    End If
    On Error GoTo 0
    
    nrCantApp = nrCantApp + 1
    ReDim Preserve xlApp(1 To nrCantApp)
    ReDim Preserve xlBook(1 To nrCantApp)
    ReDim Preserve xlSheet(1 To nrCantApp)
    ReDim Preserve nmFiles(1 To nrCantApp)
    nmFiles(nrCantApp) = pnmFile + ".xls"
    
    On Error Resume Next
    Set xlApp(nrCantApp) = CreateObject("excel.application")
    Set xlBook(nrCantApp) = xlApp(nrCantApp).Workbooks.Open(pnmFile + ".xls")
    If Err Then
        aExcel_FromListView_ConFormato = False
        pError = "El archivo" + pnmFile + ".xls" + " no existe."
        Screen.MousePointer = vbDefault
        Exit Function
    End If
    On Error GoTo 0
    Set xlSheet(nrCantApp) = xlBook(nrCantApp).Sheets(1)
    

        
    nJ = Me.posFilaInicial
    nI = Me.posColumnaInicial
    
    
    For nI = 1 To pLista.ColumnHeaders.Count
        If pLista.ColumnHeaders.Item(nI).Width <> 0 Then
            xlSheet(nrCantApp).Cells(nJ, nI).value = pLista.ColumnHeaders.Item(nI).Text
        End If
    Next nI
    
    nJ = nJ + 1
    
    If lConProgressBar Then
        totalPorcentaje = CLng(((pLista.ListItems.Count - Me.posFilaInicial) * 100) / pLista.ListItems.Count)
        totalPorcentaje = IIf(totalPorcentaje = 0, 1, totalPorcentaje)
        Ventana.ProgressBar.Min = 0
        Ventana.ProgressBar.Max = totalPorcentaje
        Ventana.fra_ProgressBar.Visible = True
        Porcentaje = ((nJ - Me.posFilaInicial) * 100) / totalPorcentaje
        On Error Resume Next
        Me.Ventana.RefrescarProgressbar Porcentaje
        On Error GoTo 0
    End If
    
    cantidadItems = 1
    ' Imprime Detalle
    Do Until cantidadItems > pLista.ListItems.Count
    
        strDato = ""
        objDiccionariodeDatos.ObtenerCampo pnmTabla, pLista.ColumnHeaders.Item(1).Tag
        Select Case UCase(objDiccionariodeDatos.tpTipo)
        Case "INTEGER", "BIT", "INT", "LONGINT", "COUNTER", "NUMERIC", "INT_CERO_POSITIVO"
            xlSheet(nrCantApp).Cells(nJ, 1).NumberFormat = "0"
            If pLista.ListItems.Item(cantidadItems).Text = "" Then
                strDato = "0"
            Else
                strDato = pLista.ListItems.Item(cantidadItems).Text
            End If
        Case "FLOAT", "DOUBLE"
            If pLista.ListItems.Item(cantidadItems).Text = "" Then
                strDato = "0"
            Else
                strDato = ReemplazarPalabra(pLista.ListItems.Item(cantidadItems).Text, ".", "!")
            End If
            ' strDato = ReemplazarPalabra(pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text, ".", "!") OJO V4.9.7.07
            strDato = ReemplazarPalabra(strDato, ",", ".")
            strDato = ReemplazarPalabra(strDato, "!", ",")
            xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "#.##"
        Case "DATETIME"
            strDato = pLista.ListItems.Item(cantidadItems).Text
            xlSheet(nrCantApp).Cells(nJ, 1).NumberFormat = "dd/mm/yyyy HH:mm:ss"
        Case "SMALLDATETIME"
            strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
            xlSheet(nrCantApp).Cells(nJ, 1).NumberFormat = "dd/mm/yyyy"
        Case "CHAR", "VARCHAR"
            strDato = pLista.ListItems.Item(cantidadItems).Text
            xlSheet(nrCantApp).Cells(nJ, 1).NumberFormat = "@"
        Case Else
            ' Debug.Assert "Falta el TIPO"
            strDato = pLista.ListItems.Item(cantidadItems).Text
            xlSheet(nrCantApp).Cells(nJ, 1).NumberFormat = "@"
            
        End Select
        
        xlSheet(nrCantApp).Cells(nJ, 1).FormulaR1C1 = strDato
        
        For nI = 1 To pLista.ListItems.Item(cantidadItems).ListSubItems.Count
        
                If pLista.ColumnHeaders.Item(nI + 1).Width <> 0 Then
                                    
                    strDato = ""
                    objDiccionariodeDatos.ObtenerCampo pnmTabla, pLista.ColumnHeaders.Item(nI + 1).Tag
                    Select Case UCase(objDiccionariodeDatos.tpTipo)
                    Case "INTEGER", "BIT", "INT", "LONGINT", "COUNTER", "NUMERIC"
                        xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "0"
                        If pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text = "" Then
                            strDato = "0"
                        Else
                            strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                        End If
                    Case "FLOAT", "DOUBLE"
                        If pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text = "" Then
                            strDato = "0"
                        Else
                            strDato = ReemplazarPalabra(pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text, ".", "!")
                        End If
                        ' strDato = ReemplazarPalabra(pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text, ".", "!")
                        strDato = ReemplazarPalabra(strDato, ",", ".")
                        strDato = ReemplazarPalabra(strDato, "!", ",")
                        xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "#.##"
                    Case "DATETIME"
                        strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                        xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "dd/mm/yyyy HH:mm:ss"
                    Case "SMALLDATETIME"
                        strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                        xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "dd/mm/yyyy"
                    Case "CHAR", "VARCHAR", "NRO_COMPROBANTE"
                        strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                        xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "@"
                    Case Else
                        Debug.Assert "Falta el TIPO"
                        strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                        xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "@"
                    End Select
                    ' Validar que si es el formato de DD-MM-YYYY Setear el formato
                    ' xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "dd-mm-yyyy"
                    ' xlSheet(nrCantApp).Cells(nJ, nI + 1).Value = _
                    ' pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                    xlSheet(nrCantApp).Cells(nJ, nI + 1).FormulaR1C1 = strDato
                    
                    
                End If
                
                
        Next
        cantidadItems = cantidadItems + 1
        nJ = nJ + 1
            
        If Me.bCancelar Then
            xlApp(nrCantApp).DisplayAlerts = False
            xlBook(nrCantApp).Close False, nmFiles(nrCantApp)
            xlApp(nrCantApp).Quit
            pError = "La accion ha sido cancelada por el usuario."
            Exit Function
        End If
        
        If lConProgressBar Then
            Porcentaje = CLng(((CLng(nJ) - Me.posFilaInicial) * 100) / pLista.ListItems.Count)
            On Error Resume Next
            Ventana.RefrescarProgressbar CLng(Porcentaje)
            On Error GoTo 0
        End If
    Loop
    
    xlSheet(nrCantApp).Cells(1, 1).Activate
    If bOpenxls Then
        xlApp(nrCantApp).DisplayAlerts = True
        xlApp(nrCantApp).Visible = bOpenxls
    Else
        xlApp(nrCantApp).DisplayAlerts = False
        xlSheet(nrCantApp).SaveAs nmFiles(nrCantApp)
        xlBook(nrCantApp).Close True, nmFiles(nrCantApp)
        xlApp(nrCantApp).Quit
    End If
    
    If lConProgressBar Then
        Ventana.fra_ProgressBar.Visible = False
        Ventana.Visible = True
    End If
    
    
    Screen.MousePointer = vbDefault
    lConProgressBar = False
    aExcel_FromListView_ConFormato = True
    
End Function


Public Function aExcel_FromListView_ConFormato2(pnmFile As String, bOpenxls As Boolean, _
pPlantilla As String, pError As String, pLista As ListView, pnmTabla As String) As Boolean
Dim nI                      As Long
Dim nJ                      As Long
Dim Porcentaje              As Double
Dim totalPorcentaje         As Double
Dim resp                    As Byte
Dim cantidadItems           As Long
Dim strDato                 As String


    If pLista.ListItems.Count < 1 Then
        pError = "No hay datos para exportar."
        aExcel_FromListView_ConFormato2 = True
        Exit Function
    End If



    Me.bCancelar = False
    Screen.MousePointer = vbHourglass
    
    
    
    On Error Resume Next
    FileCopy App.Path + "\" + pPlantilla, pnmFile + ".xls"
    If Err Then
        If Err.Number = 70 Then
            pError = "El archivo ha reemplazar se encuentra abierto, debe cerrarlo."
        Else
            pError = Err.Description
        End If
        aExcel_FromListView_ConFormato2 = False
        Screen.MousePointer = vbDefault
        Exit Function
    End If
    On Error GoTo 0
    
    nrCantApp = nrCantApp + 1
    ReDim Preserve xlApp(1 To nrCantApp)
    ReDim Preserve xlBook(1 To nrCantApp)
    ReDim Preserve xlSheet(1 To nrCantApp)
    ReDim Preserve nmFiles(1 To nrCantApp)
    nmFiles(nrCantApp) = pnmFile + ".xls"
    
    On Error Resume Next
    Set xlApp(nrCantApp) = CreateObject("excel.application")
    Set xlBook(nrCantApp) = xlApp(nrCantApp).Workbooks.Open(pnmFile + ".xls")
    If Err Then
        aExcel_FromListView_ConFormato2 = False
        pError = "El archivo" + pnmFile + ".xls" + " no existe."
        Screen.MousePointer = vbDefault
        Exit Function
    End If
    On Error GoTo 0
    Set xlSheet(nrCantApp) = xlBook(nrCantApp).Sheets(1)
    

        
    nJ = Me.posFilaInicial
    nI = Me.posColumnaInicial
    
    
    For nI = 1 To pLista.ColumnHeaders.Count
        xlSheet(nrCantApp).Cells(nJ, nI).value = pLista.ColumnHeaders.Item(nI).Text
    Next nI
    
    nJ = nJ + 1
    
    If lConProgressBar Then
        totalPorcentaje = CLng(((pLista.ListItems.Count - Me.posFilaInicial) * 100) / pLista.ListItems.Count)
        totalPorcentaje = IIf(totalPorcentaje = 0, 1, totalPorcentaje)
        Ventana.ProgressBar.Min = 0
        Ventana.ProgressBar.Max = totalPorcentaje
        Ventana.fra_ProgressBar.Visible = True
        Porcentaje = ((nJ - Me.posFilaInicial) * 100) / totalPorcentaje
        On Error Resume Next
        Me.Ventana.RefrescarProgressbar Porcentaje
        On Error GoTo 0
    End If
    
    cantidadItems = 1
    ' Imprime Detalle
    Do Until cantidadItems > pLista.ListItems.Count
        nI = 1
        strDato = ""
        objDiccionariodeDatos.ObtenerCampo pnmTabla, pLista.ColumnHeaders.Item(1).Tag
        Select Case UCase(objDiccionariodeDatos.tpTipo)
        Case "INTEGER", "BIT", "INT", "LONGINT", "COUNTER", "NUMERIC", "INT_CERO_POSITIVO"
            xlSheet(nrCantApp).Cells(nJ, 1).NumberFormat = "0"
            strDato = pLista.ListItems.Item(cantidadItems).Text
        Case "FLOAT", "DOUBLE"
            strDato = ReemplazarPalabra(pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text, ".", "!")
            strDato = ReemplazarPalabra(strDato, ",", ".")
            strDato = ReemplazarPalabra(strDato, "!", ",")
            xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "#.##"
        Case "DATETIME"
            strDato = pLista.ListItems.Item(cantidadItems).Text
            xlSheet(nrCantApp).Cells(nJ, 1).NumberFormat = "dd/mm/yyyy HH:mm:ss"
        Case "SMALLDATETIME"
            strDato = pLista.ListItems.Item(cantidadItems).Text
            xlSheet(nrCantApp).Cells(nJ, 1).NumberFormat = "dd/mm/yyyy"
        Case "CHAR", "VARCHAR"
            strDato = pLista.ListItems.Item(cantidadItems).Text
            xlSheet(nrCantApp).Cells(nJ, 1).NumberFormat = "@"
        Case Else
            Debug.Assert "Falta el TIPO"
            strDato = pLista.ListItems.Item(cantidadItems).Text
            xlSheet(nrCantApp).Cells(nJ, 1).NumberFormat = "@"
            
        End Select
        
        xlSheet(nrCantApp).Cells(nJ, 1).FormulaR1C1 = strDato
        
        For nI = 1 To pLista.ListItems.Item(cantidadItems).ListSubItems.Count
        
                strDato = ""
                objDiccionariodeDatos.ObtenerCampo pnmTabla, pLista.ColumnHeaders.Item(nI + 1).Tag
                Select Case UCase(objDiccionariodeDatos.tpTipo)
                Case "INTEGER", "BIT", "INT", "LONGINT", "COUNTER", "NUMERIC"
                    xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "0"
                    strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                Case "FLOAT", "DOUBLE"
                    strDato = ReemplazarPalabra(pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text, ".", "!")
                    strDato = ReemplazarPalabra(strDato, ",", ".")
                    strDato = ReemplazarPalabra(strDato, "!", ",")
                    xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "#.##"
                Case "DATETIME"
                    strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                    xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "dd/mm/yyyy HH:mm:ss"
                Case "SMALLDATETIME"
                    strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                    xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "dd/mm/yyyy"
                Case "CHAR", "VARCHAR", "NRO_COMPROBANTE"
                    strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                    xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "@"
                Case Else
                    Debug.Assert "Falta el TIPO"
                    strDato = pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                    xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "@"
                End Select
                ' Validar que si es el formato de DD-MM-YYYY Setear el formato
                ' xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "dd-mm-yyyy"
                ' xlSheet(nrCantApp).Cells(nJ, nI + 1).Value = _
                ' pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
                xlSheet(nrCantApp).Cells(nJ, nI + 1).FormulaR1C1 = strDato
                
        Next
        cantidadItems = cantidadItems + 1
        nJ = nJ + 1
            
        If Me.bCancelar Then
            xlApp(nrCantApp).DisplayAlerts = False
            xlBook(nrCantApp).Close False, nmFiles(nrCantApp)
            xlApp(nrCantApp).Quit
            pError = "La accion ha sido cancelada por el usuario."
            Exit Function
        End If
        
        If lConProgressBar Then
            Porcentaje = CLng(((CLng(nJ) - Me.posFilaInicial) * 100) / pLista.ListItems.Count)
            On Error Resume Next
            Ventana.RefrescarProgressbar CLng(Porcentaje)
            On Error GoTo 0
        End If
    Loop
    
    xlSheet(nrCantApp).Cells(1, 1).Activate
    If bOpenxls Then
        xlApp(nrCantApp).DisplayAlerts = True
        xlApp(nrCantApp).Visible = bOpenxls
    Else
        xlApp(nrCantApp).DisplayAlerts = False
        xlSheet(nrCantApp).SaveAs nmFiles(nrCantApp)
        xlBook(nrCantApp).Close True, nmFiles(nrCantApp)
        xlApp(nrCantApp).Quit
    End If
    
    If lConProgressBar Then
        Ventana.fra_ProgressBar.Visible = False
        Ventana.Visible = True
    End If
    
    
    Screen.MousePointer = vbDefault
    lConProgressBar = False
    aExcel_FromListView_ConFormato2 = True
    
End Function

Public Function aExcel_FromListView(pnmFile As String, bOpenxls As Boolean, _
pPlantilla As String, pError As String, pLista As ListView) As Boolean
Dim nI                      As Long
Dim nJ                      As Long
Dim Porcentaje              As Double
Dim totalPorcentaje         As Double
Dim resp                    As Byte
Dim cantidadItems           As Long

    Screen.MousePointer = vbHourglass

    Me.bCancelar = False

    On Error Resume Next
    FileCopy App.Path + "\" + pPlantilla, pnmFile + ".xls"
    If Err Then
        If Err.Number = 70 Then
            pError = "El archivo ha reemplazar se encuentra abierto, debe cerrarlo."
        Else
            pError = Err.Description
        End If
        aExcel_FromListView = False
        Screen.MousePointer = vbHourglass
        Exit Function
    End If
    On Error GoTo 0
    
    nrCantApp = nrCantApp + 1
    ReDim Preserve xlApp(1 To nrCantApp)
    ReDim Preserve xlBook(1 To nrCantApp)
    ReDim Preserve xlSheet(1 To nrCantApp)
    ReDim Preserve nmFiles(1 To nrCantApp)
    nmFiles(nrCantApp) = pnmFile + ".xls"
    
    On Error Resume Next
    Set xlApp(nrCantApp) = CreateObject("excel.application")
    If Err Then
        aExcel_FromListView = False
        pError = "La version de excel no es compatible."
        Screen.MousePointer = vbHourglass
        Exit Function
    End If
    
    Set xlBook(nrCantApp) = xlApp(nrCantApp).Workbooks.Open(pnmFile + ".xls")
    If Err Then
        aExcel_FromListView = False
        pError = "El archivo" + pnmFile + ".xls" + " no existe."
        Screen.MousePointer = vbHourglass
        Exit Function
    End If
    On Error GoTo 0
    
    Set xlSheet(nrCantApp) = xlBook(nrCantApp).Sheets(1)
    
    nJ = Me.posFilaInicial
    nI = Me.posColumnaInicial
    
    
    For nI = 1 To pLista.ColumnHeaders.Count
    
        xlSheet(nrCantApp).Cells(nJ, nI).value = pLista.ColumnHeaders.Item(nI).Text
        
    Next nI
    
    nJ = nJ + 1
    If lConProgressBar Then
        totalPorcentaje = CLng(((pLista.ListItems.Count - Me.posFilaInicial) * 100) / pLista.ListItems.Count)
        totalPorcentaje = IIf(totalPorcentaje = 0, 1, totalPorcentaje)
        Ventana.ProgressBar.Min = 0
        Ventana.ProgressBar.Max = totalPorcentaje
        Ventana.fra_ProgressBar.Visible = True
        Porcentaje = ((nJ - Me.posFilaInicial) * 100) / totalPorcentaje
        On Error Resume Next
        Me.Ventana.RefrescarProgressbar Porcentaje
        On Error GoTo 0
    End If
    
    cantidadItems = 1
    ' Imprime Detalle
    Do Until cantidadItems > pLista.ListItems.Count
    
        xlSheet(nrCantApp).Cells(nJ, 1).value = _
        pLista.ListItems.Item(cantidadItems).Text
        
        For nI = 1 To pLista.ListItems.Item(cantidadItems).ListSubItems.Count
                ' Validar que si es el formato de DD-MM-YYYY Setear el formato
                ' xlSheet(nrCantApp).Cells(nJ, nI + 1).NumberFormat = "dd-mm-yyyy"
                xlSheet(nrCantApp).Cells(nJ, nI + 1).value = _
                pLista.ListItems.Item(cantidadItems).ListSubItems(nI).Text
        Next
        cantidadItems = cantidadItems + 1
        nJ = nJ + 1
        
        If Me.bCancelar Then
            xlApp(nrCantApp).DisplayAlerts = False
            xlBook(nrCantApp).Close False, nmFiles(nrCantApp)
            xlApp(nrCantApp).Quit
            pError = "La accion ha sido cancelada por el usuario."
            Exit Function
        End If
        
        If lConProgressBar Then
            Porcentaje = CLng(((CLng(nJ) - Me.posFilaInicial) * 100) / pLista.ListItems.Count)
            On Error Resume Next
            Ventana.RefrescarProgressbar CLng(Porcentaje)
            On Error GoTo 0
        End If
    Loop
    
    xlSheet(nrCantApp).Cells(1, 1).Activate
    If bOpenxls Then
        xlApp(nrCantApp).DisplayAlerts = True
        xlApp(nrCantApp).Visible = bOpenxls
    Else
        xlApp(nrCantApp).DisplayAlerts = False
        xlSheet(nrCantApp).SaveAs nmFiles(nrCantApp)
        xlBook(nrCantApp).Close True, nmFiles(nrCantApp)
        xlApp(nrCantApp).Quit
    End If
    
    If lConProgressBar Then
        Ventana.fra_ProgressBar.Visible = False
        Ventana.Visible = True
    End If
    Screen.MousePointer = vbDefault
    lConProgressBar = False
    
    aExcel_FromListView = True
    
End Function


Public Function aExcel(prs As Object _
, pnmFile As String, bOpenxls As Boolean, _
pPlantilla As String, pError As String) As Boolean
Dim nI                      As Long
Dim nJ                      As Long
Dim Porcentaje              As Double
Dim totalPorcentaje         As Double
Dim resp                    As Byte


    prs.MoveFirst
    If prs.EOF Then
        pError = "No hay datos para el reporte"
        aExcel = False
        Exit Function
    End If
    
    
    Me.bCancelar = False
    
    On Error Resume Next
    FileCopy App.Path + "\" + pPlantilla, pnmFile + ".xls"
    If Err Then
        If Err.Number = 70 Then
             pError = "El archivo ha reemplazar se encuentra abierto, debe cerrarlo."
         Else
             pError = Err.Description
         End If
         aExcel = False
        Exit Function
    End If
    On Error GoTo 0
    
    nrCantApp = nrCantApp + 1
    ReDim Preserve xlApp(1 To nrCantApp)
    ReDim Preserve xlBook(1 To nrCantApp)
    ReDim Preserve xlSheet(1 To nrCantApp)
    ReDim Preserve nmFiles(1 To nrCantApp)
    nmFiles(nrCantApp) = pnmFile + ".xls"
    
    On Error Resume Next
    Set xlApp(nrCantApp) = CreateObject("excel.application")
    If Err Then
        aExcel = False
        pError = "No esta instalada la aplicacion Microsoft Excel"
        Exit Function
    End If
    On Error GoTo 0
    
    
    On Error Resume Next
    Set xlBook(nrCantApp) = xlApp(nrCantApp).Workbooks.Open(pnmFile + ".xls")
    If Err Then
        aExcel = False
        pError = "El archivo" + pnmFile + ".xls" + " no existe."
        Exit Function
    End If
    On Error GoTo 0
    
    Set xlSheet(nrCantApp) = xlBook(nrCantApp).Sheets(1)
    
    nJ = Me.posFilaInicial
    nI = Me.posColumnaInicial
    For nI = 0 To prs.Fields.Count - 1
        xlSheet(nrCantApp).Cells(nJ, nI + 1).value = prs.Fields(nI).Name
    Next nI
    nJ = nJ + 1
    totalPorcentaje = prs.RecordCount
    Porcentaje = ((nJ - Me.posFilaInicial) * 100) / totalPorcentaje
    RefrescarVentana CDbl(Porcentaje)
    Do Until prs.EOF
        For nI = 0 To prs.Fields.Count - 1
                xlSheet(nrCantApp).Cells(nJ, nI + 1).value = prs(nI).value
        Next nI
        prs.MoveNext
        nJ = nJ + 1
        Porcentaje = (nJ - CLng(Me.posFilaInicial)) * 100
        Porcentaje = Porcentaje / totalPorcentaje
        RefrescarVentana CDbl(Porcentaje)
        DoEvents
        
        If Me.bCancelar Then
            xlApp(nrCantApp).DisplayAlerts = False
            xlBook(nrCantApp).Close False, nmFiles(nrCantApp)
            xlApp(nrCantApp).Quit
            pError = "La accion ha sido cancelada por el usuario."
            Exit Function
        End If
    
    Loop
    xlSheet(nrCantApp).Cells(1, 1).Activate
    If bOpenxls Then
        xlApp(nrCantApp).DisplayAlerts = True
        xlApp(nrCantApp).Visible = bOpenxls
    Else
        xlApp(nrCantApp).DisplayAlerts = False
        xlSheet(nrCantApp).SaveAs nmFiles(nrCantApp)
        xlBook(nrCantApp).Close True, nmFiles(nrCantApp)
        xlApp(nrCantApp).Quit
    End If
    aExcel = True
    
    Set xlSheet(nrCantApp) = Nothing
    Set xlBook(nrCantApp) = Nothing
    Set xlApp(nrCantApp) = Nothing
    
End Function

Private Sub RefrescarVentana(pValor As Double)
    On Error Resume Next
    Me.Ventana.RefrescarProgressbar (pValor)
    Me.Ventana.Refresh
    On Error GoTo 0
End Sub

 
Private Sub Class_Initialize()
    nrCantApp = 0
    Me.posColumnaInicial = 1
    Me.posFilaInicial = 1
    
End Sub


Private Sub Class_Terminate()
Dim nI As Integer
    
    For nI = 1 To nrCantApp
        On Error Resume Next
        xlSheet(nI).SaveAs nmFiles(nI)
        xlBook(nI).Close True, nmFiles(nI)
        xlApp(nI).Quit
        On Error GoTo 0
        Set xlSheet(nI) = Nothing
        Set xlBook(nI) = Nothing
        Set xlApp(nI) = Nothing
    Next nI
    

End Sub
