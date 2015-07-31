VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTablasIO"
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
    strnmCampoExterno      As String
    strOrdenar             As String
End Type

Private ltpModoActual               As String

' declaracion de variables locales, privadas de la clase
Private lmCampoOperadorValor()   As rcCampoOperadorValor
Private lObjbasededatos          As CBasededatos
Private lObjBasededatosMDB       As Object
Private lnmTabla                 As String
Private lerror                   As String
Private lobjDiccionariodedatos   As New CDiccionariodeDatos
Private lrs                      As Object
Private ldsMotorBD               As String
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
    Set rs_resultados = lrs
End Property

' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property

Property Get nmTabla() As String
    nmTabla = lnmTabla
End Property

Property Let nmTabla(Valor As String)
    lnmTabla = Valor
    ReDim lmCampoOperadorValor(0 To 0)
End Property


Property Get dsMotorBD() As String
    dsMotorBD = ldsMotorBD
End Property

Property Let dsMotorBD(Valor As String)
    ldsMotorBD = Valor
End Property


Property Set Basededatos(Valor As Object)
    Set lObjbasededatos = Valor
End Property


Property Set Basededatos_Local(Valor As Object)
    Set lObjBasededatosMDB = Valor
End Property

Property Set DiccionarioDeDatos(Valor As CDiccionariodeDatos)
    Set lobjDiccionariodedatos = Valor
End Property


' Tomar Parametro que introduce desde afuera
Public Function setearCampoOperadorValor _
(pstrCampo As String, _
pstrOperador As String, pvrtValor As String, _
Optional pstrConjuncion As String, _
Optional pstrOrdenar As String) As Boolean

    
    If Not lobjDiccionariodedatos.ObtenerCampo(Me.nmTabla, pstrCampo) Then
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
        Debug.Assert (Err)
        Exit Function
    End If

    ' If (Trim(pvrtValor) = "*" Or Trim(pvrtValor) = "%") And Trim(pstrOperador) = "LIKE" Then
    '    lerror = "El valor no existe"
    '    Exit Function
    ' End If
    
    ReDim Preserve lmCampoOperadorValor(0 To UBound(lmCampoOperadorValor) + 1)
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strCampo = pstrCampo
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strOperador = UCase(Trim(pstrOperador))
    Select Case UCase(Trim(objDiccionariodeDatos.tpTipo))
    Case "VARCHAR", "CHAR"
        lmCampoOperadorValor(UBound(lmCampoOperadorValor)).vrtValor = Left(pvrtValor, CDbl(objDiccionariodeDatos.nrTamanio))
    Case Else
        lmCampoOperadorValor(UBound(lmCampoOperadorValor)).vrtValor = pvrtValor
    End Select
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strConjuncion = pstrConjuncion
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strnmCampoExterno = _
    lobjDiccionariodedatos.nmCampoExterno
    lmCampoOperadorValor(UBound(lmCampoOperadorValor)).strOrdenar = pstrOrdenar
    setearCampoOperadorValor = True
    
End Function


Public Function Seleccionar() As Boolean
Dim strSQL            As String
Dim strCondicion      As String

    strCondicion = ArmarCondicion()
    
    strSQL = " SELECT " + ArmarSeleccion() + " FROM " + Me.nmTabla + _
    " " + strCondicion + ArmarOrderBY
    
    strUltimoWhere = strCondicion
    
    If Not lrs Is Nothing Then
        If lrs.State = adStateOpen Then
            lrs.Close
        End If
        Set lrs = Nothing
    End If
    
    ' lObjBasededatos.close_resultados
    On Error Resume Next
    If Not lObjbasededatos.ExecuteSQL(strSQL) Then
        lerror = objbasededatos.Error
        Seleccionar = False
        On Error GoTo 0
        Exit Function
    End If
    
    ' MsgBox "SQL: " + strSQL, vbInformation, "Atención"
    Set lrs = lObjbasededatos.rs_resultados
    lrs.Requery
    ReDim mCampoOperadorValor(0 To 0)
    Seleccionar = True
    
    
End Function



