VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm Frm_Principal 
   BackColor       =   &H8000000C&
   Caption         =   "Sistema de Gestión - Taxis Aeropuerto Ezeiza "
   ClientHeight    =   7365
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   9120
   Icon            =   "Frm_Principal.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   288
      Left            =   0
      TabIndex        =   0
      Top             =   7080
      Width           =   9120
      _ExtentX        =   16087
      _ExtentY        =   503
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   1
            Object.Width           =   5159
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   1
            Object.Width           =   5159
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   1
            Object.Width           =   5159
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnMaestros 
      Caption         =   "&Maestros"
      WindowList      =   -1  'True
      Begin VB.Menu mnMaestrosClientes 
         Caption         =   "&Clientes"
         Shortcut        =   ^C
      End
      Begin VB.Menu nmMaestrosProveedores 
         Caption         =   "&Proveedores"
         Shortcut        =   ^P
      End
      Begin VB.Menu nmMaestroProductos 
         Caption         =   "Pr&oductos"
         Shortcut        =   ^O
      End
      Begin VB.Menu nmUsuario 
         Caption         =   "&Usuarios"
         Shortcut        =   ^U
      End
      Begin VB.Menu optNivelesdeAcceso 
         Caption         =   "&Niveles de Acceso"
      End
      Begin VB.Menu nmManejodeCaja 
         Caption         =   "&Manejo de Caja"
         Begin VB.Menu optcajasPuestos 
            Caption         =   "Cajas de los Puestos"
         End
         Begin VB.Menu optCajasPendientes 
            Caption         =   "Cajas Pendientes"
         End
         Begin VB.Menu optCajasRechazadas 
            Caption         =   "Cajas Rechazadas"
         End
         Begin VB.Menu optcajasmodificadosxadm 
            Caption         =   "Cajas Modificadas por Administración"
         End
         Begin VB.Menu optRegistracionCajaPuestoCajaADM 
            Caption         =   "Registración Caja Puesto -> Caja Adm."
         End
         Begin VB.Menu optReversionCajaPuestoCajaADM 
            Caption         =   "Reversión Caja Puesto -> Caja Adm."
         End
         Begin VB.Menu optCajaAdministración 
            Caption         =   "Cajas de Administración"
         End
      End
      Begin VB.Menu optTraspasoPuestos 
         Caption         =   "Traspaso de Caja"
         Begin VB.Menu optRealizarTraspaso 
            Caption         =   "Realizar Traspaso"
         End
         Begin VB.Menu optTraspasoCajaAuditorias 
            Caption         =   "Visor de Auditoria"
         End
      End
      Begin VB.Menu optComisiones 
         Caption         =   "Com&isiones"
         Shortcut        =   ^I
      End
      Begin VB.Menu optConceptos 
         Caption         =   "Conceptos"
         Shortcut        =   ^Q
      End
      Begin VB.Menu optPuestos 
         Caption         =   "Puestos"
      End
      Begin VB.Menu optTalonarios 
         Caption         =   "Talonarios"
      End
      Begin VB.Menu optTalonariosPuestos 
         Caption         =   "Talonarios / Puestos"
      End
      Begin VB.Menu optiposComprobantes 
         Caption         =   "Tipos de Comprobantes"
      End
      Begin VB.Menu optCerrarCaja 
         Caption         =   "C&errar Caja"
         Shortcut        =   ^{F1}
      End
      Begin VB.Menu mnu_Usuario 
         Caption         =   "Usuario"
         Begin VB.Menu optCambioUsuario 
            Caption         =   "Cambiar de Usuario"
         End
         Begin VB.Menu opt_cambiarClave 
            Caption         =   "Cambiar Clave de Acceso"
         End
      End
      Begin VB.Menu optParametros 
         Caption         =   "Parametros"
      End
      Begin VB.Menu optCargaMaestros 
         Caption         =   "Carga Tarifas"
      End
      Begin VB.Menu optGuiaFilcar 
         Caption         =   "Guia Filcar Digital"
      End
      Begin VB.Menu raya 
         Caption         =   "-"
      End
      Begin VB.Menu nmMaestroSalir 
         Caption         =   "&Salir"
         Shortcut        =   ^X
      End
   End
   Begin VB.Menu mnVentas 
      Caption         =   "&Ventas"
      Begin VB.Menu mnVentaViajes 
         Caption         =   "&Venta de Viajes"
         Shortcut        =   ^V
      End
      Begin VB.Menu optComprobantes 
         Caption         =   "&Búsquedas de Comprobantes"
         Shortcut        =   ^R
      End
      Begin VB.Menu optAnular 
         Caption         =   "Anular Comprobante"
      End
      Begin VB.Menu optNotasCredito 
         Caption         =   "Notas de Crédito"
      End
      Begin VB.Menu optNotasDebito 
         Caption         =   "Notas de Débito"
      End
      Begin VB.Menu optImpresionEnblanco 
         Caption         =   "Impresión de Facturas"
         Begin VB.Menu opt_imprime_factura 
            Caption         =   "Formulario Continuo"
            Checked         =   -1  'True
            Index           =   1
         End
         Begin VB.Menu opt_imprime_factura 
            Caption         =   "Preimpreso laser"
            Index           =   2
         End
         Begin VB.Menu opt_imprime_factura 
            Caption         =   "Hoja Blanco Laser"
            Index           =   3
         End
      End
      Begin VB.Menu raya_factura 
         Caption         =   "-"
      End
      Begin VB.Menu optCargaManual 
         Caption         =   "Carga Manual Para Pago de Comprobantes"
         Shortcut        =   ^Z
      End
      Begin VB.Menu optCargaComprobantesPagados 
         Caption         =   "Carga Manual de Comprobantes Pagados"
         Visible         =   0   'False
      End
      Begin VB.Menu optEliminarComprobantesMalCargados 
         Caption         =   "Corregir o Eliminar un Comprobante mal Cargado Manualmente"
      End
      Begin VB.Menu opt_MarcaComprobanteErroneo 
         Caption         =   "Marcar Comprobantes como una carga manual erronea"
         Visible         =   0   'False
      End
      Begin VB.Menu raya_2 
         Caption         =   "-"
      End
      Begin VB.Menu mn_HojaA4 
         Caption         =   "Hoja A4"
         Visible         =   0   'False
         Begin VB.Menu optVentadeViajesFacturaA4 
            Caption         =   "Venta de Viajes (Hoja Entera - A4)"
         End
         Begin VB.Menu optComprobantesHojaA4 
            Caption         =   "&Reimpresión de Comprobantes (Hoja Entera - A4)"
         End
         Begin VB.Menu optAnularA4 
            Caption         =   "Anular Comprobante (Hoja Entera - A4)"
         End
      End
   End
   Begin VB.Menu mnAdministracion 
      Caption         =   "&Administración"
      Begin VB.Menu optLicenciatarios 
         Caption         =   "Pago &Licenciatarios y Cobro a Cta. Cte."
         Shortcut        =   ^L
      End
      Begin VB.Menu optFacturarCtaCte 
         Caption         =   "Facturar las Cta. Cte."
      End
      Begin VB.Menu optReimpresionRecibos 
         Caption         =   "Búsqueda y  Anulación de Recibos"
         Shortcut        =   ^B
      End
      Begin VB.Menu optPagosdelaCajaActual 
         Caption         =   "Pagos de la Caja Actual"
      End
      Begin VB.Menu optResumenes 
         Caption         =   "Resúmenes Licenciatarios"
         Shortcut        =   ^E
      End
      Begin VB.Menu optResumenesRecaudaciones 
         Caption         =   "Resúmenes Recaudaciones"
      End
      Begin VB.Menu optResumenesClientes 
         Caption         =   "Resúmenes Clientes"
      End
      Begin VB.Menu raya2 
         Caption         =   "-"
      End
      Begin VB.Menu optMovimientosContables 
         Caption         =   "Movimientos Contables   (Caja Actual)"
      End
      Begin VB.Menu optCajasDiariasAdm 
         Caption         =   "Caja Diaria de Adm.        (Caja Actual)"
      End
      Begin VB.Menu optCajaDiariaLicenciatario 
         Caption         =   "Caja Diara Licenciatarios  (Caja Actual)"
      End
      Begin VB.Menu optCajaDiariaCooperativa 
         Caption         =   "Caja Diara Cooperativa   (Caja Actual)"
      End
      Begin VB.Menu raya3 
         Caption         =   "-"
      End
      Begin VB.Menu opt_BusquedaMovimientosContables 
         Caption         =   "Busqueda de Movimientos"
      End
      Begin VB.Menu opt_ResumenMovimientosContables 
         Caption         =   "Resumen Movimientos Contables"
      End
      Begin VB.Menu optResumenCajadelosLicenciatarios 
         Caption         =   "Resumen Caja de los Licenciatarios"
      End
   End
   Begin VB.Menu mnuEstudioContable 
      Caption         =   "Estudio Contable"
      Begin VB.Menu optFacturacionMensual 
         Caption         =   "Facturación Mensual"
      End
      Begin VB.Menu optIVAVentas 
         Caption         =   "IVA Ventas"
      End
      Begin VB.Menu optSalidasAFIP 
         Caption         =   "Salidas AFIP"
      End
      Begin VB.Menu optPresentacionesCAIAFIP 
         Caption         =   "Presentaciones CAI"
      End
   End
   Begin VB.Menu mnConciliaciones 
      Caption         =   "Conciliaciones"
      Begin VB.Menu optConciliarViajes 
         Caption         =   "Conciliar Viajes"
      End
   End
   Begin VB.Menu mnVarios 
      Caption         =   "Varios"
      Begin VB.Menu optCargaTarifas 
         Caption         =   "Carga de Tarifas"
      End
      Begin VB.Menu optModifComprobante 
         Caption         =   "Modificar Datos del Comprobante"
      End
      Begin VB.Menu optObligaciones 
         Caption         =   "Carga de Obligaciones"
      End
      Begin VB.Menu opt_estadodecuenta 
         Caption         =   "Estado de Cuenta - Obligaciones"
      End
   End
