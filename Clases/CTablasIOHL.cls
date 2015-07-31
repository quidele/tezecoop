VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTablasIOHL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'********************************************************************/
'/* En Testing cambio en Actualizar e Insertar                      */
'********************************************************************/

Option Explicit


Const adOpenKeyset = 1
Const adExecuteNoRecords = 128
Const adStateOpen = 1

'********************************************************************'
'* El objetivo de esta clase es realizar las operaciones basicas    *'
'* sobre una determinada tabla                                      *'
'* Por ejemplo Insert, Update, Delete, Select                       *'
'********************************************************************'

' Declaracion de tipos
Private Type rcCampoOperadorValor
    strCampo               As String
    strOperador            As String
    vrtValor               As String
    strConjuncion          As String
    strTipo                As String
    strnmCampoExterno      As String
    strOrdenar             As String
End Type

Private ltpModoActual               As String

' declaracion de variables locales, privadas de la clase
Private lmCampoOperadorValor()   As rcCampoOperadorValor
Private lnmTabla                 As String
Private lerror                   As String
'Private lrs                      As Object
Private ldsMotorBD               As String
Private lnrTOP                   As Integer
Private lqtPages                 As Integer
Private lnrPage                  As Integer
Private lqtRowsbyPage            As Integer
Public strUltimoWhere            As String


Private Function TraducirError(pError As ErrObject) As String

    Select Case CStr(pError.Number)
    Case "-2147217900"
        TraducirError = "registro existente."
    Case "2"
        TraducirError = ""
    Case Else
        TraducirError = pError.Description
    End Select
End Function

Property Get rs_resultados() As Object
    Set rs_resultados = objbasededatos.rs_resultados
End Property

' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property

' declaracion de las propiedades del objeto
Property Get recordAffected() As String
    recordAffected = objbasededatos.recordAffected
End Property

Property Get Top() As Integer
    Top = lnrTOP
End Property

Property Let Top(Valor As Integer)
    lnrTOP = Valor
End Property

Property Let RowsbyPage(pValor As Integer)
    lqtRowsbyPage = pValor
End Property

Property Get qtPages()
    qtPages = lqtPages
End Property


Property Get nrPage() As Integer
    nrPage = lnrPage
End Property

Property Get nmTabla() As String
    nmTabla = lnmTabla
End Property

Property Let nmTabla(Valor As String)
    lnmTabla = Valor
    lnrTOP = 0
    objDiccionariodeDatos.ObtenerTabla Valor
    ReDim lmCampoOperadorValor(0 To 0)
End Property








