Imports System.IO
Imports System.Reflection

Public Class Campo

    Public valor As System.Object
    Public tipo As System.Type
    Public formato As String

    Public ReadOnly Property esNulo() As Boolean
        Get
            Try
                If valor.ToString.Trim().Length = 0 Then
                    Return True
                Else
                    Return False
                End If
            Catch ex As Exception
                Return True
            End Try
        End Get
    End Property

    Public ReadOnly Property estipo_odbc() As Boolean
        Get

            Try
                If valor.ToString.Trim().Length = 0 Then
                    Return True
                Else
                    Return False
                End If
            Catch ex As Exception
                Return True
            End Try


        End Get
    End Property


    Public ReadOnly Property estipo_db() As Boolean
        Get
            Try
                If valor.ToString.Trim().Length = 0 Then
                    Return True
                Else
                    Return False
                End If
            Catch ex As Exception
                Return True
            End Try
        End Get
    End Property

    Public Overrides Function ToString() As String
        Try
            Return Me.valor.ToString()

        Catch ex As Exception
            Return ""
        End Try

    End Function



End Class
