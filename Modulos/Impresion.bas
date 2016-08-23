Attribute VB_Name = "impresion"
Option Explicit


Public Sub imprimirCierreCajaPuesto(porpantalla As Boolean)

    Frm_Principal.LimpiarReporte
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_cierredecaja_imprimev4_9.rpt"
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    
    objSPs.nmStoredProcedure = "rpt_cierredecaja_v3_7"
    objSPs.setearCampoValor "@nrCaja_param", objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    If Not objSPs.ExecSP() Then
        MsgBox "Error: " + objSPs.Error + ", función:rpt_cierredecaja_v3_7", vbCritical, "Atención"
        Exit Sub
    End If
    
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión del Cierre de Caja"
    
    Frm_Principal.CrystalReport1.StoredProcParam(0) = objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    Frm_Principal.CrystalReport1.Formulas(0) = "nrCajaManual=" + objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")

    ' Aparece la venta original
    ' On Error Resume Next
    ' hacer dinamica la cantidad de copias
    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    On Error GoTo 0
    Select Case objUsuario.tpAcceso
    Case "Puestos"
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_ComprobantesManuales_cajapuesto_v3_7.rpt"
    End Select
    
    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
    Frm_Principal.CrystalReport1.WindowTitle = "Comprobantes Manuales - Caja Nro: " + objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    Frm_Principal.CrystalReport1.StoredProcParam(0) = objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    Frm_Principal.CrystalReport1.Formulas(0) = ""
    
    Frm_Principal.CrystalReport1.CopiesToPrinter = 1
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
        MsgBox "ERROR: " + Err.Description + " -  Nombre del reporte:  " + Frm_Principal.CrystalReport1.ReportFileName, vbInformation + vbDefaultButton1, "Atención"
    End If
    On Error GoTo 0

End Sub