Public Function SeleccionarExportar() As Boolean
Dim strSQL As String

    strSQL = " SELECT " + ArmarSeleccionExportar() + " FROM " + Me.nmTabla + " " + ArmarCondicion()
    
    lObjbasededatos.ExecuteSQL strSQL, adOpenKeyset
    Set lrs = lObjbasededatos.rs_resultados
    
    ReDim mCampoOperadorValor(0 To 0)
        
End Function

Public Function Insertar() As Boolean
Dim strSQL As String
     
     strSQL = ""
     strSQL = ArmarInsercion()
     strSQL = " INSERT " + Me.nmTabla + strSQL
     
     
     ' lObjBasededatos.Execute strSQL, lrecordAffected, adExecuteNoRecords
     
    If Not lObjbasededatos.ExecuteSQL(strSQL, adExecuteNoRecords) Then
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

    lObjbasededatos.close_resultados

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
    
    
    If Not lObjbasededatos.ExecuteSQL(strSQL) Then
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
    
    lObjbasededatos.close_resultados
    ReDim mCampoOperadorValor(0 To 0)
    Actualizar = True
    
End Function

Public Function Eliminar() As Boolean
Dim strSQL As String

    strSQL = " DELETE  FROM " + Me.nmTabla + " " + ArmarCondicion()

    ' lObjBasededatos.Execute strSQL, lrecordAffected, adExecuteNoRecords
    
    If Not lObjbasededatos.ExecuteSQL(strSQL) Then
        lerror = objbasededatos.Error
        Eliminar = False
        Exit Function
    End If
    
    If objbasededatos.recordAffected < 1 Then
        Eliminar = False
        lerror = "No se ha podido eliminar el registro. comando " + strSQL
        Exit Function
    End If
        
    lObjbasededatos.close_resultados
    
    ReDim mCampoOperadorValor(0 To 0)
    Eliminar = True
    
End Function

Private Function esOperador(pstrOperador) As Boolean
    Select Case UCase(Trim(pstrOperador))
    Case "=", "<", ">", "=>", ">=", "<=", "=<", "!=", "<-|=", "<-", "->", "LIKE", "LIKE DER", "LIKE IZQ", "<>", "IS NULL", "IS NOT NULL"
        esOperador = True
    Case Else
    esOperador = False
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
            strValues = strValues + FormatearValor(lmCampoOperadorValor(i).vrtValor, lmCampoOperadorValor(i).strCampo) + " ,"
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
            strSET = strSET + FormatearValor(lmCampoOperadorValor(i).vrtValor, lmCampoOperadorValor(i).strCampo) + " ,"
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

    For i = LBound(lmCampoOperadorValor) To UBound(lmCampoOperadorValor)
        If lmCampoOperadorValor(i).strOperador = "=" Or _
           lmCampoOperadorValor(i).strOperador = "LIKE" Or _
           lmCampoOperadorValor(i).strOperador = "LIKE IZQ" Or _
           lmCampoOperadorValor(i).strOperador = "LIKE DER" Or _
           lmCampoOperadorValor(i).strOperador = ">=" Or _
           lmCampoOperadorValor(i).strOperador = "<=" Or _
           lmCampoOperadorValor(i).strOperador = ">" Or _
           lmCampoOperadorValor(i).strOperador = "<" Or _
           lmCampoOperadorValor(i).strOperador = "=>" Or _
           lmCampoOperadorValor(i).strOperador = "=<" Or _
           lmCampoOperadorValor(i).strOperador = "<>" Or _
           lmCampoOperadorValor(i).strOperador = "IS NULL" Or _
           lmCampoOperadorValor(i).strOperador = "IS NOT NULL" Then
           
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
                        Case Else
                    End Select
                Else
                    Select Case lmCampoOperadorValor(i).strOperador
                    Case "IS NULL", "IS NOT NULL"
                        strWhere = strWhere + Me.nmTabla + "." + lmCampoOperadorValor(i).strCampo + " "
                        strWhere = strWhere + lmCampoOperadorValor(i).strOperador + " "
                        strWhere = strWhere + lmCampoOperadorValor(i).strConjuncion + " "
                    Case Else
                        strWhere = strWhere + Me.nmTabla + "." + lmCampoOperadorValor(i).strCampo + " "
                        strWhere = strWhere + lmCampoOperadorValor(i).strOperador + " "
                        strWhere = strWhere + FormatearValor(lmCampoOperadorValor(i).vrtValor, lmCampoOperadorValor(i).strCampo) + " "
                        strWhere = strWhere + lmCampoOperadorValor(i).strConjuncion + " "
                    End Select
                End If
        End If
    Next

    If Not strWhere = "" Then
       ArmarCondicion = " WHERE " + strWhere
    End If
    
