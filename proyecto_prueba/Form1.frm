VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#4.6#0"; "crystl32.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin Crystal.CrystalReport CrystalReport1 
      Left            =   1800
      Top             =   600
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   262150
      PrinterName     =   "asxasas"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public Declare Function RegMyServerObject Lib _
"c:\vbprndlg.dll" _
Alias "DllRegisterServer" () As Long

Private Sub Form_Load()


    RegMyServerObject
    

  '  Dim objSelecImpresora As Object
  '  Set objSelecImpresora = CreateObject("MSComDlg.CommonDialog")
  '  objSelecImpresora.PrinterDefault = True
  '  objSelecImpresora.Flags = &H40
  '  objSelecImpresora.ShowPrinter
  '  MsgBox CommonDialog1.Object
  '    Dim objSelecImpresora As VBPrnDlgLib.PrinterDlg
    '  Set objSelecImpresora = New VBPrnDlgLib.PrinterDlg

    
    
    '  objSelecImpresora.PrinterDefault = True
    '  objSelecImpresora.Flags = &H40
    '  objSelecImpresora.ShowPrinter Me.hWnd
    '  MsgBox objSelecImpresora.Port
    '  MsgBox objSelecImpresora.PrinterName
    '  MsgBox objSelecImpresora.DriverName
    
    
End Sub
