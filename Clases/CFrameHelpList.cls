VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CFrameHelpList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit




Const cmdPageFist = 1
Const cmdPagePreviuos = 2
Const cmdPageNext = 3
Const cmdPageLast = 4


Const SEPARADOR = 10
Dim lqtRowsbyPage  As Long
Dim lControl       As Control
Dim lCodigo        As String
Dim lDescrip       As String
Dim lframe         As frame
Dim lVentana       As Object
Dim ltxtPage       As Object
Dim lNextControl   As Control
Dim lPreviousControl   As Control
Dim lnmCampo       As String
Dim llista         As ListView
Public lObjTablasIO        As CTablasIOHL
Dim lstrTextOLD    As String
Dim ltpOperador    As String
Dim lname          As String
Dim lobjControl As New CControl
Public Event onSeleccionOK(pTag As String)



Public Property Set lista(pValor As ListView)
    Set llista = pValor
End Property

Public Property Get nmCampo() As String
     nmCampo = lnmCampo
End Property

Public Property Let nmCampo(pValor As String)
    lnmCampo = pValor
End Property


Public Property Let tpOperador(pValor)
    ltpOperador = pValor
End Property

Property Set txtpage(pValor As Object)
    Set ltxtPage = pValor
End Property


Property Set Ventana(pValor As Object)
    Set lVentana = pValor
End Property


Property Set NextControl(pValor As Object)
    Set lNextControl = pValor
End Property

Property Set PreviousControl(pValor As Object)
    Set lPreviousControl = pValor
End Property


Property Set Control(pValor As Object)
    Set lControl = pValor
End Property

Public Property Get Codigo() As String
     Codigo = lCodigo
End Property

Public Property Let Codigo(pValor As String)
    lCodigo = pValor
End Property

Public Property Get Name() As String
     Name = lname
End Property

Public Property Let Name(pValor As String)
    lname = pValor
End Property


Public Property Get Descrip() As String
     Descrip = lDescrip
End Property

Public Property Let Descrip(pValor As String)
    lDescrip = pValor
End Property

Property Set frame(pValor As Object)
    Set lframe = pValor
End Property


' implementar Show
Public Sub Show(pControl As Object)
    
    On Error Resume Next
    llista.ColumnHeaders.Clear
    llista.ListItems.Clear
    On Error GoTo 0
        
    lframe.Left = obtenerLeft(pControl)
    lframe.Top = obtenerTop(pControl) + pControl.Height + SEPARADOR
    lframe.ZOrder 0
    lframe.Visible = True
    
End Sub


' implementar Hide
Public Sub Hide()
    
    
    lframe.Visible = False
    
End Sub



Private Function obtenerLeft(pControl As Object) As Single

    If pControl.Name = lVentana.Name Then
        obtenerLeft = 0
        Exit Function
    End If
    On Error Resume Next
    obtenerLeft = pControl.Left + obtenerLeft(pControl.Container)
    If Err Then
        obtenerLeft = pControl.Left
    End If
    On Error GoTo 0

End Function

Private Function obtenerTop(pControl As Object) As Single

    If pControl.Name = lVentana.Name Then
        obtenerTop = 0
        Exit Function
    End If
    On Error Resume Next
    obtenerTop = pControl.Top + obtenerTop(pControl.Container)
    If Err Then
        obtenerTop = pControl.Top
    End If
    On Error GoTo 0

End Function


Public Sub cmdPages_Click(Index As Integer)

    Select Case Index
    Case cmdPageFist
        Seleccionar_PaginaInicial
    Case cmdPagePreviuos
        Seleccionar_PaginaAnterior
    Case cmdPageNext
        Seleccionar_PaginaSiguiente
    Case cmdPageLast
        Seleccionar_PaginaFinal
    End Select

End Sub