End
Attribute VB_Name = "Frm_Principal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Option Explicit

Public CrystalReport1           As Object

Public Sub LimpiarReporte()
Dim i As Integer

    Set CrystalReport1 = Nothing
    Sleep (100)
    Set CrystalReport1 = CreateObject("Crystal.CrystalReport")
    Frm_Principal.CrystalReport1.Connect = "DSN=" + objConfig.dsDSN + ";UID=" + objConfig.dsUID + ";PWD=sonrisa14;DSQ=dbSG2000"

End Sub


    
Private Sub MDIForm_Activate()

    
    If objConfig.AbreCaja = "SI" Then
        Me.Caption = "Sistema de Gestión - Taxis Aeropuerto Ezeiza - (" + objUsuario.dsUsuario + ") " + " Caja Nro: " + objParametros.ObtenerValor("nrCaja")
    Else
        Me.Caption = "Sistema de Gestión - Taxis Aeropuerto Ezeiza - (" + objUsuario.dsUsuario + ") "
    End If
    

    EstablecerAccesos
    
    
End Sub

Private Sub MDIForm_Load()

    If objConfig.AbreCaja = "SI" Then
        Me.Caption = "Sistema de Gestión - Taxis Aeropuerto Ezeiza - (" + objUsuario.dsUsuario + ") " + " Caja Nro: " + objParametros.ObtenerValor("nrCaja")
    Else
        Me.Caption = "Sistema de Gestión - Taxis Aeropuerto Ezeiza - (" + objUsuario.dsUsuario + ") "
    End If
    
    
    EstablecerAccesos

    Me.opt_imprime_factura(1).Checked = False
    Me.opt_imprime_factura(2).Checked = False
    Me.opt_imprime_factura(3).Checked = False
    
    
    Select Case objConfig.tpImpresion
    Case "CONTINUO"
        Me.opt_imprime_factura(1).Checked = True
    Case "PREIMPRESO"
        Me.opt_imprime_factura(2).Checked = True
    Case "BLANCO"
        Me.opt_imprime_factura(3).Checked = True
    Case Else
        Me.opt_imprime_factura(1).Checked = True
        objConfig.tpImpresion = "CONTINUO"
    End Select
    
    Me.StatusBar1.Panels(3).Text = objConfig.dsDSN
    
End Sub

Private Sub MDIForm_QueryUnload(Cancel As Integer, UnloadMode As Integer)
Dim resp As Byte


    resp = MsgBox("Esta seguro que desea salir del sistema", _
                    vbQuestion + vbYesNo, "Salir del Sistema")
                    
    If resp = vbNo Then
        Cancel = True
        Exit Sub
    End If
    
    objLog.Cerrar_Log
    
    objConfig.dsUsuario = objUsuario.dsUsuario
    objConfig.GuardarINI
    Set CrystalReport1 = Nothing
    
End Sub


