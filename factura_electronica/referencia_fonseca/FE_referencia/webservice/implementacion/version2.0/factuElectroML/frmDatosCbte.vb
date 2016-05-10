Public Class frmDatosCbte
    Public [error] As String
    Public tipoMercado As String
    Public modoOperacion As String
    Private defaultPtoVta As String
    Private defaultTipoCbte As String
    Private defaultNroCbtes As String

    Public Sub New()
        InitializeComponent()
        tipoMercado = Configuration.ConfigurationManager.AppSettings("TIPO_MERCADO").ToString
        modoOperacion = System.Configuration.ConfigurationManager.AppSettings("MODO_OPERACION").ToString

        If tipoMercado = "ML" Then
            defaultPtoVta = Configuration.ConfigurationManager.AppSettings("DEFAULT_PTO_VTA_ML")
            defaultTipoCbte = Configuration.ConfigurationManager.AppSettings("DEFAULT_CBTE_TIPO_ML")
            defaultNroCbtes = "Último"
            AddHandler btnAceptar.Click, AddressOf btnAceptar_Click_ML
        ElseIf tipoMercado = "EX" Then
            defaultPtoVta = Configuration.ConfigurationManager.AppSettings("DEFAULT_PTO_VTA_EX")
            defaultTipoCbte = Configuration.ConfigurationManager.AppSettings("DEFAULT_CBTE_TIPO_EX")
            defaultNroCbtes = "Último"
            AddHandler btnAceptar.Click, AddressOf btnAceptar_Click_EX
        End If

    End Sub


    Private Sub frmDatosCbte_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.MinimizeBox = False
        Me.MaximizeBox = False
        Me.MinimumSize = Me.Size
        Me.MaximumSize = Me.Size
        Me.FormBorderStyle = Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.txtPtoVta.ForeColor = Color.Gray
        Me.txtPtoVta.Text = defaultPtoVta
        Me.txtTipoCbte.ForeColor = Color.Gray
        Me.txtTipoCbte.Text = defaultTipoCbte
        Me.txtNroCbtes.ForeColor = Color.Gray
        Me.txtNroCbtes.Text = defaultNroCbtes


        AddHandler txtNroCbtes.TextChanged, AddressOf txtNroCbtes_TextChanged
        AddHandler txtPtoVta.TextChanged, AddressOf txtPtoVta_TextChanged
        AddHandler txtTipoCbte.TextChanged, AddressOf txtTipoCbte_TextChanged

    End Sub


    Private Sub btnAceptar_Click_ML(ByVal sender As System.Object, ByVal e As System.EventArgs)


        Log.EscbribirLinea_Log("----------- INICIO -----------")
        Dim objComprobanteML As New Comprobantes_ml()

        Dim objProgressBar As New frm_progressbar
        objProgressBar.UseWaitCursor = True
        objProgressBar.MaximumSize = objProgressBar.Size
        objProgressBar.crearHilo()

        If IsNumeric(txtPtoVta.Text) = False Then
            objComprobanteML.PtoVta.valor = 0
        Else
            objComprobanteML.PtoVta.valor = Integer.Parse(txtPtoVta.Text)
        End If

        If IsNumeric(txtNroCbtes.Text) = False Then
            objComprobanteML.CAE.valor = 0
        Else
            objComprobanteML.CAE.valor = Long.Parse(txtNroCbtes.Text)
        End If

        If IsNumeric(txtTipoCbte.Text) = False Then
            objComprobanteML.CbteTipo.valor = 0
        Else
            objComprobanteML.CbteTipo.valor = Integer.Parse(txtTipoCbte.Text)
        End If


        If modoOperacion = "Homologacion" Then
            CasoHomologacion_ML(objComprobanteML, objProgressBar)
        ElseIf modoOperacion = "Produccion" Then
            CasoProduccion_ML(objComprobanteML, objProgressBar)
        End If

    End Sub


    Private Sub btnAceptar_Click_EX(ByVal sender As System.Object, ByVal e As System.EventArgs)


        Dim objComprobanteEX As New Comprobante

        Dim objProgressBar As New frm_progressbar
        objProgressBar.UseWaitCursor = True
        objProgressBar.MaximumSize = objProgressBar.Size
        objProgressBar.crearHilo()

        If IsNumeric(txtPtoVta.Text) = False Then
            objComprobanteEX.ptovta.valor = 0
        Else
            objComprobanteEX.ptovta.valor = Integer.Parse(txtPtoVta.Text)
        End If

        If IsNumeric(txtNroCbtes.Text) = False Then
            objComprobanteEX.nro.valor = 0
        Else
            objComprobanteEX.nro.valor = Long.Parse(txtNroCbtes.Text)
        End If

        If IsNumeric(txtTipoCbte.Text) = False Then
            objComprobanteEX.tipo.valor = 0
        Else
            objComprobanteEX.tipo.valor = Integer.Parse(txtTipoCbte.Text)
        End If


        If modoOperacion = "Homologacion" Then
            CasoHomologacion_EX(objComprobanteEX, objProgressBar)
        ElseIf modoOperacion = "Produccion" Then
            CasoProduccion_EX(objComprobanteEX, objProgressBar)
        End If

    End Sub

    Private Sub btnCancelar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCerrar.Click
        Me.Close()
    End Sub
    Private Sub txtNroCbtes_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        txtNroCbtes.ForeColor = Color.Black
        RemoveHandler txtNroCbtes.TextChanged, AddressOf txtNroCbtes_TextChanged
    End Sub
    Private Sub txtPtoVta_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        txtPtoVta.ForeColor = Color.Black
        RemoveHandler txtPtoVta.TextChanged, AddressOf txtPtoVta_TextChanged
    End Sub
    Private Sub txtTipoCbte_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        txtTipoCbte.ForeColor = Color.Black
        RemoveHandler txtTipoCbte.TextChanged, AddressOf txtTipoCbte_TextChanged
    End Sub





    Private Sub CasoProduccion_ML(ByVal objComprobanteML As Comprobantes_ml, ByVal progressBar As frm_progressbar)
        Dim objAdmFacturaElectronica As New AdmFacturaElectronica
        If Not objAdmFacturaElectronica.BuscarComprobantesPRODAfip_ML(objComprobanteML) Then
            progressBar.paraHilo()
            Me.error = objAdmFacturaElectronica.error
            MsgBox(Me.error)
            Exit Sub
        End If

        Dim prodEResponde As New ar.gov.afip.wsfe_v1.FECompConsultarResponse()

        prodEResponde = objAdmFacturaElectronica.objProdFECompConsultarResponse


        Dim detallesVarios As String = ""

        If Not prodEResponde.Body.FECompConsultarResult.ResultGet.Iva Is Nothing Then
            For Each elemento As ar.gov.afip.wsfe_v1.AlicIva In prodEResponde.Body.FECompConsultarResult.ResultGet.Iva
                detallesVarios += (vbCrLf + "Detalle Iva: " + vbCrLf + _
                                    "BaseImp: " + elemento.BaseImp.ToString + vbCrLf + _
                                    "Importe: " + elemento.Importe.ToString + vbCrLf + _
                                    "Id: " + elemento.Id.ToString)
            Next
        End If

        If Not prodEResponde.Body.FECompConsultarResult.ResultGet.Tributos Is Nothing Then
            For Each elemento As ar.gov.afip.wsfe_v1.Tributo In prodEResponde.Body.FECompConsultarResult.ResultGet.Tributos
                detallesVarios += (vbCrLf + "Detalle Tributo: " + vbCrLf + _
                                   "Alic: " + elemento.Alic.ToString + vbCrLf + _
                                    "BaseImp: " + elemento.BaseImp.ToString + vbCrLf + _
                                    "Desc: " + elemento.Desc.ToString + vbCrLf + _
                                    "Importe: " + elemento.Importe.ToString + vbCrLf + _
                                    "Id: " + elemento.Id.ToString)
            Next
        End If

        If Not prodEResponde.Body.FECompConsultarResult.ResultGet.CbtesAsoc Is Nothing Then
            For Each elemento As ar.gov.afip.wsfe_v1.CbteAsoc In prodEResponde.Body.FECompConsultarResult.ResultGet.CbtesAsoc
                detallesVarios += (vbCrLf + "Cbtes Asociados: " + vbCrLf + _
                                   "Nro: " + elemento.Nro.ToString + vbCrLf + _
                                    "PtoVta: " + elemento.PtoVta.ToString + vbCrLf + _
                                    "Tipo: " + elemento.Tipo.ToString)
            Next
        End If

        If Not prodEResponde.Body.FECompConsultarResult.ResultGet.Observaciones Is Nothing Then
            For Each elemento As ar.gov.afip.wsfe_v1.Obs In prodEResponde.Body.FECompConsultarResult.ResultGet.Observaciones
                detallesVarios += (vbCrLf + "Observaciones: " + vbCrLf + _
                                   "Code: " + elemento.Code.ToString + vbCrLf + _
                                    "Msg: " + elemento.Msg.ToString)
            Next
        End If
        progressBar.paraHilo()
        With (prodEResponde.Body.FECompConsultarResult.ResultGet)
            If MsgBox("CbteDesde: " + .CbteDesde.ToString + vbCrLf + _
                    "CbteHasta: " + .CbteHasta.ToString + vbCrLf + _
                    "CbteFch: " + .CbteFch.ToString + vbCrLf + _
                    "FchVto: " + .FchVto.ToString + vbCrLf + _
                    "CodAutorizacion: " + .CodAutorizacion.ToString + vbCrLf + _
                    "CbteTipo: " + .CbteTipo.ToString + vbCrLf + _
                    "DocNro: " + .DocNro.ToString + vbCrLf + _
                    "DocTipo: " + .DocTipo.ToString + vbCrLf + _
                    "FchVtoPago: " + .FchVtoPago.ToString + vbCrLf + _
                    "PtoVta: " + .PtoVta.ToString + vbCrLf + _
                    "Resultado: " + .Resultado.ToString + vbCrLf + _
                    "Concepto: " + .Concepto.ToString + vbCrLf + _
                    "EmisionTipo: " + .EmisionTipo.ToString + vbCrLf + _
                    "FchProceso: " + .FchProceso.ToString + vbCrLf + _
                    "FchServDesde: " + .FchServDesde.ToString + vbCrLf + _
                    "FchServHasta: " + .FchServHasta.ToString + vbCrLf + _
                    "MonId: " + .MonId.ToString + vbCrLf + _
                    "ImpNeto: " + .ImpNeto.ToString + vbCrLf + _
                    "ImpIVA: " + .ImpIVA.ToString + vbCrLf + _
                    "ImpOpEx: " + .ImpOpEx.ToString + vbCrLf + _
                    "ImpTotal: " + .ImpTotal.ToString + vbCrLf + _
                    "ImpTotConc: " + .ImpTotConc.ToString + vbCrLf + _
                    "ImpTrib: " + .ImpTrib.ToString + vbCrLf + _
                    "MonCotiz: " + .MonCotiz.ToString + vbCrLf + _
                    detallesVarios) = MsgBoxResult.Ok Then
                Me.BringToFront()
            End If
        End With
    End Sub

    Private Sub CasoHomologacion_ML(ByVal objComprobanteML As Comprobantes_ml, ByVal progressBar As frm_progressbar)

        Dim objAdmFacturaElectronica As New AdmFacturaElectronica
        If Not objAdmFacturaElectronica.BuscarComprobantesHOMOAfip_ML(objComprobanteML) Then
            Me.error = objAdmFacturaElectronica.error
            progressBar.paraHilo()
            MsgBox(Me.error)
            Exit Sub
        End If

        Dim HomoEResponde As New ar.gov.afip.wshomofev1.FECompConsultarResponse()

        HomoEResponde = objAdmFacturaElectronica.objHomoFECompConsultarResponse

        If Not HomoEResponde.Body.FECompConsultarResult.Errors Is Nothing Then
            Me.error = HomoEResponde.Body.FECompConsultarResult.Errors(0).Msg
            progressBar.paraHilo()
            MsgBox(Me.error)
            Exit Sub
        End If


        Dim detallesVarios As String = ""

        If Not HomoEResponde.Body.FECompConsultarResult.ResultGet.Iva Is Nothing Then
            For Each elemento As ar.gov.afip.wshomofev1.AlicIva In HomoEResponde.Body.FECompConsultarResult.ResultGet.Iva
                detallesVarios += (vbCrLf + "Detalle Iva: " + vbCrLf + _
                                    "BaseImp: " + elemento.BaseImp.ToString + vbCrLf + _
                                    "Importe: " + elemento.Importe.ToString + vbCrLf + _
                                    "Id: " + elemento.Id.ToString)
            Next
        End If

        If Not HomoEResponde.Body.FECompConsultarResult.ResultGet.Tributos Is Nothing Then
            For Each elemento As ar.gov.afip.wshomofev1.Tributo In HomoEResponde.Body.FECompConsultarResult.ResultGet.Tributos
                detallesVarios += (vbCrLf + "Detalle Tributo: " + vbCrLf + _
                                   "Alic: " + elemento.Alic.ToString + vbCrLf + _
                                    "BaseImp: " + elemento.BaseImp.ToString + vbCrLf + _
                                    "Desc: " + elemento.Desc.ToString + vbCrLf + _
                                    "Importe: " + elemento.Importe.ToString + vbCrLf + _
                                    "Id: " + elemento.Id.ToString)
            Next
        End If

        If Not HomoEResponde.Body.FECompConsultarResult.ResultGet.CbtesAsoc Is Nothing Then
            For Each elemento As ar.gov.afip.wshomofev1.CbteAsoc In HomoEResponde.Body.FECompConsultarResult.ResultGet.CbtesAsoc
                detallesVarios += (vbCrLf + "Cbtes Asociados: " + vbCrLf + _
                                   "Nro: " + elemento.Nro.ToString + vbCrLf + _
                                    "PtoVta: " + elemento.PtoVta.ToString + vbCrLf + _
                                    "Tipo: " + elemento.Tipo.ToString)
            Next
        End If

        If Not HomoEResponde.Body.FECompConsultarResult.ResultGet.Observaciones Is Nothing Then
            For Each elemento As ar.gov.afip.wshomofev1.Obs In HomoEResponde.Body.FECompConsultarResult.ResultGet.Observaciones
                detallesVarios += (vbCrLf + "Observaciones: " + vbCrLf + _
                                   "Code: " + elemento.Code.ToString + vbCrLf + _
                                    "Msg: " + elemento.Msg.ToString)
            Next
        End If
        progressBar.paraHilo()
        With (HomoEResponde.Body.FECompConsultarResult.ResultGet)
            If MsgBox("¡¡¡HOMOLOGACIÓN!!!" + vbCrLf + _
                   "CbteDesde: " + .CbteDesde.ToString + vbCrLf + _
                   "CbteHasta: " + .CbteHasta.ToString + vbCrLf + _
                   "CbteFch: " + .CbteFch.ToString + vbCrLf + _
                   "FchVto: " + .FchVto.ToString + vbCrLf + _
                   "CodAutorizacion: " + .CodAutorizacion.ToString + vbCrLf + _
                   "CbteTipo: " + .CbteTipo.ToString + vbCrLf + _
                   "DocNro: " + .DocNro.ToString + vbCrLf + _
                   "DocTipo: " + .DocTipo.ToString + vbCrLf + _
                   "FchVtoPago: " + .FchVtoPago.ToString + vbCrLf + _
                   "PtoVta: " + .PtoVta.ToString + vbCrLf + _
                   "Resultado: " + .Resultado.ToString + vbCrLf + _
                   "Concepto: " + .Concepto.ToString + vbCrLf + _
                   "EmisionTipo: " + .EmisionTipo.ToString + vbCrLf + _
                   "FchProceso: " + .FchProceso.ToString + vbCrLf + _
                   "FchServDesde: " + .FchServDesde.ToString + vbCrLf + _
                   "FchServHasta: " + .FchServHasta.ToString + vbCrLf + _
                   "MonId: " + .MonId.ToString + vbCrLf + _
                   "ImpNeto: " + .ImpNeto.ToString + vbCrLf + _
                   "ImpIVA: " + .ImpIVA.ToString + vbCrLf + _
                   "ImpOpEx: " + .ImpOpEx.ToString + vbCrLf + _
                   "ImpTotal: " + .ImpTotal.ToString + vbCrLf + _
                   "ImpTotConc: " + .ImpTotConc.ToString + vbCrLf + _
                   "ImpTrib: " + .ImpTrib.ToString + vbCrLf + _
                   "MonCotiz: " + .MonCotiz.ToString + vbCrLf + _
                   detallesVarios) = MsgBoxResult.Ok Then
                Me.BringToFront()
            End If
        End With
    End Sub


    Private Sub CasoHomologacion_EX(ByVal objComprobanteEX As Comprobante, ByVal progressBar As frm_progressbar)

        Dim objAdmFacturaElectronica As New AdmFacturaElectronica
        If Not objAdmFacturaElectronica.BuscarComprobantesHOMOAfip_EX(objComprobanteEX) Then
            Me.error = objAdmFacturaElectronica.error
            progressBar.paraHilo()
            MsgBox(Me.error)
            Exit Sub
        End If

        Dim HomoEResponde_EX As New ar.gov.afip.wsfexhomo.FEXGetCMPResponse

        HomoEResponde_EX = objAdmFacturaElectronica.objHomoFEXGetCMPResponse

        If HomoEResponde_EX.FEXErr.ErrCode <> 0 Then
            Me.error = HomoEResponde_EX.FEXErr.ErrMsg(0)
            progressBar.paraHilo()
            MsgBox(Me.error)
            Exit Sub
        End If


        Dim detallesVarios As String = ""

        If Not HomoEResponde_EX.FEXResultGet.Items Is Nothing Then
            For Each elemento As ar.gov.afip.wsfexhomo.Item In HomoEResponde_EX.FEXResultGet.Items
                If Not elemento Is Nothing Then
                    detallesVarios += (vbCrLf + "Detalle Items: " + vbCrLf + _
                                    "Pro_codigo: " + elemento.Pro_codigo.ToString + vbCrLf + _
                                    "Pro_ds: " + elemento.Pro_ds.ToString + vbCrLf + _
                                    "Pro_precio_uni: " + elemento.Pro_precio_uni.ToString + vbCrLf + _
                                    "Pro_qty: " + elemento.Pro_qty.ToString + vbCrLf + _
                                    "Pro_total_item: " + elemento.Pro_total_item.ToString + vbCrLf + _
                                    "Pro_umed: " + elemento.Pro_umed.ToString)
                End If
            Next
        End If

        If Not HomoEResponde_EX.FEXResultGet.Permisos Is Nothing Then

            For Each elemento As ar.gov.afip.wsfexhomo.Permiso In HomoEResponde_EX.FEXResultGet.Permisos
                If Not elemento Is Nothing Then
                    detallesVarios += (vbCrLf + "Detalle Permisos: " + vbCrLf + _
                                       "Dst_merc: " + elemento.Dst_merc.ToString + vbCrLf + _
                                        "Id_permiso: " + elemento.Id_permiso.ToString)
                End If
            Next

        End If

        If Not HomoEResponde_EX.FEXResultGet.Cmps_asoc Is Nothing Then
            For Each elemento As ar.gov.afip.wsfexhomo.Cmp_asoc In HomoEResponde_EX.FEXResultGet.Cmps_asoc
                If Not elemento Is Nothing Then
                    detallesVarios += (vbCrLf + "Cbtes Asociados: " + vbCrLf + _
                                       "Cbte_nro: " + elemento.Cbte_nro.ToString + vbCrLf + _
                                        "Cbte_punto_vta: " + elemento.Cbte_punto_vta.ToString + vbCrLf + _
                                        "CBte_tipo: " + elemento.CBte_tipo.ToString)
                End If
            Next
        End If


        progressBar.paraHilo()

        With (HomoEResponde_EX.FEXResultGet)
            If MsgBox("¡¡¡HOMOLOGACIÓN!!!" + vbCrLf + _
            "Cae: " + .Cae.ToString + vbCrLf + _
            "Cbte_nro: " + .Cbte_nro.ToString + vbCrLf + _
            "Cliente: " + .Cliente.ToString + vbCrLf + _
            "Cuit_pais_cliente: " + .Cuit_pais_cliente.ToString + vbCrLf + _
            "Domicilio_cliente: " + .Domicilio_cliente.ToString + vbCrLf + _
            "Dst_cmp: " + .Dst_cmp.ToString + vbCrLf + _
            "Fch_venc_Cae: " + .Fch_venc_Cae.ToString + vbCrLf + _
            "Fecha_cbte_cae: " + .Fecha_cbte_cae + vbCrLf + _
            "Fecha_cbte: " + .Fecha_cbte.ToString + vbCrLf + _
            "Forma_pago: " + .Forma_pago.ToString + vbCrLf + _
            "Id: " + .Id.ToString + vbCrLf + _
            "Id_impositivo: " + .Id_impositivo.ToString + vbCrLf + _
            "Idioma_cbte: " + .Idioma_cbte.ToString + vbCrLf + _
            "Imp_total: " + .Imp_total.ToString + vbCrLf + _
            "Incoterms: " + .Incoterms.ToString + vbCrLf + _
            "Incoterms_Ds: " + .Incoterms_Ds.ToString + vbCrLf + _
            "Moneda_ctz: " + .Moneda_ctz.ToString + vbCrLf + _
            "Moneda_Id: " + .Moneda_Id.ToString + vbCrLf + _
            "Motivos_Obs: " + .Motivos_Obs.ToString + vbCrLf + _
            "Obs: " + .Obs.ToString + vbCrLf + _
            "Obs_comerciales: " + .Obs_comerciales.ToString + vbCrLf + _
            "Permiso_existente: " + .Permiso_existente.ToString + vbCrLf + _
            "Punto_vta: " + .Punto_vta.ToString + vbCrLf + _
            "Resultado: " + .Resultado.ToString + vbCrLf + _
            "Tipo_cbte: " + .Tipo_cbte.ToString + vbCrLf + _
            "Tipo_expo: " + .Tipo_expo.ToString + vbCrLf + _
            detallesVarios) = MsgBoxResult.Ok Then
                Me.BringToFront()
            End If




        End With
    End Sub

    Private Sub CasoProduccion_EX(ByVal objComprobanteEX As Comprobante, ByVal progressBar As frm_progressbar)

        Dim objAdmFacturaElectronica As New AdmFacturaElectronica
        If Not objAdmFacturaElectronica.BuscarComprobantesPRODAfip_EX(objComprobanteEX) Then
            Me.error = objAdmFacturaElectronica.error
            progressBar.paraHilo()
            MsgBox(Me.error)
            Exit Sub
        End If

        Dim ProdEResponde_EX As New ar.gov.afip.wsfex.FEXGetCMPResponse

        ProdEResponde_EX = objAdmFacturaElectronica.objProdFEXGetCMPResponse

        If ProdEResponde_EX.FEXErr.ErrCode <> 0 Then
            Me.error = ProdEResponde_EX.FEXErr.ErrMsg()
            progressBar.paraHilo()
            MsgBox(Me.error)
            Exit Sub
        End If


        Dim detallesVarios As String = ""

        If Not ProdEResponde_EX.FEXResultGet.Items Is Nothing Then
            For Each elemento As ar.gov.afip.wsfex.Item In ProdEResponde_EX.FEXResultGet.Items
                If Not elemento Is Nothing Then
                    detallesVarios += (vbCrLf + "Detalle Items: " + vbCrLf + _
                                    "Pro_codigo: " + elemento.Pro_codigo.ToString + vbCrLf + _
                                    "Pro_ds: " + elemento.Pro_ds.ToString + vbCrLf + _
                                    "Pro_precio_uni: " + elemento.Pro_precio_uni.ToString + vbCrLf + _
                                    "Pro_qty: " + elemento.Pro_qty.ToString + vbCrLf + _
                                    "Pro_total_item: " + elemento.Pro_total_item.ToString + vbCrLf + _
                                    "Pro_umed: " + elemento.Pro_umed.ToString)
                End If
            Next
        End If

        If Not ProdEResponde_EX.FEXResultGet.Permisos Is Nothing Then

            For Each elemento As ar.gov.afip.wsfex.Permiso In ProdEResponde_EX.FEXResultGet.Permisos
                If Not elemento Is Nothing Then
                    detallesVarios += (vbCrLf + "Detalle Permisos: " + vbCrLf + _
                                       "Dst_merc: " + elemento.Dst_merc.ToString + vbCrLf + _
                                        "Id_permiso: " + elemento.Id_permiso.ToString)
                End If
            Next

        End If

        If Not ProdEResponde_EX.FEXResultGet.Cmps_asoc Is Nothing Then
            For Each elemento As ar.gov.afip.wsfex.Cmp_asoc In ProdEResponde_EX.FEXResultGet.Cmps_asoc
                If Not elemento Is Nothing Then
                    detallesVarios += (vbCrLf + "Cbtes Asociados: " + vbCrLf + _
                                       "Cbte_nro: " + elemento.Cbte_nro.ToString + vbCrLf + _
                                        "Cbte_punto_vta: " + elemento.Cbte_punto_vta.ToString + vbCrLf + _
                                        "CBte_tipo: " + elemento.CBte_tipo.ToString)
                End If
            Next
        End If


        progressBar.paraHilo()

        With (ProdEResponde_EX.FEXResultGet)
            If MsgBox("¡¡¡HOMOLOGACIÓN!!!" + vbCrLf + _
            "Cae: " + .Cae.ToString + vbCrLf + _
            "Cbte_nro: " + .Cbte_nro.ToString + vbCrLf + _
            "Cliente: " + .Cliente.ToString + vbCrLf + _
            "Cuit_pais_cliente: " + .Cuit_pais_cliente.ToString + vbCrLf + _
            "Domicilio_cliente: " + .Domicilio_cliente.ToString + vbCrLf + _
            "Dst_cmp: " + .Dst_cmp.ToString + vbCrLf + _
            "Fch_venc_Cae: " + .Fch_venc_Cae.ToString + vbCrLf + _
            "Fecha_cbte_cae: " + .Fecha_cbte_cae + vbCrLf + _
            "Fecha_cbte: " + .Fecha_cbte.ToString + vbCrLf + _
            "Forma_pago: " + .Forma_pago.ToString + vbCrLf + _
            "Id: " + .Id.ToString + vbCrLf + _
            "Id_impositivo: " + .Id_impositivo.ToString + vbCrLf + _
            "Idioma_cbte: " + .Idioma_cbte.ToString + vbCrLf + _
            "Imp_total: " + .Imp_total.ToString + vbCrLf + _
            "Incoterms: " + .Incoterms.ToString + vbCrLf + _
            "Incoterms_Ds: " + .Incoterms_Ds.ToString + vbCrLf + _
            "Moneda_ctz: " + .Moneda_ctz.ToString + vbCrLf + _
            "Moneda_Id: " + .Moneda_Id.ToString + vbCrLf + _
            "Motivos_Obs: " + .Motivos_Obs.ToString + vbCrLf + _
            "Obs: " + .Obs.ToString + vbCrLf + _
            "Obs_comerciales: " + .Obs_comerciales.ToString + vbCrLf + _
            "Permiso_existente: " + .Permiso_existente.ToString + vbCrLf + _
            "Punto_vta: " + .Punto_vta.ToString + vbCrLf + _
            "Resultado: " + .Resultado.ToString + vbCrLf + _
            "Tipo_cbte: " + .Tipo_cbte.ToString + vbCrLf + _
            "Tipo_expo: " + .Tipo_expo.ToString + vbCrLf + _
            detallesVarios) = MsgBoxResult.Ok Then
                Me.BringToFront()
            End If




        End With
    End Sub



    Private Sub grpDatosCbte_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles grpDatosCbte.Enter

    End Sub
End Class