Public Function Seleccionar_PaginaInicial() As Boolean


    Set lobjControl.objDiccionariodeDatos = objDiccionariodeDatos

    calcularRowsbyPage
    llista.ListItems.Clear
    lObjTablasIO.Top = 100
    lObjTablasIO.RowsbyPage = lqtRowsbyPage
    
    If Not lControl.Text = "" Then
        lObjTablasIO.setearCampoOperadorValor lnmCampo, ltpOperador, lControl.Text, " AND "
    End If
    
    lObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " "
    
    If Not lObjTablasIO.Seleccionar_Pagina(1) Then
        MsgBox "Error" + lObjTablasIO.Error, vbInformation
        Exit Function
    End If
    ltxtPage.Text = CStr(lObjTablasIO.nrPage) + " de " + CStr(lObjTablasIO.qtPages)
    If Not lObjTablasIO.rs_resultados.EOF Then
        lobjControl.CargarListView_SG_ColumnaDinamicas lObjTablasIO.rs_resultados, llista, 0, lObjTablasIO.nmTabla
        Seleccionar_PaginaInicial = True
    Else
        Seleccionar_PaginaInicial = False
        ' MsgBox "No se hablaron resultados"
    End If
    
End Function


Public Function Seleccionar_PaginaSiguiente() As Boolean


    If lObjTablasIO.nrPage = lObjTablasIO.qtPages Then Exit Function
    
    llista.ListItems.Clear
    lObjTablasIO.RowsbyPage = lqtRowsbyPage
    lObjTablasIO.setearCampoOperadorValor lnmCampo, ltpOperador, lControl.Text
    
    If Not lObjTablasIO.Seleccionar_Pagina(lObjTablasIO.nrPage + 1) Then
        MsgBox "Error" + lObjTablasIO.Error, vbInformation
        Exit Function
    End If
    If lObjTablasIO.qtPages = 0 Then Exit Function
    ltxtPage.Text = CStr(lObjTablasIO.nrPage) + " de " + CStr(lObjTablasIO.qtPages)
    
    If Not lObjTablasIO.rs_resultados.EOF Then
        lobjControl.CargarListView_SG_ColumnaDinamicas lObjTablasIO.rs_resultados, llista, 0, lObjTablasIO.nmTabla
    End If
    
End Function
    

Public Function Seleccionar_PaginaAnterior() As Boolean

    
    If lObjTablasIO.nrPage <= 1 Then Exit Function
    
    llista.ListItems.Clear
    lObjTablasIO.RowsbyPage = lqtRowsbyPage
    lObjTablasIO.setearCampoOperadorValor lnmCampo, ltpOperador, lControl.Text

    If Not lObjTablasIO.Seleccionar_Pagina(lObjTablasIO.nrPage - 1) Then
        Exit Function
    End If
    
    If lObjTablasIO.qtPages = 0 Then Exit Function
    
    ltxtPage.Text = CStr(lObjTablasIO.nrPage) + " de " + CStr(lObjTablasIO.qtPages)
    
    If Not lObjTablasIO.rs_resultados.EOF Then
        lobjControl.CargarListView_SG_ColumnaDinamicas lObjTablasIO.rs_resultados, llista, 0, lObjTablasIO.nmTabla
    End If
    
End Function
    
    


Public Function Seleccionar_PaginaFinal() As Boolean


    If lObjTablasIO.qtPages <= 0 Then Exit Function
    
    llista.ListItems.Clear
    lObjTablasIO.RowsbyPage = lqtRowsbyPage
    lObjTablasIO.setearCampoOperadorValor lnmCampo, ltpOperador, lControl.Text
    If Not lObjTablasIO.Seleccionar_Pagina(lObjTablasIO.qtPages) Then
        MsgBox "Error" + lObjTablasIO.Error, vbInformation
        Exit Function
    End If
        
    If lObjTablasIO.qtPages = 0 Then Exit Function
    
    ltxtPage.Text = CStr(lObjTablasIO.nrPage) + " de " + CStr(lObjTablasIO.qtPages)
    
    If Not lObjTablasIO.rs_resultados.EOF Then
        lobjControl.CargarListView_SG_ColumnaDinamicas lObjTablasIO.rs_resultados, llista, 0, lObjTablasIO.nmTabla
    End If
    
End Function


