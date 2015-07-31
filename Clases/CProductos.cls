VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CProductos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public cdProducto         As String
Public dsProducto         As String
Public vlPrecioPeaje      As String
Public vlPrecioViaje      As String
Public nmCampoExterno     As String
Public vlPorcentaje       As String
Public tpOperacion        As String
Public vlKilometros       As String
Public tpDestino          As String
Public cdComision         As String
    

Private Type rcProducto
    cdProducto         As String
    dsProducto         As String
    vlPrecioPeaje      As String
    vlPrecioViaje      As String
    nmCampoExterno     As String
    vlPorcentaje       As String
    tpOperacion        As String
    vlKilometros       As String
    tpDestino          As String
    nrNivel            As Integer
    cdComision         As String
End Type


Dim lmProductos()     As rcProducto
 
Public Function buscarTodoslosProductos() As Boolean
Dim strNombreCompleto As String
Dim vlPorcentaje      As Single
Dim vlPrecioViaje     As Single
Dim vlTotalGeneral    As Single
Dim strSQL            As String

        buscarTodoslosProductos = False
        strSQL = " sco_TB_Productos_v4_1 "

        If Not objbasededatos.ExecStoredProcedures(strSQL) Then Exit Function
        CargarMatrizdeProductos objbasededatos.rs_resultados
        buscarTodoslosProductos = True
        
End Function


Public Function InsertarNuevoItemEnlaMatrizProductos _
(pcdProducto As String, pdsProducto As String, _
 pvlPrecioPeaje As String, pvlPrecioViaje As String, _
 pvlPorcentaje As String, ptpOperacion As String, pvlKilometros As String) As Boolean
 
    ReDim Preserve lmProductos(LBound(lmProductos) To UBound(lmProductos) + 1)
    lmProductos(UBound(lmProductos) - 1).cdProducto = pcdProducto
    lmProductos(UBound(lmProductos) - 1).dsProducto = pdsProducto
    lmProductos(UBound(lmProductos) - 1).vlPrecioPeaje = pvlPrecioPeaje
    lmProductos(UBound(lmProductos) - 1).vlPrecioViaje = pvlPrecioViaje
    lmProductos(UBound(lmProductos) - 1).vlPorcentaje = pvlPorcentaje
    lmProductos(UBound(lmProductos) - 1).tpOperacion = ptpOperacion
    lmProductos(UBound(lmProductos) - 1).vlKilometros = pvlKilometros
    
    InsertarNuevoItemEnlaMatrizProductos = True
    
End Function

Public Function CargarMatrizdeProductos(prs As Object) As Boolean
     
    ReDim lmProductos(0 To 0)
    Do Until prs.EOF
        DoEvents
        ReDim Preserve lmProductos(LBound(lmProductos) To UBound(lmProductos) + 1)
        lmProductos(UBound(lmProductos) - 1).cdProducto = AdaptarNulos(prs("cdProducto"), "")
        lmProductos(UBound(lmProductos) - 1).dsProducto = AdaptarNulos(prs("dsProducto"), "")
        lmProductos(UBound(lmProductos) - 1).vlPrecioPeaje = AdaptarNulos(prs("vlPrecioPeaje"), "")
        lmProductos(UBound(lmProductos) - 1).vlPrecioViaje = AdaptarNulos(prs("vlPrecioViaje"), "")
        lmProductos(UBound(lmProductos) - 1).vlPorcentaje = AdaptarNulos(prs("vlPorcentaje"), "")
        lmProductos(UBound(lmProductos) - 1).tpOperacion = AdaptarNulos(prs("tpOperacion"), "")
        lmProductos(UBound(lmProductos) - 1).vlKilometros = AdaptarNulos(prs("vlKilometros"), "")
        lmProductos(UBound(lmProductos) - 1).tpDestino = AdaptarNulos(prs("tpDestino"), "")
        lmProductos(UBound(lmProductos) - 1).cdComision = AdaptarNulos(prs("cdComision"), "")
        
        
        prs.MoveNext
    Loop
    ' Guardar el recordset en memoria local
    prs.Close
    CargarMatrizdeProductos = True
    
End Function



Public Function buscarenlaMatrizdeProductos(pDato As String, _
                                            lista As ListView) As Boolean
