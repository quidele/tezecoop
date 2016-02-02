VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CStoredProceduresIO"
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
Private Type rcCampoValor
    strCampo               As String
    vrtValor               As String
End Type

Private ltpModoActual               As String

' declaracion de variables locales, privadas de la clase
Private lmCampoValor()           As rcCampoValor
Private lObjbasededatos          As Object
Private lnmStoredProcedure       As String
Private lerror                   As String
Private lobjDiccionariodedatos   As Object
Private lrs                      As Object
Private ldsMotorBD               As String
Public strUltimoLlamadaSP        As String
Public lobjConfigRegional        As CConfigRegional

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

Property Get nmStoredProcedure() As String
    nmStoredProcedure = lnmStoredProcedure
End Property

Property Let nmStoredProcedure(Valor As String)
    lnmStoredProcedure = Valor
    ReDim lmCampoValor(0 To 0)
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


Property Set DiccionarioDeDatos(Valor As Object)
    Set lobjDiccionariodedatos = Valor
End Property


' Tomar Parametro que introduce desde afuera
Public Function setearCampoValor _
(pstrCampo As String, ByVal pvrtValor As Variant) As Boolean

    
    If Not lobjDiccionariodedatos.ObtenerCampo(Me.nmStoredProcedure, pstrCampo) Then
        lerror = "El nombre Campo no existe en el Diccionario"
        Debug.Assert (Err)
        Exit Function
    End If

    ReDim Preserve lmCampoValor(0 To UBound(lmCampoValor) + 1)
    lmCampoValor(UBound(lmCampoValor)).strCampo = pstrCampo
       
    'controlamos el tamaño
    Select Case UCase(Trim(lobjDiccionariodedatos.tpTipo))
    Case "VARCHAR", "CHAR"
        If Not (pvrtValor = "") Then
            pvrtValor = Left(pvrtValor, CDbl(lobjDiccionariodedatos.nrTamanio))
        End If
    End Select
    
    pvrtValor = lObjbasededatos.FormatearValorSQL(pvrtValor, lobjDiccionariodedatos.tpTipo, lobjDiccionariodedatos.nmCampo)
        
    'ASIGNAMOS EL VALOR
    lmCampoValor(UBound(lmCampoValor)).vrtValor = pvrtValor
    setearCampoValor = True
    
End Function


Public Function ExecSP() As Boolean
Dim strParametros      As String

    strParametros = ArmarParametros()

    If Not lrs Is Nothing Then
        If lrs.State = adStateOpen Then
            lrs.Close
        End If
        Set lrs = Nothing
    End If
    
    
           
    On Error Resume Next
    If Not lObjbasededatos.ExecStoredProcedures_Params(Me.nmStoredProcedure, strParametros) Then
        lerror = lObjbasededatos.Error
        ExecSP = False
        On Error GoTo 0
        Exit Function
    End If
    On Error GoTo 0
    
    Set lrs = lObjbasededatos.rs_resultados

    ReDim mCampoValor(0 To 0)
    ExecSP = True
    

End Function



' update
Private Function ArmarParametros() As String
Dim i As Integer
Dim strSET As String
    
    strSET = ""
    For i = LBound(lmCampoValor) To UBound(lmCampoValor)
            If Not lmCampoValor(i).strCampo = "" Then
                Select Case Me.dsMotorBD
                Case "MY_SQL"
                    strSET = strSET + " "
                Case Else
                    strSET = strSET + lmCampoValor(i).strCampo
                    strSET = strSET + " = "
                End Select
                strSET = strSET + lmCampoValor(i).vrtValor + " ,"
            End If
    Next
    
    If Not strSET = "" Then
       ArmarParametros = Left(strSET, Len(strSET) - 1)
    End If
    

End Function



' Esta function realiza el formateo de los parametros de tipo char,varchar
Public Function FormatearValorSQL(pValor As Variant, pTipo As String, Optional pnmCampo As String) As String
Dim strValor
Dim dia    As String
Dim mes    As String
Dim anio   As String


    If IsNull(pValor) Then
        FormatearValorSQL = "null"
        Exit Function
    End If
    
    If Trim(CStr(pValor)) = "" Then
        FormatearValorSQL = "null"
        Exit Function
    End If
    
    Select Case UCase(pTipo)
    Case "BIT", "INT", "SMALLINT", "NUMERIC", "REAL", "NUMERIC", "INTEGER", "COUNTER"
            Select Case lobjConfigRegional.sDecimal
            Case "."
                ' extraigo el simbolo de miles
                pValor = Replace(Trim(pValor), ",", "", , , vbTextCompare)
                FormatearValorSQL = pValor
            Case ","
                pValor = Replace(Trim(pValor), ".", "", , , vbTextCompare)
                FormatearValorSQL = Replace(Trim(pValor), ",", ".", , , vbTextCompare)
            Case Else
                MsgBox "La configuración regional de windows no es apropiada " + _
                       " para este sistema. El sistema no puede continuar ejecutandose.", vbCritical + vbDefaultButton1, "Atención"
                End
            End Select
            FormatearValorSQL = pValor
    Case "DATETIME"
          If pValor = "  /  /       :  :  " Or pValor = "/  /       :  :" Then
            FormatearValorSQL = "null"
          Else
            Select Case Me.dsMotorBD
            Case "MY_SQL"
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/DD HH:MM:SS") + Chr(39)
            Case "SQL_SERVER"
                FormatearValorSQL = Chr(39) + Format(pValor, "DD/MM/YYYY HH:MM:SS") + Chr(39)
            Case Else
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/DD HH:MM:SS") + Chr(39)
            End Select
          End If
    Case "SMALLDATETIME"
          If pValor = "/  /" Or pValor = "__/__/____" Then
            FormatearValorSQL = "null"
          Else
            Select Case Me.dsMotorBD
            Case "MY_SQL"
                If Len(pValor) <> 10 Then
                    FormatearValorSQL = "null"
                    Exit Function
                End If
                dia = CStr(Day(pValor))
                If Len(dia) = 1 Then dia = "0" + dia
                mes = CStr(Month(pValor))
                If Len(mes) = 1 Then mes = "0" + mes
                anio = CStr(Year(pValor))
                FormatearValorSQL = Chr(39) + anio + "/" + mes + "/" + dia + Chr(39)
            Case "SQL_SERVER"
                FormatearValorSQL = Chr(39) + Format(pValor, "DD/MM/YYYY") + Chr(39)
            Case Else
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/YY") + Chr(39)
            End Select
          End If
    Case "CHAR", "VARCHAR"
        FormatearValorSQL = Chr(39) + Replace(Trim(CStr(pValor)), "'", "''", , , vbTextCompare) + Chr(39)
    Case "DOUBLE", "FLOAT"
        Select Case lobjConfigRegional.sDecimal
        Case "."
            ' extraigo el simbolo de miles
            strValor = Replace(Trim(CStr(pValor)), ",", "", , , vbTextCompare)
            FormatearValorSQL = strValor
        Case ","
            strValor = Replace(Trim(CStr(pValor)), ".", "", , , vbTextCompare)
            FormatearValorSQL = Replace(Trim(strValor), ",", ".", , , vbTextCompare)
        Case Else
            MsgBox "La configuración regional de windows no es apropiada " + _
                   " para este sistema. El sistema no puede continuar ejecutandose.", vbCritical + vbDefaultButton1, "Atención"
            End
        End Select
        
    Case Else
        MsgBox "Falto formatearlo, el sistema no puede continuar. Debera ingresar el tipo de dato para el campo '" + pnmCampo + "'.", vbCritical + vbDefaultButton1, "Atención"
        End
    End Select
    
End Function