' Tomar Parametro que introduce desde afuera
Public Function setearCampoOperadorValor _
(pstrCampo As String, _
pstrOperador As String, pvrtValor As Variant, _
Optional pstrConjuncion As String, _
Optional pstrOrdenar As String, Optional pstrTipo As String, _
Optional Graba_Nulos As Boolean = True) As Boolean
Dim strvrtValor As String
    
    If Not objDiccionariodeDatos.ObtenerCampo(Me.nmTabla, pstrCampo) Then
        lerror = "El nombre Campo no existe en el Diccionario"
        Debug.Assert (Err)
        Exit Function
    End If
    If Not esOperador(pstrOperador) Then
        lerror = "El operador es incorrecto"
        Debug.Assert (Err)
        Exit Function
    End If
    
    If Trim(pvrtValor) = "" And pstrOperador = "=" Then
        lerror = "El valor no existe"
        'Debug.Assert (Err)
        Exit Function
    End If

    If (Trim(pvrtValor) = "*" Or Trim(pvrtValor) = "*") And esOperadorBusqueda(pstrOperador) Then
        lerror = "El valor no existe"
        ' Debug.Assert (Err)
        Exit Function
    End If
    
    If Graba_Nulos = False And pstrOperador = "<-" And Trim(pvrtValor) = "" Then
        lerror = "Opción Graba Nulos Deshsbilitada."
        Exit Function
    End If
    
    ' If (Trim(pvrtValor) = "*" Or Trim(pvrtValor) = "%") And Trim(pstrOperador) = "LIKE" Then
    '    lerror = "El valor no existe"
    '    Exit Function
    ' End If
    
    
    ReDim Preserve lmCampoOperadorValor(0 To UBound(lmCampoOperadorValor) + 1)
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strCampo = pstrCampo
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strOperador = UCase(Trim(pstrOperador))

    
    'controlamos el tamaño
    Select Case UCase(Trim(objDiccionariodeDatos.tpTipo))
    Case "VARCHAR", "CHAR"
        If Not (pvrtValor = "") Then
            pvrtValor = Left(pvrtValor, CDbl(objDiccionariodeDatos.nrTamanio))
        End If
    End Select
    
    If Not pstrTipo = "" Then
        strvrtValor = objbasededatos.FormatearValorSQL(pvrtValor, pstrTipo)
    Else
        strvrtValor = objbasededatos.FormatearValorSQL(pvrtValor, objDiccionariodeDatos.tpTipo)
    End If
    
    'ASIGNAMOS EL VALOR
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).vrtValor = strvrtValor
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strConjuncion = pstrConjuncion
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strnmCampoExterno = _
    objDiccionariodeDatos.nmCampoExterno
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strOrdenar = pstrOrdenar
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strTipo = objDiccionariodeDatos.tpTipo
    setearCampoOperadorValor = True
    
End Function


Public Function Seleccionar() As Boolean
Dim strSQL            As String
Dim strCondicion      As String

    strCondicion = ArmarCondicion()
    
    If lnrTOP > 0 Then
        Select Case ldsMotorBD
        Case "MY_SQL"
            strSQL = " SELECT " + ArmarSeleccion() + " FROM " + Me.nmTabla + _
            " " + strCondicion + ArmarOrderBY + " LIMIT " + CStr(lnrTOP)
        Case "SQL_SERVER"
            strSQL = " SELECT TOP " + CStr(lnrTOP) + " " + ArmarSeleccion() + " FROM " + Me.nmTabla + _
            " " + strCondicion + ArmarOrderBY
        Case "MDB"
            strSQL = " SELECT TOP " + CStr(lnrTOP) + " " + ArmarSeleccion() + " FROM " + Me.nmTabla + _
            " " + strCondicion + ArmarOrderBY
        End Select
    Else
        strSQL = " SELECT " + ArmarSeleccion() + " FROM " + Me.nmTabla + _
        " " + strCondicion + ArmarOrderBY
    End If
    
    strUltimoWhere = strCondicion
    ' If " WHERE TB_Reservas.IdReserva = 0" = strUltimoWhere Then
    '     MsgBox "PROBLEMA"
    ' End If
    ' Objbasededatos.close_resultados
           
    On Error Resume Next
    If Not objbasededatos.ExecuteSQL(strSQL) Then
        lerror = objbasededatos.Error
        Seleccionar = False
        On Error GoTo 0
        Exit Function
    End If

    ReDim mCampoOperadorValor(0 To 0)
    Seleccionar = True
    
End Function



Public Function SeleccionarExportar() As Boolean
Dim strSQL As String

    strSQL = " SELECT " + ArmarSeleccionExportar() + " FROM " + Me.nmTabla + " " + ArmarCondicion()
    
    objbasededatos.ExecuteSQL strSQL, adOpenKeyset
    
    ReDim mCampoOperadorValor(0 To 0)
        
End Function

