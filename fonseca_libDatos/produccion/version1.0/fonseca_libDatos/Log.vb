Imports System.IO
Imports System.ComponentModel

Public Enum tipoLogging
    <Description("DEBUG")> Debug
    <Description("ERROR")> [Error]
    <Description("INFO")> Info
    <Description("WARN")> Warn
End Enum

Public Class Log

    Private Shared _tipoLog As String
    Private _numTipoLog As Integer
    Private Shared _SettingsTipoLog As String
    Private Shared _usuario As String
    Private Shared _Log_Activado As String
    Private Shared _ruta_Log As String



    Public Shared Sub EscbribirLinea_Log(ByVal stringLinea As String)

        'Dim logRuta As String = Configuration.ConfigurationManager.AppSettings("LOG_RUTA")

        'Si el numero del log del settings es menor, entonces no se escribe
        If Not _SettingsTipoLog = Nothing Then
            If analizaTipoLog(_SettingsTipoLog) < analizaTipoLog(_tipoLog) Then
                Exit Sub
            End If
        End If

        If _Log_Activado = "SI" Then

            Dim path_Log As String
            If _ruta_Log.Contains("\\") OrElse _ruta_Log.Contains(":") Then
                If Directory.Exists(_ruta_Log) = False Then
                    Directory.CreateDirectory(_ruta_Log)
                End If
                path_Log = _ruta_Log
            Else
                'Si el directorio no existe lo creamos
                If Directory.Exists(CurDir() + "\" + _ruta_Log) = False Then
                    Directory.CreateDirectory(CurDir() + "\" + _ruta_Log)
                End If
                'El directorio se crea en el directorio de la aplicacion \Log
                path_Log = CurDir() + "\" + _ruta_Log
            End If


            'Asignamos la fecha de hoy a la variable
            Dim hoyFecha As New Date()
            hoyFecha = Now
            'Adaptamos el formato de la fecha a la fecha que deseamos para nombrar el archivo
            Dim fechaArchivo As String = Now.Year.ToString + "-" + Now.Month.ToString + "-" + Now.Day.ToString

            'escribimos la linea en el archivo
            Dim strWriter As New StreamWriter((path_Log + My.Application.Info.ProductName.ToString + "-" + fechaArchivo + ".log").ToString, True)

            If Not _tipoLog = Nothing Then
                strWriter.WriteLine(hoyFecha.ToString + " | [" + _usuario.ToUpper + "] | [" + _tipoLog.ToUpper + "]" + " | " + stringLinea)
            Else
                strWriter.WriteLine(hoyFecha.ToString + " | [" + _usuario.ToUpper + "] | " + stringLinea)
            End If


            strWriter.Close()

        End If

    End Sub

    Public Shared Sub StartLog()
        Try
            _Log_Activado = Configuration.ConfigurationManager.AppSettings("LOG_ACTIVADO")
            _ruta_Log = Configuration.ConfigurationManager.AppSettings("LOG_RUTA")

            If Not _ruta_Log.EndsWith("\") Then
                _ruta_Log = _ruta_Log + "\"
            End If

            If _Log_Activado = "SI" Then

                _SettingsTipoLog = Configuration.ConfigurationManager.AppSettings("TIPO_LOG").ToUpper

            End If

            If _usuario = "" Or _usuario = Nothing Then
                Dim objSeguridad As New seguridad
                _usuario = objSeguridad.obtenerUID_Magma()
                objSeguridad = Nothing
            End If

        Catch ex As Exception
            'No pasa nada
        End Try
    End Sub

    Public Shared Sub StartLog(ByVal Log_Activado As String, ByVal Tipo_Log As String, ByVal Ruta_Log As String)
        _Log_Activado = Log_Activado
        _tipoLog = Tipo_Log
        _ruta_Log = Ruta_Log
        If Not _ruta_Log.EndsWith("\") Then
            _ruta_Log = _ruta_Log + "\"
        End If


        If _Log_Activado = "SI" Then

            _SettingsTipoLog = _tipoLog

        End If

        If _usuario = "" Or _usuario = Nothing Then
            Dim objSeguridad As New seguridad
            _usuario = objSeguridad.obtenerUID_Magma()
            objSeguridad = Nothing
        End If
    End Sub

    Public Shared Sub StartLog(ByVal user As String)
        _usuario = user
        StartLog()
    End Sub

    Public Shared Sub Logger(ByVal tipoLog As tipoLogging, ByVal linea As String)
        _tipoLog = tipoLog.ToString

        Try

            EscbribirLinea_Log(linea)

        Catch ex As Exception

        End Try
    End Sub

    Public Shared Sub Logger(ByVal tipoLog As String, ByVal linea As String)

        _tipoLog = tipoLog

        Try


            EscbribirLinea_Log(linea)

        Catch ex As Exception

        End Try
    End Sub

    Private Shared Function analizaTipoLog(ByVal tipolog As String) As Integer

        Select Case tipolog.ToUpper

            Case "ERROR"
                Return 1
            Case "WARN"
                Return 2
            Case "INFO"
                Return 3
            Case "DEBUG"
                Return 4
            Case Else
                Return 0
        End Select


    End Function


End Class