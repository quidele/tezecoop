Public Class SQLAdapter


    Public Shared DOBLE_COMILLA As String = Chr(34)
    Public Shared COMA As String = ","
    Public Shared COMILLA_SIMPLE As String = "'"
    Public Shared COMILLA_DOBLE As String = "''"
    Public Shared OPERADOR_AND As String = " AND "


    Public Shared Function formatValuetoSQL(ByVal puncampo As Campo) As String

        formatValuetoSQL = "null"

        If puncampo.esNulo() Then
            Exit Function
        End If

        Select Case puncampo.tipo.FullName
            Case "System.Double", "System.Int32", "System.Decimal", "System.Int64", "System.Int16"
                If puncampo.valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQL = "null"
                    Exit Function
                End If
                formatValuetoSQL = Replace(Replace(puncampo.valor.ToString(), ",", "."), SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)
            Case "System.String"
                If puncampo.valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQL = "null"
                    Exit Function
                End If
                formatValuetoSQL = SQLAdapter.COMILLA_SIMPLE + Trim(Replace(puncampo.valor, SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)) + SQLAdapter.COMILLA_SIMPLE
            Case "System.DateTime"
                Dim unafecha As New System.DateTime
                unafecha = puncampo.valor
                If puncampo.valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQL = "null"
                    Exit Function
                End If
                If puncampo.valor.ToString.Length <= 10 Then
                    formatValuetoSQL = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy") + SQLAdapter.COMILLA_SIMPLE
                Else
                    formatValuetoSQL = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy hh:mm:ss") + SQLAdapter.COMILLA_SIMPLE
                End If
            Case "System.Date"
                Dim unafecha As New System.DateTime
                unafecha = puncampo.valor
                If puncampo.valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQL = "null"
                    Exit Function
                End If
                formatValuetoSQL = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Boolean"
                If puncampo.valor.ToString = "True" Then
                    formatValuetoSQL = "1"
                Else
                    formatValuetoSQL = "0"
                End If
            Case "System.DBNull"
                Debug.Print("ERROR no existe tipo ")
                formatValuetoSQL = "null"
        End Select

    End Function


    Public Shared Function formatValuetoMFG(ByVal puncampo As Campo) As String

        formatValuetoMFG = "null"

        If puncampo.esNulo() Then
            Exit Function
        End If

        Select Case puncampo.tipo.FullName
            Case "System.Type.Double", "System.Int32", "System.Decimal", "System.Int64", "System.Double"
                If puncampo.valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoMFG = "null"
                    Exit Function
                End If
                formatValuetoMFG = Replace(Replace(puncampo.valor, ",", "."), SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)
            Case "System.String"
                If puncampo.valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoMFG = "null"
                    Exit Function
                End If
                formatValuetoMFG = SQLAdapter.COMILLA_SIMPLE + Replace(puncampo.valor, SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE) + SQLAdapter.COMILLA_SIMPLE
            Case "System.DateTime", "System.Date"
                Dim unafecha As New System.DateTime
                unafecha = puncampo.valor
                If puncampo.valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoMFG = "null"
                    Exit Function
                End If
                formatValuetoMFG = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("yyyy/MM/dd") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Boolean"
                If puncampo.valor.ToString = "True" Then
                    formatValuetoMFG = "1"
                Else
                    formatValuetoMFG = "0"
                End If
            Case "System.DBNull"
                formatValuetoMFG = "null"
        End Select

    End Function


    Public Shared Function getTipoString() As System.Type
        getTipoString = "".GetType
    End Function

    Public Shared Function getTipoLong() As System.Type
        getTipoLong = Long.MaxValue.GetType
    End Function

    Public Shared Function getTipoDouble() As System.Type
        getTipoDouble = Double.MaxValue.GetType
    End Function


    Public Shared Function getTipoDate() As System.Type
        getTipoDate = Date.MaxValue.GetType
    End Function

    Public Shared Function getTipoDateTime() As System.Type
        getTipoDateTime = DateTime.MaxValue.GetType
    End Function

    Public Shared Function getTipoInteger() As System.Type
        getTipoInteger = Integer.MaxValue.GetType
    End Function

End Class

