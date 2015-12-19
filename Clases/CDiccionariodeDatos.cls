VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CDiccionariodeDatos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'/**************************************************************************************/
'/* A Desarrollar:                                                                     '/*
'/* Se debera mejorar la forma de administrar el acceso al diccionario                 '/*
'/* de datos, acceder por tabla a medida que se vayan solicitanto las mismas           '/*
'/* a su vez mejorar la adminsitración de memoria brindando una función que permita    '/*
'/* inicializar el diccionario                                                         '/*
'/**************************************************************************************/

Option Explicit

Private Type rcDiccionario
    idCampo             As String
    nmTabla             As String
    nmCampo             As String
    nmCampoExterno      As String
    tpTipo              As String
    nrTamanio           As String
    flClave             As String
    flBusqueda          As String
    vlPuesto1           As String
    vlPuesto2           As String
    vlPuesto3           As String
    vlPuesto4           As String
    vlPuesto5           As String
    vlPuesto9           As String
    vlPuesto            As String
End Type

Private lobjConn            As CBasededatos
Private lrs                 As Object
Private lmDiccionario()     As rcDiccionario
Private lnmTabla            As String
Private lnmCampo            As String
Private lnmCampoExterno     As String
Private ltpTipo             As String
Private lnrTamanio          As String
Private lflClave            As String
Private lvlPuesto1          As String
Private lvlPuesto2          As String
Private lvlPuesto3          As String
Private lvlPuesto4          As String
Private lvlPuesto5          As String
Private lvlPuesto9          As String
Private lvlPuesto           As String
Private lerror              As String
Private lCursor             As Integer
Private lObjTablasIO        As CTablasIO
Private lindiceMatriz       As Integer


'**********************************************************************'
'* El objetivo de esta tabla es manejar toda la información           *'
'* de la base de datos en lo que respecta campos de tablas, campos    *'
'* claves y futuras cables                                            *'
'**********************************************************************'
Property Set Basededatos(Valor As Object)
    Set lobjConn = Valor
End Property

Property Set TablasIO(Valor As CTablasIO)
    Set lObjTablasIO = Valor
End Property


Property Get nmTabla() As String
   nmTabla = lnmTabla
End Property


Property Let nmTabla(Valor As String)
    lnmTabla = Valor
End Property

Property Get nmCampo() As String
   nmCampo = lnmCampo
End Property


Property Get nmCampoExterno() As String
   nmCampoExterno = lnmCampoExterno
End Property

Property Let nmCampo(Valor As String)
    lnmCampo = Valor
End Property


' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property
Property Get tpTipo() As String
    tpTipo = ltpTipo
End Property

Property Let tpTipo(Valor As String)
    ltpTipo = Valor
End Property

Property Get nrTamanio() As String
    nrTamanio = lnrTamanio
End Property

Property Let nrTamanio(Valor As String)
    lnrTamanio = Valor
End Property

Property Get flClave() As String
    flClave = lflClave
End Property

Property Let flClave(Valor As String)
    lflClave = Valor
End Property

Property Get vlPuesto1() As String
    vlPuesto1 = lvlPuesto1
End Property

Property Let vlPuesto1(Valor As String)
    lvlPuesto1 = Valor
End Property

Property Get vlPuesto2() As String
    vlPuesto2 = lvlPuesto2
End Property

Property Let vlPuesto2(Valor As String)
    lvlPuesto2 = Valor
End Property

Property Get vlPuesto3() As String
    vlPuesto3 = lvlPuesto3
End Property

Property Let vlPuesto3(Valor As String)
    lvlPuesto3 = Valor
End Property


Property Get vlPuesto4() As String
    vlPuesto4 = lvlPuesto4
End Property


Property Let vlPuesto4(Valor As String)
    lvlPuesto4 = Valor
End Property

Property Get vlPuesto5() As String
    vlPuesto5 = lvlPuesto5
End Property

Property Let vlPuesto5(Valor As String)
    lvlPuesto5 = Valor
End Property

Property Get vlPuesto9() As String
    vlPuesto9 = lvlPuesto9
End Property

Property Let vlPuesto9(Valor As String)
    lvlPuesto9 = Valor
End Property


Property Get vlPuesto() As String
    vlPuesto = lvlPuesto
End Property

Property Let vlPuesto(Valor As String)
    lvlPuesto = Valor
End Property

'/**********************************************************/
'/* Borrar despues de realizar el testeo correspondiente   */
'/**********************************************************/


Public Function ObtenerCampo(pnmTabla As String, _
                                  pnmCampo As String) As Boolean
