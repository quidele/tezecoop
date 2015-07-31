Imports System.IO
Imports System.Xml.Serialization
Imports System.Xml
Imports System


Public Class GestionXML
    Public [error] As String
    Private fecha As Date
    Public archivoPath As String
    Public TokenLeido As String
    Public SignLeido As String
    Dim rutaAplicacion As String

    ''' <summary>
    ''' Comprueba la existencia de un archivo XML para el dia de la fecha.
    ''' </summary>
    ''' <returns>Verdadero si el arhivo existe</returns>
    ''' <remarks>Almacena el nombre del archivo con la fecha actual</remarks>
    Public Function ComprobarExistenciaXML_ML(Optional ByVal TipoMercado As String = Nothing) As Boolean
        ComprobarExistenciaXML_ML = False
        Dim stringFecha As String
        Dim modoOperacion As String = ""
        'Dim tipoMercado As String = ""

        rutaAplicacion = CurDir()

        If TipoMercado Is Nothing Then
            TipoMercado = System.Configuration.ConfigurationManager.AppSettings("TIPO_MERCADO").ToString + "_"
        Else
            TipoMercado = TipoMercado + "_"
        End If


        If System.Configuration.ConfigurationManager.AppSettings("MODO_OPERACION").ToString.ToUpper = "HOMOLOGACION" Then
            modoOperacion = "HOMO_"
        ElseIf System.Configuration.ConfigurationManager.AppSettings("MODO_OPERACION").ToString.ToUpper = "PRODUCCION" Then
            modoOperacion = "PROD_"
        Else
            modoOperacion = Mid(System.Configuration.ConfigurationManager.AppSettings("MODO_OPERACION").ToString.ToUpper, 1, 4) + "_"
        End If

        fecha = Date.Now()
        stringFecha = fecha.Day.ToString + "-" + fecha.Month.ToString + "-" + fecha.Year.ToString
        archivoPath = "TA_" + modoOperacion + tipoMercado + stringFecha + ".xml"
        Log.EscbribirLinea_Log("Buscando archivo: " + archivoPath.ToString)
        If File.Exists(rutaAplicacion + "\" + archivoPath) Then
            If LeerArchivoXML() = True Then
                Log.EscbribirLinea_Log("Token y Sign leidos correctamente")
                ComprobarExistenciaXML_ML = True
                Console.WriteLine("Archivo XML leido correctamente")
            End If
        Else
            Me.error = "El archivo buscado no existe o no se encuentra."
            Console.WriteLine("no se encuentra el archivo XML")
            Log.EscbribirLinea_Log(Me.error)
        End If

    End Function

    
    ''' <summary>
    ''' Crea un archivo XML con el Token y Firma obtenidos en el dia de la fecha. Y llama al metodo EliminarArchivos XML.
    ''' </summary>
    ''' <param name="valToken"></param>
    ''' <param name="valSign"></param>
    ''' <returns>Verdadero si el archivo fue creado satisfactoriamente</returns>
    ''' <remarks></remarks>
    Public Function CrearArchivoXML(ByVal valToken As String, ByVal valSign As String) As Boolean
        CrearArchivoXML = False
        Try
            If EliminarArchivosXML(archivoPath) = False Then
                Log.EscbribirLinea_Log(Me.error)
            End If


            Dim escritorXML As XmlTextWriter = New XmlTextWriter(archivoPath, System.Text.Encoding.UTF8)
            escritorXML.Formatting = Formatting.Indented
            escritorXML.WriteStartDocument(False)
            escritorXML.WriteComment("Token y Sign solo validos para el dia: " + fecha.ToString)
            escritorXML.WriteStartElement("Auth")
            escritorXML.WriteStartElement("Token")
            escritorXML.WriteString(valToken.ToString)
            escritorXML.WriteEndElement()
            escritorXML.WriteStartElement("Sign")
            escritorXML.WriteString(valSign.ToString)
            escritorXML.WriteEndElement()
            escritorXML.WriteEndElement()
            escritorXML.Close()
            Log.EscbribirLinea_Log("Finalizada correctamente la creación del archivo XML " + archivoPath + " con Sign y Token.")
        Catch ex As Exception
            Me.error = ex.Message
            Log.EscbribirLinea_Log(Me.error)
        End Try
        CrearArchivoXML = True
    End Function


    ''' <summary>
    ''' Lee del archivo XML el Token y Sign y los almacena en variables de la clase
    ''' </summary>
    ''' <returns>Verdadero si la operación finalizó correctamente</returns>
    ''' <remarks></remarks>
    Private Function LeerArchivoXML() As Boolean

        LeerArchivoXML = False


        Try
            If Not File.Exists(archivoPath) Then
                Me.error = "Aun no se ha creado el archivo XML"
                Exit Function
            End If

            Dim lectorXML As New XmlTextReader(archivoPath)

            Do While lectorXML.Read()

                Select Case lectorXML.NodeType
                    Case XmlNodeType.Element 'Mostrar comienzo del elemento.
                        Select Case lectorXML.Name
                            Case "Token"
                                lectorXML.Read()
                                tokenLeido = lectorXML.Value
                            Case "Sign"
                                lectorXML.Read()
                                SignLeido = lectorXML.Value
                        End Select
                End Select

            Loop



        Catch ex As Exception
            Me.error = ex.Message
            Log.EscbribirLinea_Log(Me.error)
        End Try

        LeerArchivoXML = True
    End Function


    ''' <summary>
    ''' Elimina los archivos XML de Token y Sign que comiencen con las 7 primeras letras del path
    ''' </summary>
    ''' <param name="path"></param>
    ''' <returns>Verdadero si la operación finalizó correctamente</returns>
    ''' <remarks></remarks>
    Private Function EliminarArchivosXML(ByVal path As String) As Boolean
        EliminarArchivosXML = False
        Dim listaArchivos As List(Of String)

        Try
            ' rutaAplicacion = System.Configuration.ConfigurationManager.AppSettings("ROOT_RUTA").ToString

            listaArchivos = Directory.GetFileSystemEntries(CurDir()).ToList

            For Each archivo As String In listaArchivos

                If archivo.ToUpper.Contains(Mid(path.ToUpper, 1, 10)) Then
                    File.Delete(archivo)
                    Log.EscbribirLinea_Log("Eliminando archivo: " + archivo)
                End If
            Next
        Catch ex As Exception
            Me.error = ex.Message
        End Try

       
        EliminarArchivosXML = True
    End Function







End Class