Private Sub EstablecerAccesos()
Dim Control  As Control

    ' Bloqueamos  todas las opciones de menues
    RecorrerBloquearTodosMenues
    If objConfig.tpModo_Operacion = FACTURACION_REMOTA Then
        ' establecer acceso FACTURACION_REMOTA
        establecer_acceso_factu_remota
    Else
        objSPs.nmStoredProcedure = "sco_AccesosOpcionesMenu"
        objSPs.setearCampoValor "@p_tpNivelAcceso", objUsuario.tpAcceso
        objSPs.setearCampoValor "@p_operaconcaja", "1"
        If Not objSPs.ExecSP Then
            MsgBox "Error al obtener el nivel de acceso, el programa se cerrará", vbCritical, "Seguridad"
            End
        End If
        Do Until objSPs.rs_resultados.EOF
            DesbloquearBloquearMenu objSPs.rs_resultados("nmOpcionMenu"), objSPs.rs_resultados("flAcceso")
            objSPs.rs_resultados.MoveNext
        Loop
    End If
    
    
    
    Me.StatusBar1.Panels(2) = "USUARIO : " + objUsuario.dsUsuario + " - " + objUsuario.nmEmpleado



    Me.StatusBar1.Panels(1) = " Versión " + CStr(App.Major) + "." + CStr(App.Minor) + "." + CStr(App.Revision)
    

End Sub


Private Sub establecer_acceso_factu_remota()

    DesbloquearBloquearMenu "mnMaestros", True
    DesbloquearBloquearMenu "nmManejodeCaja", True
    DesbloquearBloquearMenu "optcajasPuestos", True
    DesbloquearBloquearMenu "optTraspasoPuestos", True
    DesbloquearBloquearMenu "optCerrarCaja", True
    DesbloquearBloquearMenu "mnu_Usuario", True
    DesbloquearBloquearMenu "optCambioUsuario", True
    DesbloquearBloquearMenu "opt_cambiarClave", True
    DesbloquearBloquearMenu "optGuiaFilcar", True
    DesbloquearBloquearMenu "nmMaestroSalir", True
    DesbloquearBloquearMenu "mnVentas", True
    DesbloquearBloquearMenu "mnVentaViajes", True
    DesbloquearBloquearMenu "optCargaManual", True
    DesbloquearBloquearMenu "optEliminarComprobantesMalCargados", True
    DesbloquearBloquearMenu "optComprobantes", True
    DesbloquearBloquearMenu "optAnular", True
    DesbloquearBloquearMenu "optImpresionEnblanco", True
    DesbloquearBloquearMenu "opt_imprime_factura", True
    DesbloquearBloquearMenu "opt_imprime_factura", True
    DesbloquearBloquearMenu "opt_imprime_factura", True

End Sub



Private Sub MDIForm_Resize()

    Me.WindowState = 2
    
End Sub

Private Sub mnMaestrosClientes_Click()

    Frm_ABMClientes.Show 1
    
End Sub

Private Sub mnVentaViajes_Click()

  ' Version 3.7: obtenemos los datos de las caja
  objCajas.obtenerCaja objParametros.ObtenerValor("nrCaja")

  objParametros.GrabarValor "Frm_VentasPasajes.vlDiaEuro", objCajas.vlDiaEuro
  objParametros.GrabarValor "Frm_VentasPasajes.vlDiaDolar", objCajas.vlDiaDolar
  objParametros.GrabarValor "Frm_VentasPasajes.vlDiaReal", objCajas.vlDiaReal
    
  objParametros.GrabarValor "Frm_VentaPasajes.numeracion_correlativa", "SI"
  objParametros.GrabarValor "Frm_VentaPasajes.desde", "puesto"
  objParametros.GrabarValor "Frm_VentaPasajes.nrPuesto", objConfig.nrPuesto
  objParametros.GrabarValor "Frm_VentaPasajes.nrCaja", objParametros.ObtenerValor("nrCaja")
  objParametros.GrabarValor "Frm_VentaPasajes.tipofacturacion", "automatica"
  objParametros.GrabarValor "Frm_VentaPasajes.modo", "Facturar"
  ' ADD agregado en la version 4.7
  objParametros.GrabarValor "Frm_VentaPasajes.tpComprobante", "FA"
  objParametros.GrabarValor "Frm_VentaPasajes.TituloPrincipal", "Venta de Viajes"
  
  objParametros.GrabarValor "FormatoHoja", "Chico"
  
  ' analisis version 4.7
  Frm_VentaPasajes.Show 1
    
End Sub


Private Sub nmMaestroProductos_Click()

            
    Frm_ABMProductos.Show 1


End Sub

Private Sub nmMaestroSalir_Click()

    Unload Me
    
End Sub

Private Sub nmMaestrosProveedores_Click()

    Frm_ABMProveedores.Show 1
    
End Sub

Private Sub nmUsuario_Click()

    Frm_ABMUsuarios.Show 1
    
End Sub

Private Sub opt_BusquedaMovimientosContables_Click()


    objParametros.GrabarValor "Precede_Resumen", "NO"
    Frm_BusquedaMovimientosContables.Show 1
    
End Sub

Private Sub opt_cambiarClave_Click()
   
   frm_CambiarPassword.Show vbModal
   
End Sub

Private Sub opt_estadodecuenta_Click()
Dim objServiceLoaderForms As Object


    On Error Resume Next
            
    ' v4.9
    objLog.Grabar_Log "Inicializando Servicio SGLibrary.LoaderForms"
    Set objServiceLoaderForms = CreateObject("SGLibrary.LoaderForms")
    objLog.Grabar_Log "Inicializando Servicio SGLibrary.LoaderForms OK "

    If Err <> 5 Then
        MsgBox Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0

    objLog.Grabar_Log "Antes de  UsuarioActivo objUsuario.dsUsuario " + objUsuario.dsUsuario
    objServiceLoaderForms.UsuarioActivo CStr(objUsuario.dsUsuario)

    objLog.Grabar_Log "Configurando el ambiente  objConfig.dsDSN " + objConfig.dsDSN
    objServiceLoaderForms.AmbienteActivo objConfig.dsDSN

    
    objServiceLoaderForms.execFormulario "FrmEstadoDeCuenta"
    
    
    
End Sub

Private Sub opt_imprime_factura_Click(Index As Integer)
Dim resp    As Byte
        
        Select Case Index
        Case 1 ' Continuo
            resp = MsgBox("Esta seguro que desea imprimir en Formulario Continuo?", vbYesNo + vbQuestion, "Atención")
            If resp = vbNo Then Exit Sub
            objConfig.tpImpresion = UCase("Continuo")
        Case 2 ' Preimpreso
            resp = MsgBox("Esta seguro que desea imprimir en papel Preimpreso Laser?", vbYesNo + vbQuestion, "Atención")
            If resp = vbNo Then Exit Sub
            objConfig.tpImpresion = UCase("preimpreso")
        Case 3 ' Blanco
            resp = MsgBox("Esta seguro que desea imprimir en papel en Hoja Blanco Laser?", vbYesNo + vbQuestion, "Atención")
            If resp = vbNo Then Exit Sub
            objConfig.tpImpresion = UCase("blanco")
        End Select
            
        objConfig.GuardarINI
        
        Me.opt_imprime_factura(1).Checked = False
        Me.opt_imprime_factura(2).Checked = False
        Me.opt_imprime_factura(3).Checked = False
        Me.opt_imprime_factura(Index).Checked = True
                