Dim nI As Integer

    For nI = LBound(lmDiccionario) To UBound(lmDiccionario)
        If UCase(Trim(pnmTabla)) = UCase(Trim(lmDiccionario(nI).nmTabla)) And _
           UCase(Trim(pnmCampo)) = UCase(Trim(lmDiccionario(nI).nmCampo)) Then
           lnmTabla = lmDiccionario(nI).nmTabla
           lnmCampo = lmDiccionario(nI).nmCampo
           lnmCampoExterno = lmDiccionario(nI).nmCampoExterno
           lnrTamanio = lmDiccionario(nI).nrTamanio
           ltpTipo = lmDiccionario(nI).tpTipo
           lflClave = lmDiccionario(nI).flClave
           lvlPuesto1 = lmDiccionario(nI).vlPuesto1
           lvlPuesto2 = lmDiccionario(nI).vlPuesto2
           lvlPuesto3 = lmDiccionario(nI).vlPuesto3
           lvlPuesto4 = lmDiccionario(nI).vlPuesto4
           lvlPuesto5 = lmDiccionario(nI).vlPuesto5
           lvlPuesto9 = lmDiccionario(nI).vlPuesto9
           lindiceMatriz = nI
           ObtenerCampo = True
           Exit Function
        End If
    Next nI
    
    ' ir a buscar la tabla a la base de datos
    If Not ObtenerDiccionarioporTabla(pnmTabla) Then
        ObtenerCampo = False
        MsgBox "Diccionario de datos: No existe tabla ingresada '" + pnmTabla + "'."
        Exit Function
    End If
    
    For nI = lindiceMatriz To UBound(lmDiccionario)
        If UCase(Trim(pnmTabla)) = UCase(Trim(lmDiccionario(nI).nmTabla)) And _
           UCase(Trim(pnmCampo)) = UCase(Trim(lmDiccionario(nI).nmCampo)) Then
           lnmTabla = lmDiccionario(nI).nmTabla
           lnmCampo = lmDiccionario(nI).nmCampo
           lnmCampoExterno = lmDiccionario(nI).nmCampoExterno
           lnrTamanio = lmDiccionario(nI).nrTamanio
           ltpTipo = lmDiccionario(nI).tpTipo
           lflClave = lmDiccionario(nI).flClave
           lvlPuesto1 = lmDiccionario(nI).vlPuesto1
           lvlPuesto2 = lmDiccionario(nI).vlPuesto2
           lvlPuesto3 = lmDiccionario(nI).vlPuesto3
           lvlPuesto4 = lmDiccionario(nI).vlPuesto4
           lvlPuesto5 = lmDiccionario(nI).vlPuesto5
           lvlPuesto9 = lmDiccionario(nI).vlPuesto9
           lindiceMatriz = nI
           ObtenerCampo = True
           Exit Function
        End If
    Next nI
    
    ObtenerCampo = False
    lerror = "Campo no existe en el diccionario"
    
    MsgBox "Diccionario de datos: No existe el campo '" + pnmCampo + "' en la tabla '" + pnmTabla + "'.", vbCritical + vbDefaultButton1, "Diccionario de Datos"
    
End Function



Public Function ObtenerNombredeCampoFisico(pnmTabla As String, _
                                  pnmCampoExterno As String) As Boolean
Dim nI As Integer

    For nI = LBound(lmDiccionario) To UBound(lmDiccionario)
        If UCase(pnmTabla) = UCase(lmDiccionario(nI).nmTabla) And _
           UCase(pnmCampoExterno) = UCase(lmDiccionario(nI).nmCampoExterno) Then
           lnmTabla = lmDiccionario(nI).nmTabla
           lnmCampo = lmDiccionario(nI).nmCampo
           lnmCampoExterno = lmDiccionario(nI).nmCampoExterno
           lnrTamanio = lmDiccionario(nI).nrTamanio
           ltpTipo = lmDiccionario(nI).tpTipo
           flClave = lmDiccionario(nI).flClave
           vlPuesto1 = lmDiccionario(nI).vlPuesto1
           vlPuesto2 = lmDiccionario(nI).vlPuesto2
           vlPuesto3 = lmDiccionario(nI).vlPuesto3
           vlPuesto4 = lmDiccionario(nI).vlPuesto4
           vlPuesto5 = lmDiccionario(nI).vlPuesto5
           vlPuesto9 = lmDiccionario(nI).vlPuesto9
           lindiceMatriz = nI
           ObtenerNombredeCampoFisico = True
           Exit Function
        End If
    Next nI
    
    ' ir a buscar la tabla a la base de datos
    If Not ObtenerDiccionarioporTabla(pnmTabla) Then
        ObtenerNombredeCampoFisico = False
        MsgBox "Diccionario de datos: No existe tabla ingresada '" + pnmTabla + "'."
        Exit Function
    End If
    
    For nI = lindiceMatriz To UBound(lmDiccionario)
        If UCase(pnmTabla) = UCase(lmDiccionario(nI).nmTabla) And _
           UCase(pnmCampoExterno) = UCase(lmDiccionario(nI).nmCampoExterno) Then
           lnmTabla = lmDiccionario(nI).nmTabla
           lnmCampo = lmDiccionario(nI).nmCampo
           lnmCampoExterno = lmDiccionario(nI).nmCampoExterno
           lnrTamanio = lmDiccionario(nI).nrTamanio
           ltpTipo = lmDiccionario(nI).tpTipo
           flClave = lmDiccionario(nI).flClave
           vlPuesto1 = lmDiccionario(nI).vlPuesto1
           vlPuesto2 = lmDiccionario(nI).vlPuesto2
           vlPuesto3 = lmDiccionario(nI).vlPuesto3
           vlPuesto4 = lmDiccionario(nI).vlPuesto4
           vlPuesto5 = lmDiccionario(nI).vlPuesto5
           vlPuesto9 = lmDiccionario(nI).vlPuesto9
           lindiceMatriz = nI
           ObtenerNombredeCampoFisico = True
           Exit Function
        End If
        
    Next nI
    
    ObtenerNombredeCampoFisico = False
    lerror = "Campo no existe en el diccionario"
    
    MsgBox "Diccionario de datos: No existe el campo '" + pnmCampoExterno + "' en la tabla '" + pnmTabla + "'.", vbCritical + vbDefaultButton1, "Diccionario de Datos"
    
