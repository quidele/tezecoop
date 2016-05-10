
Imports System.Xml
Imports fonseca_libDatos


Public Class XmlUtils

    Public [error] As String
    Public listadeSolicitudesRecibidas As New ArrayList


    Public Function procesararchivo(ByVal pnombrearchivo As String) As Boolean
        Dim una_solicitud As Solicitud = Nothing
        Dim reader As XmlTextReader = New XmlTextReader(pnombrearchivo)
        Do While (reader.Read())
            If reader.Name = "comprobante" Or reader.Name = "nro" _
            Or reader.Name = "codaut" Or reader.Name = "vtocodaut" _
            Or reader.Name = "codtarea" Or reader.Name = "estadocmp" Or reader.Name = "fechaemision" Then
                Select Case reader.NodeType
                    Case XmlNodeType.Element 'Mostrar comienzo del elemento.
                        'la línea dice comprobante idsolicitud=164007, en el 1er reader.Name devolverá la palabra comprobante solamente.
                        'idsolicitud="164007 es un atributo, donde idsolicitud es el nombre (reader.Name) y 164007 es el valor (reader.Value) 
                        If reader.HasAttributes Then 'If attributes exist
                            While reader.MoveToNextAttribute()
                                'Mostrar nombre y valor del atributo.
                                Console.WriteLine(" {0}='{1}'", reader.Name, reader.Value)
                                If reader.Name.CompareTo("idsolicitud") = 0 Then
                                    una_solicitud = New Solicitud
                                    una_solicitud.idsolicitud.Valor = reader.Value
                                    una_solicitud.idsolicitud.Tipo = SQLAdapter.getTipoInteger
                                End If
                            End While
                        End If
                        Select Case reader.Name
                            Case "nro"
                                reader.Read()
                                Console.WriteLine(reader.Value)
                                una_solicitud.nro.Valor = reader.Value
                                una_solicitud.nro.Tipo = SQLAdapter.getTipoInteger
                            Case "codaut"
                                reader.Read()
                                Console.WriteLine(reader.Value)
                                una_solicitud.codaut.Valor = reader.Value
                                una_solicitud.codaut.Tipo = SQLAdapter.getTipoLong
                            Case "vtocodaut"
                                reader.Read()
                                Console.WriteLine(reader.Value)
                                una_solicitud.vtocodaut.Valor = reader.Value
                                una_solicitud.vtocodaut.Tipo = SQLAdapter.getTipoDate
                            Case "codtarea"
                                reader.Read()
                                Console.WriteLine(reader.Value)
                                una_solicitud.codtarea.Valor = reader.Value
                                una_solicitud.codtarea.Tipo = SQLAdapter.getTipoLong
                            Case "estadocmp"
                                reader.Read()
                                Console.WriteLine(reader.Value)
                                una_solicitud.estadocmp.Valor = reader.Value
                                una_solicitud.estadocmp.Tipo = SQLAdapter.getTipoString
                                listadeSolicitudesRecibidas.Add(una_solicitud)
                            Case "fechaemision"
                                reader.Read()
                                Console.WriteLine(reader.Value)
                                una_solicitud.fechaemision.Valor = reader.Value
                                una_solicitud.fechaemision.Tipo = SQLAdapter.getTipoDate
                        End Select
                End Select
            End If
        Loop
        Console.ReadLine()

        procesararchivo = True
        'Cuando reader.NodeType contiene el valor 13 (Element 13) se asume como espacio en blanco (no hay datos).
        'Cada vez que pasa por Readline "se avanza" en el archivo, horizontalmente, hasta que
        'reader.NodeType es de valor 13, allí en la próxima lectura de Readline, baja de línea.

        'Cuando reader.NodeType contiene el valor 1 (Element 1) se asume como comienzo y reader.Name
        'contiene el nombre del título del elemento (NOMBRE DE CAMPO).
        'reader.nodetype = 1 --> XmlNodeType.Element

        'Cuando reader.NodeType es de valor 3 (Element 3)se asume como núcleo.
        'En este caso la propiedad a usar es reader.Value que
        'contiene el texto central del elemento (DATO QUE INTERESA, VALOR DE CAMPO)
        'reader.NodeType = 3 --> XmlNodeType.Text

        'Cuando reader.NodeType es de valor 15 (Element 15) se asume como fin de elemento y reader.Name
        'vuelve a contener el nombre del título del elemento (NOMBRE DE CAMPO)
        'reader.nodetype = 15 --> XmlNodeType.Text

        'Cada vez que pasa por Readline "se avanza" en el archivo, horizontalmente, hasta que
        'reader.NodeType es de valor 13 (Element 13), allí en la próxima lectura de Readline, baja de línea.

    End Function


    Private Function parseo1(ByVal reader As XmlTextReader) As Boolean
        Do While (reader.Read())
            ' Trabajar aquí en los datos.
            Console.WriteLine(reader.Name)
        Loop

        ' La lectura del archivo XML ha terminado.
        Console.ReadLine() 'Pause
    End Function


    Private Function parseo2(ByVal reader As XmlTextReader) As Boolean

        Do While (reader.Read())
            Select Case reader.NodeType
                Case XmlNodeType.Element 'Mostrar comienzo del elemento.
                    Console.Write("<" + reader.Name)
                    Console.WriteLine(">")
                Case XmlNodeType.Text 'Mostrar el texto en cada elemento.
                    Console.WriteLine(reader.Value)
                Case XmlNodeType.EndElement 'Mostrar final del elemento.
                    Console.Write("</" + reader.Name)
                    Console.WriteLine(">")
            End Select
        Loop


    End Function

End Class