End Sub

Private Sub opt_MarcaComprobanteErroneo_Click()

    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.modo", "Consulta"
    Frm_MarcarComprobantesErroneos.Show vbModal

End Sub

Private Sub opt_ResumenMovimientosContables_Click()

    Frm_ResumenMovimientosContables.Show 1
    
End Sub

Private Sub optAnular_Click()
    
    objParametros.GrabarValor "frm_AnularComprobantes.modo", "Consulta"
    objParametros.GrabarValor "FormatoHoja", "Chico"
    Frm_AnularComprobantes.Show 1
    
End Sub

Private Sub optAnularA4_Click()

    objParametros.GrabarValor "frm_AnularComprobantes.modo", "Consulta"
    objParametros.GrabarValor "FormatoHoja", "Grande"
    Frm_AnularComprobantes.Show 1
    
End Sub

Private Sub optCajaAdministración_Click()

    objParametros.GrabarValor "Frm_ABMCaja", "Consulta"
    frm_ABMCajaADM.Show 1
    
End Sub

Private Sub optCajaDiariaCooperativa_Click()

    objParametros.GrabarValor "Frm_ResumenCajaADM.nrCajaVista", objParametros.ObtenerValor("nrCaja")
    objParametros.GrabarValor "Frm_ResumenCajaADM.dsUsuarioVista", objUsuario.dsUsuario
    objParametros.GrabarValor "Frm_ResumenCajaADM.tpCaja", "CC"
    objParametros.GrabarValor "Frm_ResumenCajaADM.tpCajaImputacion", "Caja de la Cooperativa"
    objParametros.GrabarValor "Frm_ResumenCajaADM.titulo", "Resumen - Caja de la Cooperativa"
    Frm_ResumenCajaADM.Show 1
    
End Sub

Private Sub optCajaDiariaLicenciatario_Click()

    objParametros.GrabarValor "Frm_ResumenCajaADM.nrCajaVista", objParametros.ObtenerValor("nrCaja")
    objParametros.GrabarValor "Frm_ResumenCajaADM.dsUsuarioVista", objUsuario.dsUsuario
    objParametros.GrabarValor "Frm_ResumenCajaADM.tpCaja", "CL"
    objParametros.GrabarValor "Frm_ResumenCajaADM.tpCajaImputacion", "Caja de los Licenciatarios"
    objParametros.GrabarValor "Frm_ResumenCajaADM.titulo", "Resumen - Caja de los Licenciatarios"
    Frm_ResumenCajaADM.Show 1
    
    
End Sub

Private Sub optCajasDiariasAdm_Click()
    
    objParametros.GrabarValor "Frm_ResumenCajaADM.nrCajaVista", objParametros.ObtenerValor("nrCaja")
    objParametros.GrabarValor "Frm_ResumenCajaADM.dsUsuarioVista", objUsuario.dsUsuario
    objParametros.GrabarValor "Frm_ResumenCajaADM.tpCaja", "CA"
    objParametros.GrabarValor "Frm_ResumenCajaADM.tpCajaImputacion", ""
    objParametros.GrabarValor "Frm_ResumenCajaADM.titulo", "Resumen - Caja de la Administración"
    
    
    Frm_ResumenCajaADM.Show 1
    
    
End Sub

Private Sub optcajasmodificadosadm_Click()

    frm_ABMCaja.Show 1
    
End Sub

Private Sub optcajasmodificadosxadm_Click()

    objParametros.GrabarValor "frm_ABMCaja.modo", "cajas_modificadas_adm"
    objParametros.GrabarValor "Frm_ABMCaja", "Consulta"
    frm_ABMCaja.Show 1
    
End Sub

Private Sub optCajasPendientes_Click()

    objParametros.GrabarValor "frm_ABMCaja.modo", "cajas_modificadas_adm.cajaspendientes"
    objParametros.GrabarValor "Frm_ABMCaja", "Consulta"
    frm_ABMCaja.Show 1
    
End Sub

Private Sub optcajasPuestos_Click()

    objParametros.GrabarValor "frm_ABMCaja.modo", "cajas_del_usuario"
    objParametros.GrabarValor "Frm_ABMCaja", "Consulta"
    frm_ABMCaja.Show 1
    
    
End Sub

Private Sub optCajasRechazadas_Click()

    objParametros.GrabarValor "frm_ABMCaja.modo", "cajas_modificadas_adm.cajarechazadas"
    objParametros.GrabarValor "Frm_ABMCaja", "Consulta"
    frm_ABMCaja.Show 1
    

End Sub

Private Sub optCambioUsuario_Click()
Dim resp As Byte

    resp = MsgBox("Esta seguro que desea cambiar de usuario", _
            vbQuestion + vbYesNo, "Cierre de Caja")
    
    If resp = vbNo Then Exit Sub
            
    Frm_Acceso.Show 1
    ReabrirCaja
    
    If objConfig.AbreCaja = "SI" Then
        Me.Caption = "Sistema de Gestión - Taxis Aeropuerto Ezeiza - (" + objUsuario.dsUsuario + ") " + " Caja Nro: " + objParametros.ObtenerValor("nrCaja")
    Else
        Me.Caption = "Sistema de Gestión - Taxis Aeropuerto Ezeiza - (" + objUsuario.dsUsuario + ") "
    End If
    
    EstablecerAccesos

End Sub

Private Sub optCargaMaestros_Click()


    
    Shell objConfig.Ruta_CargaMaestros, vbNormalFocus

    
End Sub

