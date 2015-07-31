VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CMovimientosConta"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Private lObjTablasIO                As Object

Public IdMovimiento                 As String
Public dsMovimiento                 As String
Public IdRecibo                     As String
Public cdConcepto                   As String
Public tpConcepto                   As String
Public dsProveedor                  As String
Public dsConcepto                   As String
Public tpOperacion                  As String
Public vlDolares                    As String
Public vlEuros                      As String
Public vlPesos                      As String
Public nrRecibo                     As String
Public nrFactura                    As String
Public nrCaja                       As String
Public dsUsuario                    As String
Public dtMovimiento                 As String
Public IdProveedor                  As String


' Agregados en la Version
Public tpCajaImputacion             As String
Public dsUsuarioCajaPuesto          As String
Public nrCajaPuesto                 As String
Public dsUsuario_Supervisor         As String

Public flOcultado                   As String
Public tpCreadoPor                  As String



' variables privadas
Private lerror                      As String


Property Set ObjTablasIO(Valor As Object)
    Set lObjTablasIO = Valor
End Property


' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property



Public Sub limpiarObjeto()
    
    Me.IdMovimiento = ""
    Me.dsMovimiento = ""
    Me.IdRecibo = ""
    Me.cdConcepto = ""
    Me.tpConcepto = ""
    Me.dsProveedor = ""
    Me.dsConcepto = ""
    Me.tpOperacion = ""
    Me.vlDolares = ""
    Me.vlEuros = ""
    Me.vlPesos = ""
    Me.nrRecibo = ""
    Me.nrFactura = ""
    Me.nrCaja = ""
    Me.dsUsuario = ""
    Me.dtMovimiento = ""
    Me.IdProveedor = ""
    Me.tpCajaImputacion = ""
    Me.dsUsuarioCajaPuesto = ""
    Me.nrCajaPuesto = ""
    Me.dsUsuario_Supervisor = ""
    Me.flOcultado = ""
    Me.tpCreadoPor = ""

End Sub

Public Function grabarMovimientoContable() As Boolean
Dim strValor  As String

    strValor = objbasededatos.SP_ObtenerMaxIDMovimiento()
    IdMovimiento = strValor
    
    If Not obtenerConcepto() Then
        lerror = "No se pudo obtener el concepto código: " + Me.cdConcepto
        grabarMovimientoContable = False
        Exit Function
    End If
    
    lObjTablasIO.nmTabla = "TB_MovimientosContables"
    lObjTablasIO.setearCampoOperadorValor "IdMovimiento", "<-", Me.IdMovimiento
    lObjTablasIO.setearCampoOperadorValor "dsMovimiento", "<-", Me.dsMovimiento
    lObjTablasIO.setearCampoOperadorValor "IdRecibo", "<-", Me.IdRecibo
    lObjTablasIO.setearCampoOperadorValor "cdConcepto", "<-", Me.cdConcepto
    lObjTablasIO.setearCampoOperadorValor "tpConcepto", "<-", Me.tpConcepto
    lObjTablasIO.setearCampoOperadorValor "dsConcepto", "<-", Me.dsConcepto
    lObjTablasIO.setearCampoOperadorValor "tpOperacion", "<-", Me.tpOperacion
    lObjTablasIO.setearCampoOperadorValor "vlPesos", "<-", Me.vlPesos
    lObjTablasIO.setearCampoOperadorValor "vlDolares", "<-", Me.vlDolares
    lObjTablasIO.setearCampoOperadorValor "vlEuros", "<-", Me.vlEuros
    lObjTablasIO.setearCampoOperadorValor "nrRecibo", "<-", Me.IdRecibo
    lObjTablasIO.setearCampoOperadorValor "nrFactura", "<-", Me.nrFactura
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "<-", Me.nrCaja
    lObjTablasIO.setearCampoOperadorValor "dsUsuario", "<-", Me.dsUsuario
    lObjTablasIO.setearCampoOperadorValor "dtMovimiento", "<-", Me.dtMovimiento
    lObjTablasIO.setearCampoOperadorValor "dsProveedor", "<-", Me.dsProveedor
    lObjTablasIO.setearCampoOperadorValor "IdProveedor", "<-", Me.IdProveedor
    
    
    ' Agregado en la version 2.9
    lObjTablasIO.setearCampoOperadorValor "tpCajaImputacion", "<-", Me.tpCajaImputacion
    lObjTablasIO.setearCampoOperadorValor "dsUsuarioCajaPuesto", "<-", Me.dsUsuarioCajaPuesto
    lObjTablasIO.setearCampoOperadorValor "nrCajaPuesto", "<-", Me.nrCajaPuesto

    
    If Not lObjTablasIO.Insertar Then
        lerror = lObjTablasIO.Error
        grabarMovimientoContable = False
    Else
        If objbasededatos.recordAffected = 0 Then
            grabarMovimientoContable = False
            lerror = "No se pudo grabar el Movimiento Contable, por favor intente nuevamente esta operación."
            Exit Function
        End If
        grabarMovimientoContable = True
    End If
    
    