Public Function Insertar() As Boolean
Dim strSQL As String
     
     strSQL = ""
     strSQL = ArmarInsercion()
     Select Case ldsMotorBD
     Case "MDB"
        strSQL = " INSERT INTO " + Me.nmTabla + strSQL
     Case Else
        strSQL = " INSERT " + Me.nmTabla + strSQL
     End Select
     
     ' Objbasededatos.Execute strSQL, lrecordAffected, adExecuteNoRecords
     
    If Not objbasededatos.ExecuteSQL(strSQL, adExecuteNoRecords) Then
        lerror = objbasededatos.Error
        Insertar = False
        ReDim mCampoOperadorValor(0 To 0)
        Exit Function
    End If
     
    If objbasededatos.recordAffected < 1 Then
        Insertar = False
        lerror = "No se ha podido insertar el registro. comando " + strSQL
        Exit Function
    End If

    objbasededatos.close_resultados

    ReDim mCampoOperadorValor(0 To 0)
    Insertar = True
    
End Function


Public Function Actualizar() As Boolean
Dim strSQL As String

    strSQL = " UPDATE " + Me.nmTabla + " SET " + ArmarAsignacion() + " " + ArmarCondicion()
       
       
    If InStr(1, strSQL, " where ", vbTextCompare) = 0 Then
        lerror = "Error: No existe la condicion de WHERE "
        ReDim mCampoOperadorValor(0 To 0)
        Actualizar = False
        Exit Function
    End If
    
    
    If Not objbasededatos.ExecuteSQL(strSQL) Then
        lerror = objbasededatos.Error
        ReDim mCampoOperadorValor(0 To 0)
        Actualizar = False
        Exit Function
    End If

    
    If objbasededatos.recordAffected < 1 Then
        Actualizar = False
        lerror = "No se ha podido actualizar el registro. comando " + strSQL
        Exit Function
    End If
    
    objbasededatos.close_resultados
    
    ReDim mCampoOperadorValor(0 To 0)
    Actualizar = True
    
End Function

Public Function Eliminar() As Boolean
Dim strSQL As String

    strSQL = " DELETE  FROM " + Me.nmTabla + " " + ArmarCondicion()

    If Not objbasededatos.ExecuteSQL(strSQL) Then
        lerror = objbasededatos.Error
        Eliminar = False
        Exit Function
    End If
    
    If objbasededatos.recordAffected < 1 Then
        Eliminar = False
        lerror = "No se ha podido eliminar el registro. comando " + strSQL
        Exit Function
    End If
        
    objbasededatos.close_resultados
    
    ReDim mCampoOperadorValor(0 To 0)
    Eliminar = True
    
End Function

Private Function esOperador(pstrOperador) As Boolean
    Select Case UCase(Trim(pstrOperador))
    Case "=", "<", ">", "=>", ">=", "<=", "=<", "!=", "<-|=", "<-", "->", "LIKE", "LIKE DER", "LIKE IZQ", "<>", "IS NULL"
        esOperador = True
    Case Else
    esOperador = False
    End Select
    
End Function


Private Function esOperadorBusqueda(pstrOperador) As Boolean
    Select Case UCase(Trim(pstrOperador))
    Case "=", "LIKE", "LIKE DER", "LIKE IZQ"
        esOperadorBusqueda = True
    Case Else
        esOperadorBusqueda = False
    End Select
    
End Function

' selección
Private Function ArmarSeleccion() As String
Dim i As Integer
Dim strField  As String
Dim strValues As String

    For i = LBound(lmCampoOperadorValor) To UBound(lmCampoOperadorValor)
        If lmCampoOperadorValor(i).strOperador <> "" Then
            If lmCampoOperadorValor(i).strOperador = "->" Then
                strField = strField + Me.nmTabla + "." + lmCampoOperadorValor(i).strCampo + " ,"
            End If
        End If
    Next
    If Not strField = "" Then
       ArmarSeleccion = Left(strField, Len(strField) - 1)
    End If
    

End Function



