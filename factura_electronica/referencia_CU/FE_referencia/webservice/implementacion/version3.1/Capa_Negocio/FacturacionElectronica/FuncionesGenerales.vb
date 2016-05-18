Imports fonseca_libDatos
Imports System.Security.Principal.WindowsIdentity
Imports fonseca_libDatos.Config

Public Class FuncionesGenerales

    Public Shared Function GetTipoDeConexion(ByVal pLst As List(Of Propiedades)) As String
        Try
            Dim tipoDeConexion As String = (From item As Propiedades In pLst _
                                     Where item.Propiedad.ToUpper.Equals("TIPO_DE_CONEXION") Select item.Valor).ToList(0).ToString

            Return tipoDeConexion
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Shared Function GetAmbiente(ByVal pLst As List(Of Propiedades)) As String
        Try
            Dim ambiente As String = (From item As Propiedades In pLst _
                                     Where item.Propiedad.ToUpper.Equals("AMBIENTE") Select item.Valor).ToList(0).ToString

            Return ambiente
        Catch ex As Exception
            Throw ex
        End Try
    End Function
    Public Shared Function GetAmbienteAFIP(ByVal pLst As List(Of Propiedades)) As String
        Try
            Dim ambiente As String = (From item As Propiedades In pLst _
                                     Where item.Propiedad.ToUpper.Equals("AFIP") Select item.Valor).ToList(0).ToString

            Return ambiente
        Catch ex As Exception
            Throw ex
        End Try
    End Function
    Public Shared Function GetBaseSecundaria(ByVal pLst As List(Of Propiedades)) As String
        Try
            Dim Base_secundaria As String = (From item As Propiedades In pLst _
                                     Where item.Propiedad.ToUpper.Equals("BASE_SECUNDARIA") Select item.Valor).ToList(0).ToString

            Return Base_secundaria
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Shared Function GetBasePrimaria(ByVal pLst As List(Of Propiedades)) As String
        Try
            Dim base_primaria As String = (From item As Propiedades In pLst _
                                     Where item.Propiedad.ToUpper.Equals("BASE_PRIMARIA") Select item.Valor).ToList(0).ToString

            Return base_primaria
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Shared Function GetBaseEsquema(ByVal pLst As List(Of Propiedades), ByVal pListaConexiones As List(Of Conexion)) As String
        Try

            Dim a As String
            Dim objTipoConexion As String
            Dim objAmbiente As String
            Dim objBase As String

            objTipoConexion = GetTipoDeConexion(pLst)
            objAmbiente = GetAmbiente(pLst)
            objBase = GetBasePrimaria(pLst)

            a = (From item As Conexion In pListaConexiones Where item.TipoConexion.ToUpper.Equals(objTipoConexion.ToUpper) AndAlso _
                 item.Ambiente.ToUpper.Equals(objAmbiente.ToUpper) AndAlso item.Nombre.ToUpper.Equals(objBase.ToUpper))(0).Base

            Return a

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Devuelve el nombre del usuario de Windows. Version_6.3
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetWindowsUser() As String
        Try

            Dim posicion As Integer

            If GetCurrent.Name.Contains("\") Then
                posicion = InStr(GetCurrent.Name, "\", CompareMethod.Text)
            Else
                posicion = 0
            End If

            Return Right(GetCurrent.Name, GetCurrent.Name.Length - posicion)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Devuelve el nombre del usuario de Windows. Version_6.3
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetHostName() As String
        Try

            Return Trim(My.Computer.Name).ToUpper

        Catch ex As Exception
            Throw ex
        End Try
    End Function




    ''' <summary>
    ''' El verdadero metodo esta en la clase Conexion de Fonseca_libDatos. pero por el momento usamos este hasta que el otro
    ''' sea implementado. Problemas en GAC
    ''' </summary>
    ''' <param name="pConnectionString"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function GetDataBaseFromConnectionString(pConnectionString As String) As String
        Dim b As String = String.Empty
        Try
            If pConnectionString.Equals(String.Empty) Then
                Return b
            End If

            If Not pConnectionString.Contains("Database") Then
                Return b
            End If

            Dim num1 As Integer = InStr(pConnectionString, "Database")
            Dim a As String = Mid(pConnectionString, num1)
            Dim num2 As Integer = InStr(a, "=")
            Dim num3 As Integer = InStrRev(a, "=")

            If num2 = num3 Then
                b = Mid(a, num2 + 1)
            Else
                b = Mid(a, num2, num3 - 1)
            End If

            Return b

        Catch ex As Exception
            Throw ex
        End Try
    End Function


    ''' <summary>
    ''' Obtiene una lista de objetos de tipo Conexion a partir del XML de la aplicación. Version_6.1
    ''' </summary>
    ''' <remarks></remarks>
    Public Shared Function ObtenerConexiones(ByVal pRutaArchivoConexiones As String) As List(Of Conexion)
        Try
            Dim lista As List(Of Conexion)
            Dim objGestionXML As New GestionXML(pRutaArchivoConexiones)

            lista = New List(Of Conexion)
            lista = CType(objGestionXML.ObtenerObjetoDesdeXML(lista.GetType()), Global.System.Collections.Generic.List(Of Global.fonseca_libDatos.Conexion))

            Return lista

        Catch ex As Exception
            Throw New Exception("No se obtuvieron datos de conexion. Falta el archivo """ + pRutaArchivoConexiones + """." + vbCrLf + " Error extendido: ")
        End Try
    End Function

End Class