Dim nI               As Integer
Dim elemList         As ListItem
Dim nPos             As Integer
Dim nTamanio         As Integer
Dim strToken         As String
Dim bencontrado      As Boolean
Dim lmProductosLocalidades()     As rcProducto
Dim lmProductosPartidos()     As rcProducto


    ReDim lmProductosLocalidades(0 To 0)
    ReDim lmProductosPartidos(0 To 0)
    
    
    nTamanio = Len(pDato)
    buscarenlaMatrizdeProductos = False
    lista.ListItems.Clear
    For nI = LBound(lmProductos) To UBound(lmProductos)
        bencontrado = False
        If lmProductos(nI).dsProducto <> "" Then
            strToken = Left(lmProductos(nI).dsProducto, nTamanio)
            ' lmProductos(nI).dsProducto
            nPos = InStr(1, strToken, pDato, vbTextCompare)
            If nPos > 0 Then

                ReDim Preserve lmProductosLocalidades(LBound(lmProductosLocalidades) To UBound(lmProductosLocalidades) + 1)
                
                lmProductosLocalidades(UBound(lmProductosLocalidades) - 1).cdProducto = lmProductos(nI).cdProducto
                lmProductosLocalidades(UBound(lmProductosLocalidades) - 1).dsProducto = lmProductos(nI).dsProducto
                lmProductosLocalidades(UBound(lmProductosLocalidades) - 1).vlPrecioPeaje = lmProductos(nI).vlPrecioPeaje
                lmProductosLocalidades(UBound(lmProductosLocalidades) - 1).vlPrecioViaje = lmProductos(nI).vlPrecioViaje
                lmProductosLocalidades(UBound(lmProductosLocalidades) - 1).vlPorcentaje = lmProductos(nI).vlPorcentaje
                lmProductosLocalidades(UBound(lmProductosLocalidades) - 1).tpOperacion = lmProductos(nI).tpOperacion
                lmProductosLocalidades(UBound(lmProductosLocalidades) - 1).vlKilometros = lmProductos(nI).vlKilometros
                lmProductosLocalidades(UBound(lmProductosLocalidades) - 1).nrNivel = 1
                ' version 4.1
                lmProductosLocalidades(UBound(lmProductosLocalidades) - 1).cdComision = lmProductos(nI).cdComision
                
              
            
    
               buscarenlaMatrizdeProductos = True
               bencontrado = True
            End If
            
            ' Agregado en la version 3.5 - buscamos por el partido
             If Not bencontrado Then
                   nPos = InStr(1, lmProductos(nI).dsProducto, "-", vbTextCompare)
                   If Not nPos = 0 Then
                     nPos = InStr(nPos, lmProductos(nI).dsProducto, pDato, vbTextCompare)
                     If nPos > 0 Then
                     
                        ReDim Preserve lmProductosPartidos(LBound(lmProductosPartidos) To UBound(lmProductosPartidos) + 1)
                        
                        lmProductosPartidos(UBound(lmProductosPartidos) - 1).cdProducto = lmProductos(nI).cdProducto
                        lmProductosPartidos(UBound(lmProductosPartidos) - 1).dsProducto = lmProductos(nI).dsProducto
                        lmProductosPartidos(UBound(lmProductosPartidos) - 1).vlPrecioPeaje = lmProductos(nI).vlPrecioPeaje
                        lmProductosPartidos(UBound(lmProductosPartidos) - 1).vlPrecioViaje = lmProductos(nI).vlPrecioViaje
                        lmProductosPartidos(UBound(lmProductosPartidos) - 1).vlPorcentaje = lmProductos(nI).vlPorcentaje
                        lmProductosPartidos(UBound(lmProductosPartidos) - 1).tpOperacion = lmProductos(nI).tpOperacion
                        lmProductosPartidos(UBound(lmProductosPartidos) - 1).vlKilometros = lmProductos(nI).vlKilometros
                        lmProductosPartidos(UBound(lmProductosPartidos) - 1).nrNivel = 2
                        lmProductosPartidos(UBound(lmProductosPartidos) - 1).cdComision = lmProductos(nI).cdComision
                        buscarenlaMatrizdeProductos = True
                        
                     End If
                   End If
             End If
            
       End If
    Next nI
    
    If Not buscarenlaMatrizdeProductos Then Exit Function
    
    Dim objArrayUtils As New CArrayUtils
    

    
    For nI = LBound(lmProductosLocalidades) To UBound(lmProductosLocalidades)
        If lmProductosLocalidades(nI).dsProducto <> "" Then
            Set elemList = lista.ListItems.Add(, , lmProductosLocalidades(nI).cdProducto)
            elemList.SubItems(1) = lmProductosLocalidades(nI).dsProducto
            elemList.SubItems(2) = lmProductosLocalidades(nI).tpOperacion
            elemList.SubItems(3) = lmProductosLocalidades(nI).vlPorcentaje
            elemList.SubItems(4) = lmProductosLocalidades(nI).vlPrecioPeaje
            elemList.SubItems(5) = lmProductosLocalidades(nI).vlKilometros
            elemList.SubItems(6) = lmProductosLocalidades(nI).vlPrecioViaje
            elemList.SubItems(7) = lmProductosLocalidades(nI).cdComision
        End If
    Next nI
    

    For nI = LBound(lmProductosPartidos) To UBound(lmProductosPartidos)
        If lmProductosPartidos(nI).dsProducto <> "" Then
            Set elemList = lista.ListItems.Add(, , lmProductosPartidos(nI).cdProducto)
            elemList.SubItems(1) = lmProductosPartidos(nI).dsProducto
            elemList.SubItems(2) = lmProductosPartidos(nI).tpOperacion
            elemList.SubItems(3) = lmProductosPartidos(nI).vlPorcentaje
            elemList.SubItems(4) = lmProductosPartidos(nI).vlPrecioPeaje
            elemList.SubItems(5) = lmProductosPartidos(nI).vlKilometros
            elemList.SubItems(6) = lmProductosPartidos(nI).vlPrecioViaje
            elemList.SubItems(7) = lmProductosPartidos(nI).cdComision
        End If
    Next nI
        

    
