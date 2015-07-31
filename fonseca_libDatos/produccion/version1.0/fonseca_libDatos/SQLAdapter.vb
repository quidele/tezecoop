Public Class SQLAdapter


    Public Shared DOBLE_COMILLA As String = Chr(34)
    Public Shared COMA As String = ","
    Public Shared COMILLA_SIMPLE As String = "'"
    Public Shared COMILLA_DOBLE As String = "''"
    Public Shared OPERADOR_AND As String = " AND "
    Public Shared OPERADOR_OR As String = " OR "
    Public Shared OPERADOR_LIKE As String = "%"


    Public Shared ReadOnly Property NewProperty() As String
        Get
            Return Chr(34)
        End Get
    End Property

    Public Shared Function formatValuetoSQL(ByVal puncampo As Campo) As String

        formatValuetoSQL = "null"

        If puncampo.esNulo() Then
            Exit Function
        End If

        Select Case puncampo.Tipo.FullName
            Case "System.Double", "System.Int32", "System.Decimal", "System.Int64", "System.Int16"
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQL = "null"
                    Exit Function
                End If
                formatValuetoSQL = Replace(Replace(puncampo.Valor.ToString(), ",", "."), SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)
            Case "System.String", "System.Char"
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQL = "null"
                    Exit Function
                End If
                formatValuetoSQL = SQLAdapter.COMILLA_SIMPLE + Trim(Replace(puncampo.Valor.ToString, SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)) + SQLAdapter.COMILLA_SIMPLE
            Case "System.DateTime"
                Dim unafecha As New System.DateTime
                unafecha = Date.Parse(puncampo.Valor.ToString)
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQL = "null"
                    Exit Function
                End If
                formatValuetoSQL = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy hh:mm:ss") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Date"
                Dim unafecha As New System.DateTime
                unafecha = Date.Parse(puncampo.Valor.ToString)
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQL = "null"
                    Exit Function
                End If
                formatValuetoSQL = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Boolean"
                If puncampo.Valor.ToString = "True" Then
                    formatValuetoSQL = "1"
                Else
                    formatValuetoSQL = "0"
                End If
            Case "System.DBNull"
                Debug.Print("ERROR no existe tipo ")
                formatValuetoSQL = "null"
        End Select

    End Function

    Public Shared Function formatValuetoSQLLikeIzq(ByVal puncampo As Campo) As String

        formatValuetoSQLLikeIzq = "null"

        If puncampo.esNulo() Then
            Exit Function
        End If

        Select Case puncampo.Tipo.FullName
            Case "System.Double", "System.Int32", "System.Decimal", "System.Int64", "System.Int16"
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLikeIzq = "null"
                    Exit Function
                End If
                formatValuetoSQLLikeIzq = SQLAdapter.COMILLA_SIMPLE + Trim(Replace(puncampo.Valor.ToString, SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)) + SQLAdapter.OPERADOR_LIKE + SQLAdapter.COMILLA_SIMPLE
            Case "System.String"
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLikeIzq = "null"
                    Exit Function
                End If
                formatValuetoSQLLikeIzq = SQLAdapter.COMILLA_SIMPLE + Trim(Replace(puncampo.Valor.ToString, SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)) + SQLAdapter.OPERADOR_LIKE + SQLAdapter.COMILLA_SIMPLE
            Case "System.DateTime"
                Dim unafecha As New System.DateTime
                unafecha = Date.Parse(puncampo.Valor.ToString)
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLikeIzq = "null"
                    Exit Function
                End If
                formatValuetoSQLLikeIzq = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy hh:mm:ss") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Date"
                Dim unafecha As New System.DateTime
                unafecha = Date.Parse(puncampo.Valor.ToString)
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLikeIzq = "null"
                    Exit Function
                End If
                formatValuetoSQLLikeIzq = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Boolean"
                If puncampo.Valor.ToString = "True" Then
                    formatValuetoSQLLikeIzq = "1"
                Else
                    formatValuetoSQLLikeIzq = "0"
                End If
            Case "System.DBNull"
                Debug.Print("ERROR no existe tipo ")
                formatValuetoSQLLikeIzq = "null"
        End Select

    End Function

    Public Shared Function formatValuetoMFG(ByVal puncampo As Campo) As String

        formatValuetoMFG = "null"

        If puncampo.esNulo() Then
            Exit Function
        End If

        Select Case puncampo.Tipo.FullName
            Case "System.Type.Double", "System.Int32", "System.Decimal", "System.Int64", "System.Double"
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoMFG = "null"
                    Exit Function
                End If
                formatValuetoMFG = Replace(Replace(puncampo.Valor.ToString, ",", "."), SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)
            Case "System.String"
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoMFG = "null"
                    Exit Function
                End If
                formatValuetoMFG = SQLAdapter.COMILLA_SIMPLE + Replace(puncampo.Valor.ToString, SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE) + SQLAdapter.COMILLA_SIMPLE
            Case "System.DateTime", "System.Date"
                Dim unafecha As New System.DateTime
                unafecha = Date.Parse(puncampo.Valor.ToString)
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoMFG = "null"
                    Exit Function
                End If
                formatValuetoMFG = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("yyyy/MM/dd") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Boolean"
                If puncampo.Valor.ToString = "True" Then
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

    ' el formato de pstrDate debe ser yyyyMMdd
    Public Shared Function convertiraFecha(ByVal pstrDate As String) As Date
        Dim strDate As String
        Dim objdate As Date

        strDate = pstrDate.Substring(6, 2) & "/" & pstrDate.Substring(4, 2) & "/" & pstrDate.Substring(0, 4)
        objdate = CDate(Date.Parse(strDate).ToShortDateString)
        convertiraFecha = objdate

    End Function


    Public Shared Function formatValuetoSQLLike(ByVal puncampo As Campo) As String

        formatValuetoSQLLike = "null"

        If puncampo.esNulo() Then
            Exit Function
        End If

        Select Case puncampo.Tipo.FullName
            Case "System.Double", "System.Int32", "System.Decimal", "System.Int64", "System.Int16"
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLike = "null"
                    Exit Function
                End If
                formatValuetoSQLLike = SQLAdapter.COMILLA_SIMPLE + SQLAdapter.OPERADOR_LIKE + Trim(Replace(puncampo.Valor.ToString, SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)) + SQLAdapter.OPERADOR_LIKE + SQLAdapter.COMILLA_SIMPLE
            Case "System.String"
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLike = "null"
                    Exit Function
                End If
                formatValuetoSQLLike = SQLAdapter.COMILLA_SIMPLE + SQLAdapter.OPERADOR_LIKE + Trim(Replace(puncampo.Valor.ToString, SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)) + SQLAdapter.OPERADOR_LIKE + SQLAdapter.COMILLA_SIMPLE
            Case "System.DateTime"
                Dim unafecha As New System.DateTime
                unafecha = Date.Parse(puncampo.Valor.ToString)
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLike = "null"
                    Exit Function
                End If
                formatValuetoSQLLike = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy hh:mm:ss") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Date"
                Dim unafecha As New System.DateTime
                unafecha = Date.Parse(puncampo.Valor.ToString)
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLike = "null"
                    Exit Function
                End If
                formatValuetoSQLLike = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Boolean"
                If puncampo.Valor.ToString = "True" Then
                    formatValuetoSQLLike = "1"
                Else
                    formatValuetoSQLLike = "0"
                End If
            Case "System.DBNull"
                Debug.Print("ERROR no existe tipo ")
                formatValuetoSQLLike = "null"
        End Select

    End Function


    Public Shared Function formatValuetoSQLLikeDer(ByVal puncampo As Campo) As String

        formatValuetoSQLLikeDer = "null"

        If puncampo.esNulo() Then
            Exit Function
        End If

        Select Case puncampo.Tipo.FullName
            Case "System.Double", "System.Int32", "System.Decimal", "System.Int64", "System.Int16"
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLikeDer = "null"
                    Exit Function
                End If
                formatValuetoSQLLikeDer = SQLAdapter.COMILLA_SIMPLE + SQLAdapter.OPERADOR_LIKE + Trim(Replace(puncampo.Valor.ToString, SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)) + SQLAdapter.COMILLA_SIMPLE
            Case "System.String"
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLikeDer = "null"
                    Exit Function
                End If
                formatValuetoSQLLikeDer = SQLAdapter.COMILLA_SIMPLE + SQLAdapter.OPERADOR_LIKE + Trim(Replace(puncampo.Valor.ToString, SQLAdapter.COMILLA_SIMPLE, SQLAdapter.COMILLA_DOBLE)) + SQLAdapter.COMILLA_SIMPLE
            Case "System.DateTime"
                Dim unafecha As New System.DateTime
                unafecha = Date.Parse(puncampo.Valor.ToString)
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLikeDer = "null"
                    Exit Function
                End If
                formatValuetoSQLLikeDer = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy hh:mm:ss") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Date"
                Dim unafecha As New System.DateTime
                unafecha = Date.Parse(puncampo.Valor.ToString)
                If puncampo.Valor.ToString.Trim().CompareTo("") = 0 Then
                    formatValuetoSQLLikeDer = "null"
                    Exit Function
                End If
                formatValuetoSQLLikeDer = SQLAdapter.COMILLA_SIMPLE + unafecha.ToString("dd-MM-yyyy") + SQLAdapter.COMILLA_SIMPLE
            Case "System.Boolean"
                If puncampo.Valor.ToString = "True" Then
                    formatValuetoSQLLikeDer = "1"
                Else
                    formatValuetoSQLLikeDer = "0"
                End If
            Case "System.DBNull"
                Debug.Print("ERROR no existe tipo ")
                formatValuetoSQLLikeDer = "null"
        End Select

    End Function


End Class