End Function


Private Function obtenerConcepto() As Boolean
    
    obtenerConcepto = True
    
    lObjTablasIO.nmTabla = "TB_Conceptos"
    lObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
    lObjTablasIO.setearCampoOperadorValor "cdConcepto", "=", Me.cdConcepto
    lObjTablasIO.setearCampoOperadorValor "tpConcepto", "->", Me.tpConcepto
    lObjTablasIO.setearCampoOperadorValor "dsConcepto", "->", Me.dsConcepto
    lObjTablasIO.setearCampoOperadorValor "tpOperacion", "->", Me.tpOperacion
    lObjTablasIO.setearCampoOperadorValor "tpCajaImputacion", "->", Me.tpCajaImputacion
    ' lObjTablasIO.setearCampoOperadorValor "flOcultado", "->", Me.flOcultado
    lObjTablasIO.setearCampoOperadorValor "tpCreadoPor", "->", Me.tpCreadoPor
    
    
    lObjTablasIO.Seleccionar
    
    If Not lObjTablasIO.rs_resultados.EOF Then
        obtenerConcepto = True
        Me.tpConcepto = lObjTablasIO.rs_resultados("tpConcepto").value
        Me.dsConcepto = lObjTablasIO.rs_resultados("dsConcepto").value
        Me.tpOperacion = lObjTablasIO.rs_resultados("tpOperacion").value
        Me.tpCreadoPor = lObjTablasIO.rs_resultados("tpCreadoPor").value
        ' Me.flOcultado = lObjTablasIO.rs_resultados("flOcultado").value
        Me.tpCajaImputacion = lObjTablasIO.rs_resultados("tpCajaImputacion").value
    Else
        obtenerConcepto = False
    End If
    
End Function


