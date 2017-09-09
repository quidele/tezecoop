VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False


Option Explicit


' Public objDiccionariodeDatos   As CDiccionariodeDatos
Public objDiccionariodeDatos   As Object


'******************************************'
'* Carga caja de combo box                *'
'* Parametros de entrada                  *'
'* 1 _ recordset                          *'
'* 2 _ objeto combo                       *'
'******************************************'

Public Sub CargarCombo _
  (cb_lista As Object, rs_registros As Object, _
   ByRef fld_columna As Object)
   If rs_registros.EOF Then Exit Sub
   cb_lista.Clear
   rs_registros.MoveFirst
   Do Until rs_registros.EOF
     cb_lista.AddItem _
     CStr(rs_registros(fld_columna.Name))
     rs_registros.MoveNext
   Loop
   
End Sub

'*************************************'
'* realiza una busqueda en un combo  *'
'* devolviendo la posición de los    *'
'* registros                         *'
Public Function BuscarCombo(Combo As Object, _
                       Item As String) _
                       As Integer
  Dim nI     As Integer
  nI = 0
  Do Until nI > Combo.ListCount - 1
    If Combo.List(nI) = Item Then
      BuscarCombo = nI
      Exit Function
    End If
    nI = nI + 1
  Loop
  BuscarCombo = -1
End Function


'*************************************'
'* realiza una busqueda en un combo  *'
'* devolviendo la posición de los    *'
'* registros                         *'
Public Function BuscarComboConItemData(Combo As Object, _
                       pItemData As String) _
                       As Integer
  Dim nI     As Integer
  nI = 0
  Do Until nI > Combo.ListCount - 1
    If Combo.ItemData(nI) = pItemData Then
      BuscarComboConItemData = nI
      Exit Function
    End If
    nI = nI + 1
  Loop
  BuscarComboConItemData = -1
End Function


'*************************************'
Public Function CargarListView _
 (rs_registros As Object, _
  lst_lista As Object, img As Integer) As Integer
  Dim i, j             As Integer

  i = 1
  
  'cargar el control listview
  Do Until rs_registros.EOF
      
     For j = 0 To rs_registros.Fields.Count - 2
         If j = 0 Then
            lst_lista.ListItems.Add i, , CStr(rs_registros(lst_lista.ColumnHeaders.Item(j + 1).Tag)), , img
            
         Else
            If Not IsNull(rs_registros(lst_lista.ColumnHeaders.Item(j + 1).Tag)) Then
               lst_lista.ListItems(i).SubItems(j) = _
               CStr(AdaptarNulos(rs_registros(lst_lista.ColumnHeaders.Item(j + 1).Tag), ""))
            End If
         End If
     Next
     rs_registros.MoveNext
     i = i + 1
  Loop
  
End Function
'*******************************************'


'*************************************'
Public Function CargarListView_SG _
 (rs_registros As Object, _
  lst_lista As ListView, img As Integer, pnmTabla As String, Optional posicion As Long) As Integer
  Dim i, j             As Integer
  Dim Valor            As String
  Dim elemList         As ListItem
  
  If posicion = 0 Then
    i = 1
  Else
    i = posicion
  End If
  
  'cargar el control listview
  Do Until rs_registros.EOF
  
    Valor = CStr(AdaptarNulos(rs_registros(lst_lista.ColumnHeaders.Item(1).Tag), ""))
         Valor = ReemplazarPalabra(Valor, "True", "SI")
         Valor = ReemplazarPalabra(Valor, "False", "NO")
         Valor = ReemplazarPalabra(Valor, "Verdadero", "SI")
         Valor = ReemplazarPalabra(Valor, "Falso", "NO")
     On Error Resume Next
     Set elemList = lst_lista.ListItems.Add(i, , Valor, , img)
     If Err Then
        Exit Function
     End If
     On Error GoTo 0
     
     On Error Resume Next
     For j = 2 To lst_lista.ColumnHeaders.Count
         Valor = ""
         If Not IsNull(rs_registros(Trim(lst_lista.ColumnHeaders.Item(j).Tag))) Then
           Valor = CStr(AdaptarNulos(rs_registros(Trim(lst_lista.ColumnHeaders.Item(j).Tag)), ""))
            Valor = ReemplazarPalabra(Valor, "True", "SI")
            Valor = ReemplazarPalabra(Valor, "False", "NO")
            Valor = ReemplazarPalabra(Valor, "Verdadero", "SI")
            Valor = ReemplazarPalabra(Valor, "Falso", "NO")
            elemList.SubItems(j - 1) = Valor
         End If
     Next
     On Error GoTo 0
     rs_registros.MoveNext
     i = i + 1
  Loop
  
