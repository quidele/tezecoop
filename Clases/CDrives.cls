VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CDrives"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'Función Api getLogicalDrives para recuperar las unidades
Private Declare Function GetLogicalDrives Lib "kernel32" () As Long

' Función Api GetDriveType para obtener el tipo y clase de unidad
Private Declare Function GetDriveType _
    Lib "kernel32" _
    Alias "GetDriveTypeA" ( _
    ByVal nDrive As String) As Long
  
  
Dim o_Fso   As Object
Dim o_Drive As Drive
Dim lerror  As String


' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property

    
Public Sub ObtenerUnidadesMovilesDisponibles(cbLista As ComboBox, pnmUnidadxDefecto As String)
Dim LDs As Long, Cnt As Long, sDrives As String
Dim l_unidad As String, nombreVolumen As String
Dim l_letra_unidad As String, l_tipounidad As String
Dim i As Integer, l_index As Integer

    LDs = GetLogicalDrives
    i = -1
    For Cnt = 0 To 25
        If (LDs And 2 ^ Cnt) <> 0 Then
            l_unidad = Chr$(65 + Cnt) + ":\"
            l_tipounidad = obtenerTipodeUnidad(Chr$(65 + Cnt) + ":\")
            l_letra_unidad = Chr$(65 + Cnt)
            If Chr$(65 + Cnt) + ":\" <> "A:\" And l_tipounidad = "Unidad Removible" Then
                i = i + 1
                nombreVolumen = obtenerNombreVolumen(Chr$(65 + Cnt) + ":\")
                cbLista.AddItem nombreVolumen + " (" + Chr$(65 + Cnt) + ":) "
                If nombreVolumen = pnmUnidadxDefecto Then
                    l_index = i
                End If
            End If
        End If
    Next Cnt
  
   If cbLista.ListCount > 0 And l_index > -1 Then
     cbLista.ListIndex = l_index
   Else
      If cbLista.ListCount > 0 Then
        cbLista.ListIndex = 0
      End If
   End If
   
   
End Sub

Private Function obtenerTipodeUnidad(pnmUnidad As String) As String

    ' Llamamos a la función pasandole la unidad que queremos obtener la información
    Select Case GetDriveType(Trim(pnmUnidad))
        Case 2
            ' Unidad de tipo removible, por ejemplo la unidad A:
            obtenerTipodeUnidad = "Unidad Removible"
        Case 3
            ' Por ejemplo un disco duro
            obtenerTipodeUnidad = "Unidad Fija"
        Case Is = 4
            ' Una unidad de red
            obtenerTipodeUnidad = "Unidad Remota"
        Case Is = 5
            'Unidad de Cd - Dvd
            obtenerTipodeUnidad = "Unidad de Cd-Rom"
        Case Is = 6
            ' Para una unidad de dsico Virtual
            obtenerTipodeUnidad = "Unidad Virtual"
        Case Else
            'Cuando es desconocida
            obtenerTipodeUnidad = "Unidad no Reconocida"
    End Select
    
    
End Function


Public Function obtenerNombreVolumen(ByVal s_Drive As String) As String
    Dim o_Fso As Object
    Dim o_Drive As Drive
       
    ' Creamos un nuevo objeto de tipo Scripting FileSystemObject
    Set o_Fso = CreateObject("Scripting.FileSystemObject")
    ' Si el Drive no es un vbnullstring
    If s_Drive <> "" Then
        ' Recuperamos el Drive para poder acceder _
         en las siguientes lineas
        Set o_Drive = o_Fso.GetDrive(s_Drive)
       obtenerNombreVolumen = o_Drive.VolumeName
    End If
       
    ' Eliminamos los objetos instanciados
    Set o_Drive = Nothing
    Set o_Fso = Nothing
    
       
End Function


Private Function Get_Numero_Serie(ByVal s_Drive As String) As Long

    ' Creamos un nuevo objeto de tipo Scripting FileSystemObject
    Set o_Fso = CreateObject("Scripting.FileSystemObject")

       
    ' Si el Drive no es un vbnullstring
    If s_Drive <> "" Then
        ' Recuperamos el Drive para poder acceder _
         en las siguientes lineas
        Set o_Drive = o_Fso.GetDrive(s_Drive)
        MsgBox o_Drive.VolumeName
        MsgBox o_Drive.ShareName
        MsgBox o_Drive.Path
        MsgBox o_Drive.RootFolder
        MsgBox o_Drive.FileSystem
        MsgBox o_Drive.SerialNumber
    End If
       
    With o_Drive
           
        ' Si está disponible
        If .IsReady Then
            Get_Numero_Serie = Not .SerialNumber
        Else
            MsgBox " No se puede acceder a la unidad ", vbCritical
            Get_Numero_Serie = -1
        End If
    End With
       
    ' Eliminamos los objetos instanciados
    Set o_Drive = Nothing
    Set o_Fso = Nothing
       
End Function


Private Function ObtenerUnidad(pDescripcion As String) As String
Dim nrPos As Integer

    nrPos = InStr(1, pDescripcion, "(", vbTextCompare)
    ObtenerUnidad = Mid(pDescripcion, nrPos + 1, 2)

End Function


Public Function CopiarMDBPendriveaDisco(pnmNombreUnidad As String) As Boolean
Dim l_unidad             As String
Dim l_destino            As String
Dim l_origen    As String


    CopiarMDBPendriveaDisco = False

    l_unidad = ObtenerUnidad(pnmNombreUnidad)
    
    ' Creamos un nuevo objeto de tipo Scripting FileSystemObject
    Set o_Fso = CreateObject("Scripting.FileSystemObject")

    Set o_Drive = o_Fso.GetDrive(l_unidad)
    
    ' Si está disponible
    If Not o_Drive.IsReady Then
        lerror = "La unidad de disco USB no esta lista."
        Exit Function
    End If
    
    l_origen = l_unidad + "\Puesto_ADM.dat"
    l_destino = objConfig.Carpeta_Sincronizacion + "\Puesto_ADM.mdb"
   
    If Not o_Fso.FileExists(l_origen) Then
        lerror = "el archivo origen '" + l_origen + "' no existe."
        Exit Function
    End If
    
    On Error Resume Next
    o_Fso.CopyFile l_origen, l_destino, True
    If Err Then
        lerror = "No se pudo copiar el archivo copiar archivo origen  '" + l_origen + "' a destino'" + l_destino + "'."
        Exit Function
    End If
    
    On Error GoTo 0
    CopiarMDBPendriveaDisco = True

End Function


Public Function CopiarMDBPlantillaDisco() As Boolean
Dim l_origen_plantilla As String
Dim l_destino As String

    CopiarMDBPlantillaDisco = False

    ' Creamos un nuevo objeto de tipo Scripting FileSystemObject
    Set o_Fso = CreateObject("Scripting.FileSystemObject")


    l_origen_plantilla = objConfig.Carpeta_Sincronizacion + "\Plantilla_Puesto_ADM.mdb"
    l_destino = objConfig.Carpeta_Sincronizacion + "\Puesto_ADM.mdb"
    
   If Not o_Fso.FileExists(l_origen_plantilla) Then
        lerror = "el archivo origen '" + l_origen_plantilla + "' no existe."
        Exit Function
    End If
       
    ' On Error Resume Next
    o_Fso.CopyFile l_origen_plantilla, l_destino, True
    If Err Then
        lerror = "No se pudo copiar el archivo copiar archivo origen  '" + l_origen_plantilla + "' a destino'" + l_destino + "'."
        Exit Function
    End If

    CopiarMDBPlantillaDisco = True

End Function


Public Function CopiarMDBaPendrive(pnmNombreUnidad As String) As Boolean
Dim l_origen_plantilla As String
Dim l_destino As String
Dim l_unidad  As String


    CopiarMDBaPendrive = False
    
    l_unidad = ObtenerUnidad(pnmNombreUnidad)

    ' Creamos un nuevo objeto de tipo Scripting FileSystemObject
    Set o_Fso = CreateObject("Scripting.FileSystemObject")

    Set o_Drive = o_Fso.GetDrive(l_unidad)
    
    ' Si está disponible
    If Not o_Drive.IsReady Then
        lerror = "La unidad de disco USB no esta lista."
        Exit Function
    End If

    
    l_origen_plantilla = objConfig.Carpeta_Sincronizacion + "\Puesto_ADM.mdb"
    l_destino = l_unidad + "\Puesto_ADM.dat"
    
    On Error Resume Next
    o_Fso.CopyFile l_origen_plantilla, l_destino, True
    If Err Then
        lerror = "No se pudo copiar el archivo copiar archivo origen  '" + l_origen_plantilla + "' a destino'" + l_destino + "'."
        Exit Function
    End If

    CopiarMDBaPendrive = True

End Function




Public Function EliminarMDBenPendrive(pnmNombreUnidad As String) As Boolean
Dim l_origen_plantilla As String
Dim l_unidad           As String

    EliminarMDBenPendrive = False

    ' Creamos un nuevo objeto de tipo Scripting FileSystemObject
    Set o_Fso = CreateObject("Scripting.FileSystemObject")
    
    l_unidad = ObtenerUnidad(pnmNombreUnidad)
    l_origen_plantilla = l_unidad + "\Puesto_ADM.dat"
    
    If o_Fso.FileExists(l_origen_plantilla) Then
        o_Fso.DeleteFile l_origen_plantilla, True
    End If

    EliminarMDBenPendrive = True

End Function


Public Function CopiarMDB_a_log_errores() As Boolean
Dim l_origen As String
Dim l_destino As String

    CopiarMDB_a_log_errores = False

    ' Creamos un nuevo objeto de tipo Scripting FileSystemObject
    Set o_Fso = CreateObject("Scripting.FileSystemObject")


    l_origen = objConfig.Carpeta_Sincronizacion + "\Puesto_ADM.mdb"
    l_destino = objConfig.Carpeta_Sincronizacion + "\log_errores\Puesto_ADM_" + Format(Now, "YYYYMMDD_HHMMSS") + ".mdb"
    
   If Not o_Fso.FileExists(l_origen) Then
        lerror = "el archivo origen '" + l_origen + "' no existe."
        Exit Function
    End If
       
    On Error Resume Next
    o_Fso.CopyFile l_origen, l_destino, True
    If Err Then
        lerror = "No se pudo copiar el archivo copiar archivo origen  '" + l_origen + "' a destino'" + l_destino + "'."
        Exit Function
    End If

    CopiarMDB_a_log_errores = True

End Function



