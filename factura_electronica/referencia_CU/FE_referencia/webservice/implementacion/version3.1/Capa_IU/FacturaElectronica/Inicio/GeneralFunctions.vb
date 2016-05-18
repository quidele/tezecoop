Imports fonseca_libDatos

Public NotInheritable Class GeneralFunctions


    ''' <summary>
    ''' Version_6.1
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function ObtenerVersionRealSistemaObject() As System.Version
        Try
            Log.Logger(tipoLogging.Check, "ObtenerVersionRealSistema")
            Dim version As System.Version

            If My.Computer.Network.IsAvailable AndAlso My.Application.IsNetworkDeployed Then
                Log.Logger(tipoLogging.Check, "IsNetworkDeployed = TRUE")
                Log.Logger(tipoLogging.Check, "Network.IsAvailable = TRUE")
                version = My.Application.Deployment.CurrentVersion
            Else
                If Not My.Computer.Network.IsAvailable Then
                    Log.Logger(tipoLogging.Check, "Network.IsAvailable = FALSE")
                End If
                If Not My.Application.IsNetworkDeployed Then
                    Log.Logger(tipoLogging.Check, "IsNetworkDeployed = FALSE")
                End If
                version = My.Application.Info.Version
            End If

            Return version

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Version_6.1
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function ObtenerVersionRealSistema() As String
        Try

            Return ObtenerVersionRealSistemaObject().ToString()

        Catch ex As Exception
            Throw ex
        End Try
    End Function



End Class
