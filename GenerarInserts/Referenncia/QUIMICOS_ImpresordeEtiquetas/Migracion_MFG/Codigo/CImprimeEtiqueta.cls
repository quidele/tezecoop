VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CImprimeEtiqueta"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False


Option Explicit

Public lote                As String
Public empresa             As String
Public cantidad_copias     As String
Public fecha_lote          As String
Public fecha_vencimiento   As String
Const MARGEN = "  "



Public Function imprimir()
Dim posx As Single
Dim posy As Single
Dim i    As Integer
Dim posfechas As Integer


' Fecha: <Impact Normal  12>  valor_fecha <Impact Normal  17>
' Vto: <Impact Normal  12>  valor_vto <Impact Normal  17>
' Lote Nº: <Impact Normal  12>
' 98/00002321 <Impact Normal  36>

    Printer.ScaleMode = vbMillimeters
    Printer.Font = "Impact"
    
    For i = 1 To cantidad_copias
    
        ' dejamos margen superior
        
        Printer.FontSize = 2
        Printer.Print MARGEN
        
        ' Comienzo de la impresion de los datos
        ' Fecha: <Impact Normal  12>  valor_fecha <Impact Normal  17>
        posx = Printer.CurrentX
        posy = Printer.CurrentY
        Printer.FontSize = 12
        Printer.Print MARGEN + "Fecha:  "
        Printer.CurrentY = posy
        Printer.CurrentX = Printer.TextWidth(MARGEN + "Fecha:  ")
        posfechas = Printer.CurrentX
        Printer.FontSize = 17
        Printer.Print fecha_lote
        
        ' Vto: <Impact Normal  12>  valor_vto <Impact Normal  17>
        posx = Printer.CurrentX
        posy = Printer.CurrentY
        Printer.FontSize = 12
        Printer.Print MARGEN + "Vto: "
        Printer.CurrentY = posy
        Printer.CurrentX = posfechas
        Printer.FontSize = 17
        Printer.Print fecha_vencimiento
        
        ' Lote Nº: <Impact Normal  12>
        Printer.FontSize = 12
        Printer.Print MARGEN + "Lote Nº:    "
    
        Printer.FontSize = 36
        Printer.Print MARGEN + lote
        
        ' 98/00002321 <Impact Normal  36>

        Printer.EndDoc
            
    
    Next i
    
    

End Function



Private Sub Class_Initialize()

    lote = "01/02003"
    fecha_lote = "12/12/2009"
    fecha_vencimiento = "13/06/2008"
    cantidad_copias = 1
    
End Sub