End Function
' a programar: obtiene el siguiente numero para un campo desde la Matriz en Memoria
Public Function ObtenerSiguienteValor(pnmTabla As String _
, pnmCampo As String, nrPuesto As String) As String

    If Not ObtenerCampo(pnmTabla, pnmCampo) Then
        ObtenerSiguienteValor = ""
        Exit Function
    End If

    
    Select Case nrPuesto
    Case "1"
        ObtenerSiguienteValor = CStr(CDbl(IIf(lvlPuesto1 = "", 0, lvlPuesto1) + 1))
    Case "2"
        ObtenerSiguienteValor = CStr(CDbl(IIf(lvlPuesto1 = "", 0, lvlPuesto2) + 1))
    Case "3"
        ObtenerSiguienteValor = CStr(CDbl(IIf(lvlPuesto1 = "", 0, lvlPuesto3) + 1))
    Case "4"
        ObtenerSiguienteValor = CStr(CDbl(IIf(lvlPuesto1 = "", 0, lvlPuesto4) + 1))
    Case "5"
        ObtenerSiguienteValor = CStr(CDbl(IIf(lvlPuesto1 = "", 0, lvlPuesto5) + 1))
    Case "9"
        ObtenerSiguienteValor = CStr(CDbl(IIf(lvlPuesto1 = "", 0, lvlPuesto9) + 1))
    Case Else
        ObtenerSiguienteValor = CStr(CDbl(IIf(lvlPuesto = "", 0, lvlPuesto) + 1))
    End Select
    
End Function

Public Function ObtenerValorFijo(pnmTabla As String _
, pnmCampo As String, nrPuesto As String) As String

    If Not ObtenerCampo(pnmTabla, pnmCampo) Then
        ObtenerValorFijo = ""
        Exit Function
    End If

    Select Case nrPuesto
    Case "1"
        ObtenerValorFijo = CStr(CDbl(lvlPuesto1))
    Case "2"
        ObtenerValorFijo = CStr(CDbl(lvlPuesto2))
    Case "3"
        ObtenerValorFijo = CStr(CDbl(lvlPuesto3))
    Case "4"
        ObtenerValorFijo = CStr(CDbl(lvlPuesto4))
    Case "5"
        ObtenerValorFijo = CStr(CDbl(lvlPuesto5))
    Case "9"
        ObtenerValorFijo = CStr(CDbl(lvlPuesto9))
    Case Else
        ObtenerValorFijo = CStr(CDbl(lvlPuesto))
    End Select
    
End Function
' a programar: obtiene el siguiente numero para un campo desde la Matriz en Memoria
Public Function ObtenerValorActual(pnmTabla As String _
, pnmCampo As String, nrPuesto As String) As String

    If Not ObtenerCampo(pnmTabla, pnmCampo) Then
        ObtenerValorActual = ""
        Exit Function
    End If

    Select Case nrPuesto
    Case "1"
        ObtenerValorActual = CStr(lvlPuesto1)
    Case "2"
        ObtenerValorActual = CStr(lvlPuesto2)
    Case "3"
        ObtenerValorActual = CStr(lvlPuesto3)
    Case "4"
        ObtenerValorActual = CStr(lvlPuesto4)
    Case "5"
        ObtenerValorActual = CStr(lvlPuesto5)
    Case "9"
        ObtenerValorActual = CStr(lvlPuesto9)
    Case Else
        ObtenerValorActual = CStr(lvlPuesto)
    End Select
    
End Function