' agregado en la version 9
Public Function realizarAsientodeCajaPuestoaCajaAdministracion(lista As ListView, listaOculta As ListView) As Boolean
Dim i As Long
Dim objControl As New CControl
Dim moneda     As String

    realizarAsientodeCajaPuestoaCajaAdministracion = False
    
    objbasededatos.BeginTrans

    Me.dsUsuario = objUsuario.dsUsuario

    For i = 1 To lista.ListItems.Count
        Me.cdConcepto = objControl.buscarListviewValorColumnaIndice(lista, "cdConcepto", CLng(i))
        Me.dsMovimiento = objControl.buscarListviewValorColumnaIndice(lista, "dsConcepto", CLng(i))
        
        moneda = objControl.buscarListviewValorColumnaIndice(lista, "moneda", CLng(i))
        
        Me.vlPesos = "0"
        Me.vlEuros = "0"
        Me.vlDolares = "0"
        
        Select Case moneda
        Case "PES"
            Me.vlPesos = objControl.buscarListviewValorColumnaIndice(lista, "vlImporte", CLng(i))
        Case "EUR"
            Me.vlEuros = objControl.buscarListviewValorColumnaIndice(lista, "vlImporte", CLng(i))
        Case "USD"
            Me.vlDolares = objControl.buscarListviewValorColumnaIndice(lista, "vlImporte", CLng(i))
        Case Else
            Me.vlPesos = objControl.buscarListviewValorColumnaIndice(lista, "vlImporte", CLng(i))
        End Select
        
        Me.tpCajaImputacion = objControl.buscarListviewValorColumnaIndice(lista, "tpCajaImputacion", CLng(i))
        Me.tpOperacion = objControl.buscarListviewValorColumnaIndice(lista, "tpOperacion", CLng(i))
        
        If Not Me.grabarMovimientoContable() Then
            objbasededatos.RollBackTrans
            lerror = "Error al intentar grabar el movimiento contable." + vbCrLf + "Error Extendido: " + lerror
            Exit Function
        End If
        
    Next i
    
    
    For i = 1 To listaOculta.ListItems.Count
        
        Me.cdConcepto = objControl.buscarListviewValorColumnaIndice(listaOculta, "cdConcepto", CLng(i))
        Me.dsMovimiento = objControl.buscarListviewValorColumnaIndice(listaOculta, "dsConcepto", CLng(i))
        moneda = objControl.buscarListviewValorColumnaIndice(listaOculta, "moneda", CLng(i))
        Me.vlPesos = "0"
        Me.vlEuros = "0"
        Me.vlDolares = "0"
        Select Case moneda
        Case "PES"
            Me.vlPesos = objControl.buscarListviewValorColumnaIndice(listaOculta, "vlImporte", CLng(i))
        Case "EUR"
            Me.vlEuros = objControl.buscarListviewValorColumnaIndice(listaOculta, "vlImporte", CLng(i))
        Case "USD"
            Me.vlDolares = objControl.buscarListviewValorColumnaIndice(listaOculta, "vlImporte", CLng(i))
        Case Else
            Me.vlPesos = objControl.buscarListviewValorColumnaIndice(listaOculta, "vlImporte", CLng(i))
        End Select
        Me.tpCajaImputacion = objControl.buscarListviewValorColumnaIndice(listaOculta, "tpCajaImputacion", CLng(i))
        Me.tpOperacion = objControl.buscarListviewValorColumnaIndice(listaOculta, "tpOperacion", CLng(i))
        If Not Me.grabarMovimientoContable() Then
            objbasededatos.RollBackTrans
            lerror = "Error al intentar grabar el movimiento contable." + vbCrLf + "Error Extendido: " + lerror
            Exit Function
        End If
        
    Next i
    
    
    
    If Not objCajas.marcarComoImputada(Me.nrCajaPuesto) Then
        objbasededatos.RollBackTrans
        lerror = "Error al intentar grabar el movimiento contable." + vbCrLf + "Error Extendido: " + lerror
        Exit Function
    End If
    
    Dim besImputacionCajaActual As Boolean
    
    besImputacionCajaActual = objCajas.esImputacionCajaActual(Me.nrCajaPuesto, Me.nrCaja)

    If besImputacionCajaActual Then
        If Not objCajas.marcarCajaAdmImputacionOrigen(Me.nrCajaPuesto, Me.nrCaja) Then
            objbasededatos.RollBackTrans
            lerror = "Error al intentar grabar el movimiento contable." + vbCrLf + "Error Extendido: " + lerror
            Exit Function
        End If
        If Not objCajas.grabarValoresImputacionesDesimputacionesCajasPuestos("Imputación", Me.nrCaja, Me.nrCajaPuesto, "1") Then
            objbasededatos.RollBackTrans
            lerror = "Error al intentar grabar grabarValoresImputacionesDesimputacionesCajasPuestos." + vbCrLf + "Error Extendido: " + lerror
            Exit Function
        End If
    Else
        If Not objCajas.grabarValoresImputacionesDesimputacionesCajasPuestos("Imputación", Me.nrCaja, Me.nrCajaPuesto, "0") Then
            objbasededatos.RollBackTrans
            lerror = "Error al intentar grabar grabarValoresImputacionesDesimputacionesCajasPuestos." + vbCrLf + "Error Extendido: " + lerror
            Exit Function
        End If
    End If
    

    objbasededatos.CommitTrans
    realizarAsientodeCajaPuestoaCajaAdministracion = True
    

End Function


Public Function revertirAsientodeCajaPuestoaCajaAdministracion()


   objbasededatos.BeginTrans
   
   If Not desimputarMovimientosdelaCajaPuesto(nrCajaPuesto, nrCaja, dsUsuario, dsUsuarioCajaPuesto, dsUsuario_Supervisor) Then
        objbasededatos.RollBackTrans
        lerror = "Error al intentar revertir la imputación de la caja puesto." + vbCrLf + "Error Extendido: " + lerror
        Exit Function
   End If
   
   If Not objCajas.marcarComoNoImputada(Me.nrCajaPuesto, nrCaja) Then
        objbasededatos.RollBackTrans
        lerror = "Error al intentar revertir la imputación de la caja puesto." + vbCrLf + "Error Extendido: " + objCajas.Error
        Exit Function
    End If

    objbasededatos.CommitTrans
    revertirAsientodeCajaPuestoaCajaAdministracion = True
    

End Function


Private Function desimputarMovimientosdelaCajaPuesto _
                            (pnrCajaPuesto As String, _
                             pnrCajaActual As String, _
                             pdsUsuario As String, _
                             pdsUsuarioCajaPuesto As String, _
                             pdsUsuario_Supervisor As String) As Boolean


    
    desimputarMovimientosdelaCajaPuesto = True
    
    objSPs.nmStoredProcedure = "sp_desimputarcajapuesto_v3_7"
    objSPs.setearCampoValor "@nrCajaPuesto_param", pnrCajaPuesto
    objSPs.setearCampoValor "@nrCajaAdmActual", pnrCajaActual
    objSPs.setearCampoValor "@dsUsuario_param", pdsUsuario
    objSPs.setearCampoValor "@dsUsuarioCajaPuesto_param", pdsUsuarioCajaPuesto
    objSPs.setearCampoValor "@dsUsuario_Supervisor_param", pdsUsuario_Supervisor
    
    
    
    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        desimputarMovimientosdelaCajaPuesto = False
    End If
        
    
    