End Function

Public Function buscarenlaMatrizdeProductoslike(pDato As String, _
                                            lista As ListView) As Boolean
Dim nI               As Integer
Dim elemList         As ListItem
Dim nPos             As Integer

    buscarenlaMatrizdeProductoslike = False
    lista.ListItems.Clear
    For nI = LBound(lmProductos) To UBound(lmProductos)
        If lmProductos(nI).dsProducto <> "" Then
            nPos = InStr(1, lmProductos(nI).dsProducto, pDato, vbTextCompare)
            If nPos > 0 Then
               Set elemList = lista.ListItems.Add(, , lmProductos(nI).cdProducto)
               elemList.SubItems(1) = lmProductos(nI).dsProducto
               elemList.SubItems(2) = lmProductos(nI).tpOperacion
               elemList.SubItems(3) = lmProductos(nI).vlPorcentaje
               elemList.SubItems(4) = lmProductos(nI).vlPrecioPeaje
               elemList.SubItems(5) = lmProductos(nI).vlKilometros
               elemList.SubItems(6) = lmProductos(nI).vlPrecioViaje
              elemList.SubItems(7) = lmProductos(nI).cdComision
               buscarenlaMatrizdeProductoslike = True
            End If
       End If
    Next nI
    
End Function

Public Function CargarTodalaMatrizdeProductos _
                                (lista As ListView) As Boolean
Dim nI As Integer
Dim elemList         As ListItem
    
    lista.ListItems.Clear
    For nI = LBound(lmProductos) To UBound(lmProductos)
           If lmProductos(nI).dsProducto <> "" Then
                Set elemList = lista.ListItems.Add(, , lmProductos(nI).cdProducto)
                elemList.SubItems(1) = lmProductos(nI).dsProducto
                elemList.SubItems(2) = lmProductos(nI).tpOperacion
                elemList.SubItems(3) = lmProductos(nI).vlPorcentaje
                elemList.SubItems(4) = lmProductos(nI).vlPrecioPeaje
                elemList.SubItems(5) = lmProductos(nI).vlKilometros
                elemList.SubItems(6) = lmProductos(nI).vlPrecioViaje
                elemList.SubItems(7) = lmProductos(nI).cdComision
           End If
    Next nI
    
End Function


Public Function esValorMontodelViajeunDestinoPredefinido _
                        (vlMontoViajeIngresado As Single) As Boolean

Dim vlPrecioViaje As Single
Dim nI             As Long

    If vlMontoViajeIngresado = 0 Then
        esValorMontodelViajeunDestinoPredefinido = False
        Exit Function
    End If

    esValorMontodelViajeunDestinoPredefinido = False
    
    For nI = LBound(lmProductos) To UBound(lmProductos)
        If lmProductos(nI).vlPrecioPeaje = "" Then
            vlPrecioViaje = 0
        Else
            vlPrecioViaje = CSng(lmProductos(nI).vlPrecioViaje)
        End If
        
        'If (lmProductos(nI).tpDestino = "Retorno"
        If lmProductos(nI).tpDestino = "Centro" And _
           vlPrecioViaje = vlMontoViajeIngresado Then
                Me.cdProducto = lmProductos(nI).cdProducto
                Me.dsProducto = lmProductos(nI).dsProducto
                Me.vlPrecioPeaje = lmProductos(nI).vlPrecioPeaje
                Me.vlPrecioViaje = lmProductos(nI).vlPrecioViaje
                Me.nmCampoExterno = lmProductos(nI).nmCampoExterno
                Me.vlPorcentaje = lmProductos(nI).vlPorcentaje
                Me.tpOperacion = lmProductos(nI).tpOperacion
                Me.vlKilometros = lmProductos(nI).vlKilometros
                Me.tpDestino = lmProductos(nI).tpDestino
                Me.cdComision = lmProductos(nI).cdComision
                
               esValorMontodelViajeunDestinoPredefinido = True
               Exit Function
        End If
        
    Next nI
    
End Function



' Simple binary search. Be sure array is sorted first.
' Returns index of first match, or -1 if no match found
Public Function BinarySearch(pvarArray As Variant, pvarFind As Variant) As Long
    Dim lngFirst As Long
    Dim lngMid As Long
    Dim lngLast As Long

    BinarySearch = -1
    lngMid = -1
    lngFirst = LBound(pvarArray)
    lngLast = UBound(pvarArray)
    Do While lngFirst <= lngLast
        lngMid = (lngFirst + lngLast) \ 2
        If pvarArray(lngMid) > pvarFind Then
            lngLast = lngMid - 1
        ElseIf pvarArray(lngMid) < pvarFind Then
            lngFirst = lngMid + 1
        Else
            Exit Do
        End If
    Loop
    ' Make sure this is the first match in array
    Do While lngMid > lngFirst
        If pvarArray(lngMid - 1) <> pvarFind Then Exit Do
        lngMid = lngMid - 1
    Loop
    ' Set return value if match was found
    If pvarArray(lngMid) = pvarFind Then BinarySearch = lngMid
End Function


