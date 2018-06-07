VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CAFIP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False


Option Explicit


Public Function obtenerTipodeComprobante() As String

    obtenerTipodeComprobante = "01"
    
End Function


' - C.U.I.T.  (Clave Unica de Identificación Tributaria) del emisor (11 caracteres).
' - Código de tipo de comprobante  (2 caracteres).
' - Punto de venta  (4 caracteres).
' - Código de Autorización de Impresión (14 caracteres).
' - Fecha de vencimiento  (8 caracteres).
' - Dígito verificador    (1 carácter).


Public Function StrToI2of5(tcString As String) As String
  ' FUNCTION _StrToI2of5(tcString) * INTERLEAVED 2 OF 5
  ' Convierte un string para ser impreso con fuente True Type "PF Interleaved 2 of 5"
  ' ó "PF Interleaved 2 of 5 Wide" ó "PF Interleaved 2 of 5 Text"
  ' Solo caracteres numéricos
  Dim lcStart As String
  Dim lcStop As String
  Dim lcRet As String
  Dim lcCheck As String
  Dim lcCar As String
  Dim lnLong As Long
  Dim lnI As Integer
  Dim lnSum As Integer
  Dim lnAux As Integer
  Dim lnCount As Integer
  
  lcStart = Chr(40)
  lcStop = Chr(41)
  lcRet = Trim(tcString)
  '--- Genero dígito de control
  lnLong = Len(lcRet)
  lnSum = 0
  lnCount = 1
  
  For lnI = lnLong To 1 Step -1
    lnSum = lnSum + Val(Mid(lcRet, lnI, 1)) * IIf(lnCount Mod 2 = 0, 1, 3)
    lnCount = lnCount + 1
  Next lnI
  
  lnAux = lnSum Mod 10
  lcRet = lcRet & Trim(Str(IIf(lnAux = 0, 0, 10 - lnAux)))
  lnLong = Len(lcRet)
  '--- La longitud debe ser par
  If lnLong Mod 2 <> 0 Then
    lcRet = "0" & lcRet
    lnLong = Len(lcRet)
  End If
  '--- Convierto los pares a caracteres
  lcCar = ""
  For lnI = 1 To lnLong Step 2
    If Val(Mid(lcRet, lnI, 2)) < 50 Then
      lcCar = lcCar + Chr(Val(Mid(lcRet, lnI, 2)) + 48)
    Else
      lcCar = lcCar + Chr(Val(Mid(lcRet, lnI, 2)) + 142)
    End If
  Next lnI
  '--- Armo código
  lcRet = lcStart + lcCar + lcStop
  StrToI2of5 = lcRet
End Function



Public Function DigitoVerificador(pstrDato As String) As String
    Dim nTamanio    As Integer
    Dim i           As Integer
    Dim iAcumulado  As Integer
    Dim iTotal      As Integer
    
    pstrDato = Trim(pstrDato)
    nTamanio = Len(pstrDato)
    
    'ETAPA 1: Sumar todos los caracteres impares
    iAcumulado = 0
    For i = 1 To CInt(nTamanio / 2)
        If (i * 2 - 1) <= nTamanio Then iAcumulado = iAcumulado + CInt(Mid(pstrDato, i * 2 - 1, 1))
    Next
    
    'ETAPA 2: Multiplica por 3
    iTotal = iAcumulado * 3
        
    'ETAPA 3: Sumar todos los caracteres pares
    iAcumulado = 0
    For i = 1 To CInt(nTamanio / 2)
        If i * 2 <= nTamanio Then iAcumulado = iAcumulado + CInt(Mid(pstrDato, i * 2, 1))
    Next
    
    'ETAPA 4: Suma los resultados de Etapa 2 y 3
    iTotal = iTotal + iAcumulado
    
    'ETAPA 5: Busca el Numero que sumado al resultado de multiplo de 10
    DigitoVerificador = Trim(Str(10 - CInt(Right(Str(iTotal), 1))))
    
End Function

' Version 1.4
Public Function CalcularSubtotal(ptpIVA As String, pvlMonto As Single, pvlAlicuota As Single) As Single

    objSPs.nmStoredProcedure = "SP_CalcularSubtotalIVA"
    objSPs.setearCampoValor "@tpCategoriaIVA_param", ptpIVA
    objSPs.setearCampoValor "@vlMonto_param", pvlMonto
    objSPs.setearCampoValor "@vlAlicuota_param", pvlAlicuota
    
    If Not objSPs.ExecSP() Then
        MsgBox objSPs.Error, vbCritical, "Atención"
        End
    End If

    CalcularSubtotal = objSPs.rs_resultados("subtotal")

End Function


' Version 1.4
Public Function CalcularIVA(ptpIVA As String, pvlMonto As Single, pvlAlicuota As Single, Optional pflPrecio_menos_iva As Integer = 1) As Single

    objSPs.nmStoredProcedure = "SP_CalcularIVA"
    objSPs.setearCampoValor "@tpCategoriaIVA_param", ptpIVA
    objSPs.setearCampoValor "@vlMonto_param", pvlMonto
    objSPs.setearCampoValor "@vlAlicuota_param", pvlAlicuota
    objSPs.setearCampoValor "@precio_menos_iva_param", pflPrecio_menos_iva
    
    
    If Not objSPs.ExecSP() Then
        MsgBox objSPs.Error, vbCritical, "Atención"
        End
    End If

    CalcularIVA = objSPs.rs_resultados("IVA")
    
