Public Class v_Comprobantes_EXDAO

    Public [error] As String
    Public listav_Comprobantes_EX As New ArrayList
    Public v_Comprobantes_EXBuscado As v_Comprobantes_EX
    Public un_resultadoSP As New ResultadoSP
    Public una_observacion As New Observaciones
    Public listaObservaciones As New ArrayList

    Private Function rsto_v_Comprobantes_EX(ByVal pv_Comprobantes_EX As v_Comprobantes_EX, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pv_Comprobantes_EX.Id.valor = rs("Id")
        pv_Comprobantes_EX.Tipo_cbte.valor = rs("Tipo_cbte")
        pv_Comprobantes_EX.Fecha_cbte.valor = rs("Fecha_cbte")
        pv_Comprobantes_EX.Punto_vta.valor = rs("Punto_vta")
        pv_Comprobantes_EX.Cbt_nro.valor = rs("Cbt_nro")
        pv_Comprobantes_EX.Tipo_expo.valor = rs("Tipo_expo")
        pv_Comprobantes_EX.Permiso_existente.valor = rs("Permiso_existente")
        pv_Comprobantes_EX.Dst_cmp.valor = rs("Dst_cmp")
        pv_Comprobantes_EX.Cliente.valor = rs("Cliente")
        pv_Comprobantes_EX.Cuit_pais_cliente.valor = rs("Cuit_pais_cliente")
        pv_Comprobantes_EX.Domicilio_cliente.valor = rs("Domicilio_cliente")
        pv_Comprobantes_EX.ID_impositivo.valor = rs("ID_impositivo")
        pv_Comprobantes_EX.Moneda_ID.valor = rs("Moneda_ID")
        pv_Comprobantes_EX.Moneda_Ctz.valor = rs("Moneda_Ctz")
        pv_Comprobantes_EX.Obs_comerciales.valor = rs("Obs_comerciales")
        pv_Comprobantes_EX.Imp_total.valor = rs("Imp_total")
        pv_Comprobantes_EX.Obs.valor = rs("Obs")
        pv_Comprobantes_EX.Incoterms.valor = rs("Incoterms")
        pv_Comprobantes_EX.Incoterms_Ds.valor = rs("Incoterms_Ds")
        pv_Comprobantes_EX.Idioma_cbte.valor = rs("Idioma_cbte")
        pv_Comprobantes_EX.formaspago.valor = rs("formaspago")

        pv_Comprobantes_EX.Id.tipo = rs("Id").GetType
        pv_Comprobantes_EX.Tipo_cbte.tipo = rs("Tipo_cbte").GetType
        pv_Comprobantes_EX.Fecha_cbte.tipo = rs("Fecha_cbte").GetType
        pv_Comprobantes_EX.Punto_vta.tipo = rs("Punto_vta").GetType
        pv_Comprobantes_EX.Cbt_nro.tipo = rs("Cbt_nro").GetType
        pv_Comprobantes_EX.Tipo_expo.tipo = rs("Tipo_expo").GetType
        pv_Comprobantes_EX.Permiso_existente.tipo = rs("Permiso_existente").GetType
        pv_Comprobantes_EX.Dst_cmp.tipo = rs("Dst_cmp").GetType
        pv_Comprobantes_EX.Cliente.tipo = rs("Cliente").GetType
        pv_Comprobantes_EX.Cuit_pais_cliente.tipo = rs("Cuit_pais_cliente").GetType
        pv_Comprobantes_EX.Domicilio_cliente.tipo = rs("Domicilio_cliente").GetType
        pv_Comprobantes_EX.ID_impositivo.tipo = rs("ID_impositivo").GetType
        pv_Comprobantes_EX.Moneda_ID.tipo = rs("Moneda_ID").GetType
        pv_Comprobantes_EX.Moneda_Ctz.tipo = rs("Moneda_Ctz").GetType
        pv_Comprobantes_EX.Obs_comerciales.tipo = rs("Obs_comerciales").GetType
        pv_Comprobantes_EX.Imp_total.tipo = rs("Imp_total").GetType
        pv_Comprobantes_EX.Obs.tipo = rs("Obs").GetType
        pv_Comprobantes_EX.Incoterms.tipo = rs("Incoterms").GetType
        pv_Comprobantes_EX.Incoterms_Ds.tipo = rs("Incoterms_Ds").GetType
        pv_Comprobantes_EX.Idioma_cbte.tipo = rs("Idioma_cbte").GetType
        pv_Comprobantes_EX.formaspago.tipo = rs("formaspago").GetType



    End Function

    Public Function obtenerV_Comprobantes_EX(ByVal pv_Comprobantes_EX As Campo) As Boolean

        Dim Sql As String
        Dim un_v_Comprobantes_EX As v_Comprobantes_EX
        obtenerV_Comprobantes_EX = False

        Sql = "Select "
        Sql = Sql + "Id,"
        Sql = Sql + "Tipo_cbte,"
        Sql = Sql + "Fecha_cbte,"
        Sql = Sql + "Punto_vta,"
        Sql = Sql + "Cbt_nro,"
        Sql = Sql + "Tipo_expo,"
        Sql = Sql + "Permiso_existente,"
        Sql = Sql + "Dst_cmp,"
        Sql = Sql + "Cliente,"
        Sql = Sql + "Cuit_pais_cliente,"
        Sql = Sql + "Domicilio_cliente,"
        Sql = Sql + "ID_impositivo,"
        Sql = Sql + "Moneda_ID,"
        Sql = Sql + "Moneda_Ctz,"
        Sql = Sql + "Obs_comerciales,"
        Sql = Sql + "Imp_total,"
        Sql = Sql + "Obs,"
        Sql = Sql + "Incoterms,"
        Sql = Sql + "Incoterms_Ds,"
        Sql = Sql + "Idioma_cbte,"
        Sql = Sql + "formaspago"
        Sql = Sql + " FROM v_Comprobantes_EX WHERE Id = " + SQLAdapter.formatValuetoSQL(pv_Comprobantes_EX)

        AdmConexiones.ejecutarQuerySQLFE(Sql)

        If AdmConexiones.rsSQLFE.HasRows Then
            Do While AdmConexiones.rsSQLFE.Read

                un_v_Comprobantes_EX = New v_Comprobantes_EX() '-- Crea objeto v_Comprobantes_EX con sus atributos (campos)

                Me.rsto_v_Comprobantes_EX(un_v_Comprobantes_EX, AdmConexiones.rsSQLFE) '-- Asigna datos campo a campo para el objeto v_Comprobantes_EX


                listav_Comprobantes_EX.Add(un_v_Comprobantes_EX) '-- Agrega la solicitud al ARRAY de v_Comprobantes_EX
                v_Comprobantes_EXBuscado = un_v_Comprobantes_EX
                obtenerV_Comprobantes_EX = True
            Loop
        Else
            Me.error = "No existen registros para procesar en v_Comprobantes_EX"
            Log.EscbribirLinea_Log("No existen registros para procesar en v_Comprobantes_EX")
            Exit Function
        End If
    End Function




    Public Function InsertarComprobantesEXFE(ByVal idSolicitud As Campo) As Boolean
        Dim Sql As String

        InsertarComprobantesEXFE = False

        Sql = " exec spu_insertarComprobanteEX"
        Sql = Sql + " 	@pnro_trans  = " + SQLAdapter.formatValuetoSQL(idSolicitud)

        If Not AdmConexiones.ejecutarQuerySQLFE(Sql) Then
            Me.error = AdmConexiones.error
            InsertarComprobantesEXFE = False
            Log.EscbribirLinea_Log(AdmConexiones.error)
            Exit Function
        End If

        If AdmConexiones.rsSQLFE.HasRows Then '-- Si rsSQLFE (variable pública de tipo "lector de datos SQL") tiene filas...
            If AdmConexiones.rsSQLFE.Read Then '-- Si el lector de datos anterior da verdadero en la lectura...
                un_resultadoSP = New ResultadoSP() '-- El objeto "ResultadoSP" tiene los atributos descripción y resultado 
                Me.rsto_resultadoSP(un_resultadoSP, AdmConexiones.rsSQLFE)
                una_observacion = New Observaciones() '-- El objeto "Observaciones" tiene los atributos descripción y resultado 
                listav_Comprobantes_EX.Add(un_resultadoSP) '-- Agrega el objeto resultado (con atributos descripción y resultado) a un array de lista de solicitudes
                una_observacion.Msg = un_resultadoSP.descripcion
                If Not un_resultadoSP.descripcion.esNulo Then
                    Me.error = un_resultadoSP.descripcion.valor
                End If
                una_observacion.Code = un_resultadoSP.resultado
                listaObservaciones.Add(una_observacion)
                InsertarComprobantesEXFE = True
                Exit Function
            End If
        Else
            Me.error = "No existen registros para procesar en spu_insertarComprobanteML "
            InsertarComprobantesEXFE = False

            Exit Function
        End If



    End Function

    Private Function rsto_resultadoSP(ByVal pResultadoSP As ResultadoSP, _
                                ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pResultadoSP.resultado.valor = rs("resultado")
        pResultadoSP.descripcion.valor = rs("descripcion")

        pResultadoSP.resultado.tipo = rs("resultado").GetType
        pResultadoSP.descripcion.tipo = rs("descripcion").GetType

    End Function


End Class
