VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CConfigRegional"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Longitud del buffer para obtener la información
Private Const MAX_LOCALE_BUF As Long = 256&

' formato de la fecha
Public Enum eDateOrder
    MDY = 0 ' Month-Day-Year
    DMY = 1 ' Day-Month-Year
    YMD = 2 ' Year-Month-Day
End Enum


Private Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long
Private Declare Function SetLocaleInfo Lib "kernel32" Alias "SetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String) As Boolean
Private Declare Function GetSystemDefaultLCID Lib "kernel32" () As Long
Private Declare Function PostMessage Lib "user32" Alias _
          "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, _
          ByVal wParam As Long, ByVal lParam As Long) As Long

Private Declare Function GetSystemDefaultLangID Lib "kernel32" () As Integer

Private Const WM_SETTINGCHANGE = &H1A
'same as the old WM_WININICHANGE
Private Const HWND_BROADCAST = &HFFFF&

'constantes para obtener la información regional
Private Const LOCALE_FONTSIGNATURE = &H58
Private Const LOCALE_ICENTURY = &H24
Private Const LOCALE_ICOUNTRY = &H5     'código de país
Private Const LOCALE_ICURRDIGITS = &H19 'nº de decimales en las monedas
Private Const LOCALE_ICURRENCY = &H1B ' posición del simbolo de moneda respecto al _
                                      ' número,0=delante, 1=detrás, 2=delante con un blanco, 3=detras con un blanco
Private Const LOCALE_IDATE = &H21
Private Const LOCALE_IDAYLZERO = &H26 '1=días con dos dígitos en fecha corta
Private Const LOCALE_IDEFAULTCODEPAGE = &HB 'página de códigos por defecto
Private Const LOCALE_IDEFAULTCOUNTRY = &HA 'código de país por defecto
Private Const LOCALE_IDEFAULTLANGUAGE = &H9 'codigo de lenguaje por defecto
Private Const LOCALE_IDIGITS = &H11 'nº de decimales en los numeros
Private Const LOCALE_IINTLCURRDIGITS = &H1A
Private Const LOCALE_ILANGUAGE = &H1 'codigo del lenguaje
Private Const LOCALE_ILDATE = &H22
Private Const LOCALE_ILZERO = &H12
Private Const LOCALE_IMEASURE = &HD 'sistema de medida, 0=metrico, 1 =EE.UU.
Private Const LOCALE_IMONLZERO = &H27
Private Const LOCALE_INEGCURR = &H1C 'formato nº negativo en las monedas
Private Const LOCALE_INEGSEPBYSPACE = &H57 ' un espacio entre el nº y la
                                           ' moneda en los negativos
Private Const LOCALE_INEGSIGNPOSN = &H53 'posicion del signo en las monedas
        ' negativas, 0=no se pone, 1=antes del numero, 2=despues del numero,3=antes de la
        ' moneda, 4=despues de la monea