Private Sub optCargaManual_Click()
Dim strnrCaja               As String

    If objConfig.nrPuesto <> 9 Then
    
        ' Version 3.7: obtenemos los datos de las caja
        objCajas.obtenerCaja objParametros.ObtenerValor("nrCaja")
    
        objParametros.GrabarValor "Frm_VentaPasajes.nrPuesto", objConfig.nrPuesto
        objParametros.GrabarValor "Frm_VentaPasajes.numeracion_correlativa", "SI"
        objParametros.GrabarValor "Frm_VentaPasajes.desde", "puesto"
        objParametros.GrabarValor "FormatoHoja", "Chico"
        objParametros.GrabarValor "Frm_VentaPasajes.modo", "Facturar"
        objParametros.GrabarValor "Frm_VentaPasajes.tipofacturacion", "manual"
        ' modificado version 3.7
        objParametros.GrabarValor "Frm_VentasPasajes.vlDiaEuro", objCajas.vlDiaEuro
        objParametros.GrabarValor "Frm_VentasPasajes.vlDiaDolar", objCajas.vlDiaDolar
        objParametros.GrabarValor "Frm_VentasPasajes.vlDiaReal", objCajas.vlDiaReal
        
        objParametros.GrabarValor "Frm_VentaPasajes.nrCaja", objParametros.ObtenerValor("nrCaja")
        
                ' ADD agregado en la version 4.7
                objParametros.GrabarValor "Frm_VentaPasajes.tpComprobante", "FA"
                  
        ' Analisis de la version 4.7 <Llamada para facturacion manual>
        Frm_VentaPasajes.Show vbModal
        Exit Sub
    End If
    
    
    If objConfig.tpModo_Operacion = FACTURACION_REMOTA Then
        strnrCaja = objParametros.ObtenerValor("nrCaja")
        objParametros.GrabarValor "dsUsuario_Acceso_Supervisor", ""
    Else
        If Not objSeguridad.ObtenerPermisoSupervisor() Then Exit Sub
        strnrCaja = objCajas.ObtenerCajadeADMActiva()
    End If
    
    If strnrCaja = "" Then
        MsgBox "No se puede realizar la carga manual porque no existe una caja de adm abierta en el sistema, por favor abra una caja e intente nuevamente", vbInformation + vbDefaultButton1, "Seguridad"
        Exit Sub
    End If
    
    objParametros.GrabarValor "frm_SeleccionarPuesto.nrPuesto", ""
       
    frm_SeleccionarPuesto.Show vbModal
    
    If objParametros.ObtenerValor("frm_SeleccionarPuesto.nrPuesto") = "" Then
        objParametros.GrabarValor "dsUsuario_Acceso_Supervisor", ""
        Exit Sub
    End If
    
    ' Version 3.7: obtenemos los datos de las caja
    objCajas.obtenerCaja objParametros.ObtenerValor("nrCaja")
    
    ' Seleccionar el numero de puesto
    objParametros.GrabarValor "Frm_VentaPasajes.nrPuesto", objParametros.ObtenerValor("frm_SeleccionarPuesto.nrPuesto")
    objParametros.GrabarValor "Frm_VentaPasajes.desde", "administracion"
    objParametros.GrabarValor "nrCaja", strnrCaja
    objParametros.GrabarValor "Frm_VentaPasajes.Compensado", "NO"
    objParametros.GrabarValor "FormatoHoja", "Chico"
    objParametros.GrabarValor "Frm_VentaPasajes.modo", "Facturar"
    objParametros.GrabarValor "Frm_VentaPasajes.tipofacturacion", "manual"
    objParametros.GrabarValor "Frm_VentaPasajes.numeracion_correlativa", "NO"
    objParametros.GrabarValor "Frm_VentasPasajes.vlDiaEuro", objCajas.vlDiaEuro
    objParametros.GrabarValor "Frm_VentasPasajes.vlDiaDolar", objCajas.vlDiaDolar
    objParametros.GrabarValor "Frm_VentasPasajes.vlDiaReal", objCajas.vlDiaReal
    objParametros.GrabarValor "Frm_VentaPasajes.nrCaja", objParametros.ObtenerValor("nrCaja")
    

    ' Analisis de la version 4.7 <Llamada para facturacion manual>
    Frm_VentaPasajes.Show vbModal
    
    
    
End Sub

Private Sub optCargaTarifas_Click()
Dim objLoaderForms As Object



    On Error Resume Next
            
    ' v4.9
    objLog.Grabar_Log "optPresentacionesCAIAFIP_Click - Inicializando Servicio SGLibrary.LoaderForms"
    Set objLoaderForms = CreateObject("SGLibrary.LoaderForms")
    objLog.Grabar_Log "optPresentacionesCAIAFIP_Click - Inicializando Servicio SGLibrary.LoaderForms OK "

    If Err <> 5 Then
        MsgBox Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0

    objLog.Grabar_Log "optPresentacionesCAIAFIP_Click - Antes de  UsuarioActivo objUsuario.dsUsuario "
    objLoaderForms.UsuarioActivo CStr(objUsuario.dsUsuario)

    objLog.Grabar_Log "optPresentacionesCAIAFIP_Click- Antes de  CajaActiva objCajas.nrCaja "
    objLoaderForms.CajaActiva CStr(objCajas.nrCaja)

    objLog.Grabar_Log "Configurando el ambiente  objConfig.dsDSN " + objConfig.dsDSN
    objLoaderForms.AmbienteActivo objConfig.dsDSN
    
    objLog.Grabar_Log "optPresentacionesCAIAFIP_Click - Antes de  CajaActiva objCajas.nrCaja "
    objLoaderForms.execFormulario "ServiceTarifas"
    
    
End Sub

Private Sub optCerrarCaja_Click()
Dim resp As Byte

    If objConfig.AbreCaja = "SI" Then
        If objCajas.esCajaAbierta(objParametros.ObtenerValor("nrCaja")) Then
            objConfig.dsUsuario = objUsuario.dsUsuario
            objConfig.GuardarINI
            
            If resp = vbNo Then Exit Sub
            
            objParametros.GrabarValor "frm_ABMCaja", "CerrarCaja"
            
            Select Case objUsuario.tpAcceso
            Case "Puestos"
                '/* inicia Version 2.7 */
                ' Modificación solicitada por adrian
                objParametros.GrabarValor "frm_ABMCajaPuesto.modo", "puesto.modificacion"
                objParametros.GrabarValor "frm_ABMCajaPuesto.nrCaja", objParametros.ObtenerValor("nrCaja")
                frm_ABMCajaPuesto.Show 1
                ' objParametros.GrabarValor "frm_ABMCaja.modo", "puesto.cierre"
                ' objParametros.GrabarValor "frm_ABMCaja.nrCaja", objParametros.ObtenerValor("nrCaja")
                ' frm_ABMCaja.Show 1
                '/* fin */
            Case "Administración"
                resp = MsgBox("Confirma el cierre de la caja", _
                    vbQuestion + vbYesNo, "Cierre de Caja")
                If resp = vbNo Then Exit Sub
                ' logica agregada en la version 3.2
                If objCajas.existenCajasDesimputadas(objParametros.ObtenerValor("nrCaja")) Then
                    MsgBox "No puede realizar el cierre de la caja. " + objCajas.Error + ".", vbDefaultButton1 + vbInformation, "Atención"
                    Exit Sub
                End If
                
                ' logica incluidas en la version 3.9
                If objCajas.hayCambioenCotizacionCierredeCaja(objParametros.ObtenerValor("nrCaja")) Then
                    MsgBox "Existen cambios de cotizacion, deberá ingresar el monto de la moneda.", vbDefaultButton1 + vbInformation, "Atención"
                    objParametros.GrabarValor "frm_CambiosCotizacion.accion", "cierredecaja"
                    frm_CambiosCotizacion.Show 1
                End If
            
                frm_ABMCajaADM.Show 1
                
                If objParametros.ObtenerValor("Cancela") = "NO" Then
                    objParametros.GrabarValorBD "COBRO_COMISION_CD_RE_OBLIGATORIA", "S"
                    objParametros.GrabarValorBD "CTROL_CANT_VIAJES", "S"
                End If
            Case Else
                MsgBox "Este perfil no puede realizar cierre de cajas", vbCritical, "Seguridad"
                Exit Sub
            End Select
            
            If Not objParametros.ObtenerValor("Cancela") = "SI" Then
                objConfig.dsUsuario = objUsuario.dsUsuario
                objConfig.GuardarINI
                objParametros.GrabarValor "CajaAbierta", "NO"
        
                resp = MsgBox("Desea cambiar de usuario", _
                        vbQuestion + vbYesNo, "Cambio de Usuario")
                
                If resp = vbYes Then
                    Frm_Acceso.Show 1
                    Me.Caption = "Sistema de Gestión - Taxis Aeropuerto Ezeiza - (" + objUsuario.dsUsuario + ") " + " Caja Nro: " + objParametros.ObtenerValor("nrCaja")
                    EstablecerAccesos
                End If
                ReabrirCaja
                Me.Caption = "Sistema de Gestión - Taxis Aeropuerto Ezeiza - (" + objUsuario.dsUsuario + ") " + " Caja Nro: " + objParametros.ObtenerValor("nrCaja")
            End If
            
        End If
    End If
    
