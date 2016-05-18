Imports fonseca_libDatos

Public Class cpt_cabgenacDAO


    'Public [error] As String
    'Public listaComprobantes As New ArrayList
    'Public comprobanteBuscado As cpt_cabgenac

    Private _comprobanteBuscado As cpt_cabgenac
    Public ReadOnly Property ComprobanteBuscado() As cpt_cabgenac
        Get
            Return _comprobanteBuscado
        End Get
    End Property

    Private _listaComprobantes As ArrayList
    Public ReadOnly Property ListaComprobantes() As ArrayList
        Get
            Return _listaComprobantes
        End Get
    End Property

    Private _error As String
    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property

    Public Function obtenerComprobantesaEnviar() As Boolean
        Dim Sql As String
        Dim un_cpt_cabgenac As cpt_cabgenac
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Log.Logger("info", "cpt_cabgenacDAO - obtenerComprobantesaEnviar")
        Try

            If Not _listaComprobantes Is Nothing Then
                _listaComprobantes.Clear()
            End If

            ' obtenemos el detalle de la liuidacion 
            Sql = " select "
            Sql = Sql + " cod_doc, "
            Sql = Sql + " nro_doc, "
            Sql = Sql + " nro_trans "
            Sql = Sql + " from cpt_cabgenac "
            Sql = Sql + " where cod_doc in  ('FCE' , 'NCE','NDE') "
            MsgBox(" falta completar el where , estaria mejor usar un SP")

            Log.Logger("debug", Sql)
            If Not objAdmConexiones.EjecutarQuerySQLFE(Sql) Then
                Me._error = objAdmConexiones.Error
                Exit Function
            End If

            _listaComprobantes = New ArrayList

            If objAdmConexiones.rsSQLFE.HasRows Then
                Do While objAdmConexiones.rsSQLFE.Read
                    un_cpt_cabgenac = New cpt_cabgenac()
                    Me.rsto_cpt_cabgenac(un_cpt_cabgenac, objAdmConexiones.rsSQLFE)
                    _listaComprobantes.Add(un_cpt_cabgenac)
                    _comprobanteBuscado = un_cpt_cabgenac
                    obtenerComprobantesaEnviar = True
                Loop
            Else
                Me._error = "No existen registros para procesar en ct_Comprobantes. "
                Log.Logger("error", Me._error)
                obtenerComprobantesaEnviar = False

                Exit Try
            End If
        Catch ex As Exception
            Me._error = "No existen registros para procesar en ct_Comprobantes. " + ex.Message
            obtenerComprobantesaEnviar = False
            Log.Logger("error", Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
        End Try
    End Function



    Private Function rsto_cpt_cabgenac(ByVal pcpt_cabgenac As cpt_cabgenac, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean
        rsto_cpt_cabgenac = True
        Log.Logger("info", "cpt_cabgenacDAO - rsto_cpt_cabgenac")
        Try

            pcpt_cabgenac.cod_doc.Valor = rs("cod_doc")
            pcpt_cabgenac.nro_doc.Valor = rs("nro_doc")
            pcpt_cabgenac.nro_trans.Valor = rs("nro_trans")

            pcpt_cabgenac.cod_doc.Tipo = rs("cod_doc").GetType
            pcpt_cabgenac.nro_doc.Tipo = rs("nro_doc").GetType
            pcpt_cabgenac.nro_trans.Tipo = rs("nro_trans").GetType

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("error", Me._error)
            rsto_cpt_cabgenac = False
        End Try

    End Function

End Class