Private Const LOCALE_INEGSYMPRECEDES = &H56
Private Const LOCALE_IPOSSEPBYSPACE = &H55
Private Const LOCALE_IPOSSIGNPOSN = &H52
Private Const LOCALE_IPOSSYMPRECEDES = &H54
Private Const LOCALE_ITIME = &H23
Private Const LOCALE_ITLZERO = &H25 '1=horas con dos digitos
Private Const LOCALE_NOUSEROVERRIDE = &H80000000
Private Const LOCALE_S1159 = &H28 'simbolo a.m.
Private Const LOCALE_S2359 = &H29 'simbolo p.m.
Private Const LOCALE_SABBREVCTRYNAME = &H7 'nombre abreviado del país
Private Const LOCALE_SABBREVDAYNAME1 = &H31 'nombre abreviado de los días de la semana
Private Const LOCALE_SABBREVDAYNAME2 = &H32 'en el idioma del país
Private Const LOCALE_SABBREVDAYNAME3 = &H33
Private Const LOCALE_SABBREVDAYNAME4 = &H34
Private Const LOCALE_SABBREVDAYNAME5 = &H35
Private Const LOCALE_SABBREVDAYNAME6 = &H36
Private Const LOCALE_SABBREVDAYNAME7 = &H37
Private Const LOCALE_SABBREVLANGNAME = &H3 'nombre a breviado del lenguaje
Private Const LOCALE_SABBREVMONTHNAME1 = &H44  'nombre abreviado de los meses del año
Private Const LOCALE_SABBREVMONTHNAME10 = &H4D 'en el idioma del país
Private Const LOCALE_SABBREVMONTHNAME11 = &H4E
Private Const LOCALE_SABBREVMONTHNAME12 = &H4F
Private Const LOCALE_SABBREVMONTHNAME13 = &H100F
Private Const LOCALE_SABBREVMONTHNAME2 = &H45
Private Const LOCALE_SABBREVMONTHNAME3 = &H46
Private Const LOCALE_SABBREVMONTHNAME4 = &H47
Private Const LOCALE_SABBREVMONTHNAME5 = &H48
Private Const LOCALE_SABBREVMONTHNAME6 = &H49
Private Const LOCALE_SABBREVMONTHNAME7 = &H4A
Private Const LOCALE_SABBREVMONTHNAME8 = &H4B
Private Const LOCALE_SABBREVMONTHNAME9 = &H4C
Private Const LOCALE_SCOUNTRY = &H6 'nombre del país en inglés
Private Const LOCALE_SCURRENCY = &H14 'símbolo de la moneda
Private Const LOCALE_SDATE = &H1D 'separador de fechas
Private Const LOCALE_SDAYNAME1 = &H2A 'nombre de los días día de la semana
Private Const LOCALE_SDAYNAME2 = &H2B 'en el idioma del país
Private Const LOCALE_SDAYNAME3 = &H2C
Private Const LOCALE_SDAYNAME4 = &H2D
Private Const LOCALE_SDAYNAME5 = &H2E
Private Const LOCALE_SDAYNAME6 = &H2F
Private Const LOCALE_SDAYNAME7 = &H30
Private Const LOCALE_SDECIMAL = &HE 'separador decimal
Private Const LOCALE_SENGCOUNTRY = &H1002
Private Const LOCALE_SENGLANGUAGE = &H1001
Private Const LOCALE_SGROUPING = &H10 'nº de dígitos en grupo
Private Const LOCALE_SINTLSYMBOL = &H15 'simbolo internacional del pais
Private Const LOCALE_SLANGUAGE = &H2 'lenguaje selecionado en conf.reg.
Private Const LOCALE_SLIST = &HC 'separador de listas
Private Const LOCALE_SLONGDATE = &H20 'formato de fecha larga
Private Const LOCALE_SMONDECIMALSEP = &H16 'separador decimal en las monedas
Private Const LOCALE_SMONGROUPING = &H18 'nº de dígitos en grupo para las monedas
Private Const LOCALE_SMONTHNAME1 = &H38  'nombres de los meses
Private Const LOCALE_SMONTHNAME10 = &H41 'en el idioma del país
Private Const LOCALE_SMONTHNAME11 = &H42
Private Const LOCALE_SMONTHNAME12 = &H43
Private Const LOCALE_SMONTHNAME2 = &H39
Private Const LOCALE_SMONTHNAME3 = &H3A
Private Const LOCALE_SMONTHNAME4 = &H3B
Private Const LOCALE_SMONTHNAME5 = &H3C
Private Const LOCALE_SMONTHNAME6 = &H3D
Private Const LOCALE_SMONTHNAME7 = &H3E
Private Const LOCALE_SMONTHNAME8 = &H3F
Private Const LOCALE_SMONTHNAME9 = &H40
Private Const LOCALE_SMONTHOUSANDSEP = &H17 'separador de miles en las monedas
Private Const LOCALE_SNATIVECTRYNAME = &H8 'nombre del país en el idioma del país
Private Const LOCALE_SNATIVEDIGITS = &H13 'digitos empleados en el país
Private Const LOCALE_SNATIVELANGNAME = &H4 'idioma del país en el idioma del país
Private Const LOCALE_SNEGATIVESIGN = &H51 'simbolo de signo negativo
Private Const LOCALE_SPOSITIVESIGN = &H50 'simbolo de signo positivo
Private Const LOCALE_SSHORTDATE = &H1F 'formato de fecha corta
Private Const LOCALE_STHOUSAND = &HF 'separador de miles
Private Const LOCALE_STIME = &H1E 'separador de horas
Private Const LOCALE_STIMEFORMAT = &H1003 'formato de horas
Private Const LOCALE_SYSTEM_DEFAULT = &H800 'presentar información del sistema
Private Const LOCALE_USER_DEFAULT = &H400 'presentar información del usuario

