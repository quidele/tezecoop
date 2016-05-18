Imports fonseca_libDatos
Imports System.Threading
Imports DAOFacturacionElectronica
Imports System.Xml
Imports System.Text
Imports System.Security.Cryptography.X509Certificates

Public MustInherit Class AccesoAFIP

    Protected _globalUniqueID As UInt32 = 0 ' OJO! NO ES THREAD-SAFE
    Protected _error As String
    Protected _objetoObtenido As Object

    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property

    Public ReadOnly Property ObjetoObtenido() As Object
        Get
            Return _objetoObtenido
        End Get
    End Property


    Public Sub CargarWeb(ByVal pAddress As String, pMiliSegundos As Integer)
        Try
            'Dim direccion As String = Configuration.ConfigurationManager.AppSettings("SERVICE_DIR").ToString
            'Dim tiempo As Integer = Integer.Parse(Configuration.ConfigurationManager.AppSettings("TIEMPO_ESPERA").ToString)
            Dim objProcessStartInfo As New ProcessStartInfo

            objProcessStartInfo.FileName = "iexplore"
            objProcessStartInfo.Arguments = pAddress
            objProcessStartInfo.WindowStyle = ProcessWindowStyle.Hidden

            Dim myProcess As Process = Process.Start(objProcessStartInfo)
            Thread.Sleep(pMiliSegundos)
            myProcess.Kill()

            Log.Logger(tipoLogging.Debug, "Dirección " + pAddress + " lanzada correctamente.")

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Friend Function GenerarLoginTicketRequest(pDnSource As String, pIdServicioNegocio As String, pDnDestination As String) As XmlDocument
        Try
            Dim xmlNodoSource As XmlNode
            Dim xmlNodoDestination As XmlNode
            Dim xmlNodoUniqueId As XmlNode
            Dim xmlNodoGenerationTime As XmlNode
            Dim xmlNodoExpirationTime As XmlNode
            Dim xmlNodoService As XmlNode

            Dim XmlStrLoginTicketRequestTemplate As String = "<loginTicketRequest><header><source></source><destination>cn=wsaahomo,o=afip,c=ar,serialNumber=CUIT 33693450239</destination><uniqueId></uniqueId><generationTime></generationTime><expirationTime></expirationTime></header><service></service></loginTicketRequest>"
            Dim objXmlDocument As XmlDocument = Nothing

            objXmlDocument = New XmlDocument()
            objXmlDocument.LoadXml(XmlStrLoginTicketRequestTemplate)

            xmlNodoSource = objXmlDocument.SelectSingleNode("//source")
            xmlNodoDestination = objXmlDocument.SelectSingleNode("//destination")
            xmlNodoUniqueId = objXmlDocument.SelectSingleNode("//uniqueId")
            xmlNodoGenerationTime = objXmlDocument.SelectSingleNode("//generationTime")
            xmlNodoExpirationTime = objXmlDocument.SelectSingleNode("//expirationTime")
            xmlNodoService = objXmlDocument.SelectSingleNode("//service")

            xmlNodoGenerationTime.InnerText = DateTime.Now.AddMinutes(-10).ToString("s")
            xmlNodoExpirationTime.InnerText = DateTime.Now.AddMinutes(+10).ToString("s")
            xmlNodoSource.InnerText = pDnSource
            xmlNodoDestination.InnerText = pDnDestination
            xmlNodoUniqueId.InnerText = CStr(_globalUniqueID)
            xmlNodoService.InnerText = pIdServicioNegocio
            _globalUniqueID += 1

            Return objXmlDocument

        Catch ex As Exception
            Me._error = "***Error GENERANDO el LoginTicketRequest : " + ex.Message
            Throw ex
        End Try
    End Function

    Friend Function FirmarLoginTicketRequest(pDnSource As String, pNombreCertificado As String, pXmlLoginTicketRequest As XmlDocument) As String
        Try
            Dim objEncodedSignedCms As Byte()
            Dim objMsgBytes As Byte()
            Dim objEncodedMsg As Encoding
            Dim certFirmante As X509Certificate2

            ' PARA OBTENER EL CERTIFICADO DEL CERTSTORE MY DE WINDOWS DES-COMENTAR SIGUIENTE LINEA
            certFirmante = CertificadosX509.ObtieneCertificadoDelCertStoreMy(pDnSource, pNombreCertificado)

            If certFirmante Is Nothing Then
                Throw New Exception("No se encuentra el certificado en el store. Verifique su existencia.")
            End If

            ' Convierto el login ticket request a bytes, para firmar
            objEncodedMsg = Encoding.UTF8
            objMsgBytes = objEncodedMsg.GetBytes(pXmlLoginTicketRequest.OuterXml)

            ' Firmo el msg y paso a Base64
            objEncodedSignedCms = CertificadosX509.FirmaBytesMensaje(objMsgBytes, certFirmante)

            Return Convert.ToBase64String(objEncodedSignedCms)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function LoginTicketResponseToTicket(ByVal pLoginTicketResponse As String) As Ticket
        Try
            Dim objTicket As New Ticket
            Dim objXmlLoginTicketResponse As New XmlDocument

            objXmlLoginTicketResponse.LoadXml(pLoginTicketResponse)

            objTicket.Source = objXmlLoginTicketResponse.SelectSingleNode("//source").InnerText
            objTicket.Destination = objXmlLoginTicketResponse.SelectSingleNode("//destination").InnerText
            objTicket.UniqueID = UInt32.Parse(objXmlLoginTicketResponse.SelectSingleNode("//uniqueId").InnerText)
            objTicket.GenerationTime = DateTime.Parse(objXmlLoginTicketResponse.SelectSingleNode("//generationTime").InnerText)
            objTicket.ExpirationTime = DateTime.Parse(objXmlLoginTicketResponse.SelectSingleNode("//expirationTime").InnerText)
            objTicket.Sign = objXmlLoginTicketResponse.SelectSingleNode("//sign").InnerText
            objTicket.Token = objXmlLoginTicketResponse.SelectSingleNode("//token").InnerText

            Return objTicket

        Catch ex As Exception
            Throw ex
        End Try
    End Function


End Class