' Armar el order en una Selección
Private Function ArmarOrderBY() As String
Dim i As Integer
Dim strField  As String

    strField = ""
    For i = LBound(lmCampoOperadorValor) To UBound(lmCampoOperadorValor)
        If lmCampoOperadorValor(i).strOrdenar <> "" Then
            Select Case Trim(lmCampoOperadorValor(i).strOrdenar)
            Case "ASC"
                strField = strField + Me.nmTabla + "." + _
                lmCampoOperadorValor(i).strCampo + " " + _
                lmCampoOperadorValor(i).strOrdenar + " ,"
            Case "DESC"
                strField = strField + Me.nmTabla + "." + _
                lmCampoOperadorValor(i).strCampo + " " + _
                lmCampoOperadorValor(i).strOrdenar + " ,"
            Case Else
                Debug.Assert "Error al Ordenar"
            End Select
        End If
    Next
    If Not strField = "" Then
       ArmarOrderBY = " Order by " + Left(strField, Len(strField) - 1)
    End If
    
End Function



' seleccion
Private Function ArmarSeleccionExportar() As String
Dim i As Integer
Dim strField  As String
Dim strValues As String

    For i = LBound(lmCampoOperadorValor) To UBound(lmCampoOperadorValor)
        If lmCampoOperadorValor(i).strOperador <> "" Then
            If lmCampoOperadorValor(i).strOperador = "->" Then
                strField = strField + Me.nmTabla + "." + _
                lmCampoOperadorValor(i).strCampo + " AS [" _
            + lmCampoOperadorValor(i).strnmCampoExterno + "] ,"
            End If
        End If
    Next
    If Not strField = "" Then
       ArmarSeleccionExportar = Left(strField, Len(strField) - 1)
    Else
        ArmarSeleccionExportar = " " + Me.nmTabla & ".* "
    End If
    
End Function

            
' insert
Private Function ArmarInsercion() As String
Dim i As Integer
Dim strField  As String
Dim strValues As String


    For i = LBound(lmCampoOperadorValor) To UBound(lmCampoOperadorValor)
        If lmCampoOperadorValor(i).strOperador = "<-" Then
            strField = strField + lmCampoOperadorValor(i).strCampo + " ,"
            strValues = strValues + lmCampoOperadorValor(i).vrtValor + " ,"
        End If
    Next
    
    If Not strField = "" Then
       ArmarInsercion = " (" + Left(strField, Len(strField) - 1) + ") "
       ArmarInsercion = ArmarInsercion + " VALUES (" + Left(strValues, Len(strValues) - 1) + ")"
    End If
    
End Function


' update
Private Function ArmarAsignacion() As String
Dim i As Integer
Dim strSET As String
    
    strSET = ""
    For i = LBound(lmCampoOperadorValor) To UBound(lmCampoOperadorValor)
        If lmCampoOperadorValor(i).strOperador = "<-" Then
            strSET = strSET + Me.nmTabla + "." + lmCampoOperadorValor(i).strCampo + " "
            strSET = strSET + " = "
            strSET = strSET + lmCampoOperadorValor(i).vrtValor + " ,"
        End If
    Next

    If Not strSET = "" Then
       ArmarAsignacion = Left(strSET, Len(strSET) - 1)
    End If
    
End Function


