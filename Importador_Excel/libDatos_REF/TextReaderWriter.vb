Imports System.IO

Public Class TextReaderWriter



    Public Function ReadText(ByVal pPath As String) As String

        Dim texto As String = ""

        Try

            Using strReader As New StreamReader(pPath)
                Dim linea As String
                linea = strReader.ReadLine()

                Do While (Not linea Is Nothing)

                    texto = texto + linea + vbCrLf
                    linea = strReader.ReadLine

                Loop

            End Using

        Catch ex As Exception
            Log.Logger("Error", ex.Message)
            texto = ex.Message
        Finally
            ReadText = texto
        End Try

    End Function





End Class