' a programar: graba en matriz dinamica y Base de datos
Public Function GuardarSiguienteValor(pnmTabla As String _
, pnmCampo As String, pnrPuesto As String) As Double
Dim miIndiceMatriz As Integer
    If Not ObtenerCampo(pnmTabla, pnmCampo) Then
           GuardarSiguienteValor = -1
           Exit Function
       End If
    miIndiceMatriz = lindiceMatriz
    Select Case pnrPuesto
    Case "1"
        GuardarSiguienteValor = CDbl(IIf(lvlPuesto1 = "", 0, lvlPuesto1)) + 1
    Case "2"
        GuardarSiguienteValor = CDbl(IIf(lvlPuesto2 = "", 0, lvlPuesto2)) + 1
    Case "3"
        GuardarSiguienteValor = CDbl(IIf(lvlPuesto3 = "", 0, lvlPuesto3)) + 1
    Case "4"
        GuardarSiguienteValor = CDbl(IIf(lvlPuesto4 = "", 0, lvlPuesto4)) + 1
    Case "5"
        GuardarSiguienteValor = CDbl(IIf(lvlPuesto5 = "", 0, lvlPuesto5)) + 1
    Case "9"
        GuardarSiguienteValor = CDbl(IIf(lvlPuesto9 = "", 0, lvlPuesto9)) + 1
    Case Else
        GuardarSiguienteValor = CDbl(IIf(lvlPuesto = "", 0, lvlPuesto)) + 1
        pnrPuesto = ""
    End Select
    
    lObjTablasIO.nmTabla = "DiccionariodeDatos"
    lObjTablasIO.setearCampoOperadorValor "nmTabla", "=", pnmTabla, " AND "
    lObjTablasIO.setearCampoOperadorValor "nmCampo", "=", pnmCampo
    lObjTablasIO.setearCampoOperadorValor "vlPuesto" + CStr(pnrPuesto), "<-", CStr(GuardarSiguienteValor)
    
    If Not ObjTablasIO.Actualizar() Then
           lerror = lObjTablasIO.Error
           Debug.Assert lerror
           GuardarSiguienteValor = -1
    Else
        Select Case pnrPuesto
        Case "1"
            lmDiccionario(miIndiceMatriz).vlPuesto1 = GuardarSiguienteValor
        Case "2"
            lmDiccionario(miIndiceMatriz).vlPuesto2 = GuardarSiguienteValor
        Case "3"
            lmDiccionario(miIndiceMatriz).vlPuesto3 = GuardarSiguienteValor
        Case "4"
            lmDiccionario(miIndiceMatriz).vlPuesto4 = GuardarSiguienteValor
        Case "5"
            lmDiccionario(miIndiceMatriz).vlPuesto5 = GuardarSiguienteValor
        Case "9"
            lmDiccionario(miIndiceMatriz).vlPuesto9 = GuardarSiguienteValor
        Case Else
            lmDiccionario(miIndiceMatriz).vlPuesto = GuardarSiguienteValor
        End Select
    End If
    
    
End Function



' a programar: graba en matriz dinamica y Base de datos
Public Function GuardarValorCampo(pnmTabla As String _
, pnmCampo As String, pnrPuesto As String, pValor As String) As Boolean
Dim miIndiceMatriz As Integer

    If Not ObtenerCampo(pnmTabla, pnmCampo) Then
           GuardarValorCampo = False
           Exit Function
       End If
    miIndiceMatriz = lindiceMatriz
    Select Case pnrPuesto
    Case "1"
        lmDiccionario(miIndiceMatriz).vlPuesto1 = pValor
    Case "2"
        lmDiccionario(miIndiceMatriz).vlPuesto2 = pValor
    Case "3"
        lmDiccionario(miIndiceMatriz).vlPuesto3 = pValor
    Case "4"
        lmDiccionario(miIndiceMatriz).vlPuesto4 = pValor
    Case "5"
        lmDiccionario(miIndiceMatriz).vlPuesto5 = pValor
    Case "9"
        lmDiccionario(miIndiceMatriz).vlPuesto9 = pValor
    Case Else
        lmDiccionario(miIndiceMatriz).vlPuesto = pValor
    End Select
    GuardarValorCampo = True
    
End Function