Private Function ArmarCondicion() As String
Dim i As Integer
Dim strWhere As String
Dim strLike  As String
Dim j    As Integer

    strWhere = ""
    strLike = ""

    For i = LBound(lmCampoOperadorValor) To UBound(lmCampoOperadorValor)
        If lmCampoOperadorValor(i).strOperador = "=" Or _
           lmCampoOperadorValor(i).strOperador = "LIKE" Or _
           lmCampoOperadorValor(i).strOperador = "LIKE IZQ" Or _
           lmCampoOperadorValor(i).strOperador = "LIKE DER" Or _
           lmCampoOperadorValor(i).strOperador = ">=" Or _
           lmCampoOperadorValor(i).strOperador = "<=" Or _
           lmCampoOperadorValor(i).strOperador = "=>" Or _
           lmCampoOperadorValor(i).strOperador = "=<" Or _
           lmCampoOperadorValor(i).strOperador = "<>" Or _
           lmCampoOperadorValor(i).strOperador = ">" Or _
           lmCampoOperadorValor(i).strOperador = "<" Or _
           lmCampoOperadorValor(i).strOperador = "IS NULL" Then
           
                If lmCampoOperadorValor(i).strOperador = "LIKE" Or _
                   lmCampoOperadorValor(i).strOperador = "LIKE IZQ" Or _
                   lmCampoOperadorValor(i).strOperador = "LIKE DER" Then
                        Select Case ldsMotorBD
                        Case "SQL_SERVER"
                            strLike = ArmarLikeSegunMotorSQL _
                                (lmCampoOperadorValor(i).vrtValor, _
                                lmCampoOperadorValor(i).strCampo, _
                                lmCampoOperadorValor(i).strOperador, lmCampoOperadorValor(i).strConjuncion)
                            strWhere = strWhere + strLike
                        Case "MDB"
                            strLike = ArmarLikeSegunMotorMDB _
                                (lmCampoOperadorValor(i).vrtValor, _
                                lmCampoOperadorValor(i).strCampo, _
                                lmCampoOperadorValor(i).strOperador, lmCampoOperadorValor(i).strConjuncion)
                            strWhere = strWhere + strLike
                        Case "MY_SQL"
                            strLike = ArmarLikeSegunMotorMySQL _
                                (lmCampoOperadorValor(i).vrtValor, _
                                lmCampoOperadorValor(i).strCampo, _
                                lmCampoOperadorValor(i).strOperador, lmCampoOperadorValor(i).strConjuncion)
                                strWhere = strWhere + strLike
                        Case Else
                    End Select
                Else
                    If lmCampoOperadorValor(i).strOperador = "IS NULL" Then
                        strWhere = strWhere + Me.nmTabla + "." + lmCampoOperadorValor(i).strCampo + " "
                        strWhere = strWhere + lmCampoOperadorValor(i).strOperador + " "
                        strWhere = strWhere + lmCampoOperadorValor(i).strConjuncion + " "
                    Else
                        Select Case ldsMotorBD
                        Case "SQL_SERVER"
                            strWhere = strWhere + Me.nmTabla + "." + lmCampoOperadorValor(i).strCampo + " "
                        Case "MY_SQL"
                            If lmCampoOperadorValor(i).strTipo = "FLOAT" Or _
                                lmCampoOperadorValor(i).strTipo = "DOUBLE" Then
                                strWhere = strWhere + " CONVERT(" + Me.nmTabla + "." + lmCampoOperadorValor(i).strCampo + ",DECIMAL) "
                            Else
                                strWhere = strWhere + Me.nmTabla + "." + lmCampoOperadorValor(i).strCampo + " "
                            End If
                        Case Else
                            strWhere = strWhere + Me.nmTabla + "." + lmCampoOperadorValor(i).strCampo + " "
                        End Select
                        strWhere = strWhere + lmCampoOperadorValor(i).strOperador + " "
                        strWhere = strWhere + lmCampoOperadorValor(i).vrtValor + " "
                        strWhere = strWhere + lmCampoOperadorValor(i).strConjuncion + " "
                            
                    End If
                End If
        End If
    Next
    
    strWhere = Trim(strWhere)
    
    If Right(strWhere, 1) = "(" Then
        strWhere = Left(strWhere, Len(strWhere) - 1)
    End If
    
    If Right(Trim(strWhere), 4) = " AND" Then
       strWhere = Left(strWhere, Len(strWhere) - 4)
    End If

    ' Fuerzo a que siempre debe existir al menos un campo que realize WHERE
    ArmarCondicion = " WHERE " + strWhere
    
    
End Function




Private Function ArmarLikeSegunMotorSQL _
                (pValor As String, pstrCampo As String, _
                tpLike As String, pstrConjuncion As String) As String
