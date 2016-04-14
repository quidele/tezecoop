Imports fonseca_libDatos
Public Class ConexionDAO


    Private _objConexion As Conexion
    Public ReadOnly Property ObjConexion() As Conexion
        Get
            Return _objConexion
        End Get
    End Property



    Public Function ObtenerConexion(ByVal pAmbiente As String, ByVal pnombre As Campo) As Boolean
        ObtenerConexion = False
        Dim Sql As String
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        Sql = " SELECT * FROM Conexion "
        Sql = Sql + " WHERE nombre = " + SQLAdapter.formatValuetoSQL(pnombre) + SQLAdapter.OPERADOR_AND
        Sql = Sql + " ambiente = " + SQLAdapter.formatValuetoSQL(Campo.ToCampo(pAmbiente))

        Try

        
            objAdmConexiones.AbrirConexionRRHH_SQL()
            Log.Logger("Debug", Sql)
            If objAdmConexiones.EjecutarQueryRRHH(Sql) Then
                While objAdmConexiones.rsSQL.Read()
                    With objAdmConexiones
                        _objConexion = New Conexion(Campo.ToCampo(.rsSQL("id_conexion").ToString), Campo.ToCampo(.rsSQL("plataforma").ToString), _
                                                    Campo.ToCampo(.rsSQL("ambiente").ToString), Campo.ToCampo(.rsSQL("nombre").ToString), _
                                                    Campo.ToCampo(.rsSQL("driver").ToString), Campo.ToCampo(.rsSQL("url").ToString), _
                                                    Campo.ToCampo(.rsSQL("usuario").ToString), Campo.ToCampo(.rsSQL("password").ToString))
                        Exit While
                    End With
                End While

                objAdmConexiones.CerrarDataReaderRRHH()

                ObtenerConexion = True
            End If
        Catch ex As Exception
            Log.Logger("Error", ex.Message)
            Throw ex
        End Try
    End Function


End Class
