

Imports System
Imports System.Collections.Generic
Imports System.Text
Imports System.Xml
Imports System.Net
Imports System.Security.Cryptography
Imports System.Security.Cryptography.Pkcs
Imports System.Security.Cryptography.X509Certificates
Imports System.IO

Public Class CertificadosX509

    Public Shared VerboseMode As Boolean = False

    ''' <summary>
    ''' Lee un certificado del repositorio My 
    ''' </summary>
    ''' <param name="argDnCertificado">DN del certificado a buscar</param>
    ''' ''' <param name="argNameCertificado">Nombre del certificado a buscar</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function ObtieneCertificadoDelCertStoreMy( _
    ByVal argDnCertificado As String, ByVal argNameCertificado As String) As X509Certificate2


        ' Abro el repositorio de certificados en modo lectura
        Dim storeMy As New X509Store(StoreName.My, StoreLocation.CurrentUser)
        storeMy.Open(OpenFlags.[ReadOnly])

        ' Muestro los certificados del repositorio
        Console.WriteLine("***Certificados disponibles en el repositorio {0}:", storeMy.Name)
        Log.EscbribirLinea_Log("***Certificados disponibles en el repositorio:" + storeMy.Name)

        For Each cert As X509Certificate2 In storeMy.Certificates
            Console.WriteLine("" & Chr(9) & "{0}", cert.SubjectName.Name)
            If cert.GetNameInfo(X509NameType.DnsName, True) = argNameCertificado Then
                ' ubico el certificado y lo devuelvo, salimos de la funcion 
                Log.EscbribirLinea_Log("ubico el certificado y lo devuelvo, salimos de la funcion ")

                Return cert
            End If
        Next

        Return Nothing

    End Function

    ''' <summary>
    ''' Firma mensaje
    ''' </summary>
    ''' <param name="argBytesMsg">Bytes del mensaje</param>
    ''' <param name="argCertFirmante">Certificado usado para firmar</param>
    ''' <returns>Bytes del mensaje firmado</returns>
    ''' <remarks></remarks>
    Public Shared Function FirmaBytesMensaje( _
    ByVal argBytesMsg As Byte(), _
    ByVal argCertFirmante As X509Certificate2 _
    ) As Byte()
        Try
            ' Pongo el mensaje en un objeto ContentInfo (requerido para construir el obj SignedCms)
            Dim infoContenido As New ContentInfo(argBytesMsg)
            Dim cmsFirmado As New SignedCms(infoContenido)

            ' Creo objeto CmsSigner que tiene las caracteristicas del firmante
            Dim cmsFirmante As New CmsSigner(argCertFirmante)
            cmsFirmante.IncludeOption = X509IncludeOption.EndCertOnly

            If VerboseMode Then
                Console.WriteLine("***Firmando bytes del mensaje...")
                Log.EscbribirLinea_Log("***Firmando bytes del mensaje...")
            End If
            ' Firmo el mensaje PKCS #7
            cmsFirmado.ComputeSignature(cmsFirmante)

            If VerboseMode Then
                Console.WriteLine("***OK mensaje firmado")
                Log.EscbribirLinea_Log("***OK mensaje firmado")
            End If

            ' Encodeo el mensaje PKCS #7.
            Return cmsFirmado.Encode()
        Catch excepcionAlFirmar As Exception

            Log.EscbribirLinea_Log("***Error al firmar: " & excepcionAlFirmar.Message)
            Throw New Exception("***Error al firmar: " & excepcionAlFirmar.Message)
            Return Nothing
        End Try
    End Function

    ''' <summary>
    ''' Lee certificado de disco
    ''' </summary>
    ''' <param name="argArchivo">Ruta del certificado a leer.</param>
    ''' <returns>Un objeto certificado X509</returns>
    ''' <remarks></remarks>
    Public Shared Function ObtieneCertificadoDesdeArchivo( _
    ByVal argArchivo As String _
    ) As X509Certificate2
        Dim objCert As New X509Certificate2
        Try
            objCert.Import(My.Computer.FileSystem.ReadAllBytes(argArchivo))
            Return objCert
        Catch excepcionAlImportarCertificado As Exception
            Log.EscbribirLinea_Log(excepcionAlImportarCertificado.Message & " " & excepcionAlImportarCertificado.StackTrace)
            Throw New Exception(excepcionAlImportarCertificado.Message & " " & excepcionAlImportarCertificado.StackTrace)
            Return Nothing
        End Try
    End Function

End Class