Dim strLike    As String


        objDiccionariodeDatos.ObtenerCampo Me.nmTabla, pstrCampo
        Select Case UCase(objDiccionariodeDatos.tpTipo)
        Case "BIT", "COUNTER", "DOUBLE", "INTEGER":
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorSQL = strLike + pstrConjuncion
        Case "SMALLDATETIME", "DATETIME"
            strLike = " CONVERT(char," + pstrCampo + ",103) LIKE ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorSQL = strLike + pstrConjuncion
        Case "VARCHAR"
            pValor = Mid(pValor, 2, Len(pValor) - 2)
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorSQL = strLike + pstrConjuncion
        Case Else
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorSQL = strLike + pstrConjuncion
        End Select
        
    
End Function



Private Function ArmarLikeSegunMotorMDB _
                (pValor As String, pstrCampo As String, _
                tpLike As String, pstrConjuncion As String) As String
Dim strLike    As String

        objDiccionariodeDatos.ObtenerCampo Me.nmTabla, pstrCampo
        Select Case UCase(objDiccionariodeDatos.tpTipo)
        Case "BIT", "COUNTER", "DOUBLE", "INTEGER":
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorMDB = strLike + pstrConjuncion
        Case "SMALLDATETIME", "DATETIME"
            pValor = Mid(pValor, 2, Len(pValor) - 2)
            strLike = " cstr(" + pstrCampo + ") LIKE ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorMDB = strLike + pstrConjuncion
        Case "VARCHAR"
            pValor = Mid(pValor, 2, Len(pValor) - 2)
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorMDB = strLike + pstrConjuncion
        Case Else
            pValor = Mid(pValor, 2, Len(pValor) - 2)
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorMDB = strLike + pstrConjuncion
        End Select
        
    
End Function


Private Function InsertarOperadorenLIKE(pValor As String, _
tpLike As String, Caracter As String) As String

    pValor = Replace(pValor, "%", Caracter, , , vbTextCompare)
    pValor = Replace(pValor, "*", Caracter, , , vbTextCompare)
    pValor = Replace(pValor, " ", Caracter, , , vbTextCompare)
    pValor = Replace(pValor, ".", Caracter, , , vbTextCompare)

    Select Case tpLike
    Case "LIKE IZQ"
        InsertarOperadorenLIKE = Caracter + Replace(pValor, "'%'", "")
    Case "LIKE DER"
        InsertarOperadorenLIKE = Replace(pValor, "'%'", "", , , vbTextCompare) + Caracter
    Case Else
        InsertarOperadorenLIKE = Caracter + Replace(pValor, "'%'", "", , , vbTextCompare) + Caracter
    End Select
    
End Function


Private Function ArmarLikeSegunMotorMySQL _
                (pValor As String, pstrCampo As String, _
                tpLike As String, pstrConjuncion As String) As String
Dim strLike    As String

        
        
        objDiccionariodeDatos.ObtenerCampo Me.nmTabla, pstrCampo
        Select Case UCase(objDiccionariodeDatos.tpTipo)
        Case "BIT", "COUNTER", "DOUBLE", "INTEGER":
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorMySQL = strLike + pstrConjuncion
        Case "SMALLDATETIME", "DATETIME"
            pValor = Mid(pValor, 2, Len(pValor) - 2)
            pValor = Replace(pValor, "/", "-", , , vbTextCompare)
            strLike = " CONVERT(" + pstrCampo + ",CHAR) LIKE ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorMySQL = strLike + pstrConjuncion
        Case "VARCHAR"
            pValor = Mid(pValor, 2, Len(pValor) - 2)
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorMySQL = strLike + pstrConjuncion
        Case Else
            pValor = Mid(pValor, 2, Len(pValor) - 2)
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorMySQL = strLike + pstrConjuncion
        End Select
        
    
End Function



