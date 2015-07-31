VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CArchivo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit
'* En este modulo de declaran ciertas funciones que permiten el manejo de archivos *'

Public nCanal             As Integer
'********************************************'
'* En este modulo de declaran ciertas       *'
'* funciones que permiten el manejo de      *'
'* archivos                                 *'
'********************************************'
Dim pFile                         As New Scripting.FileSystemObject
Dim lInStream                     As Scripting.TextStream
Public strContenidoTXT            As String
Public GrabaLog                   As String
Public nombreArchivo              As String


'* esta función abre el archivo binario que contine informacion de la huella dactilar
'* para proseguir con la operacion backup parametros:
'* [e]= nombre del archivo [s]= valor error o
Public Function Abrir_Escritura _
(str_nom As String) As Integer
 ' si existe una version anterior bOrrarla del disco
 nCanal = FreeFile 'obtener un canal libre
 On Error Resume Next
 Open str_nom For Output As #nCanal
  If Err Then
   ' error
   Abrir_Escritura = -1
  Else
   '
   Abrir_Escritura = 0
  End If
End Function

'* esta función abre el archivo binario que contine informacion de la huella dactilar
'* para proseguir con la operacion backup parametros:
'* [e]= nombre del archivo [s]= valor error o
Public Function Abrir_Agregar _
(str_nom As String) As Boolean
 ' si existe una version anterior bOrrarla del disco
 nCanal = FreeFile 'obtener un canal libre
 On Error Resume Next
 Open str_nom For Append As #nCanal
  If Err Then
   ' error
   Abrir_Agregar = False
  Else
   '
   Abrir_Agregar = True
  End If
End Function

'* esta función abre el archivo binario que contine informacion de la huella dactilar *'
'* para proseguir con la operacion backup parametros:
'* [e]= nombre del archivo [s]= valor error o
Public Function Abrir_Lectura _
(str_nom As String) As Integer
 nCanal = FreeFile 'obtener un canal libre
 On Error Resume Next
 Open str_nom For Input As #nCanal
  If Err Then
   ' error
   Abrir_Lectura = -1
  Else
   '
   Abrir_Lectura = 0
  End If
  On Error GoTo 0
  'posicionarnos en el primer byte
End Function

Public Function Eliminar _
(strName As String) As Integer
    ' eliminar el archivo que se
    ' pasa como parametro
    Kill strName
        If Err Then
          Eliminar = -1
        Else
          Eliminar = 0
        End If
End Function

Public Sub Grabar(ByRef strDato As String)
    
     Print #nCanal, strDato

End Sub

Public Function leer(ByRef strDato As String)
    ' read line of the file
    ' On Error Resume Next
    Line Input #nCanal, strDato
    On Error GoTo 0
End Function


'* de una cadena que contiene la ruta hacia un archivo obtiene el dir correspondiente                     *'
Public Function ObtenerNombreDirectorio _
            (ByRef strRuta As String, _
             ByRef strDIR As String) _
             As Integer
Dim nI, nT      As Integer
Dim strAux      As String

    On Error Resume Next
      nI = Len(strRuta)
       Do Until nI = 1
         strAux = Mid(strRuta, nI, 1)
         If strAux = "\" Then
           strDIR = (Left(strRuta, nI))
           Exit Do
         End If
         nI = nI - 1
       Loop
      If Err Then
        ObtenerNombreDirectorio = -1
        Exit Function
      End If
    On Error GoTo 0
    
    Err.Clear
    ObtenerNombreDirectorio = 0
    
End Function


Public Function ObtenerNombreArchivo _
            (ByRef strRuta As String) _
             As String
Dim nI     As Integer
Dim strAux, strnombre As String

    strnombre = ""
    nI = Len(strRuta)
    If nI < 1 Then Exit Function
    Do Until nI = 1
         strAux = Mid(strRuta, nI, 1)
         If strAux = "\" Then
           ObtenerNombreArchivo = strnombre
           Exit Do
         Else
           strnombre = strAux + strnombre
         End If
         nI = nI - 1
    Loop
    ObtenerNombreArchivo = strnombre
End Function


Public Sub Cerrar()

   ' cerrar el canal arbieto
   Close #nCanal
   
End Sub
 
 
Public Function ObtenerContenidoTXT(pNombreArchivo As String) As Boolean
Dim InStream                As Scripting.TextStream
Dim strCuerpoArchivo        As String
Dim Tline                   As String

        On Error Resume Next
        Set InStream = pFile.OpenTextFile(pNombreArchivo, 1, False, False)
        If Err Then
            ObtenerContenidoTXT = False
            Exit Function
        End If
        On Error GoTo 0
        strCuerpoArchivo = ""
        While InStream.AtEndOfStream = False
           Tline = InStream.ReadLine
           strCuerpoArchivo = strCuerpoArchivo + Tline + Chr(13) + Chr(10)
        Wend
        Me.strContenidoTXT = strCuerpoArchivo
        ObtenerContenidoTXT = True
        
End Function

Public Function Abrir_Log(pNombreArchivo As String) As Boolean
Dim strCuerpoArchivo        As String
Dim Tline                   As String

        On Error Resume Next
        Set lInStream = pFile.OpenTextFile(pNombreArchivo, ForAppending, True, False)
        If Err Then
            Abrir_Log = False
            Exit Function
        End If
        On Error GoTo 0
        Abrir_Log = True
        
End Function

Public Function Grabar_Log(ByVal pDato As String) As Boolean
Dim strCuerpoArchivo        As String
Dim Tline                   As String

        If GrabaLog <> "SI" Then Exit Function
      
        Abrir_Log nombreArchivo
  
        On Error Resume Next
        pDato = Replace(pDato, Chr(10) + Chr(13), "", 0, , vbTextCompare)
        pDato = Replace(pDato, "|", ";", 0, , vbTextCompare)
        pDato = Format(Now, "DD/MM/YYYY HH:MM:SS") + " | " + pDato
        lInStream.WriteLine pDato
        If Err Then
            lInStream.Close
            Grabar_Log = False
            Exit Function
        End If
        On Error GoTo 0
        lInStream.Close
        Grabar_Log = True
        
End Function

Public Function Cerrar_Log() As Boolean
Dim strCuerpoArchivo        As String
Dim Tline                   As String

        If GrabaLog <> "SI" Then Exit Function


        On Error Resume Next
        lInStream.Close
        If Err Then
            Cerrar_Log = False
            Exit Function
        End If
        On Error GoTo 0
        Cerrar_Log = True
        
End Function


Public Function crearNombreArchivo() As String

    
     nombreArchivo = App.Path + "\" + Format(Now, "YYYYMMDD") + ".log"
     
     crearNombreArchivo = nombreArchivo

End Function
