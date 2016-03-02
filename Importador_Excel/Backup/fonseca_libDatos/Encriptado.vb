Imports System.Data
Imports System.Text
Imports System.Security.Cryptography

Public Class Encriptado

    ''' <summary>
    ''' Devuelve una clave encriptada a partir de un nombre de usuario
    ''' </summary>
    ''' <param name="strUsuario"></param>
    ''' <param name="strPass"></param>
    ''' <returns>String</returns>
    Public Function EncryptText(ByVal strPass As String, ByVal strUsuario As String) As String
        Dim i As Integer, C As Integer
        Dim strBuff As String = ""

        strUsuario = UCase$(strUsuario)

        'Encrypt string
        If Len(strUsuario) > 1 Then
            For i = 1 To Len(strPass)
                C = Asc(Mid$(strPass, i, 1))
                C = C + Asc(Mid$(strUsuario, (i Mod Len(strUsuario)) + 1, 1))
                strBuff = strBuff & Chr(C And &HFF)
            Next i
        Else
            strBuff = strPass
        End If
        'Devuelve la cadena encriptada
        EncryptText = strBuff

    End Function


    ''' <summary>
    ''' Devuelve la clave original desencriptada a partir de su propio nombre de usuario
    ''' </summary>
    ''' <param name="strPassEncript"></param>
    ''' <param name="strUsuario"></param>
    ''' <returns>string</returns>
    Public Function DecryptText(ByVal strPassEncript As String, ByVal strUsuario As String) As String
        Dim i As Integer, C As Integer
        Dim strBuff As String = ""

        strUsuario = UCase$(strUsuario)

        'Desencripta el string
        If Len(strUsuario) > 1 Then
            For i = 1 To Len(strPassEncript)
                C = Asc(Mid$(strPassEncript, i, 1))
                C = (C - (Asc(Mid$(strUsuario, (i Mod Len(strUsuario)) + 1, 1))))
                strBuff = strBuff & Chr(C And &HFF)
            Next i
        Else
            strBuff = strPassEncript
        End If
        DecryptText = strBuff
    End Function


End Class