' que se obtengan del acceso a los datos
Public Function rs_resultados_valor(pnom_valor As Variant) As String
 
    If IsNull(Me.rs_resultados(pnom_valor).value) Then
        Select Case Me.rs_resultados(pnom_valor).Type
        Case adChar, adBSTR, adVariant, _
             adLongVarChar, adLongVarWChar, adLongVarBinary, adVarBinary, _
             adVarChar, adVarWChar, adWChar, adDate
             rs_resultados_valor = vbNullString
        Case adCurrency, adDecimal, adDouble, adNumeric, adSingle, _
             adDBDate, adDBTimeStamp, adDBTime, adBoolean, adBigInt, _
             adInteger, adSmallInt, adTinyInt, adUnsignedBigInt, _
             adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt
             rs_resultados_valor = 0
        End Select
    Else
        Select Case Me.rs_resultados(pnom_valor).Type
        Case adChar, adLongVarChar, adLongVarWChar, adVarChar, adVarWChar, adWChar
             rs_resultados_valor = Trim(Me.rs_resultados(pnom_valor).value)
        Case adBoolean
            If Me.rs_resultados(pnom_valor).value Then
               rs_resultados_valor = "1"
            Else
               rs_resultados_valor = "0"
            End If
        Case Else
             rs_resultados_valor = Me.rs_resultados(pnom_valor).value
        End Select
    End If
    
End Function


Public Function ObtenerMaxPrimaryKey() As Variant
Dim strSQL As String

    strSQL = "SELECT " + ArmarMaxId() + " FROM " + Me.nmTabla + ArmarCondicion() + " ; "


    If Not objbasededatos.ExecuteSQL(strSQL) Then
        lerror = objbasededatos.Error
        Err.Raise "1", "Objbasededatos", "Error al obtener el siguiente comando " + strSQL
        Exit Function
    End If
    
    If objbasededatos.recordAffected < 1 Then
        ObtenerMaxPrimaryKey = 0
    End If
    
    ReDim mCampoOperadorValor(0 To 0)
    If objbasededatos.rs_resultados.EOF Then
        ObtenerMaxPrimaryKey = 0
    Else
        If IsNull(objbasededatos.rs_resultados(0).value) Then
            ObtenerMaxPrimaryKey = 0
        Else
            ObtenerMaxPrimaryKey = objbasededatos.rs_resultados(0).value
        End If
    End If
        
    objbasededatos.close_resultados
    

End Function


' selección
Private Function ArmarMaxId() As String
Dim i As Integer
Dim strField  As String
Dim strValues As String

    For i = LBound(lmCampoOperadorValor) To UBound(lmCampoOperadorValor)
        If lmCampoOperadorValor(i).strOperador <> "" Then
            If lmCampoOperadorValor(i).strOperador = "->" Then
                strField = strField + " MAX(" + lmCampoOperadorValor(i).strCampo + ") ,"
            End If
        End If
    Next
    If Not strField = "" Then
       ArmarMaxId = Left(strField, Len(strField) - 1)
    End If
    

End Function