End Function
'*******************************************'

Public Function CargarListView_SG_conFORMATO _
 (rs_registros As Object, _
  lst_lista As ListView, img As Integer, pnmTabla As String) As Integer
  Dim i, j             As Integer
  Dim Valor            As String
  Dim elemList         As ListItem
  
  i = 1
  
  'cargar el control listview
  Do Until rs_registros.EOF
    Valor = objDiccionariodeDatos.FormatearCampoValor _
         (pnmTabla, lst_lista.ColumnHeaders.Item(1).Tag, _
         CStr(AdaptarNulos(rs_registros(lst_lista.ColumnHeaders.Item(1).Tag), "")))
         Valor = ReemplazarPalabra(Valor, "True", "SI")
         Valor = ReemplazarPalabra(Valor, "False", "NO")
         
     On Error Resume Next
     Set elemList = lst_lista.ListItems.Add(i, , Valor, , img)
     If Err Then
        Exit Function
     End If
     On Error GoTo 0
     
     For j = 1 To lst_lista.ColumnHeaders.Count - 1
         Valor = ""
         If Not IsNull(rs_registros(Trim(lst_lista.ColumnHeaders.Item(j + 1).Tag))) Then
           Valor = objDiccionariodeDatos.FormatearCampoValor _
            (pnmTabla, lst_lista.ColumnHeaders.Item(j + 1).Tag, _
            CStr(AdaptarNulos(rs_registros(Trim(lst_lista.ColumnHeaders.Item(j + 1).Tag)), "")))
            Valor = ReemplazarPalabra(Valor, "True", "SI")
            Valor = ReemplazarPalabra(Valor, "False", "NO")
            elemList.ListSubItems.Add j, , Valor
         Else
            elemList.ListSubItems.Add j, , ""
         End If
     Next
     rs_registros.MoveNext
     i = i + 1
  Loop
  
End Function
'*******************************************'


'*************************************'
Public Function CargarListView_SG_ColumnaDinamicas _
 (rs_registros As Object, _
  lst_lista As ListView, img As Integer, pnmTabla As String) As Integer
  Dim i, j             As Integer
  Dim Valor            As String
  Dim elemList         As ListItem
  Dim elemObject       As Object

  objDiccionariodeDatos.ObtenerTabla (pnmTabla)
  
  lst_lista.ColumnHeaders.Clear
  
  For i = 0 To rs_registros.Fields.Count - 1
    objDiccionariodeDatos.ObtenerCampo pnmTabla, rs_registros.Fields(i).Name
    Set elemObject = lst_lista.ColumnHeaders.Add(i + 1, , objDiccionariodeDatos.nmCampoExterno, 1500)
    elemObject.Tag = rs_registros.Fields(i).Name
  Next i
  
  
  i = 1
  
  'cargar el control listview
  Do Until rs_registros.EOF
    Valor = objDiccionariodeDatos.FormatearCampoValor _
         (pnmTabla, lst_lista.ColumnHeaders.Item(1).Tag, _
         CStr(AdaptarNulos(rs_registros(lst_lista.ColumnHeaders.Item(1).Tag), "")))
         Valor = ReemplazarPalabra(Valor, "True", "SI")
         Valor = ReemplazarPalabra(Valor, "False", "NO")
         
     Set elemList = lst_lista.ListItems.Add(i, , Valor, , img)
         
     For j = 2 To lst_lista.ColumnHeaders.Count
         Valor = ""
         If Not IsNull(rs_registros(Trim(lst_lista.ColumnHeaders.Item(j).Tag))) Then
           Valor = objDiccionariodeDatos.FormatearCampoValor _
            (pnmTabla, lst_lista.ColumnHeaders.Item(j).Tag, _
            CStr(AdaptarNulos(rs_registros(Trim(lst_lista.ColumnHeaders.Item(j).Tag)), "")))
            Valor = ReemplazarPalabra(Valor, "True", "SI")
            Valor = ReemplazarPalabra(Valor, "False", "NO")
            elemList.SubItems(j - 1) = Valor
         End If
     Next
     rs_registros.MoveNext
     i = i + 1
  Loop
  
End Function
'*******************************************'



Public Sub BuscarListview _
     (lstLista As Object, _
      strDato As String, _
      nColumna As Integer)
  Dim nI                    As Integer
  Dim strAux                As String
  Dim nrCompara             As Integer

  nI = 1
  'cargar el control listview
  Do Until (nI > lstLista.ListItems.Count)
     strAux = lstLista.ListItems(nI).SubItems(nColumna)
     nrCompara = StrComp(strAux, strDato, vbTextCompare)
     If (nrCompara = 0) Then
        lstLista.ListItems(nI).Selected = True
        Exit Sub
     Else
        If nrCompara = -1 Then
            nI = nI + 1
        Else
            lstLista.ListItems(nI).Selected = True
            Exit Sub
        End If
        
     End If
     
  Loop
  lstLista.SetFocus
