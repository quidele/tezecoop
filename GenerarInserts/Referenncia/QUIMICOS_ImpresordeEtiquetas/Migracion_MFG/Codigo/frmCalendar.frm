VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmCalendar 
   Caption         =   "Calendario OyG"
   ClientHeight    =   2376
   ClientLeft      =   4728
   ClientTop       =   2652
   ClientWidth     =   2628
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2376
   ScaleWidth      =   2628
   Begin MSComCtl2.MonthView Calendario 
      Height          =   2208
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2640
      _ExtentX        =   4657
      _ExtentY        =   3895
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   0
      StartOfWeek     =   16384001
      CurrentDate     =   36565
   End
End
Attribute VB_Name = "frmCalendar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Sub Calendario_click()
    If frmPrincipal.Fecha Then   'llama el frmPrincipal
        frmPrincipal.mskFechaLote = Calendario.Value
    Else
        frmSeleccion.cargarFechas
    End If
End Sub

Public Sub Calendario_DblClick()
    If frmPrincipal.Fecha Then
        frmPrincipal.mskFechaLote = Calendario.Value
        frmCalendar.Hide
        frmPrincipal.Fecha = False
    Else
        frmSeleccion.cargarFechas
        frmCalendar.Hide
    End If
End Sub

Private Sub Calendario_LostFocus()
    frmCalendar.Hide
End Sub

