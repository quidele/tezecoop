VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CFlexGridUtils"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Public Sub AsignarTitulosColumnasCamposFisicos(FlexGrid As MSFlexGrid)

With FlexGrid

        .Row = 0
        .Cols = 4
        
        .Col = 0: .Text = "Tabla"
        .Col = 1: .Text = "Campo"
        .Col = 2: .Text = "Tipo de Dato "
        .Col = 3: .Text = "Tamaño"
        
        .ColWidth(0) = 800
        .ColWidth(1) = 800
        .ColWidth(2) = 800
        .ColWidth(3) = 800   'codigo de artículo
        .ColAlignment(0) = flexAlignLeftCenter
        .ColAlignment(1) = flexAlignLeftCenter
        .ColAlignment(2) = flexAlignLeftCenter
        .ColAlignment(3) = flexAlignLeftCenter
        
End With

End Sub


 'Sub para recorrer el FlexGRid y ajustar las columnas
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 Public Sub Ajustar_Columnas(FlexGrid As MSFlexGrid, miform As Form)

 On Local Error GoTo ErrSub

     'Para las filas y columnas del Flexgrid
     Dim Columna As Integer, Fila As Long

     'Matriz y variable para los anchos de columna
     Dim Ancho_Columna() As Single
     Dim Col_Width As Single

     'Redimensionar el Array a la cantidad de columnas
     ReDim Ancho_Columna(0 To FlexGrid.Cols - 1)

     'Recorrer las columnas para almacenar el ancho
     For Columna = 0 To FlexGrid.Cols - 1
         'Guarda el ancho de la  columna en la matriz
         Ancho_Columna(Columna) = miform.TextWidth(FlexGrid.TextMatrix(0, Columna))
     Next Columna

     'Recorrer todas las filas del FlexGRid
     For Fila = 1 To FlexGrid.Rows - 1

         'Recorrer todas las Columnas
         For Columna = 0 To FlexGrid.Cols - 1

             ' Almacenar el ancho de la columna actual
             Col_Width = miform.TextWidth(FlexGrid.TextMatrix(Fila, Columna))

             'Comparar cual es mayor
If Ancho_Columna(Columna) < Col_Width Then
                Ancho_Columna(Columna) = Col_Width
End If
         Next
     Next

     ' Establecer los anchos de columna al FlexGRid _
       con la propiedad ColWidth

     For Columna = 0 To FlexGrid.Cols - 1
         FlexGrid.ColWidth(Columna) = Ancho_Columna(Columna) + 240
     Next

 Exit Sub

 'Error
ErrSub:

     MsgBox Err.Description, vbCritical
     FlexGrid.Redraw = True

 End Sub




Public Sub AsignarTitulosColumnasCamposLogicos(FlexGrid As MSFlexGrid)

With FlexGrid

        .Row = 0
        .Cols = 10
        
        .Col = 0: .Text = "IdCampo"
        .Col = 1: .Text = "nmTabla"
        .Col = 2: .Text = "nmCampo"
        .Col = 3: .Text = "nmCampoExterno"
        .Col = 4: .Text = "tpTipo"
        .Col = 5: .Text = "nrTamanio"
        .Col = 6: .Text = "flClave"
        .Col = 7: .Text = "flClaveForanea"
        .Col = 8: .Text = "flBusqueda"
        .Col = 9: .Text = "nrOrdenBusqueda"

        .ColWidth(0) = 800
        .ColWidth(1) = 800
        .ColWidth(2) = 800
        .ColWidth(3) = 800
        .ColWidth(4) = 800
        .ColWidth(5) = 800
        .ColWidth(6) = 800
        .ColWidth(7) = 800
        .ColWidth(8) = 800
        .ColWidth(9) = 800
        
        .ColAlignment(0) = flexAlignLeftCenter
        .ColAlignment(1) = flexAlignLeftCenter
        .ColAlignment(2) = flexAlignLeftCenter
        .ColAlignment(3) = flexAlignLeftCenter
        .ColAlignment(4) = flexAlignLeftCenter
        .ColAlignment(5) = flexAlignLeftCenter
        .ColAlignment(6) = flexAlignLeftCenter
        .ColAlignment(7) = flexAlignLeftCenter
        .ColAlignment(8) = flexAlignLeftCenter
        .ColAlignment(9) = flexAlignLeftCenter
        
End With

End Sub

