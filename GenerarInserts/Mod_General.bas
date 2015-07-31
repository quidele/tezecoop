Attribute VB_Name = "Mod_General"
Option Explicit


Global objBasededatos           As New CBasededatos
Global ObjTablasIO              As New CTablasIO
Global objDiccionariodeDatos    As New CDiccionariodeDatos


Global Azul     As Long
Global Amarillo As Long
Global Blanco   As Long
Global Gris     As Long
Global Rojo     As Long
Global Verde    As Long
Global Marron   As Long

Sub Main()

     objBasededatos.dsDSN = App.EXEName
     
    
    
     Azul = RGB(0, 0, 255)
     Amarillo = RGB(255, 255, 185)
     Blanco = RGB(255, 255, 255)
     Gris = RGB(230, 230, 230)
     Rojo = RGB(255, 113, 113)
     Verde = RGB(64, 196, 73)
     Marron = RGB(255, 128, 64)
     
     
    FrmAdmMetadata.Show vbModal
    
    
     
    
End Sub



Public Function ReemplazarPalabra(pCadena As String, _
  pPalabraIn As String, pPalabraOut As String) As String
Dim nPos As Integer
Dim strAux1 As String
Dim strAux2 As String

    nPos = InStr(1, pCadena, pPalabraIn, vbTextCompare)
    If nPos > 0 Then
        strAux1 = Left(pCadena, nPos - 1)
        strAux2 = Right(pCadena, Len(pCadena) - nPos - Len(pPalabraIn) + 1)
        strAux1 = strAux1 + pPalabraOut + ReemplazarPalabra(strAux2, pPalabraIn, pPalabraOut)
        ReemplazarPalabra = strAux1
        Exit Function
    End If
    ReemplazarPalabra = pCadena
    
End Function