End Sub

'******************************************'
'*    Carga caja de combo box             *'
'* Parametros de entrada                  *'
'* 1 _ recordset                          *'
'* 2 _ objeto combo                       *'
'* 3 _ columna de recordset data          *'
'* 4 _ columna index data                 *'
'******************************************'
Public Sub CargarComboConData _
  (cb_lista As Object, _
   rs_registros As Object, _
   ByRef fld_columna As Object, _
   fld_dataindex As Object)
   Dim nI                   As Integer
   If rs_registros.EOF Then Exit Sub
   cb_lista.Clear
   rs_registros.MoveFirst
   nI = 0
   Do Until rs_registros.EOF
        cb_lista.AddItem _
        CStr(rs_registros(fld_columna.Name))
        cb_lista.ItemData(nI) = rs_registros(fld_dataindex.Name)
     rs_registros.MoveNext
     nI = nI + 1
   Loop
End Sub


Public Function AdaptarNulos(pDato As Variant, valordefecto As Variant)
    
    
    If IsNull(pDato) Then
        AdaptarNulos = valordefecto
    Else
        AdaptarNulos = CStr(pDato)
    End If

End Function


'*************************************'
Public Function buscarListviewValorColumnaSeleccionada(lst_lista As ListView, pnmColumna As String) As String
  Dim i, j             As Integer
  Dim Valor            As String
  Dim elemList         As ListItem
  
  
  
  For j = 1 To lst_lista.ColumnHeaders.Count
    If j = 1 Then
        If lst_lista.ColumnHeaders(1).Tag = pnmColumna Then
              buscarListviewValorColumnaSeleccionada = lst_lista.SelectedItem.Text
              Exit Function
        End If
    Else
        If lst_lista.ColumnHeaders(j).Tag = pnmColumna Then
              buscarListviewValorColumnaSeleccionada = lst_lista.SelectedItem.ListSubItems(j - 1)
              Exit Function
        End If
    End If
  Next j
  
  buscarListviewValorColumnaSeleccionada = ""
  
End Function
'*******************************************'



'*******************************************'
Public Function buscarListviewValorColumnaIndice(ByRef lst_lista As ListView, pnmColumna As String, indice As Integer) As String
  Dim i, j             As Integer
  Dim Valor            As String
  Dim elemList         As ListItem
  
  For j = 1 To lst_lista.ColumnHeaders.Count
    If j = 1 Then
        If lst_lista.ColumnHeaders(1).Tag = pnmColumna Then
              buscarListviewValorColumnaIndice = lst_lista.ListItems(indice).Text
              Exit Function
        End If
    Else
        If lst_lista.ColumnHeaders(j).Tag = pnmColumna Then
              buscarListviewValorColumnaIndice = lst_lista.ListItems(indice).SubItems(j - 1)
              Exit Function
        End If
    End If
  Next j
  buscarListviewValorColumnaIndice = ""
  
End Function
'*******************************************'



'*******************************************'
Public Function AsignarValorListviewColumnaIndice(ByRef lst_lista As ListView, pnmColumna As String, indice As Integer, pValor As String) As Boolean
  Dim i, j             As Integer
  Dim Valor            As String
  Dim elemList         As ListItem
  
  For j = 1 To lst_lista.ColumnHeaders.Count
    If j = 1 Then
        If lst_lista.ColumnHeaders(1).Tag = pnmColumna Then
              lst_lista.ListItems(indice).Text = pValor
              AsignarValorListviewColumnaIndice = True
              Exit Function
        End If
    Else
        If lst_lista.ColumnHeaders(j).Tag = pnmColumna Then
              lst_lista.ListItems(indice).SubItems(j - 1) = pValor
              AsignarValorListviewColumnaIndice = True
              Exit Function
        End If
    End If
  Next j
  
  AsignarValorListviewColumnaIndice = False
  
End Function
'*******************************************'

Public Function obtenerHoraDTpicker(pdatepicker As DTPicker) As String
Dim hora As String
Dim minutos As String
Dim objNumeros As New CNumerosUtil

    hora = objNumeros.CompletarCerosaIzquierda(pdatepicker.Hour, 2)
    minutos = objNumeros.CompletarCerosaIzquierda(pdatepicker.Minute, 2)
    obtenerHoraDTpicker = hora + ":" + minutos
    
End Function