End Function


' version 1.4
Public Function obtenerAlicuotaIVA(ptpIVA As String) As Single

    objSPs.nmStoredProcedure = "SP_obtenerAlicuotaIVA"
    objSPs.setearCampoValor "@tpCategoriaIVA_param", ptpIVA
    
    If Not objSPs.ExecSP() Then
        MsgBox objSPs.Error, vbCritical, "Atención"
        End
    End If

    obtenerAlicuotaIVA = objSPs.rs_resultados("PORC_IVA")
    
End Function




' version 1.4
Public Function Supera_KM_IVA_segunMonto(ptpIVA As String, pvlKilometros As Long, pvlMonto As Single, ptpComprobante As String) As Boolean

    objSPs.nmStoredProcedure = "SP_Supera_KM_IVA_segunMonto_2_0"
    objSPs.setearCampoValor "@tpCategoriaIVA_param", ptpIVA
    objSPs.setearCampoValor "@vlKilometros_param", pvlKilometros
    objSPs.setearCampoValor "@vlMonto_param", pvlMonto
    If Not objSPs.ExecSP() Then
        MsgBox objSPs.Error, vbCritical, "Atención"
        End
    End If
    
    If objSPs.rs_resultados("Respuesta") = "S" Then
        Supera_KM_IVA_segunMonto = True
    Else
        Supera_KM_IVA_segunMonto = False
    End If
    
    
End Function


Public Function obtenerKM_IVA_segunMonto(ptpIVA As String, pvlKilometros As Long, pvlMonto As Single) As Boolean

    objSPs.nmStoredProcedure = "SP_Supera_KM_IVA_segunMonto_2_0"
    objSPs.setearCampoValor "@tpCategoriaIVA_param", ptpIVA
    objSPs.setearCampoValor "@vlKilometros_param", pvlKilometros
    objSPs.setearCampoValor "@vlMonto_param", pvlMonto
    If Not objSPs.ExecSP() Then
        MsgBox objSPs.Error, vbCritical, "Atención"
        End
    End If
    obtenerKM_IVA_segunMonto = objSPs.rs_resultados("Kilometros")
    
    
End Function


Public Function preguntaOperadora(ptpIVA As String, pvlKilometros As Long, pvlMonto As Single) As Boolean

    objSPs.nmStoredProcedure = "SP_Supera_KM_IVA_segunMonto_2_0"
    objSPs.setearCampoValor "@tpCategoriaIVA_param", ptpIVA
    objSPs.setearCampoValor "@vlKilometros_param", pvlKilometros
    objSPs.setearCampoValor "@vlMonto_param", pvlMonto
    If Not objSPs.ExecSP() Then
        MsgBox objSPs.Error, vbCritical, "Atención"
        End
    End If
    
    If objSPs.rs_resultados("Pregunta") = "S" Then
        preguntaOperadora = True
    Else
        preguntaOperadora = False
    End If
    
    
End Function


' verificar la caducidad de los numeros de cai
Public Function verificarVencimientoCAI(pdtVencimiento As Date) As Boolean

    If pdtVencimiento < Date Then
        verificarVencimientoCAI = False
    Else
        verificarVencimientoCAI = True
    End If

End Function

Public Function verificarCAI(pnrCAI As String) As Boolean

    If pnrCAI = "" Or pnrCAI = "0" Then
        verificarCAI = False
    Else
        verificarCAI = True
    End If

End Function

' verificar la caducidad de los numeros de cai
Public Sub mostrarTalonariosVencimientoCAI()
Dim strMSG As String

        If Not objbasededatos.ExecStoredProcedures("sco_validarVencimientosCAI_v4_1") Then
            MsgBox "No se pudo validar las fechas de CAI", vbInformation, "Atención"
        End If
        
        If objbasededatos.rs_resultados.EOF Then Exit Sub
        
        strMSG = "Existen números de CAI vencidos o  por vencer " + vbCrLf
        
        Do Until objbasededatos.rs_resultados.EOF
            strMSG = strMSG + "Nro. de puesto: " + CStr(objbasededatos.rs_resultados("nrPuesto")) + " - "
            strMSG = strMSG + objbasededatos.rs_resultados("dsPuesto") + " - "
            strMSG = strMSG + " CAI Nro: " + CStr(objbasededatos.rs_resultados("nrCAI")) + " - "
            strMSG = strMSG + " Fecha Vencimiento:  " + CStr(objbasededatos.rs_resultados("dtVencimintoCAI"))
            strMSG = strMSG + vbCrLf
            objbasededatos.rs_resultados.MoveNext
        Loop

        MsgBox strMSG, vbInformation + vbDefaultButton1, "Atención"
        
        
End Sub



Public Function CalcularCoeficienteTarjeta(ByVal vlIVA As Double, ByVal vlPorcentajeIVA As Double, ByVal vlPorcentajeTarjeta As Double) As Double
Dim resultado As Double
    
    If vlIVA = 0 Then
        CalcularCoeficienteTarjeta = 1
        Return
    End If
    
    
    resultado = 1 / ((2 + vlPorcentajeIVA / 100) + (vlPorcentajeTarjeta / 100) - (1 + vlPorcentajeIVA / 100) * (1 + vlPorcentajeTarjeta / 100))
    CalcularCoeficienteTarjeta = resultado

End Function