Public Function ObtenerlosCamposdeBusquedadeunaTabla(pnmTabla As String) As Boolean
Dim nI As Integer

    For nI = LBound(lmDiccionario) To UBound(lmDiccionario)
        If UCase(pnmTabla) = UCase(lmDiccionario(nI).nmTabla) And _
           UCase(lmDiccionario(nI).flBusqueda) = UCase("Yes") Then
           lCursor = nI
           lindiceMatriz = nI
           lnmTabla = lmDiccionario(nI).nmTabla
           lnmCampo = lmDiccionario(nI).nmCampo
           lnmCampoExterno = lmDiccionario(nI).nmCampoExterno
           lnrTamanio = lmDiccionario(nI).nrTamanio
           ltpTipo = lmDiccionario(nI).tpTipo
           lflClave = lmDiccionario(nI).flClave
           lvlPuesto1 = lmDiccionario(nI).vlPuesto1
           lvlPuesto2 = lmDiccionario(nI).vlPuesto2
           lvlPuesto3 = lmDiccionario(nI).vlPuesto3
           lvlPuesto4 = lmDiccionario(nI).vlPuesto4
           lvlPuesto5 = lmDiccionario(nI).vlPuesto5
           lvlPuesto9 = lmDiccionario(nI).vlPuesto9
           lvlPuesto = lmDiccionario(nI).vlPuesto
           ObtenerlosCamposdeBusquedadeunaTabla = True
           Exit Function
        End If
    Next nI
    
    ' ir a buscar la tabla a la base de datos
    If Not ObtenerDiccionarioporTabla(pnmTabla) Then
        ObtenerlosCamposdeBusquedadeunaTabla = False
        MsgBox "Diccionario de datos: No existe tabla ingresada '" + pnmTabla + "'."
        Exit Function
    End If
    
    For nI = lindiceMatriz To UBound(lmDiccionario)
        If UCase(pnmTabla) = UCase(lmDiccionario(nI).nmTabla) And _
           UCase(lmDiccionario(nI).flBusqueda) = UCase("Yes") Then
           lCursor = nI
           lindiceMatriz = nI
           lnmTabla = lmDiccionario(nI).nmTabla
           lnmCampo = lmDiccionario(nI).nmCampo
           lnmCampoExterno = lmDiccionario(nI).nmCampoExterno
           lnrTamanio = lmDiccionario(nI).nrTamanio
           ltpTipo = lmDiccionario(nI).tpTipo
           lflClave = lmDiccionario(nI).flClave
           lvlPuesto1 = lmDiccionario(nI).vlPuesto1
           lvlPuesto2 = lmDiccionario(nI).vlPuesto2
           lvlPuesto3 = lmDiccionario(nI).vlPuesto3
           lvlPuesto4 = lmDiccionario(nI).vlPuesto4
           lvlPuesto5 = lmDiccionario(nI).vlPuesto5
           lvlPuesto9 = lmDiccionario(nI).vlPuesto9
           lvlPuesto = lmDiccionario(nI).vlPuesto
           ObtenerlosCamposdeBusquedadeunaTabla = True
           Exit Function
        End If
    Next nI
    
    ObtenerlosCamposdeBusquedadeunaTabla = False
    MsgBox "Diccionario de datos: No existe tabla ingresada '" + pnmTabla + "'."
    
End Function



Public Function ObtenerSiguienteCampo(pnmTabla As String) As Boolean
Dim nI As Integer

    lCursor = lCursor + 1
    For nI = lCursor To UBound(lmDiccionario)
        If UCase(pnmTabla) = UCase(lmDiccionario(lCursor).nmTabla) And _
               UCase(lmDiccionario(nI).flBusqueda) = UCase("Yes") Then
            lindiceMatriz = nI
            lnmTabla = lmDiccionario(lindiceMatriz).nmTabla
            lnmCampo = lmDiccionario(lindiceMatriz).nmCampo
            lnmCampoExterno = lmDiccionario(lindiceMatriz).nmCampoExterno
            lnrTamanio = lmDiccionario(lindiceMatriz).nrTamanio
            ltpTipo = lmDiccionario(lindiceMatriz).tpTipo
            lflClave = lmDiccionario(lindiceMatriz).flClave
            lvlPuesto1 = lmDiccionario(lindiceMatriz).vlPuesto1
            lvlPuesto2 = lmDiccionario(lindiceMatriz).vlPuesto2
            lvlPuesto3 = lmDiccionario(lindiceMatriz).vlPuesto3
            lvlPuesto4 = lmDiccionario(lindiceMatriz).vlPuesto4
            lvlPuesto5 = lmDiccionario(lindiceMatriz).vlPuesto5
            lvlPuesto9 = lmDiccionario(lindiceMatriz).vlPuesto9
            lvlPuesto = lmDiccionario(lindiceMatriz).vlPuesto
            lCursor = nI
            ObtenerSiguienteCampo = True
            Exit Function
        Else
            lCursor = nI
            ObtenerSiguienteCampo = False
        End If
    Next
End Function

Public Function FindeCampos(pnmTabla As String) As Boolean
Dim ValorCursor As Integer

    ValorCursor = lCursor
    If UBound(lmDiccionario) > ValorCursor Then
        If UCase(pnmTabla) <> UCase(lmDiccionario(ValorCursor).nmTabla) Then
            FindeCampos = True
        Else
            FindeCampos = False
        End If
    Else
        FindeCampos = True
    End If
    
