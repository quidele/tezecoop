Imports System.Threading
Class AccesoAFIP

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

        Dim un_GestionXML As New GestionXML()

        If un_GestionXML.ComprobarExistenciaXML_ML() = True Then
            Sign = un_GestionXML.SignLeido
            Token = un_GestionXML.TokenLeido
            obtenerTicketHomologacion = True
            Log.EscbribirLinea_Log("Token: " + Token)
            Log.EscbribirLinea_Log("Sign: " + Sign)
            Exit Function
        End If

        CargarWebAFIP_WS()


        If strVerboseMode Then
            Console.WriteLine("***DN origen: {0}", strDnSource)
            Console.WriteLine("***Servicio a acceder: {0}", strIdServicioNegocio)
            Console.WriteLine("***DN destino: {0}", strDnDestination)
        End If

        objTicketRespuesta = New Ticket

        objTicketRespuesta.Modo = Configuration.ConfigurationManager.AppSettings("MODO_OPERACION")
        objTicketRespuesta.OrigenDn = strDnSource
        objTicketRespuesta.Servicio = Configuration.ConfigurationManager.AppSettings("DEFAULT_SERVICIO_HOMO")
        objTicketRespuesta.DestinoDn = strDnDestination
        objTicketRespuesta.Verbose = strVerboseMode
        objTicketRespuesta.NombreCertificado = Configuration.ConfigurationManager.AppSettings("DEFAULT_NOMBRE_CERTI_HOMO")

        If Not objTicketRespuesta.ObtenerLoginTicketResponse() Then
            Me.Error = objTicketRespuesta.Error
            obtenerTicketHomologacion = False
            CargarWebAFIP_WS()
            Exit Function
        End If

        Sign = objTicketRespuesta.Sign
        Token = objTicketRespuesta.Token

        If Not un_GestionXML.CrearArchivoXML(Token, Sign) Then
            Me.Error = un_GestionXML.error
            Exit Function
        End If ' Crear el archivo XML
        Log.EscbribirLinea_Log("Token y Firma obtenidos correctamente - WS")
        obtenerTicketHomologacion = True

    End Function

    Public Function obtenerTicketHomologacion_EX() As Boolean

        Dim strDnSource As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_DNORIGEN_HOMO")
        Dim strDnDestination As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_DNDESTINO_HOMO")
        Dim strIdServicioNegocio As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_SERVICIO_HOMO_EX")
        Dim strVerboseMode As Boolean = DEFAULT_VERBOSE
        Dim objTicketRespuesta As Ticket
        Dim un_GestionXML As New GestionXML

        If un_GestionXML.ComprobarExistenciaXML_ML() = True Then
            Sign = un_GestionXML.SignLeido
            Token = un_GestionXML.TokenLeido
            obtenerTicketHomologacion_EX = True
            Exit Function
        End If

        CargarWebAFIP_WS()


        If strVerboseMode Then
            Console.WriteLine("***DN origen: {0}", strDnSource)
            Console.WriteLine("***Servicio a acceder: {0}", strIdServicioNegocio)
            Console.WriteLine("***DN destino: {0}", strDnDestination)
        End If



        objTicketRespuesta = New Ticket

        objTicketRespuesta.Modo = Configuration.ConfigurationManager.AppSettings("MODO_OPERACION")
        objTicketRespuesta.OrigenDn = strDnSource
        objTicketRespuesta.Servicio = Configuration.ConfigurationManager.AppSettings("DEFAULT_SERVICIO_HOMO_EX")
        objTicketRespuesta.DestinoDn = strDnDestination
        objTicketRespuesta.Verbose = strVerboseMode
        objTicketRespuesta.NombreCertificado = Configuration.ConfigurationManager.AppSettings("DEFAULT_NOMBRE_CERTI_HOMO")

        CargarWebAFIP_WS()

        If Not objTicketRespuesta.ObtenerLoginTicketResponse() Then
            Me.Error = objTicketRespuesta.Error
            Return (False)
        End If

        Sign = objTicketRespuesta.Sign
        Token = objTicketRespuesta.Token

        If Not un_GestionXML.CrearArchivoXML(Token, Sign) Then
            Me.Error = un_GestionXML.error
            Exit Function
        End If

        Return True
    End Function

    ''' <summary>
    ''' Funcion ejecutar 
    ''' </summary>
    ''' <returns>0 si terminó bien, valores negativos si hubieron errores</returns>
    ''' <remarks></remarks>
    Public Function obtenerTicketProduccion() As Boolean
        Dim strDnSource As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_DNORIGEN_PROD")
        Dim strDnDestination As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_DNDESTINO_PROD")
        Dim strIdServicioNegocio As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_SERVICIO_PROD")
        Dim strVerboseMode As Boolean = DEFAULT_VERBOSE
        Dim objTicketRespuesta As Ticket

        Dim un_GestionXML As New GestionXML()

        If un_GestionXML.ComprobarExistenciaXML_ML() = True Then
            Sign = un_GestionXML.SignLeido
            Token = un_GestionXML.TokenLeido
            obtenerTicketProduccion = True
            Exit Function
        End If

        CargarWebAFIP_WS()


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
            CargarWebAFIP_WS()
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

        If Not un_GestionXML.CrearArchivoXML(Token, Sign) Then
            Me.Error = un_GestionXML.error
            Exit Function
        End If
        ' Crear el archivo XML

        obtenerTicketProduccion = True
    End Function

    Public Function obtenerTicketProduccion_Ex() As Boolean
        Dim strDnSource As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_DNORIGEN_PROD")
        Dim strDnDestination As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_DNDESTINO_PROD")
        Dim strIdServicioNegocio As String = Configuration.ConfigurationManager.AppSettings("DEFAULT_SERVICIO_PROD_EX")
        Dim strVerboseMode As Boolean = DEFAULT_VERBOSE
        Dim objTicketRespuesta As Ticket
        Dim un_GestionXML As New GestionXML

        If un_GestionXML.ComprobarExistenciaXML_ML() = True Then
            Sign = un_GestionXML.SignLeido
            Token = un_GestionXML.TokenLeido
            obtenerTicketProduccion_Ex = True
            Exit Function
        End If

        CargarWebAFIP_WS()



        If strVerboseMode Then
            Console.WriteLine("***DN origen: {0}", strDnSource)
            Console.WriteLine("***Servicio a acceder: {0}", strIdServicioNegocio)
            Console.WriteLine("***DN destino: {0}", strDnDestination)
        End If



        objTicketRespuesta = New Ticket

        objTicketRespuesta.Modo = Configuration.ConfigurationManager.AppSettings("MODO_OPERACION")
        objTicketRespuesta.OrigenDn = strDnSource
        objTicketRespuesta.Servicio = Configuration.ConfigurationManager.AppSettings("DEFAULT_SERVICIO_PROD_EX")
        objTicketRespuesta.DestinoDn = strDnDestination
        objTicketRespuesta.Verbose = strVerboseMode
        objTicketRespuesta.NombreCertificado = Configuration.ConfigurationManager.AppSettings("DEFAULT_NOMBRE_CERTI_PROD")

        CargarWebAFIP_WS()

        If Not objTicketRespuesta.ObtenerLoginTicketResponse() Then
            Me.Error = objTicketRespuesta.Error
            Return (False)
        End If

        Sign = objTicketRespuesta.Sign
        Token = objTicketRespuesta.Token

        If Not un_GestionXML.CrearArchivoXML(Token, Sign) Then
            Me.Error = un_GestionXML.error
            Exit Function
        End If

        obtenerTicketProduccion_Ex = True
    End Function


    Public Sub CargarWebAFIP_WS()
        Dim direccion As String = Configuration.ConfigurationManager.AppSettings("SERVICE_DIR").ToString
        Dim tiempo As Integer = Integer.Parse(Configuration.ConfigurationManager.AppSettings("TIEMPO_ESPERA").ToString)

        Dim inicioProceso As New ProcessStartInfo
        inicioProceso.FileName = "iexplore"
        inicioProceso.Arguments = direccion
        inicioProceso.WindowStyle = ProcessWindowStyle.Hidden

        Dim myProcess As Process = Process.Start(inicioProceso)
        Thread.Sleep(tiempo)
        myProcess.Kill()

        Log.EscbribirLinea_Log("Dirección " + direccion + " lanzada correctamente.")

    End Sub


End Class