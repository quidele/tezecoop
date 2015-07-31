VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CGUI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Const espacio_borde = 10

Public Sub SizeControls(frm As Form, Optional frame As frame, Optional grilla As ListView, Optional espacio_derecha As Integer = 100, Optional espacio_abajo As Integer = 200)

    On Error Resume Next
    If frm.Height < 1500 Then
        frm.Height = 1500
    End If
    If frm.Width < 1500 Then
        frm.Width = 1500
    End If
    
    If Not IsMissing(frame) Then
        frame.Width = frm.ScaleWidth - espacio_derecha
        frame.Height = frm.ScaleHeight - espacio_abajo
    End If
    
    If Not IsMissing(grilla) Then
        grilla.Width = frm.ScaleWidth - (grilla.Left + espacio_derecha + espacio_borde)
        grilla.Height = frm.ScaleHeight - (grilla.Top + (espacio_abajo * 3) + espacio_borde)

        Dim i As Integer
        i = grilla.ListItems.Add(, , "").Index
        grilla.ListItems.Remove i

    End If
    
    DoEvents
    frm.Visible = True
    DoEvents
    On Error GoTo 0
    
End Sub


Public Sub SizeControlsPagoLicenciatario(frm As Form, Optional frame As frame, _
                                         Optional grilla As ListView, _
                                         Optional espacio_derecha As Integer = 100, _
                                         Optional espacio_abajo As Integer = 200, _
                                         Optional frameTotales As frame)

    On Error Resume Next
    If frm.Height < 1500 Then
        frm.Height = 1500
    End If
    If frm.Width < 1500 Then
        frm.Width = 1500
    End If
    
    If Not IsMissing(frame) Then
        frame.Width = frm.ScaleWidth - espacio_derecha
        frame.Height = frm.ScaleHeight - (espacio_abajo)
    End If
    
    If Not IsMissing(grilla) Then
    ' (espacio_abajo * 3)
        grilla.Width = frame.Width - (grilla.Left + espacio_derecha + espacio_borde)
        grilla.Height = frame.Height - (grilla.Top + (espacio_abajo * 8) + espacio_borde + frameTotales.Height)

        Dim i As Integer
        i = grilla.ListItems.Add(, , "").Index
        grilla.ListItems.Remove i

    End If
    
    If Not IsMissing(frameTotales) Then
        frameTotales.Top = grilla.Top + grilla.Height + espacio_borde
    End If
    
    
    DoEvents
    frm.Visible = True
    DoEvents
    On Error GoTo 0
    
End Sub

Public Sub SizeControls_WithTotals(frm As Form, Optional frame As frame, Optional grilla As ListView, Optional espacio_derecha As Integer = 100, Optional espacio_abajo As Integer = 200, Optional pic_detalle As PictureBox, Optional grillaTotales As ListView)

    On Error Resume Next
    If frm.Height < 1500 Then
        frm.Height = 1500
    End If
    If frm.Width < 1500 Then
        frm.Width = 1500
    End If
    
    If Not IsMissing(frame) Then
        frame.Width = frm.ScaleWidth - espacio_derecha
        frame.Height = frm.ScaleHeight - espacio_abajo
    End If
    
    If Not IsMissing(grilla) Then
    
        grilla.Width = frm.ScaleWidth - (grilla.Left + espacio_derecha + espacio_borde)
        grilla.Height = frm.ScaleHeight - (grilla.Top + (espacio_borde * 50) + grillaTotales.Height)
        
        If Not IsMissing(pic_detalle) Then
            pic_detalle.Left = grilla.Left
            pic_detalle.Top = grilla.Top + grilla.Height
            pic_detalle.Width = grilla.Width
        End If

        If Not IsMissing(grillaTotales) Then
            grillaTotales.Left = 0
            grillaTotales.Width = pic_detalle.Width - 100
        End If
        

        Dim i As Integer
        i = grilla.ListItems.Add(, , "").Index
        grilla.ListItems.Remove i
        grilla.Refresh
        i = grillaTotales.ListItems.Add(, , "").Index
        grillaTotales.ListItems.Remove i
        grillaTotales.Refresh
        
    End If
    
    DoEvents
    frm.Visible = True
    DoEvents
    On Error GoTo 0
    
End Sub

Public Sub centrarObjeto(objControl As Control)

    objControl.Top = (Screen.ActiveForm.ScaleHeight / 2) - (objControl.Height / 2)
    objControl.Left = (Screen.ActiveForm.ScaleWidth / 2) - (objControl.Width / 2)
    objControl.Refresh

End Sub



Public Sub resaltarcambiosenFilaaFila(lstgrilla As ListView)
Dim listItem_anterior As ListView
Dim listItem_Actual As ListView

    For i = 1 To lstgrilla.ListItems.Count
        If i > 1 Then
                If lstgrilla.ListItems(i - 1).Text <> lstgrilla.ListItems(i).Text Then
                    lstgrilla.ListItems(i - 1).ForeColor = vbRed
                End If
            
            For j = 1 To lstgrilla.ColumnHeaders.Count - 2
                If lstgrilla.ListItems(i - 1).ListSubItems(j).Text <> lstgrilla.ListItems(i).ListSubItems(j).Text Then
                    lstgrilla.ListItems(i - 1).ListSubItems(j).ForeColor = vbRed
                End If
            Next j
        End If
    Next
    
End Sub



Public Sub HabilitarCampos(objCampo As Control, habilitar As Boolean)
    'habilitar = True Habilita
    'habilitar = False Deshabilita
    If Not habilitar Then
          objCampo.Locked = True
          objCampo.BackColor = Gris '&HE0E0E0
    Else
          objCampo.BackColor = Blanco
          objCampo.Locked = False
    End If

End Sub



Public Sub refrescarGrilla(lstBusqueda As ListView)
    
    Dim i As Integer
    i = lstBusqueda.ListItems.Add(, , "").Index
    lstBusqueda.ListItems.Remove i
    
    
End Sub



