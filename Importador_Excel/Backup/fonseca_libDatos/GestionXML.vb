Imports System.IO
Imports System.Xml.Serialization
Imports System.Xml
Imports System

Public Class GestionXML

    Private _signLeido As String
    Private _tokenLeido As String
    Private _archivoPath As String
    Private _fecha As Date
    Private _rutaAplicacion As String
    Private _error As String

    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property
    Public Property ArchivoPath() As String
        Get
            Return _archivoPath
        End Get
        Set(ByVal value As String)
            _archivoPath = value
        End Set
    End Property
    Public Property TokenLeido() As String
        Get
            Return _tokenLeido
        End Get
        Set(ByVal value As String)
            _tokenLeido = value
        End Set
    End Property
    Public Property SignLeido() As String
        Get
            Return _signLeido
        End Get
        Set(ByVal value As String)
            _signLeido = value
        End Set
    End Property
    Public Property RutaAplicacion() As String
        Get
            Return _rutaAplicacion
        End Get
        Set(ByVal value As String)
            _rutaAplicacion = value
        End Set
    End Property


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

        _rutaAplicacion = CurDir()

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

        _fecha = Date.Now()
        stringFecha = _fecha.Day.ToString + "-" + _fecha.Month.ToString + "-" + _fecha.Year.ToString
        _archivoPath = "TA_" + modoOperacion + TipoMercado + stringFecha + ".xml"
        Log.EscbribirLinea_Log("Buscando archivo: " + _archivoPath.ToString)
        If File.Exists(_rutaAplicacion + "\" + _archivoPath) Then
            If LeerArchivoXML() = True Then
                Log.EscbribirLinea_Log("Token y Sign leidos correctamente")
                ComprobarExistenciaXML_ML = True
                Console.WriteLine("Archivo XML leido correctamente")
            End If
        Else
            Me._error = "El archivo buscado no existe o no se encuentra."
            Console.WriteLine("no se encuentra el archivo XML")
            Log.EscbribirLinea_Log(Me.Error)
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
            If EliminarArchivosXML(_archivoPath) = False Then
                Log.EscbribirLinea_Log(Me.Error)
            End If


            Dim escritorXML As XmlTextWriter = New XmlTextWriter(_archivoPath, System.Text.Encoding.UTF8)
            escritorXML.Formatting = Formatting.Indented
            escritorXML.WriteStartDocument(False)
            escritorXML.WriteComment("Token y Sign solo validos para el dia: " + _fecha.ToString)
            escritorXML.WriteStartElement("Auth")
            escritorXML.WriteStartElement("Token")
            escritorXML.WriteString(valToken.ToString)
            escritorXML.WriteEndElement()
            escritorXML.WriteStartElement("Sign")
            escritorXML.WriteString(valSign.ToString)
            escritorXML.WriteEndElement()
            escritorXML.WriteEndElement()
            escritorXML.Close()
            Log.EscbribirLinea_Log("Finalizada correctamente la creación del archivo XML " + _archivoPath + " con Sign y Token.")
        Catch ex As Exception
            Me._error = ex.Message
            Log.EscbribirLinea_Log(Me.Error)
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
            If Not File.Exists(_archivoPath) Then
                Me._error = "Aun no se ha creado el archivo XML"
                Exit Function
            End If

            Dim lectorXML As New XmlTextReader(_archivoPath)

            Do While lectorXML.Read()

                Select Case lectorXML.NodeType
                    Case XmlNodeType.Element 'Mostrar comienzo del elemento.
                        Select Case lectorXML.Name
                            Case "Token"
                                lectorXML.Read()
                                TokenLeido = lectorXML.Value
                            Case "Sign"
                                lectorXML.Read()
                                _SignLeido = lectorXML.Value
                        End Select
                End Select

            Loop



        Catch ex As Exception
            Me._error = ex.Message
            Log.EscbribirLinea_Log(Me.Error)
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
            Me._error = ex.Message
        End Try


        EliminarArchivosXML = True
    End Function


    Public Function ObtenerObjetoDesdeXML(ByVal pTipoObjeto As Type) As Object

        'Salimos si la variable esta vacia.
        If _archivoPath = String.Empty Then
            Return Nothing
        End If
        'Comprobamos la existencia del archivo
        If Not File.Exists(_archivoPath) Then
            Throw New Exception("Error al encontrar el archivo de configuración de conexiones.")
        End If

        'Deserializar desde el archivo al objeto.
        Dim objStreamReader As New StreamReader(_archivoPath)
        Dim p2 As New Object()

        Try

            'Dim ser As New XmlSerializer(GetType(Object))
            Dim ser As New XmlSerializer(pTipoObjeto)

            p2 = ser.Deserialize(objStreamReader)


        Catch ex As Exception
            Throw ex
        Finally
            objStreamReader.Close()
        End Try

        Return p2

    End Function

    Public Function GuardarObjetoXML(ByVal pObjeto As Object) As Boolean
        GuardarObjetoXML = False
        Try
            'Salimos si la variable esta vacia.
            If _archivoPath = String.Empty Then
                Exit Function
            End If

            'Serializamos el objeto a un archivo.
            Dim objStreamWriter As New StreamWriter(_archivoPath)

            Dim ser As New XmlSerializer(pObjeto.GetType)

            ser.Serialize(objStreamWriter, pObjeto)

            objStreamWriter.Close()

            GuardarObjetoXML = True

        Catch ex As Exception
            Throw ex
        End Try

    End Function

    Sub New(ByVal pArchivoPath As String)
        Me._archivoPath = pArchivoPath
    End Sub

    Sub New()

    End Sub


End Class
