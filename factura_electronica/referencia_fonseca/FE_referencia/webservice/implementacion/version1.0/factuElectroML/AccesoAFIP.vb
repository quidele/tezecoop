
Class AccesoAFIP

    'Const DEFAULT_DNORIGEN_PROD As String = "C=AR, O=Curtiembre Fonseca S.A., SERIALNUMBER=CUIT 30559697857, CN=Ricardo Badano"
    'Const DEFAULT_DNDESTINO_PROD As String = "cn=wsaa,o=afip,c=ar,serialNumber=CUIT 33693450239"
    'Const DEFAULT_SERVICIO_PROD As String = "wsfe"
    'Const DEFAULT_NOMBRE_CERTI_PROD As String = "AFIP Produccion Computadores CA"

    ' Valores por defecto, globales en esta clase
    'Const DEFAULT_DNORIGEN_HOMO As String = "c=ar,o=curtiembres fonseca s.a.,2.5.4.5=#131043554954203330353539363937383537,cn=eulises quidel"
    'Const DEFAULT_DNDESTINO_HOMO As String = "cn=wsaahomo,o=afip,c=ar,serialNumber=CUIT 33693450239"
    'Const DEFAULT_SERVICIO_HOMO As String = "wsfe"
    'Const DEFAULT_NOMBRE_CERTI_HOMO As String = "AFIP Testing Computadores CA"

    Const DEFAULT_VERBOSE As Boolean = True

    Public [Error] As String

    Public Sign As String ' Firma de seguridad recibida en la respuesta
    Public Token As String ' Token de seguridad recibido en la respuesta

    ''' <summary>
    ''' Funcion ejecutar 
    ''' </summary>
    ''' <returns>0 si terminó bien, valores negativos si hubieron errores</returns>
    ''' <remarks></remarks>
    Public Function obtenerTicketHomologacion() As Boolean

        Dim strDnSource As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_DNORIGEN_HOMO")
        Dim strDnDestination As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_DNDESTINO_HOMO")
        Dim strIdServicioNegocio As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_SERVICIO_HOMO")
        Dim strVerboseMode As Boolean = DEFAULT_VERBOSE
        Dim objTicketRespuesta As Ticket

            If strVerboseMode Then
                Console.WriteLine("***DN origen: {0}", strDnSource)
                Console.WriteLine("***Servicio a acceder: {0}", strIdServicioNegocio)
                Console.WriteLine("***DN destino: {0}", strDnDestination)
            End If

            objTicketRespuesta = New Ticket

        objTicketRespuesta.Modo = "Homologacion"
            objTicketRespuesta.OrigenDn = strDnSource
        objTicketRespuesta.Servicio = Configuration.ConfigurationManager.AppSettings("DEFAULT_SERVICIO_HOMO")
            objTicketRespuesta.DestinoDn = strDnDestination
            objTicketRespuesta.Verbose = strVerboseMode
        objTicketRespuesta.NombreCertificado = Configuration.ConfigurationManager.AppSettings("DEFAULT_NOMBRE_CERTI_HOMO")

            If Not objTicketRespuesta.ObtenerLoginTicketResponse() Then
                Me.Error = objTicketRespuesta.Error
                Return (False)
            End If

            Sign = objTicketRespuesta.Sign
            Token = objTicketRespuesta.Token

        Return True

    End Function



Public Function obtenerTicketProduccion() As Boolean
        Dim strDnSource As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_DNORIGEN_PROD")
        Dim strDnDestination As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_DNDESTINO_PROD")
        Dim strIdServicioNegocio As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_SERVICIO_PROD")
        Dim strVerboseMode As Boolean = DEFAULT_VERBOSE
        Dim objTicketRespuesta As Ticket


        If strVerboseMode Then
            Console.WriteLine("***DN origen: {0}", strDnSource)
            Console.WriteLine("***Servicio a acceder: {0}", strIdServicioNegocio)
            Console.WriteLine("***DN destino: {0}", strDnDestination)
        End If

        objTicketRespuesta = New Ticket

        objTicketRespuesta.Modo = "Produccion"
        objTicketRespuesta.OrigenDn = strDnSource
        objTicketRespuesta.Servicio = Configuration.ConfigurationManager.AppSettings("DEFAULT_SERVICIO_PROD")
        objTicketRespuesta.DestinoDn = strDnDestination
        objTicketRespuesta.Verbose = strVerboseMode
        objTicketRespuesta.NombreCertificado = Configuration.ConfigurationManager.AppSettings("DEFAULT_NOMBRE_CERTI_PROD")
        
        If Not objTicketRespuesta.ObtenerLoginTicketResponse() Then
            Me.Error = objTicketRespuesta.Error
            Return (False)
        End If

        If strVerboseMode Then
            Console.WriteLine("***CONTENIDO:")
            Console.WriteLine("   Token: {0}", objTicketRespuesta.Token)
            Console.WriteLine("   Sign: {0}", objTicketRespuesta.Sign)
            Console.WriteLine("   GenerationTime: {0}", CStr(objTicketRespuesta.GenerationTime))
            Console.WriteLine("   ExpirationTime: {0}", CStr(objTicketRespuesta.ExpirationTime))
            Console.WriteLine("   Service: {0}", objTicketRespuesta.Servicio)
            Console.WriteLine("   Source: {0}", objTicketRespuesta.Source)
            Console.WriteLine("   Destination: {0}", objTicketRespuesta.Destination)
            Console.WriteLine("   UniqueID: {0}", CStr(objTicketRespuesta.UniqueId))
        End If

        Sign = objTicketRespuesta.Sign
        Token = objTicketRespuesta.Token
        obtenerTicketProduccion = True
End Function



End Class