VERSION 5.00
Begin VB.Form frm_SeleccionarPuesto 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Seleccionar Puesto"
   ClientHeight    =   1905
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   4425
   Icon            =   "frm_SeleccionarPuesto.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1905
   ScaleWidth      =   4425
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmd 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Index           =   1
      Left            =   1230
      TabIndex        =   5
      Top             =   1350
      Width           =   1050
   End
   Begin VB.CommandButton cmd 
      Caption         =   "&Aceptar"
      Height          =   375
      Index           =   0
      Left            =   105
      TabIndex        =   4
      Top             =   1350
      Width           =   1050
   End
   Begin VB.PictureBox pnl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   1155
      Index           =   2
      Left            =   105
      ScaleHeight     =   1125
      ScaleWidth      =   4215
      TabIndex        =   0
      Top             =   105
      Width           =   4245
      Begin VB.ComboBox cbPuestos 
         Height          =   315
         ItemData        =   "frm_SeleccionarPuesto.frx":000C
         Left            =   330
         List            =   "frm_SeleccionarPuesto.frx":000E
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   435
         Width           =   3495
      End
      Begin VB.CommandButton cmd 
         Caption         =   "..."
         Height          =   330
         Index           =   2
         Left            =   5955
         TabIndex        =   1
         Top             =   240
         Width           =   330
      End
      Begin VB.Label lbl 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Usuario"
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   2
         Left            =   315
         TabIndex        =   2
         Top             =   210
         Width           =   540
      End
   End
End
Attribute VB_Name = "frm_SeleccionarPuesto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim objControl As New CControl

Private Sub cmd_Click(Index As Integer)

    Select Case Index
    Case 0
        objParametros.GrabarValor "frm_SeleccionarPuesto.nrPuesto", Me.cbPuestos.ItemData(Me.cbPuestos.ListIndex)
    Case Else
        objParametros.GrabarValor "frm_SeleccionarPuesto.nrPuesto", ""
    End Select
    Unload Me
    
End Sub

Private Sub Form_Activate()


    If objParametros.ObtenerValor("frm_SeleccionarPuesto.nrPuesto") = "" Then Exit Sub

    ObjTablasIO.nmTabla = "TB_Puestos"
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "->", ""
    
    If App.LogMode <> MODO_DEBUG Then
        ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<>", "9", " AND "
    End If
    
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "=", objParametros.ObtenerValor("frm_SeleccionarPuesto.nrPuesto")
    ObjTablasIO.setearCampoOperadorValor "dsPuesto", "->", ""
    ObjTablasIO.Seleccionar
    
    If Not objbasededatos.rs_resultados.EOF Then
        Me.cbPuestos.Text = objbasededatos.rs_resultados("dsPuesto")
    End If
    
    Me.cbPuestos.SetFocus
    
    
End Sub

Private Sub Form_Load()



    ObjTablasIO.nmTabla = "TB_Puestos"
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "->", ""
    If App.LogMode <> MODO_DEBUG Then
        ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<>", "9", " AND "
    End If
    ObjTablasIO.setearCampoOperadorValor "dsPuesto", "->", ""
    ObjTablasIO.Seleccionar
    
    
    objControl.CargarComboConData Me.cbPuestos, objbasededatos.rs_resultados, objbasededatos.rs_resultados("dsPuesto"), objbasededatos.rs_resultados("nrPuesto")
    
    Me.cbPuestos.ListIndex = 0
    
End Sub