'/////////////////////////////////////////////////////////////
'/  Mis Definiciones
Private LCID As Long

Public Sub setearConfiguracióndeNumeros()
    
    SetLocaleInfo LOCALE_USER_DEFAULT, LOCALE_SDECIMAL, ","
    SetLocaleInfo LOCALE_USER_DEFAULT, LOCALE_STHOUSAND, "."
    'Configuración de la moneda
    SetLocaleInfo LOCALE_USER_DEFAULT, LOCALE_SMONDECIMALSEP, ","
    SetLocaleInfo LOCALE_USER_DEFAULT, LOCALE_SMONTHOUSANDSEP, "."
    
End Sub


Public Sub setearConfiguracióndeFecha()
         
         If SetLocaleInfo(LCID, LOCALE_SSHORTDATE, "dd/MM/yyyy") _
            = False Then
            MsgBox "Failed"
            Exit Sub
         End If
         PostMessage HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0

End Sub


Public Sub setearConfiguracióndeHora()

         Dim dwLCID As Long
         dwLCID = GetSystemDefaultLCID()
         
         If SetLocaleInfo(LCID, LOCALE_S1159, "") _
            = False Then
            MsgBox "Failed"
            Exit Sub
         End If
         
         If SetLocaleInfo(LCID, LOCALE_S2359, "") _
            = False Then
            MsgBox "Failed"
            Exit Sub
         End If
         
         PostMessage HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0

End Sub


Public Sub ConfigurarSistema()

    setearConfiguracióndeNumeros
    setearConfiguracióndeHora
    setearConfiguracióndeFecha

End Sub


Private Function LocaleInfo(Optional ByVal nLocaleInfo As Long = LOCALE_IDEFAULTLANGUAGE) As String
    ' Devuelve la información indicada en el parámetro
    ' Si no se especifica el parámetro,
    ' será el nombre del idioma según la norma ISO (en inglés)
    Dim sBuf As String
    
    sBuf = Space$(MAX_LOCALE_BUF)
    Call GetLocaleInfo(LCID, nLocaleInfo, sBuf, Len(sBuf))
    LocaleInfo = TrimNull(sBuf)
End Function


Private Function TrimNull(ByVal sCadena As String) As String
    ' Devuelve la cadena hasta el primer null
    ' También quita los espacios extras
    Dim i As Long
    
    i = InStr(sCadena, Chr$(0))
    If i Then
        'TrimNull = Left$(sCadena, i - 1)
        ' esta sería la asignación correcta                         (29/Oct/02)
        ' gracias a José María Mata
        sCadena = Left$(sCadena, i - 1)
    End If
    
    TrimNull = Trim$(sCadena)
End Function

Private Sub Class_Initialize()
    ' Al iniciar la clase, obtener el ID del idioma usado
    GetLCID
End Sub

Public Function GetLCID() As Long
    ' Obtener el ID del idioma usado
    ' Lo he puesto en un método público por si se quiere refrescar la información
    LCID = GetSystemDefaultLangID
    
    GetLCID = LCID
End Function

Public Function Thousands() As String
    ' Devuelve el signo de los miles
    Thousands = LocaleInfo(LOCALE_STHOUSAND)
End Function

Public Function sDecimal() As String
    ' Devuelve el signo decimal
    sDecimal = LocaleInfo(LOCALE_SDECIMAL)
End Function


Public Function LongDateFormatOrder() As String
    ' El orden de la fecha larga (MDY, DMY, YMD)
    Dim i As eDateOrder
    
    i = LocaleInfo(LOCALE_ILDATE)
    
    If i = DMY Then
        LongDateFormatOrder = "DMY"
    ElseIf i = MDY Then
        LongDateFormatOrder = "MDY"
    Else
        LongDateFormatOrder = "YMD"
    End If
End Function

Public Function DateFormatOrder() As String
    ' El orden de la fecha corta (MDY, DMY, YMD)
    Dim i As eDateOrder
    
    i = LocaleInfo(LOCALE_IDATE)
    
    If i = DMY Then
        DateFormatOrder = "DMY"
    ElseIf i = MDY Then
        DateFormatOrder = "MDY"
    Else
        DateFormatOrder = "YMD"
    End If
End Function