Private Sub calcularRowsbyPage()
    lqtRowsbyPage = CInt(llista.Height / (ltxtPage.Height - 40))
End Sub


Public Sub KeyDown(KeyCode As Integer, Shift As Integer)

         Select Case KeyCode
         Case vbKeyReturn
         Case vbKeyUp, vbKeyUp, vbKeyEnd, vbKeyPageUp, vbKeyRight, vbKeyDown
         Case vbKeyShift
         Case vbKeyHome
         Case vbKeyBack
            If Trim(lControl.Text) = "" Then
                lPreviousControl.SetFocus
            End If
         Case vbKeyMenu
         Case vbKeyControl
'            Me.Hide
'            lPreviousControl.SetFocus
         Case vbKeyEscape
            Me.Hide
            lNextControl.SetFocus
         Case Else
         End Select
         
End Sub



Public Function KeyUp(ByRef KeyCode As Integer, Shift As Integer) As Boolean

        KeyUp = True
        Select Case KeyCode
        Case vbKeyReturn
            If lControl.Text <> "" Then
                If Me.Codigo = "" Then
'                    If llista.ListItems.Count >= 1 And lframe.Visible Then
'                       llista.SetFocus
'                    End If
                Else
                    Me.Hide
                    lNextControl.SetFocus
                End If
            Else
                Me.Hide
                lNextControl.SetFocus
            End If
        Case vbKeyUp, vbKeyUp, vbKeyEnd, vbKeyPageUp, vbKeyRight, vbKeyDown
            If Shift = 0 Then
                If lControl.Text <> "" Then
                    If llista.ListItems.Count >= 1 And lframe.Visible Then
                        llista.SetFocus
                    End If
                End If
            End If
        Case Else
            If lstrTextOLD <> lControl.Text Then
                Me.Codigo = ""
                lstrTextOLD = lControl.Text
            End If
            Me.Show lControl
            If Not Me.Seleccionar_PaginaInicial() Then
                KeyUp = False
            Else
                KeyUp = True
            End If
            
            
        End Select
        
        
End Function


Public Sub LostFocus()



End Sub


Private Sub AvisarError(Error As Boolean)

    If Error Then
          lControl.BackColor = Rojo
    Else
          lControl.BackColor = Blanco
    End If

End Sub


Public Sub Change()

    On Error Resume Next
    If lControl.Text = "" Then
        lControl.BackColor = Amarillo
        Exit Sub
    End If
    On Error GoTo 0
    
End Sub

Public Sub Lista_DblClick()
    
    If llista.ListItems.Count < 1 Then Exit Sub
    lControl.Text = llista.SelectedItem.Text
    DoEvents
    AvisarError False
    lNextControl.SetFocus
    Me.Hide
    Me.Codigo = llista.SelectedItem.Text
    RaiseEvent onSeleccionOK(lControl.Tag)
    
End Sub


Public Sub Lista_KeyUp(KeyCode As Integer, Shift As Integer)

    Select Case KeyCode
    Case vbKeyEscape, vbKeyBack
        Me.Hide
        lControl.SetFocus
    Case vbKeyReturn
        If llista.ListItems.Count > 0 Then
            lControl.Text = llista.SelectedItem.Text
            DoEvents
            AvisarError False
            lNextControl.SetFocus
            Me.Hide
            Me.Codigo = llista.SelectedItem.Text
            RaiseEvent onSeleccionOK(lControl.Tag)
        End If
    Case Else
        If llista.ListItems.Count <= 0 Then
        End If
    End Select
    
End Sub


Public Sub GotFocus()

    lstrTextOLD = lControl.Text

    On Error Resume Next
    lControl.SelStart = 0
    lControl.SelLength = Len(lControl.Text)
    On Error GoTo 0

    If CStr(lControl.BackColor) = CStr(RGB(255, 255, 255)) Or CStr(lControl.BackColor) = CStr(-2147483643) Then
        lControl.BackColor = Amarillo
    Else
        lControl.BackColor = lControl.BackColor
    End If

End Sub

Private Sub Class_Initialize()

    ltpOperador = "LIKE DER"
    
End Sub