End Function




Public Function AdaptarNulos(pDato As Variant, valordefecto As Variant)
    
    
    If IsNull(pDato) Then
        AdaptarNulos = valordefecto
    Else
        AdaptarNulos = CStr(pDato)
    End If

End Function





Public Function ValidarEntrada(pnmTabla As String, _
                    pControl As Control, KeyAscii As Integer, Optional bPasaraMayus As Boolean = True) As Integer
Dim nTamanio As Integer
Dim strNro   As String


    Me.ObtenerCampo pnmTabla, pControl.Tag
    
    On Error Resume Next
    If pControl.Locked Then
        ValidarEntrada = vbKeyTab
        Exit Function
    End If
    If pControl.BackColor = 14737632 Then
        ValidarEntrada = vbKeyTab
        Exit Function
    End If
    If Err Then
        ValidarEntrada = vbKeyTab
        Exit Function
    End If
    On Error GoTo 0
    
        If KeyAscii = vbKeyBack Then
        ValidarEntrada = vbKeyBack
        Exit Function
    End If
    

    
    If Len(pControl.Text) >= CInt(lnrTamanio) Then
            ValidarEntrada = vbKeyTab
            Exit Function
    End If
    
    If pControl.SelLength > 0 Then
        On Error Resume Next
       pControl.Text = ""
        On Error GoTo 0
    End If

    
    Select Case UCase(Me.tpTipo)
    Case "BIT", "S/N":
    Case "CUIT", "CUIL"
            If Not (KeyAscii = 44 Or KeyAscii = 46) Then
                strNro = pControl.Text + Chr(KeyAscii)
                If (KeyAscii >= 48 And KeyAscii <= 57) Or (KeyAscii = 45) Or _
                   (KeyAscii = 42) Or (KeyAscii = 37) Then
                    ValidarEntrada = KeyAscii
                Else
                    ValidarEntrada = vbKeyReturn
                End If
            Else
                ValidarEntrada = vbKeyReturn
            End If
    Case "COUNTER", "INTEGER", "NRO_COMPROBANTE", "NRO_TALONARIO", "SMALLINT", "INT", "ENTERO":
             If Not (KeyAscii = 44 Or KeyAscii = 46) Then
                strNro = pControl.Text + Chr(KeyAscii)
                If (KeyAscii >= 48 And KeyAscii <= 57) Or (KeyAscii = 45) Or _
                   (KeyAscii = 42) Or (KeyAscii = 37) Then
                    ValidarEntrada = KeyAscii
                Else
                    ValidarEntrada = vbKeyReturn
                End If
            Else
                ValidarEntrada = vbKeyReturn
            End If
    Case "INT_CERO_POSITIVO":
                If (KeyAscii >= 48 And KeyAscii <= 57) Then
                    ValidarEntrada = KeyAscii
                Else
                    ValidarEntrada = vbKeyReturn
                End If
    Case "DOUBLE", "DECIMAL":
        If KeyAscii = 46 Then
            KeyAscii = 44
        End If
        If KeyAscii = 44 And InStr(1, pControl.Text, ",", vbTextCompare) > 0 Then
            ValidarEntrada = vbKeyReturn
        Else
            If (KeyAscii >= 48 And KeyAscii <= 57) Or KeyAscii = 44 _
               Or (KeyAscii = 45) Or (KeyAscii = 42) Or (KeyAscii = 37) Then
                ValidarEntrada = KeyAscii
            Else
                ValidarEntrada = vbKeyReturn
            End If
        End If
    Case "DATETIME", "FECHA CORTA", "FECHA LARGA"
        If (KeyAscii >= 48 And KeyAscii <= 57) Or (KeyAscii = 47) Or _
           (KeyAscii = 45) Or (KeyAscii = 42) Or (KeyAscii = 37) Then
           ValidarEntrada = KeyAscii
        Else
           ValidarEntrada = vbKeyReturn
        End If
    Case "VARCHAR"
        If bPasaraMayus Then
            If KeyAscii >= 97 And KeyAscii <= 122 Then
                KeyAscii = KeyAscii - 32
            End If
        End If
        ValidarEntrada = KeyAscii
    Case Else
        ValidarEntrada = KeyAscii
    End Select
    
End Function


Public Function FormatearCampoControl(pnmTabla As String, _
                    pControl As Control, pAccion As String) As Boolean