End Function


' falta terminar de programar
Public Function esMovimientoContabledelSistema(cdConcepto As String) As Boolean

    esMovimientoContabledelSistema = False
    Me.cdConcepto = cdConcepto
    
    obtenerConcepto
        
    If Me.tpCreadoPor = "Sistema" Then
        esMovimientoContabledelSistema = True
    End If

End Function


Public Function sumarMovimientosContablesporPeriodoCajaLicenciatarios _
    (pdtdesde As String, pdtHasta As String) As Boolean
    
    objSPs.nmStoredProcedure = "SP_SumarMovimientosContablesporPeriodo"
    objSPs.setearCampoValor "@dtDesde_param", pdtdesde
    objSPs.setearCampoValor "@dtHasta_param", pdtHasta
    objSPs.setearCampoValor "@tpCajaImputacion_param", "Caja de los Licenciatarios"
    
    
    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        sumarMovimientosContablesporPeriodoCajaLicenciatarios = False
    End If
        
End Function






Public Function obtenerSaldoInicialMovimientosContablesporPeriodoCajaLicenciatarios _
    (pdtHasta As String) As Boolean
    
    objSPs.nmStoredProcedure = "SP_SaldoInicialMovimientosContablesporPeriodo_v2_9"
    objSPs.setearCampoValor "@dtHasta_param", pdtHasta
    objSPs.setearCampoValor "@tpCajaImputacion_param", "Caja de los Licenciatarios"
    
    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        obtenerSaldoInicialMovimientosContablesporPeriodoCajaLicenciatarios = False
    End If
        
End Function



Public Function obtenerSaldoFinalMovimientosContablesporPeriodoCajaLicenciatarios() As Boolean
    
    objSPs.nmStoredProcedure = "SP_SaldoFinalMovimientosContablesporPeriodo_v2_9"
    objSPs.setearCampoValor "@tpCajaImputacion_param", "Caja de los Licenciatarios"
    
    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        obtenerSaldoFinalMovimientosContablesporPeriodoCajaLicenciatarios = False
    End If
        
End Function



Public Function obtenerSalosyMovimientosContablesporPeriodoCajaLicenciatarios _
    (pdtdesde As String, pdtHasta As String) As Boolean
    
    objSPs.nmStoredProcedure = "SP_obtenerSaldosyMovimientosdelPeriodo_v2_9"
    objSPs.setearCampoValor "@dtDesde_param", pdtdesde
    objSPs.setearCampoValor "@dtHasta_param", pdtHasta
    objSPs.setearCampoValor "@tpCajaImputacion_param", "Caja de los Licenciatarios"
    
    
    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        obtenerSalosyMovimientosContablesporPeriodoCajaLicenciatarios = False
    Else
        obtenerSalosyMovimientosContablesporPeriodoCajaLicenciatarios = True
    End If
        
End Function


' agregado en la version 2.9
Public Function obtenerMovimientosContables(pdsUsuario As String, _
                                            pstrSQLWhere As String)


    objSPs.nmStoredProcedure = "SP_TB_MovimientosContables_Qry_v2_9"
    objSPs.setearCampoValor "@strSQL_param", pstrSQLWhere
    objSPs.setearCampoValor "@dsUsuario_param", pdsUsuario
    

    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        obtenerMovimientosContables = False
    Else
        obtenerMovimientosContables = True
    End If
    

End Function


' creado en la version 3.9
'Public Function grabarAsientoporCambiodeCotizacion(pvlCotizacion As Single, _
'pvlDineroMoneda As Single) As Boolean
'
'
'    grabarAsientoporCambiodeCotizacion = False
'
'    objbasededatos.BeginTrans
'    Me.dsUsuario = objUsuario.dsUsuario
'
'    Me.vlPesos = "0"
'    Me.vlEuros = "0"
'    Me.vlDolares = "0"
'
'    Me.vlPesos = pvlCotizacion * pvlDineroMoneda
'
'    If Not Me.grabarMovimientoContable() Then
'        objbasededatos.RollBackTrans
'        lerror = "Error al intentar grabar el movimiento contable." + vbCrLf + "Error Extendido: " + lerror + " función: grabarAsientoporCambiodeCotizacion "
'        Exit Function
'    End If
'
'    objbasededatos.CommitTrans
'    grabarAsientoporCambiodeCotizacion = True
'
'
'
'End Function
'