End Sub


Private Sub ReabrirCaja()
    Dim lnrCaja As String

    
         
    Select Case objUsuario.tpAcceso
    Case "Puestos", "Administración"
        objConfig.AbreCaja = "SI"
        If Not objConfig.ObtenerValoresEuroyDolaryPromoyComisionRetorno Then
            MsgBox "Los valores de Dolar y Euro no estan bien, en programa no prodrá iniciar", vbCritical + vbDefaultButton1, "Atención"
            End
        End If
        lnrCaja = objCajas.ObtenerCajaAbiertadelUsuario(objParametros.ObtenerValor("dsUsuario"))
        
        objParametros.GrabarValor "dsObservacion", ""
        If lnrCaja = "" Then
            ' Si esta en blanco
            objParametros.GrabarValor "frm_ABMCaja", "Alta"
            Select Case objUsuario.tpAcceso
            Case "Puestos"
                frm_ABMCaja.Show 1
            Case "Administración"
                frm_ABMCajaADM.Show 1
            End Select
                
            If objParametros.ObtenerValor("CajaAbierta") = "NO" Then
                End
            Else
                ' objConfig.nrUltimaCaja = objParametros.ObtenerValor("nrCaja")
                objConfig.GuardarINI
            End If
        Else
            ' tiene un numero de caja
            MsgBox "El sistema esta reabrindo una caja que usted dejó abierta.", vbInformation, "Atención"
            objParametros.GrabarValor "nrCaja", lnrCaja
            objParametros.GrabarValor "frm_ABMCaja", "CajaSinCerrar"
            Select Case objUsuario.tpAcceso
            Case "Puestos"
                ' Pedido por adrian, que no muestre el detalle de la caja
                ' frm_ABMCaja.Show 1
            Case "Administración"
                frm_ABMCajaADM.Show 1
            End Select
            If objParametros.ObtenerValor("CajaAbierta") = "NO" Then
                End
            End If
            objConfig.GuardarINI
        End If
    Case Else
        objConfig.AbreCaja = "NO"
        If Not objConfig.ObtenerValoresEuroyDolaryPromoyComisionRetorno Then
            MsgBox "Los valores de Dolar y Euro no estan bien," + vbCrLf + _
            " por favor vaya a la pantalla de parámetros para arreglar estos valores.", vbCritical + vbDefaultButton1, "Atención"
        End If
    End Select

End Sub


Private Sub optComisiones_Click()

    Frm_ABMComisiones.Show 1
    
End Sub

Private Sub optComprobantes_Click()

    objParametros.GrabarValor "frm_ReimpComprobantes.modo", "Consulta"
    objParametros.GrabarValor "FormatoHoja", "Chico"
    Frm_ReimpComprobantes.Show 1
    
End Sub


Private Sub optComprobantesHojaA4_Click()

    objParametros.GrabarValor "frm_ReimpComprobantes.modo", "Consulta"
    objParametros.GrabarValor "FormatoHoja", "Grande"
    Frm_ReimpComprobantes.Show 1
    
    
End Sub

Private Sub optConceptos_Click()

    Frm_ABMConceptos.Show 1
    
    
End Sub


' -- Agregado en la version 4.9
Private Sub optConciliarViajes_Click()
Dim objLoaderForms As Object

    If Not objCajas.ObtenerCajadeADMAbierta() Then
        MsgBox "Para acceder a esta opción debe existir una caja de la adm abierta", vbInformation, "Atención"
        Exit Sub
    End If
    

    On Error Resume Next
            
    ' v4.9
    objLog.Grabar_Log "Inicializando Servicio SGLibrary.LoaderForms"
    Set objLoaderForms = CreateObject("SGLibrary.LoaderForms")
    objLog.Grabar_Log "Inicializando Servicio SGLibrary.LoaderForms OK "

    If Err <> 5 Then
        MsgBox Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0

    objLog.Grabar_Log "Antes de  UsuarioActivo objUsuario.dsUsuario "
    objLoaderForms.UsuarioActivo CStr(objUsuario.dsUsuario)

    objLog.Grabar_Log "Antes de  CajaActiva objCajas.nrCaja "
    objLoaderForms.CajaActiva CStr(objCajas.nrCaja)

    objLog.Grabar_Log "Antes de  AmbienteActivo objConfig.dsDSN "
    ' Comentado para implmentacion Camila Configuracion de tamanios
    objLoaderForms.AmbienteActivo CStr(objConfig.dsDSN)

    objLoaderForms.execFormulario "FrmConciliaciones"
            


End Sub

Private Sub optEliminarComprobantesMalCargados_Click()
Dim strnrCaja               As String


    If objConfig.tpModo_Operacion = FACTURACION_REMOTA Then
        strnrCaja = objParametros.ObtenerValor("nrCaja")
    Else
        If Not objSeguridad.ObtenerPermisoSupervisor() Then Exit Sub
        strnrCaja = objCajas.ObtenerCajadeADMActiva()
    End If

    If strnrCaja = "" Then
        MsgBox "No se puede realizar la carga manual porque no existe una caja de adm abierta en el sistema, por favor abra una caja e intente nuevamente", vbInformation + vbDefaultButton1, "Seguridad"
        Exit Sub
    End If
    
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.nrCierre", ""
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.nrCaja", strnrCaja
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.modo", "Consulta"
    Frm_ElimModifAnularComprobantes.Show 1
     
     
