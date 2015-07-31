VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cConexion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public Property Get motor(sProyecto As String, sOpcion As String) As String
    motor = LCase(ObtenerValorReg("Motor", sProyecto, sOpcion))
End Property

Public Function StringDeConexion(sProyecto As String, base As String, sOpcion As String) As String
    StringDeConexion = ArmarStringDeConexion(sProyecto, base, sOpcion)
End Function

Public Function StringDeConexionJerarquico(sProyecto As String, sOpcion As String) As String
    StringDeConexionJerarquico = ArmarStringDeConexionJerarquico(sProyecto, sOpcion)
End Function

Private Function ArmarStringDeConexion(sProyecto As String, base As String, sOpcion As String) As String
    Dim strCon As String
    Dim sUser As String
    Dim sPass As String
    Dim sCatalogo As String
    Dim sServer As String
    Dim sDSN As String
    
    sUser = ObtenerValorReg("Usuario", sProyecto, sOpcion)
    sPass = ObtenerValorReg("Pass", sProyecto, sOpcion)
    
    Select Case LCase(motor(sProyecto, sOpcion))
        Case "informix"
            sDSN = ObtenerValorReg("DSN", sProyecto, sOpcion)
            strCon = "DSN=" & sDSN
            strCon = strCon & ";UID=" & sUser
            strCon = strCon & ";PWD=" & sPass
            strCon = strCon & ";DB=" & base
            
        Case "sql"
            sDSN = ObtenerValorReg("DSN", sProyecto, sOpcion)
            strCon = "DSN=" & sDSN
            strCon = strCon & ";UID=" & sUser
            strCon = strCon & ";PWD=" & sPass
        Case "oracle"
            sServer = ObtenerValorReg("Server", sProyecto, sOpcion)
            strCon = "Provider=OraOLEDB.Oracle.1;"
            strCon = strCon & "User ID = " & sUser & ";"
            strCon = strCon & "Password=" & sPass & ";"
            strCon = strCon & "Data Source=" & sServer
        Case "progress"
            sDSN = ObtenerValorReg("DSN", sProyecto, sOpcion)
            strCon = "DSN=" & sDSN
            strCon = strCon & ";UID=" & sUser
            strCon = strCon & ";PWD=" & sPass
        Case Else
            Err.Raise vbObjectError, , "Motor '" & motor(sProyecto, sOpcion) & "' desconocido."
    End Select

    ArmarStringDeConexion = strCon
    
End Function

Private Function ArmarStringDeConexionJerarquico(sProyecto As String, sOpcion As String) As String
    Dim strCon As String
    Dim sUser As String
    Dim sPass As String
    Dim sCatalogo As String
    Dim sServer As String
    Dim sMotor As String

    sMotor = LCase(motor(sProyecto, sOpcion))

    If sMotor = "informix" Then
        sUser = ObtenerValorReg("Usuario", sProyecto, sOpcion)
        sPass = ObtenerValorReg("Pass", sProyecto, sOpcion)
        sServer = ObtenerValorReg("Server", sProyecto, sOpcion)
        sCatalogo = ObtenerValorReg("Catalogo", sProyecto, sOpcion)
        strCon = "Provider=MSDataShape.1;DSN=produccion;UID=" & sUser & ";PWD=" & sPass & ";DB=" & sCatalogo & ";HOST=" & sServer & "" & ";" 'Data Provider=MSDASQL.1"
    Else
        sUser = ObtenerValorReg("Usuario", sProyecto, sOpcion)
        sPass = ObtenerValorReg("Pass", sProyecto, sOpcion)
        sServer = ObtenerValorReg("Server", sProyecto, sOpcion)

        strCon = "Provider=MSDataShape.1;"
        strCon = strCon & "User ID = " & sUser & ";"
        strCon = strCon & "Password=" & sPass & ";"
        strCon = strCon & "Data Source=" & sServer & ";"
        strCon = strCon & "Data Provider=OraOLEDB.Oracle.1;"
  
    End If

    ArmarStringDeConexionJerarquico = strCon
End Function

Public Function ObtenerValorReg(sKey As String, sProyecto As String, sOpcion As String) As String
    Dim res As String
    
    If sOpcion = "" Then
        sOpcion = "Opciones_MFG_BD_EBCUEROS"
    End If
        
    res = GetSetting(sProyecto, sOpcion, sKey, "####")
    
    If res = "####" Then
        res = InputBox("Ingrese un valor para '" & sKey & "'", sProyecto, sOpcion)
        SaveSetting sProyecto, "Opciones", sKey, res
    End If
    
    ObtenerValorReg = res
End Function

Public Function OpenRs(cmd As ADODB.Command, Optional dbMotor As String) As Recordset
    Dim rs As ADODB.Recordset
    Dim i As Integer
    Dim t0
    Dim sMotor As String
    
    On Error GoTo ErrorHandler

    ' Prueba Alejandro 20/12/99
    Set rs = cmd.Execute
    Set OpenRs = rs

    Exit Function
ErrorHandler:
    Err.Raise Err.Number, Err.Source, Err.Description
    
End Function