Dim nTamanio As Integer
Dim strNro   As String


    Me.ObtenerCampo pnmTabla, pControl.Tag
    
    Select Case UCase(Me.tpTipo)
    Case "BIT", "COUNTER", "INTEGER", "VARCHAR", "NRO_COMPROBANTE", "SMALLINT", "INT", "INT_CERO_POSITIVO", "CUIT", "CUIL":
    Case "SMALLDATETIME":
            If IsNull(pControl.Text) And pControl.Text = "" Then
                pControl.Text = ""
            Else
                If IsDate(pControl.Text) Then
                    pControl.Text = pControl.Text
                Else
                    pControl.Text = Format(pControl.Text, "##/##/####")
                End If
            End If
    Case "DATETIME":
            If IsNull(pControl.Text) And pControl.Text = "" Then
                pControl.Text = ""
            Else
                If IsDate(pControl.Text) Then
                    pControl.Text = pControl.Text
                Else
                    pControl.Text = Format(pControl.Text, "##/##/#### ##:##:##")
                End If
            End If
    Case "DOUBLE":
        If Not pControl.Text = "" Then
            On Error Resume Next
            pControl.Text = FormatNumber(pControl.Text, 2)
            On Error GoTo 0
        Else
            strNro = String(nrTamanio, "0")
            pControl = FormatNumber(strNro, 2)
        End If
    Case Else
    End Select

    On Error Resume Next
    pControl.SelStart = 0
    pControl.SelLength = Len(pControl.Text)
    On Error GoTo 0
    Select Case pAccion
    Case "GotFocus"
        If CStr(pControl.BackColor) = CStr(RGB(255, 255, 255)) Then
             pControl.BackColor = Amarillo
        Else
            pControl.BackColor = pControl.BackColor
        End If
    Case "LostFocus"
        If CStr(pControl.BackColor) = Amarillo Then
             pControl.BackColor = Blanco
        Else
            pControl.BackColor = pControl.BackColor
        End If
    Case Else
    End Select
    
    
End Function



Public Function FormatearCampoValor(pnmTabla As String, pnmCampo As String, _
                    pValor As String) As String
Dim nTamanio As Integer
Dim strNro   As String


    Me.ObtenerCampo pnmTabla, pnmCampo
    Select Case UCase(Me.tpTipo)
    Case "BIT", "COUNTER", "INTEGER", "SMALLINT", "INT", "INT_CERO_POSITIVO", "CUIT", "CUIL":
        If IsNull(pValor) And pValor = "" Then
            FormatearCampoValor = ""
        Else
            FormatearCampoValor = CStr(pValor)
        End If
    Case "SMALLDATETIME":
            If IsNull(pValor) And pValor = "" Then
                FormatearCampoValor = ""
            Else
                If IsDate(pValor) Then
                    FormatearCampoValor = pValor
                Else
                    FormatearCampoValor = Format(pValor, "##/##/####")
                End If
            End If
    Case "DATETIME":
            If IsNull(pValor) And pValor = "" Then
                FormatearCampoValor = ""
            Else
                If IsDate(pValor) Then
                    FormatearCampoValor = pValor
                Else
                    FormatearCampoValor = Format(pValor, "##/##/#### ##:##:##")
                End If
            End If
    Case "VARCHAR", "NRO_COMPROBANTE":
        FormatearCampoValor = Trim(pValor)
    Case "DOUBLE":
        If Not pValor = "" Then
            FormatearCampoValor = FormatNumber(pValor, 2)
        Else
            strNro = String(nrTamanio, "0")
            FormatearCampoValor = FormatNumber(strNro, 2)
        End If
    Case Else
        FormatearCampoValor = pValor
    End Select

End Function