End Sub

Private Sub optFactrurarCtaCte_Click()

    frm_CobroCtaCte.Show 1
    
End Sub

Private Sub optFacturacionMensual_Click()

    Frm_SalidaEstudioContable.Show 1
    
End Sub


Private Sub optFacturarCtaCte_Click()

    If App.LogMode = MODO_DEBUG Then
       frm_CobroCtaCte.Show 1
       ' frm_CobroCtaCte_v2.Show 1
    Else
      frm_CobroCtaCte.Show 1
    End If
  
    
End Sub

Private Sub optGuiaFilcar_Click()

    Dim strUbicacion As String
    strUbicacion = Trim(ObtenerDatoDelRegistrodeWindows("GFD", "Ubicacion"))
    If strUbicacion = "" Then
        MsgBox "No tiene instalada la Guía Filcar Digital." & vbCrLf & "Debe instalarla para poder acceder a todas las calles de Capital y GBA.", vbInformation, "Atención"
    Else
        Shell strUbicacion & "\Filcar.exe", vbMaximizedFocus
    End If
    
End Sub

Private Sub optiposComprobantes_Click()

    Frm_ABMTiposdeComprobantes.Show 1
    
End Sub

Private Sub optIVAVentas_Click()

    Frm_IVAVentas.Show 1
    
End Sub

Private Sub optLicenciatarios_Click()


    objCajas.ObtenerSaldosdeInicioyValores objParametros.ObtenerValor("nrCaja")
    objParametros.GrabarValor "frm_PagoLicenciatario.vlDiaReal", objCajas.vlDiaReal
    
    frm_PagoLicenciatario.Show 1
    
End Sub

Private Sub optModifComprobante_Click()

    ' If Not objSeguridad.ObtenerPermisoSupervisor() Then Exit Sub
    
    frm_ModifComprobante.Show 1
    
End Sub

Private Sub optMovimientosContables_Click()

    Frm_MovimientosContables.Show 1
    
End Sub

Private Sub optNivelesdeAcceso_Click()

    Frm_ABMNivelAcceso.Show 1
    

End Sub

Private Sub optNotasCredito_Click()

    ' Agregado en la version 4.9.71
    If Not objCajas.ObtenerCajadeADMAbierta() Then
        MsgBox "Para acceder a esta opción debe existir una caja de la adm abierta", vbInformation, "Atención"
        Exit Sub
    End If


  objParametros.GrabarValor "nrCaja", objCajas.nrCaja

  ' Version 3.7: obtenemos los datos de las caja
  objCajas.obtenerCaja objParametros.ObtenerValor("nrCaja")

  objParametros.GrabarValor "Frm_VentasPasajes.vlDiaEuro", objCajas.vlDiaEuro
  objParametros.GrabarValor "Frm_VentasPasajes.vlDiaDolar", objCajas.vlDiaDolar
  objParametros.GrabarValor "Frm_VentasPasajes.vlDiaReal", objCajas.vlDiaReal
    
  objParametros.GrabarValor "Frm_VentaPasajes.numeracion_correlativa", "SI"
  objParametros.GrabarValor "Frm_VentaPasajes.desde", "puesto"
  objParametros.GrabarValor "Frm_VentaPasajes.nrPuesto", objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND")
  objParametros.GrabarValor "Frm_VentaPasajes.nrCaja", objParametros.ObtenerValor("nrCaja")
  objParametros.GrabarValor "Frm_VentaPasajes.tipofacturacion", "automatica"
  objParametros.GrabarValor "Frm_VentaPasajes.modo", "Facturar"
  ' ADD agregado en la version 4.7
  objParametros.GrabarValor "Frm_VentaPasajes.tpComprobante", "NC"
  objParametros.GrabarValor "Frm_VentaPasajes.TituloPrincipal", "Notas de Crédito"
  
  objParametros.GrabarValor "FormatoHoja", "Chico"
  
  ' analisis version 4.7
  Frm_VentaPasajes.Show 1
End Sub

Private Sub optNotasDebito_Click()


    ' Agregado en la version 4.9.71
    If Not objCajas.ObtenerCajadeADMAbierta() Then
        MsgBox "Para acceder a esta opción debe existir una caja de la adm abierta", vbInformation, "Atención"
        Exit Sub
    End If


  objParametros.GrabarValor "nrCaja", objCajas.nrCaja

  ' Version 3.7: obtenemos los datos de las caja
  objCajas.obtenerCaja objParametros.ObtenerValor("nrCaja")

  objParametros.GrabarValor "Frm_VentasPasajes.vlDiaEuro", objCajas.vlDiaEuro
  objParametros.GrabarValor "Frm_VentasPasajes.vlDiaDolar", objCajas.vlDiaDolar
  objParametros.GrabarValor "Frm_VentasPasajes.vlDiaReal", objCajas.vlDiaReal
    
  objParametros.GrabarValor "Frm_VentaPasajes.numeracion_correlativa", "SI"
  objParametros.GrabarValor "Frm_VentaPasajes.desde", "puesto"
  objParametros.GrabarValor "Frm_VentaPasajes.nrPuesto", objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND")
  objParametros.GrabarValor "Frm_VentaPasajes.nrCaja", objParametros.ObtenerValor("nrCaja")
  objParametros.GrabarValor "Frm_VentaPasajes.tipofacturacion", "automatica"
  objParametros.GrabarValor "Frm_VentaPasajes.modo", "Facturar"
  ' ADD agregado en la version 4.7
  objParametros.GrabarValor "Frm_VentaPasajes.tpComprobante", "ND"
  objParametros.GrabarValor "Frm_VentaPasajes.TituloPrincipal", "Notas de Débito"
  
  objParametros.GrabarValor "FormatoHoja", "Chico"
  
  ' analisis version 4.7
  Frm_VentaPasajes.Show 1
  
End Sub

Private Sub optObligaciones_Click()
Dim objServiceConciliacion As Object

    If Not objCajas.ObtenerCajadeADMAbierta() Then
        MsgBox "Para acceder a esta opción debe existir una caja de la adm abierta", vbInformation, "Atención"
        Exit Sub
    End If

    On Error Resume Next
            
    ' v4.9
    objLog.Grabar_Log "Inicializando Servicio SGLibrary.LoaderForms"
    Set objServiceConciliacion = CreateObject("SGLibrary.LoaderForms")
    objLog.Grabar_Log "Inicializando Servicio SGLibrary.LoaderForms OK "

    If Err <> 5 Then
        MsgBox Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0

    objLog.Grabar_Log "Antes de  UsuarioActivo objUsuario.dsUsuario " + objUsuario.dsUsuario
    objServiceConciliacion.UsuarioActivo CStr(objUsuario.dsUsuario)

    objLog.Grabar_Log "Antes de  CajaActiva objCajas.nrCaja " + CStr(objCajas.nrCaja)
    objServiceConciliacion.CajaActiva CStr(objCajas.nrCaja)
    
    objLog.Grabar_Log "Configurando el ambiente  objConfig.dsDSN " + objConfig.dsDSN
    objServiceConciliacion.AmbienteActivo objConfig.dsDSN

    objLog.Grabar_Log "Antes de  CajaActiva objCajas.nrCaja "
    objServiceConciliacion.execFormulario "FrmObligaciones"
            
            
