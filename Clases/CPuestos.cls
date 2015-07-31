VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CPuestos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Public Function obtenerNroPuesto(pdsPuesto As String) As String

         obtenerNroPuesto = ""
         
         ObjTablasIO.nmTabla = "TB_Puestos"

         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         ObjTablasIO.setearCampoOperadorValor "dsPuesto", "=", pdsPuesto
         ObjTablasIO.setearCampoOperadorValor "nrPuesto", "->", ""
         
         ObjTablasIO.Seleccionar
    
        If Not ObjTablasIO.rs_resultados.EOF Then
            obtenerNroPuesto = ObjTablasIO.rs_resultados("nrPuesto")
        End If

End Function
         

Public Function obtenerPuestosDisponibles() As Object

    ObjTablasIO.nmTabla = "TB_Puestos"
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<>", "9"
    ObjTablasIO.setearCampoOperadorValor "dsPuesto", "->", ""
    
    ObjTablasIO.Seleccionar
    
     If objbasededatos.rs_resultados.EOF Then
        Set obtenerPuestosDisponibles = Nothing
     Else
        Set obtenerPuestosDisponibles = ObjTablasIO.rs_resultados
     End If
    
    
    
    
End Function

