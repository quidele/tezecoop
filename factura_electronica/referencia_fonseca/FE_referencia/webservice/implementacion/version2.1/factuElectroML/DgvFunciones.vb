Public Class DgvFunciones

    Public Shared Function ComparaNumeros(ByVal e As System.Windows.Forms.DataGridViewSortCompareEventArgs) As Integer
        Try
            If Double.Parse(e.CellValue1.ToString) > Double.Parse(e.CellValue2.ToString) Then
                e.SortResult = 1
            ElseIf Double.Parse(e.CellValue1.ToString) < Double.Parse(e.CellValue2.ToString) Then
                e.SortResult = -1
            Else
                e.SortResult = 0
            End If
            Return e.SortResult
        Catch exFormat As FormatException

        Catch ex As Exception
            Throw ex
        End Try

    End Function

    Public Shared Function ComparaFechas(ByVal e As System.Windows.Forms.DataGridViewSortCompareEventArgs) As Integer

        If Date.Parse(e.CellValue1.ToString) > Date.Parse(e.CellValue2.ToString) Then
            e.SortResult = 1
        ElseIf Date.Parse(e.CellValue1.ToString) < Date.Parse(e.CellValue2.ToString) Then
            e.SortResult = -1
        Else
            e.SortResult = 0
        End If
        Return e.SortResult
    End Function


End Class