End Function




Public Function FormatearValor _
                (ByVal pValor As String, pstrCampo As String) As String

    If pValor = "" Or pValor = "null" Or pValor = " " Then
        FormatearValor = "null"
    Else
        lobjDiccionariodedatos.ObtenerCampo Me.nmTabla, pstrCampo
        Select Case UCase(lobjDiccionariodedatos.tpTipo)
        Case "BIT", "COUNTER", "DOUBLE", "INTEGER", "NUMERIC":
            pValor = ReemplazarPalabra(pValor, ".", "")
            pValor = ReemplazarPalabra(pValor, ",", ".")
            FormatearValor = pValor
        Case "SMALLDATETIME"
            If pValor = "/  /" Or pValor = "__/__/____" Then
                FormatearValor = "null"
            Else
                FormatearValor = "'" + pValor + "'"
            End If
        Case "DATETIME"
            If pValor = "  /  /       :  :  " Or pValor = "/  /       :  :" Then
                FormatearValor = "null"
            Else
                FormatearValor = "'" + pValor + "'"
            End If
        Case "VARCHAR"
            pValor = ReemplazarPalabra(pValor, "'", "''")
            FormatearValor = "'" + pValor + "'"
        Case Else
            pValor = ReemplazarPalabra(pValor, "'", "''")
            FormatearValor = "'" + pValor + "'"
        End Select
    End If
    
End Function


Public Function ArmarLikeSegunMotorSQL _
                (ByVal pValor As String, pstrCampo As String, _
                tpLike As String, pstrConjuncion As String) As String
Dim strLike    As String

        lobjDiccionariodedatos.ObtenerCampo Me.nmTabla, pstrCampo
        Select Case UCase(lobjDiccionariodedatos.tpTipo)
        Case "BIT", "COUNTER", "DOUBLE", "INTEGER":
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorSQL = strLike + pstrConjuncion
        Case "SMALLDATETIME", "DATETIME"
            strLike = " CONVERT(char," + pstrCampo + ",103) LIKE ('" + InsertarOperadorenLIKE(pValor, tpLike, "%") + "')"
            ArmarLikeSegunMotorSQL = strLike + pstrConjuncion
        Case "VARCHAR"
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

        lobjDiccionariodedatos.ObtenerCampo Me.nmTabla, pstrCampo
        Select Case UCase(lobjDiccionariodedatos.tpTipo)
        Case "BIT", "COUNTER", "DOUBLE", "INTEGER":
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "*") + "')"
            ArmarLikeSegunMotorMDB = strLike + pstrConjuncion
        Case "SMALLDATETIME", "DATETIME"
            strLike = " cstr(" + pstrCampo + ") LIKE ('" + InsertarOperadorenLIKE(pValor, tpLike, "*") + "')"
            ArmarLikeSegunMotorMDB = strLike + pstrConjuncion
        Case "VARCHAR"
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "*") + "')"
            ArmarLikeSegunMotorMDB = strLike + pstrConjuncion
        Case Else
            strLike = " " + pstrCampo + " Like ('" + InsertarOperadorenLIKE(pValor, tpLike, "*") + "')"
            ArmarLikeSegunMotorMDB = strLike + pstrConjuncion
        End Select
        
    
End Function


Private Function InsertarOperadorenLIKE(pValor As String, _
tpLike As String, Caracter As String) As String

    pValor = ReemplazarPalabra(pValor, "%", Caracter)
    pValor = ReemplazarPalabra(pValor, "*", Caracter)
    pValor = ReemplazarPalabra(pValor, " ", Caracter)
    pValor = ReemplazarPalabra(pValor, ".", Caracter)

    Select Case tpLike
    Case "LIKE IZQ"
        InsertarOperadorenLIKE = Caracter + pValor
    Case "LIKE DER"
        InsertarOperadorenLIKE = pValor + Caracter
    Case Else
        InsertarOperadorenLIKE = Caracter + pValor + Caracter
    End Select
    
End Function