Public Function Seleccionar_Pagina(pnrPage As Integer) As Boolean
Dim strSQL            As String
Dim strCondicion      As String

    lqtPages = 0
    lnrPage = 0
    strCondicion = ArmarCondicion()
    
    Select Case ldsMotorBD
    Case "MY_SQL"
        strSQL = " SELECT count(*) as  Cantidad_Registros FROM " + Me.nmTabla + " " + strCondicion
        If Not objbasededatos.ExecuteSQL(strSQL) Then
            LimpiarCamposLikes
            lerror = objbasededatos.Error
            Seleccionar_Pagina = False
            Exit Function
        End If
        
        If lqtRowsbyPage <= 0 Then
            lqtRowsbyPage = 10
        End If
        
        If objbasededatos.rs_resultados("Cantidad_Registros").value = 0 Then
            ' no hay registros
            LimpiarCamposLikes
            Seleccionar_Pagina = True
            Exit Function
        End If
        lqtPages = objbasededatos.rs_resultados("Cantidad_Registros").value / lqtRowsbyPage
        If lqtPages = 0 Then
            lqtPages = 1
        End If
        If pnrPage > lqtPages Then
            LimpiarCamposLikes
            lerror = "El página seleccinada no es válida"
            Seleccionar_Pagina = False
            On Error GoTo 0
            Exit Function
        End If
       lnrPage = pnrPage
        ' LIMIT (nrPagina - 1) * tamanio_pagina, tamanio_pagina
        strSQL = " SELECT " + ArmarSeleccion() + " FROM " + Me.nmTabla + _
        " " + strCondicion + ArmarOrderBY + " LIMIT " + _
        CStr(CInt((Me.nrPage - 1) * lqtRowsbyPage)) + "," + CStr(lqtRowsbyPage) + ";"
    Case "MDB"
        strSQL = " SELECT count(*) as  Cantidad_Registros FROM " + Me.nmTabla + " " + strCondicion
        If Not objbasededatos.ExecuteSQL(strSQL) Then
            LimpiarCamposLikes
            lerror = objbasededatos.Error
            Seleccionar_Pagina = False
            Exit Function
        End If
        
        If lqtRowsbyPage <= 0 Then
            lqtRowsbyPage = 10
        End If
        
        If objbasededatos.rs_resultados("Cantidad_Registros").value = 0 Then
            ' no hay registros
            LimpiarCamposLikes
            Seleccionar_Pagina = True
            Exit Function
        End If
        lqtPages = objbasededatos.rs_resultados("Cantidad_Registros").value / lqtRowsbyPage
        If lqtPages = 0 Then
            lqtPages = 1
        End If
        If pnrPage > lqtPages Then
            LimpiarCamposLikes
            lerror = "El página seleccinada no es válida"
            Seleccionar_Pagina = False
            On Error GoTo 0
            Exit Function
        End If
       lnrPage = pnrPage
        ' LIMIT (nrPagina - 1) * tamanio_pagina, tamanio_pagina
        strSQL = " SELECT TOP " + CStr(lqtRowsbyPage) + " " + ArmarSeleccion() + " FROM " + Me.nmTabla + _
        " " + strCondicion + ArmarOrderBY
    Case "SQL_SERVER"
        strSQL = " SELECT TOP " + CStr(lnrTOP) + " " + ArmarSeleccion() + " FROM " + Me.nmTabla + _
        " " + strCondicion + ArmarOrderBY
    End Select

    strUltimoWhere = strCondicion
    ' Objbasededatos.close_resultados
           
    On Error Resume Next
    If Not objbasededatos.ExecuteSQL(strSQL) Then
        LimpiarCamposLikes
        lerror = objbasededatos.Error
        Seleccionar_Pagina = False
        On Error GoTo 0
        Exit Function
    End If
    LimpiarCamposLikes
    Seleccionar_Pagina = True
    
End Function


Private Sub LimpiarCamposLikes()
Dim i As Integer

    For i = LBound(lmCampoOperadorValor) To UBound(lmCampoOperadorValor)
        If lmCampoOperadorValor(i).strOperador = "LIKE" Or _
           lmCampoOperadorValor(i).strOperador = "LIKE IZQ" Or _
           lmCampoOperadorValor(i).strOperador = "LIKE DER" Or _
           lmCampoOperadorValor(i).strOperador = "=" Then
                lmCampoOperadorValor(i).strCampo = ""
                lmCampoOperadorValor(i).strOperador = ""
                lmCampoOperadorValor(i).strConjuncion = ""
                lmCampoOperadorValor(i).strnmCampoExterno = ""
                lmCampoOperadorValor(i).vrtValor = ""
                lmCampoOperadorValor(i).strTipo = ""
                lmCampoOperadorValor(i).strOrdenar = ""
        End If
    Next i
    
End Sub




Private Sub Class_Initialize()
    lqtRowsbyPage = 100
    lnrTOP = 100
    ldsMotorBD = "SQL_SERVER"
End Sub

