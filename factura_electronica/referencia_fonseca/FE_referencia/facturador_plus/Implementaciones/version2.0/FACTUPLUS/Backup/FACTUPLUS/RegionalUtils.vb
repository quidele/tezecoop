
Imports System.String


Public Class RegionalUtils


Public Shared Function ImporteEnLetras(ByVal argNumero As Decimal, ByVal argIdioma As String) As String
        Try
            ' Redondeo en 2 decimales
            argNumero = Math.Round(argNumero, 2)
            Dim parteEntera As Int64 = Math.Truncate(argNumero)
            Dim cents As Integer = (argNumero - parteEntera) * 100
            Dim result As String = ""
            Select Case argIdioma.ToUpper.Trim
                Case "EN"
                    ' Inglés
                    result = _IntegerToWords(parteEntera)
                    If cents > 0 Then result = result.Trim & " and " & cents & "/100"
                Case Else
                    ' Español
                    result = _EnteroAPalabras(parteEntera)
                    If cents > 0 Then result = result.Trim & " con " & cents & "/100"
            End Select
            Return result
        Catch ex As Exception
            Throw
        End Try
    End Function
    ''' <summary> 
    ''' Retorna un string representando el número argNumero en palabras.
    ''' </summary> 
    Private Shared Function _IntegerToWords(ByVal argNumero As Int64) As String
        Try
            If argNumero < 0 Or argNumero > System.Int64.MaxValue Then
                Throw New Exception("El número está fuera del rango soportado por la función (0 - " & System.Int64.MaxValue.ToString & ")")
            End If
            If argNumero = 0 Then Return "zero"
            Dim result As String = ""
            If argNumero > 999 Then
                Dim place(4) As String
                Dim mult(4) As Int64
                place(0) = " thousand " : mult(0) = 1000
                place(1) = " million " : mult(1) = 1000000
                place(2) = " billion " : mult(2) = 1000000000
                place(3) = " trillion " : mult(3) = 1000000000000
                Dim aux As Int64
                Dim resto As Int64 = argNumero
                Dim units As Integer
                For i As Integer = 3 To 0 Step -1
                    If resto >= mult(i) Then
                        aux = (resto \ mult(i))
                        resto = resto - (aux * mult(i))
                        If aux > 0 Then
                            result = result & _HundredsToWords(aux) & place(i)
                        End If
                    End If
                Next
                units = argNumero - (argNumero \ 1000) * 1000
                If units > 0 Then result = result & _HundredsToWords(units)
            Else
                result = _HundredsToWords(argNumero)
            End If
            Return result
        Catch ex As Exception
            Throw
        End Try
    End Function
    ''' <summary>
    ''' Retorna un string representando el número argNumero en palabras.
    ''' </summary>
    Public Shared Function _EnteroAPalabras(ByVal argNumero As Int64) As String
        Try
            If argNumero < 0 Or argNumero > System.Int64.MaxValue Then
                Throw New Exception("El número está fuera del rango soportado por la función (0 - " & System.Int64.MaxValue.ToString & ")")
            End If
            If argNumero = 0 Then Return "cero"
            Dim result As String = ""
            If argNumero > 999 Then
                Dim place(2) As String
                Dim mult(2) As Int64
                place(0) = " mil " : mult(0) = 1000
                place(1) = " millón " : mult(1) = 1000000
                place(2) = " billón " : mult(2) = 1000000000000
                'Dim place(4) As String
                'Dim mult(4) As Int64
                'place(0) = " mil " : mult(0) = 1000
                'place(1) = " millón " : mult(1) = 1000000
                'place(2) = " billón " : mult(2) = 1000000000
                'place(3) = " trillón " : mult(3) = 1000000000000
                Dim aux As Int64
                Dim resto As Int64 = argNumero
                Dim units As Integer
                For i As Integer = 2 To 0 Step -1
                    If resto >= mult(i) Then
                        aux = (resto \ mult(i))
                        resto = resto - (aux * mult(i))
                        If aux > 0 Then
                            If aux = 1 Then
                                result = result & _EnteroAPalabras(aux) & place(i)
                            Else
                                result = result & _EnteroAPalabras(aux) & place(i).Replace("ón", "ones")
                            End If
                        End If
                    End If
                Next
                units = argNumero - (argNumero \ 1000) * 1000
                If units > 0 Then result = result & _EnteroAPalabras(units)
            Else
                result = _CientosAPalabras(argNumero)
            End If
            result = result.Replace("uno mil", "un mil")
            result = result.Replace("uno billón", "un billón")
            Return result
        Catch ex As Exception
            Throw
        End Try
    End Function
    Private Shared Function _HundredsToWords(ByVal argNumero As Integer) As String
        Try
            If argNumero < 1 Or argNumero > 999 Then
                Throw New Exception("El número está fuera del rango soportado por la función auxiliar CientosAPalabras(1 - 999)")
            End If
            Dim result As String = ""
            ' The range is from 1 to 999. 
            Dim units As Integer
            Dim hundreds As Integer = argNumero \ 100
            units = argNumero - (hundreds * 100)
            If hundreds > 0 Then
                result = _HundredsToWords(hundreds) + " hundred"
                If units > 0 Then
                    result = result + " " + _HundredsToWords(units)
                End If
            Else
                ' The range is from 1 to 99.
                If units = 1 Then : result = "one"
                ElseIf units = 2 Then : result = "two"
                ElseIf units = 3 Then : result = "three"
                ElseIf units = 4 Then : result = "four"
                ElseIf units = 5 Then : result = "five"
                ElseIf units = 6 Then : result = "six"
                ElseIf units = 7 Then : result = "seven"
                ElseIf units = 8 Then : result = "eight"
                ElseIf units = 9 Then : result = "nine"
                ElseIf units = 10 Then : result = "ten"
                ElseIf units = 11 Then : result = "eleven"
                ElseIf units = 12 Then : result = "twelve"
                ElseIf units = 13 Then : result = "thirteen"
                ElseIf units = 14 Then : result = "fourteen"
                ElseIf units = 15 Then : result = "fifteen"
                ElseIf units = 16 Then : result = "sixteen"
                ElseIf units = 17 Then : result = "seventeen"
                ElseIf units = 18 Then : result = "eighteen"
                ElseIf units = 19 Then : result = "nineteen"
                Else
                    ' The range is from 20 to 99
                    Dim tens As Integer = units \ 10
                    units = units - (tens * 10)
                    If tens = 2 Then : result = "twenty"
                    ElseIf tens = 3 Then : result = "thirty"
                    ElseIf tens = 4 Then : result = "forty"
                    ElseIf tens = 5 Then : result = "fifty"
                    ElseIf tens = 6 Then : result = "sixty"
                    ElseIf tens = 7 Then : result = "seventy"
                    ElseIf tens = 8 Then : result = "eighty"
                    ElseIf tens = 9 Then : result = "ninety"
                    End If
                    If units > 0 Then
                        result = result + " " + _HundredsToWords(units)
                    End If
                End If
            End If
            Return result
        Catch ex As Exception
            Throw
        End Try
    End Function
    Public Shared Function _CientosAPalabras(ByVal argNumero As Integer) As String
        Try
            If argNumero < 1 Or argNumero > 999 Then
                Throw New Exception("El número está fuera del rango soportado por la función auxiliar CientosAPalabras (1 - 999)")
            End If
            Dim result As String = ""
            ' The range is from 1 to 999.
            Dim units As Integer
            Dim hundreds As Integer = argNumero \ 100
            units = argNumero - (hundreds * 100)
            If hundreds > 0 Then
                ' hundreds va de 1 a 9    
                Select Case hundreds
                    Case 1
                        If units = 0 Then
                            result = "cien"
                        Else
                            result = "ciento"
                        End If
                    Case 2 : result = "doscientos"
                    Case 3 : result = "trescientos"
                    Case 4 : result = "cuatrocientos"
                    Case 5 : result = "quinientos"
                    Case 6 : result = "seiscientos"
                    Case 7 : result = "setecientos"
                    Case 8 : result = "ochocientos"
                    Case 9 : result = "novecientos"
                End Select
                If units > 0 Then
                    result = result + " " + _CientosAPalabras(units)
                End If
            Else
                ' The range is from 1 to 99.
                If units = 1 Then : result = "uno"
                ElseIf units = 2 Then : result = "dos"
                ElseIf units = 3 Then : result = "tres"
                ElseIf units = 4 Then : result = "cuatro"
                ElseIf units = 5 Then : result = "cinco"
                ElseIf units = 6 Then : result = "seis"
                ElseIf units = 7 Then : result = "siete"
                ElseIf units = 8 Then : result = "ocho"
                ElseIf units = 9 Then : result = "nueve"
                ElseIf units = 10 Then : result = "diez"
                ElseIf units = 11 Then : result = "once"
                ElseIf units = 12 Then : result = "doce"
                ElseIf units = 13 Then : result = "trece"
                ElseIf units = 14 Then : result = "catorce"
                ElseIf units = 15 Then : result = "quince"
                ElseIf units = 16 Then : result = "dieciseis"
                ElseIf units = 17 Then : result = "diecisiete"
                ElseIf units = 18 Then : result = "dieciocho"
                ElseIf units = 19 Then : result = "diecinueve"
                Else
                    ' The range is from 20 to 99 
                    Dim tens As Integer = units \ 10
                    units = units - (tens * 10)
                    If tens = 2 Then
                        If units = 0 Then
                            result = "veinte"
                        Else
                            result = "veinti"
                        End If
                    ElseIf tens = 3 Then : result = "treinta"
                    ElseIf tens = 4 Then : result = "cuarenta"
                    ElseIf tens = 5 Then : result = "cincuenta"
                    ElseIf tens = 6 Then : result = "sesenta"
                    ElseIf tens = 7 Then : result = "setenta"
                    ElseIf tens = 8 Then : result = "ochenta"
                    ElseIf tens = 9 Then : result = "noventa"
                    End If
                    If units > 0 Then
                        If tens = 2 Then
                            result = result + _CientosAPalabras(units)
                        Else
                            result = result + " y " + _CientosAPalabras(units)
                        End If
                    End If
                End If
            End If
            Return result
        Catch ex As Exception
            Throw
        End Try
    End Function

End Class
