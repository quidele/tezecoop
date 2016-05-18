Imports System.IO
Imports System.Xml.Serialization
Imports System.Xml

Public Class AdmXML

    Private _rutaXML As String
    Private _esNodoRaiz As Boolean = False

    Sub New(ByVal RutaXML As String)
        _rutaXML = RutaXML
    End Sub

    Public Function GuardarValorNodo(ByVal pNodo As String, ByVal pValor As String, ByVal pNodoRaiz As String) As Boolean
        GuardarValorNodo = False
        Try
            Dim objXmlDocument As New XmlDocument()
            'Cargamos el documento XML
            objXmlDocument.Load(_rutaXML)
            'Buscamos el nodo que deseamos modificar
            'Al buscar debemos anteponer el nodo que lo contiene o la ruta para acceder al nodo Ej. configuracion/color si deseamos cambiar la propiedad color
            Dim objXmlNode As XmlNode = objXmlDocument.SelectSingleNode(pNodoRaiz + "/" + pNodo)
            If objXmlNode IsNot Nothing Then
                ' Cambiamos el texto que hay en el nodo.
                objXmlNode.InnerText = pValor
                GuardarValorNodo = True
            Else
                Exit Function
            End If
            'Guardamos el archivo XML
            objXmlDocument.Save(_rutaXML)

            objXmlDocument = Nothing
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Sub GuardarNuevoElemento(ByVal pNodo As String, ByVal pValor As String)
        Try
            Dim objXmlDoc As New XmlDocument()

            objXmlDoc.Load(_rutaXML)

            Dim objNodo As XmlNode = objXmlDoc.CreateNode(XmlNodeType.Element, pNodo, Nothing)

            objNodo.InnerText = pValor

            objXmlDoc.DocumentElement.AppendChild(objNodo)

            objXmlDoc.Save(_rutaXML)

            objXmlDoc = Nothing
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Function SerializarObjeto(ByVal unObjeto As Object) As Boolean

        SerializarObjeto = False
        Dim objStreamWriter As StreamWriter = Nothing

        Try
            objStreamWriter = New StreamWriter(_rutaXML)

            Dim x As New XmlSerializer(unObjeto.GetType)

            x.Serialize(objStreamWriter, unObjeto)


            SerializarObjeto = True

        Catch ex As Exception
            Throw ex
        Finally
            objStreamWriter.Close()
        End Try

    End Function

    Public Function DeserializarObjeto(ByVal tipoObjeto As Type) As Object

        Dim objStreamReader As StreamReader = Nothing

        Try
            Dim unObjeto As Object

            objStreamReader = New StreamReader(_rutaXML)

            Dim x As New XmlSerializer(tipoObjeto)

            unObjeto = x.Deserialize(objStreamReader)


            Return unObjeto

        Catch ex As Exception
            Throw ex
        Finally
            objStreamReader.Close()
        End Try


    End Function



    Public Function LeerNodo(ByVal pNodo As String, ByVal pNodoRaiz As String) As String

        'valor de retorno reset
        Dim retorno As String = ""
        Dim xml_reader As XmlTextReader = Nothing

        Try
            xml_reader = New XmlTextReader(_rutaXML)

            Dim _esNodoCorrecto As Boolean = False
            'Mientras se lea el archivo XML
            Do While (xml_reader.Read())
                'Si es un elemento y es igual a configuracion entonces pasamos al siguiente y esConfiguracion
                If xml_reader.NodeType = XmlNodeType.Element Then
                    If xml_reader.Name.ToLower = pNodoRaiz Then
                        _esNodoRaiz = True
                        Continue Do
                    End If
                End If

                'Si es el fin de configuracion no leemos mas, devuelve cadena vacia
                If xml_reader.NodeType = XmlNodeType.EndElement Then
                    If xml_reader.Name.ToLower = pNodoRaiz Then
                        Return retorno
                    End If
                End If
                'Si es un elemento y el nombre no es el que buscamos, pasamos al siguiente nodo
                If xml_reader.NodeType = XmlNodeType.Element Then
                    If xml_reader.Name.ToLower <> pNodo.ToLower Then
                        Continue Do
                    Else
                        _esNodoCorrecto = True
                    End If
                End If
                'Si aun no dimos con el nodo que buscamos pasamos al siguiente
                If _esNodoCorrecto = False Then
                    Continue Do
                End If
                'Si llegamos hasta aca es porque encontramos el nodo que buscamos o todavia no pasamos por un elemento
                If xml_reader.NodeType = XmlNodeType.Text And (_esNodoRaiz = True OrElse _esNodoCorrecto = True) Then
                    'pero si el nodo es texto entonces devolvemos el valor 
                    retorno = xml_reader.Value
                    Exit Do
                End If
            Loop

            _esNodoRaiz = False
            _esNodoCorrecto = False
        Catch ex As IO.IOException
            Throw New Exception("Error al establecer conexión on el archivo XML. " + ex.Message)
        Catch ex As Exception
            Throw ex
        Finally
            xml_reader.Close()
        End Try

        Return retorno
    End Function


End Class
