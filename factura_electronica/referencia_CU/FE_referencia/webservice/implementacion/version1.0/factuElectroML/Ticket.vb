
Imports System
Imports System.Collections.Generic
Imports System.Text
Imports System.Xml
Imports System.Net
Imports System.Security.Cryptography
Imports System.Security.Cryptography.Pkcs
Imports System.Security.Cryptography.X509Certificates
Imports System.IO
Imports System.Xml.Serialization
Imports System.Xml.XmlException

Public Class Ticket


    Public [Error] As String

    Public Source As String ' DN del computador que realiza el requerimiento
    Public Destination As String ' DN del WSAA
    Public UniqueId As UInt32 ' Entero de 32 bits sin signo que identifica el requerimiento
    Public GenerationTime As DateTime ' Momento en que fue generado el requerimiento
    Public ExpirationTime As DateTime ' Momento en el que exoira la solicitud

    Public Sign As String ' Firma de seguridad recibida en la respuesta
    Public Token As String ' Token de seguridad recibido en la respuesta

    Public OrigenDn As String
    Public Servicio As String
    'Public UrlWsaa As String
    Public DestinoDn As String
    Public Verbose As Boolean
    Public NombreCertificado As String
    Public Modo As String
    Public loginTicketResponse As String

    Private XmlLoginTicketRequest As XmlDocument = Nothing
    Private XmlLoginTicketResponse As XmlDocument = Nothing
    Private RutaDelCertificadoFirmante As String
    Private XmlStrLoginTicketRequestTemplate As String = "<loginTicketRequest><header><source></source><destination>cn=wsaahomo,o=afip,c=ar,serialNumber=CUIT 33693450239</destination><uniqueId></uniqueId><generationTime></generationTime><expirationTime></expirationTime></header><service></service></loginTicketRequest>"
    Private Shared _globalUniqueID As UInt32 = 0 ' OJO! NO ES THREAD-SAFE
    Private _verboseMode As Boolean = True


    Public Function ObtenerLoginTicketResponse() As Boolean



        CertificadosX509.VerboseMode = Verbose

        Dim cmsFirmadoBase64 As String
        Dim xmlNodoSource As XmlNode
        Dim xmlNodoDestination As XmlNode
        Dim xmlNodoUniqueId As XmlNode
        Dim xmlNodoGenerationTime As XmlNode
        Dim xmlNodoExpirationTime As XmlNode
        Dim xmlNodoService As XmlNode
        Log.EscbribirLinea_Log("Generando el Login Ticket Request")
        ' PASO 1: Genero el Login Ticket Request
        Try
            XmlLoginTicketRequest = New XmlDocument()
            XmlLoginTicketRequest.LoadXml(XmlStrLoginTicketRequestTemplate)

            xmlNodoSource = XmlLoginTicketRequest.SelectSingleNode("//source")
            xmlNodoDestination = XmlLoginTicketRequest.SelectSingleNode("//destination")
            xmlNodoUniqueId = XmlLoginTicketRequest.SelectSingleNode("//uniqueId")
            xmlNodoGenerationTime = XmlLoginTicketRequest.SelectSingleNode("//generationTime")
            xmlNodoExpirationTime = XmlLoginTicketRequest.SelectSingleNode("//expirationTime")
            xmlNodoService = XmlLoginTicketRequest.SelectSingleNode("//service")

            xmlNodoGenerationTime.InnerText = DateTime.Now.AddMinutes(-10).ToString("s")
            xmlNodoExpirationTime.InnerText = DateTime.Now.AddMinutes(+10).ToString("s")
            xmlNodoSource.InnerText = Me.OrigenDn
            xmlNodoDestination.InnerText = Me.DestinoDn
            xmlNodoUniqueId.InnerText = CStr(_globalUniqueID)
            xmlNodoService.InnerText = Servicio
            _globalUniqueID += 1

            If Me._verboseMode Then
                Console.WriteLine(XmlLoginTicketRequest.OuterXml)
            End If

        Catch excepcionAlGenerarLoginTicketRequest As Exception
            Me.Error = excepcionAlGenerarLoginTicketRequest.Message
            Log.EscbribirLinea_Log("***Error GENERANDO el LoginTicketRequest : " + excepcionAlGenerarLoginTicketRequest.Message)
            'Throw New Exception("***Error GENERANDO el LoginTicketRequest : " + excepcionAlGenerarLoginTicketRequest.Message)
            Return False
        End Try
        Log.EscbribirLinea_Log("Firmando el Login Ticket Request")
        ' PASO 2: Firmo el Login Ticket Request
        Try
            If Me._verboseMode Then
                Console.WriteLine("***Leyendo certificado: {0}", RutaDelCertificadoFirmante)
                Log.EscbribirLinea_Log("***Leyendo certificado: " + RutaDelCertificadoFirmante)
            End If

            ' PARA OBTENER EL CERTIFICADO DEL CERTSTORE MY DE WINDOWS DES-COMENTAR SIGUIENTE LINEA
            Dim certFirmante As X509Certificate2 = CertificadosX509.ObtieneCertificadoDelCertStoreMy(OrigenDn, NombreCertificado)

            ' Obtengo el certificado que voy a usar para firmar el mensaje
            ' Leo el certificado de disco
            'Dim certFirmante As X509Certificate2 = CertificadosX509Lib.ObtieneCertificadoDesdeArchivo(RutaDelCertificadoFirmante)

            'If Me._verboseMode Then
            '    Console.WriteLine("***Firmando: ")
            '    Log.EscbribirLinea_Log("***Firmando: ")
            '    Console.WriteLine(XmlLoginTicketRequest.OuterXml)
            '    Log.EscbribirLinea_Log(XmlLoginTicketRequest.OuterXml)

            'End If

            ' Convierto el login ticket request a bytes, para firmar
            Dim EncodedMsg As Encoding = Encoding.UTF8
            Dim msgBytes As Byte() = EncodedMsg.GetBytes(XmlLoginTicketRequest.OuterXml)

            ' Firmo el msg y paso a Base64
            Dim encodedSignedCms As Byte() = CertificadosX509.FirmaBytesMensaje(msgBytes, certFirmante)
            cmsFirmadoBase64 = Convert.ToBase64String(encodedSignedCms)

        Catch excepcionAlFirmar As Exception
            '  Throw New Exception("***Error FIRMANDO el LoginTicketRequest : " + excepcionAlFirmar.Message)
            Me.Error = excepcionAlFirmar.Message
            Log.EscbribirLinea_Log(excepcionAlFirmar.Message)
            Return False
        Finally

        End Try

        ' PASO 3: Invoco al WSAA para obtener el Login Ticket Response
        Try
            If Me._verboseMode Then
                Console.WriteLine("***Argumento en el request:")
                Console.WriteLine(cmsFirmadoBase64)
                '    Log.EscbribirLinea_Log("***Argumento en el request: " + cmsFirmadoBase64)
            End If

            Dim WSAA_homo As New ar.gov.afip.wsaahomo.LoginCMSClient
            Dim WSAA_prod As New ar.gov.afip.wsaa.LoginCMSClient


            WSAA_homo.Endpoint.Binding.SendTimeout = New TimeSpan(0, 1, 60)
            WSAA_homo.Endpoint.Binding.ReceiveTimeout = New TimeSpan(0, 1, 60)
            WSAA_homo.Endpoint.Binding.OpenTimeout = New TimeSpan(0, 1, 60)

            WSAA_prod.Endpoint.Binding.SendTimeout = New TimeSpan(0, 1, 60)
            WSAA_prod.Endpoint.Binding.ReceiveTimeout = New TimeSpan(0, 1, 60)
            WSAA_prod.Endpoint.Binding.OpenTimeout = New TimeSpan(0, 1, 60)

            If Me.Modo.ToUpper = "PRODUCCION" Then
                loginTicketResponse = WSAA_prod.loginCms(cmsFirmadoBase64)
            Else
                loginTicketResponse = WSAA_homo.loginCms(cmsFirmadoBase64)
            End If


            'If Me._verboseMode Then
            '    Console.WriteLine("***LoguinTicketResponse: ")
            '    Console.WriteLine(loginTicketResponse)
            'End If

            'Dim nombreArchivo As String
            'If Me.Modo.ToUpper = "PRODUCCION" Then
            '    nombreArchivo = "C:\TA_Prod.xml"
            'Else
            '    nombreArchivo = "C:\TA.xml"
            'End If

            'Dim file1 As New StreamWriter(nombreArchivo)
            'file1.Write(loginTicketResponse)
            'Log.EscbribirLinea_Log("Login Ticket Response: " + loginTicketResponse)
            'file1.Close()

        Catch excepcionAlInvocarWsaa As Exception
            Me.Error = excepcionAlInvocarWsaa.Message
            Log.EscbribirLinea_Log(excepcionAlInvocarWsaa.Message)
            Return False
        End Try

        Log.EscbribirLinea_Log("Analizando el Ticket Response recibido del WSAA")
        ' PASO 4: Analizo el Login Ticket Response recibido del WSAA
        Try
            XmlLoginTicketResponse = New XmlDocument()
            XmlLoginTicketResponse.LoadXml(loginTicketResponse)
            Me.Source = XmlLoginTicketResponse.SelectSingleNode("//source").InnerText
            Me.Destination = XmlLoginTicketResponse.SelectSingleNode("//destination").InnerText
            Me.UniqueId = UInt32.Parse(XmlLoginTicketResponse.SelectSingleNode("//uniqueId").InnerText)
            Me.GenerationTime = DateTime.Parse(XmlLoginTicketResponse.SelectSingleNode("//generationTime").InnerText)
            Me.ExpirationTime = DateTime.Parse(XmlLoginTicketResponse.SelectSingleNode("//expirationTime").InnerText)
            Me.Sign = XmlLoginTicketResponse.SelectSingleNode("//sign").InnerText
            Me.Token = XmlLoginTicketResponse.SelectSingleNode("//token").InnerText
        Catch excepcionAlAnalizarLoginTicketResponse As Exception
            Me.Error = excepcionAlAnalizarLoginTicketResponse.Message
            Log.EscbribirLinea_Log(Me.Error)
            Return False
        End Try

        Return True

    End Function


End Class