Private Function ObtenerDiccionarioporTabla(psTabla As String) As Boolean
Dim strSQL As String

    strSQL = "sco_DiccionariodeDatos "
    strSQL = strSQL + "@nmtabla_param='" + psTabla + "'"
       
    Set lrs = CreateObject("adodb.recordset")
    
    
    If Not lobjConn.ExecStoredProcedures_Diccionariodedatos(strSQL) Then
        lerror = Err.Description
        ObtenerDiccionarioporTabla = False
        On Error GoTo 0
        Exit Function
    End If
    
    Set lrs = lobjConn.rs_resultados_Diccionariodedatos
    
    Do Until lrs.EOF
        ReDim Preserve lmDiccionario(LBound(lmDiccionario) To UBound(lmDiccionario) + 1)
        lmDiccionario(UBound(lmDiccionario) - 1).idCampo = AdaptarNulos(lrs("IdCampo"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).nmTabla = AdaptarNulos(lrs("nmTabla"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).nmCampo = AdaptarNulos(lrs("nmCampo"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).nmCampoExterno = AdaptarNulos(lrs("nmCampoExterno"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).tpTipo = AdaptarNulos(lrs("tpTipo"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).nrTamanio = AdaptarNulos(lrs("nrTamanio"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).flClave = AdaptarNulos(lrs("flClave"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).flBusqueda = AdaptarNulos(lrs("flBusqueda"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).vlPuesto1 = AdaptarNulos(lrs("vlPuesto1"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).vlPuesto2 = AdaptarNulos(lrs("vlPuesto2"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).vlPuesto3 = AdaptarNulos(lrs("vlPuesto3"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).vlPuesto4 = AdaptarNulos(lrs("vlPuesto4"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).vlPuesto5 = AdaptarNulos(lrs("vlPuesto5"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).vlPuesto9 = AdaptarNulos(lrs("vlPuesto9"), "")
        lmDiccionario(UBound(lmDiccionario) - 1).vlPuesto = AdaptarNulos(lrs("vlPuesto"), "")
        
        lrs.MoveNext
    Loop
    
    objbasededatos.close_resultados_Diccionariodedatos
    
    ObtenerDiccionarioporTabla = True
    
End Function


Public Function InicializarDiccionario() As Boolean

    ReDim lmDiccionario(0 To 0)
    InicializarDiccionario = True
    
End Function


Public Function ObtenerCampo_replicacion(pnmTabla As String, _
                                  pnmCampo As String) As Boolean
Dim nI As Integer

    For nI = LBound(lmDiccionario) To UBound(lmDiccionario)
        If UCase(Trim(pnmTabla)) = UCase(Trim(lmDiccionario(nI).nmTabla)) And _
           UCase(Trim(pnmCampo)) = UCase(Trim(lmDiccionario(nI).nmCampo)) Then
           lnmTabla = lmDiccionario(nI).nmTabla
           lnmCampo = lmDiccionario(nI).nmCampo
           lnmCampoExterno = lmDiccionario(nI).nmCampoExterno
           lnrTamanio = lmDiccionario(nI).nrTamanio
           ltpTipo = lmDiccionario(nI).tpTipo
           lflClave = lmDiccionario(nI).flClave
           lvlPuesto1 = lmDiccionario(nI).vlPuesto1
           lvlPuesto2 = lmDiccionario(nI).vlPuesto2
           lvlPuesto3 = lmDiccionario(nI).vlPuesto3
           lvlPuesto4 = lmDiccionario(nI).vlPuesto4
           lvlPuesto5 = lmDiccionario(nI).vlPuesto5
           lvlPuesto9 = lmDiccionario(nI).vlPuesto9
           lvlPuesto = lmDiccionario(nI).vlPuesto
           lindiceMatriz = nI
           ObtenerCampo_replicacion = True
           Exit Function
        End If
    Next nI
    
    ' ir a buscar la tabla a la base de datos
    If Not ObtenerDiccionarioporTabla(pnmTabla) Then
        ObtenerCampo_replicacion = False
        MsgBox "Diccionario de datos: No existe tabla ingresada '" + pnmTabla + "'."
        Exit Function
    End If
    
    For nI = lindiceMatriz To UBound(lmDiccionario)
        If UCase(Trim(pnmTabla)) = UCase(Trim(lmDiccionario(nI).nmTabla)) And _
           UCase(Trim(pnmCampo)) = UCase(Trim(lmDiccionario(nI).nmCampo)) Then
           lnmTabla = lmDiccionario(nI).nmTabla
           lnmCampo = lmDiccionario(nI).nmCampo
           lnmCampoExterno = lmDiccionario(nI).nmCampoExterno
           lnrTamanio = lmDiccionario(nI).nrTamanio
           ltpTipo = lmDiccionario(nI).tpTipo
           lflClave = lmDiccionario(nI).flClave
           lvlPuesto1 = lmDiccionario(nI).vlPuesto1
           lvlPuesto2 = lmDiccionario(nI).vlPuesto2
           lvlPuesto3 = lmDiccionario(nI).vlPuesto3
           lvlPuesto4 = lmDiccionario(nI).vlPuesto4
           lvlPuesto5 = lmDiccionario(nI).vlPuesto5
           lvlPuesto9 = lmDiccionario(nI).vlPuesto9
           lvlPuesto = lmDiccionario(nI).vlPuesto
           lindiceMatriz = nI
           ObtenerCampo_replicacion = True
           Exit Function
        End If
    Next nI
    
    ObtenerCampo_replicacion = False
    
    
End Function


Public Function ObtenerTabla(pnmTabla As String) As Boolean
Dim nI As Integer

    For nI = LBound(lmDiccionario) To UBound(lmDiccionario)
        If UCase(Trim(pnmTabla)) = UCase(Trim(lmDiccionario(nI).nmTabla)) Then
           ObtenerTabla = True
           Exit Function
        End If
    Next nI
    
    ' ir a buscar la tabla a la base de datos
    If Not ObtenerDiccionarioporTabla(pnmTabla) Then
        ObtenerTabla = False
        lerror = "Tabla no existe en el diccionario"
        MsgBox "Diccionario de datos: No existe tabla ingresada '" + pnmTabla + "'."
        Exit Function
    End If
    
    ObtenerTabla = True
    

End Function




