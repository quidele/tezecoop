Imports System.IO

Public Class ArchivoSolicitudes

    Public [error] As String

    Public Function grabarArchivo(ByVal pnombrearchivo As String, ByVal pdatos As String) As Boolean

        Dim escritor As IO.StreamWriter
        Dim Archivo As VariantType
        Archivo = InputBox("Ruta y nombre del archivo")
        escritor = New IO.StreamWriter(Archivo)
        escritor.WriteLine("Esto es una prueba para escribir en un archivo de texto")
        escritor.Close()
        MessageBox.Show("Datos guardados")

    End Function



    Public Function grabarArchivoSolicitudXML(ByVal pnombrearchivo As String, ByVal plistaSolicitudesXML As ArrayList) As Boolean

        Dim escritor As IO.StreamWriter

        grabarArchivoSolicitudXML = False

        Try
            escritor = New IO.StreamWriter(pnombrearchivo)
        Catch ex As Exception
           [error] = ex.Message
            Exit Function
        End Try

        For Each un_comprobanteXML As String In plistaSolicitudesXML '-- Lista tripartita, el encabezado, cuerpo y cola viene para cada solicitud procesada.
            escritor.WriteLine(un_comprobanteXML) '-- mínimo de 3 pasadas, en caso de haber un solo comprobante.
        Next

        escritor.Close()
        grabarArchivoSolicitudXML = True


    End Function

    Public Shared Function obtenerNombreArchivo(ByVal pRuta As String) As String
        Dim datos
        obtenerNombreArchivo = ""
        datos = Split(pRuta, "\")
        For Each una_palabra In datos
            obtenerNombreArchivo = una_palabra
        Next
    End Function


End Class

