
Option Strict Off
'implementing the abstract class by inheriting
Imports fonseca_libDatos

Public Class OR_Criteria
    Inherits Criteria

    Public lista_parametros As New ArrayList
    Public agregar_where As Boolean = True


    Public Overrides Function ejecutar() As String
        Dim resultado As String
        Dim un_campo As New CampoExtendido

        If lista_parametros.Count() = 0 Then Return ""
        resultado = ""
        For Each listaoCampo As Object In lista_parametros
            Select Case listaoCampo.GetType().Name
                Case "AND_Criteria", "OR_Criteria"
                    resultado = IIf(resultado = "", listaoCampo.ejecutar(), resultado + " " + SQLAdapter.OPERADOR_OR + " " + listaoCampo.ejecutar())
                Case "CampoExtendido"
                    un_campo = listaoCampo
                    If Not un_campo.esNulo Then
                        resultado = IIf(resultado = "", resultado, resultado + " " + SQLAdapter.OPERADOR_OR)
                        resultado = resultado + un_campo.Nombre + "=" + SQLAdapter.formatValuetoSQL(un_campo)
                    End If
                Case Else
                    resultado = ""
            End Select
        Next
        If resultado = "" Then
            Return ""
        Else
            Return "( " + resultado + ") "
        End If

    End Function


End Class