End Sub

Private Sub optPagosdelaCajaActual_Click()

    Frm_ResumenLicenciatarioCajaADM.Show 1
    
End Sub

Private Sub optPrueba_Click()

    ' objbasededatos.SP_CalculaSaldoInicial

End Sub


Private Sub optParametros_Click()

    On Error Resume Next
    Frm_ABMParametros.Show 1
    On Error GoTo 0
End Sub

Private Sub optPresentacionesCAIAFIP_Click()


Dim objServicePresentacionCAIs As Object


    

    On Error Resume Next
            
    ' v4.9
    objLog.Grabar_Log "optPresentacionesCAIAFIP_Click - Inicializando Servicio SGLibrary.LoaderForms"
    Set objServicePresentacionCAIs = CreateObject("SGLibrary.LoaderForms")
    objLog.Grabar_Log "optPresentacionesCAIAFIP_Click - Inicializando Servicio SGLibrary.LoaderForms OK "

    If Err <> 5 Then
        MsgBox Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0

    objLog.Grabar_Log "optPresentacionesCAIAFIP_Click - Antes de  UsuarioActivo objUsuario.dsUsuario "
    objServicePresentacionCAIs.UsuarioActivo CStr(objUsuario.dsUsuario)

    objLog.Grabar_Log "optPresentacionesCAIAFIP_Click- Antes de  CajaActiva objCajas.nrCaja "
    objServicePresentacionCAIs.CajaActiva CStr(objCajas.nrCaja)

    objLog.Grabar_Log "optPresentacionesCAIAFIP_Click - Antes de  CajaActiva objCajas.nrCaja "
    objServicePresentacionCAIs.execFormulario "FrmPresentacionesCAI"
    
End Sub

Private Sub optPuestos_Click()
 
    Frm_ABMPuestos.Show 1
 
End Sub

Private Sub optRealizarTraspaso_Click()


    Frm_TraspasodeCaja.Show 1

    
    If objConfig.AbreCaja = "SI" Then
        Me.Caption = "Sistema de Gestión - Taxis Aeropuerto Ezeiza - (" + objUsuario.dsUsuario + ") " + " Caja Nro: " + objParametros.ObtenerValor("nrCaja")
    Else
        Me.Caption = "Sistema de Gestión - Taxis Aeropuerto Ezeiza - (" + objUsuario.dsUsuario + ") "
    End If
    

    EstablecerAccesos
    
    
End Sub

Private Sub optRegistracionCajaPuestoCajaADM_Click()

    objParametros.GrabarValor "Frm_ResumenAsientoCP.modo", "registracion_asiento"
    objParametros.GrabarValor "Frm_ResumenAsientoCP", "Consulta"
    Frm_ResumenAsientoCP.Show vbModal

End Sub

Private Sub optReimpresionRecibos_Click()

    Frm_ReimpRecibos.Show 1
    
End Sub

Private Sub optResumenCajadelosLicenciatarios_Click()

    Frm_ResumenMovimientosContablesCajaLicenciatarios.Show 1

End Sub

Private Sub optResumenes_Click()

    frm_ResumenLicenciatario.Show 1
    
End Sub


Private Sub optResumenesClientes_Click()

    Frm_ResumenCliente.Show 1
    
End Sub

Private Sub optResumenesRecaudaciones_Click()

    Frm_Recaudaciones.Show vbModal
    
End Sub

Private Sub optReversionCajaPuestoCajaADM_Click()


    objParametros.GrabarValor "Frm_ResumenAsientoCP.modo", "reversion_asiento"
    objParametros.GrabarValor "Frm_ResumenAsientoCP", "Consulta"
    
    Frm_ResumenAsientoCP.Show vbModal


End Sub

Private Sub optSalidasAFIP_Click()

    frm_SalidasAFIP.Show 1
    
End Sub

Private Sub optTalonarios_Click()

    Frm_ABMTalonarios.Show 1
    
End Sub

Private Sub optTalonariosPuestos_Click()

    Frm_ABMPuestosTalonarios.Show 1
    
    
End Sub



Private Sub optTraspasoCajaAuditorias_Click()

    
    If objUsuario.tpAcceso = "Puestos" Then
        objParametros.GrabarValor "Frm_ABMAuditorias.modo", "VistaCajaPuesto"
    Else
         objParametros.GrabarValor "Frm_ABMAuditorias.modo", "VistaCajaADM"
    End If
        
    Frm_ABMAuditorias.Show 1
    
End Sub

Private Sub optVentadeViajesFacturaA4_Click()
    
    objParametros.GrabarValor "Frm_VentaPasajes.modo", "Facturar"
    objParametros.GrabarValor "FormatoHoja", "Grande"
     ' Analisis de la version 4.7 <Venta de Viajes Manual>
    Frm_VentaPasajes.Show 1
    
End Sub


Private Function RecorrerBloquearTodosMenues() As Control
Dim Control As Object

    For Each Control In Me.Controls
        If Not Control.Name = "raya" Then
            On Error Resume Next
            Control.Enabled = False
            On Error GoTo 0
        End If
    Next
    
End Function

Private Function DesbloquearBloquearMenu(pnmMenu As String, pAccion As Boolean, Optional pIndex As String) As Boolean
Dim Control As Object

    For Each Control In Me.Controls
        If StrComp(Control.Name, pnmMenu, vbTextCompare) = 0 Then
            If pIndex = "" Then
                Control.Enabled = pAccion
                DesbloquearBloquearMenu = True
                Exit Function
            Else
                If pIndex = Control.Index Then
                    Control.Enabled = pAccion
                    DesbloquearBloquearMenu = True
                Exit Function
                End If
            End If
        End If
    Next

    
End Function

Private Function RecorrerEsconderTodosMenues() As Control
Dim Control As Object

    DesbloquearBloquearMenu "mnAdministracion", False
    DesbloquearBloquearMenu "mnMaestros", False
    DesbloquearBloquearMenu "mnVentas", False
    DesbloquearBloquearMenu "mnEstudioContable", False

    For Each Control In Me.Controls
        If Not Control.Name = "raya" Then
            On Error Resume Next
            Control.Visible = False
            On Error GoTo 0
        End If
    Next
    
End Function







