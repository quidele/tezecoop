
Public Class AdmFactuPlus

    Public [error] As String
    Public listaComprobantes As New ArrayList
    Public lote As lote

    Public Function generarArchivo(ByVal pNombreArchivo As String) As Boolean
            ' Obtener los comprobantes sin car asignado ('FCE' , 'NCE','NDE')
            Dim un_cpt_cabgenacDAO As New cpt_cabgenacDAO
            Dim un_cpt_cabgenac As New cpt_cabgenac


            If Not un_cpt_cabgenacDAO.obtenerComprobantesaEnviar() Then

            End If

            ' Por cada comprobante generar un solicitud en la base Factura Electronica 

            ' Obtener todos los comprobantes en formato XML
            '   Vamos grabando el archivo de la salida
    End Function


    Public Function recepcionarArchivo(ByVal pNombreArchivo As String) As Boolean
            ' Abrir el archivo xml y lo parseamos
            ' Actualizamos la base de datos Factura Electronica 
            ' Actualizamos el comrobante en magma
    End Function


End Class
