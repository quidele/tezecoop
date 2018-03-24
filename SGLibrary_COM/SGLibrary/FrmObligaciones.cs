using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ControlesdeUsuario;
using System.Reflection;
using System.Diagnostics;
using SGLibrary.Extensiones;
using SGLibrary.Services;
using SGLibrary.GUIUtilities;
using System.Globalization;
using Microsoft.VisualBasic;


namespace SGLibrary
{
    public partial class FrmObligaciones : Form
    {


        public ServiceModelGenerico<Obligaciones> serviceModel { get; set; }
        public List<TB_ProveedoresExt> Titulares { get; set; }
        public IEnumerable<TB_ObligacionesCuotasExt> Lista_Vencimientos { get; set; }
        

        public FrmObligaciones()
        {
            InitializeComponent();
        }

        private void FrmABMBase_Load(object sender, EventArgs e)
        {

            botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
            this.panelcarga.Visible = false;
            this.panelbusqueda.Visible = true;
            this.fechadesde.Value = DateTime.Now.AddDays(-30).Date;
            this.fechahasta.Value = DateTime.Now.Date;

            var lista = this.serviceModel.obtenerUsuarios();
            if (lista.Count() > 0)
            {
                cargarCombo(this.cbUsuariosConciliaciones, this.serviceModel.obtenerUsuarios());
                this.cbUsuariosConciliaciones.SelectedIndex = 0;
            }

            
            this.statusbar_bd.Text = "Base de datos: " + serviceModel.Basededatos;
            this.statusbar_servidor.Text = "Base de datos: " + serviceModel.Servidor;
            this.statusbar_usuario.Text = "Usuario: " + serviceModel.Usuario;
            this.statusbar_version.Text = "Versión: " + typeof(SGLibrary.ServiceModel).Assembly.GetName().Version.ToString();
            this.Titulares = new List<TB_ProveedoresExt>();

            this.botonesForm1.InicializarFindBoton();


        }


        private void HabilitarDeshabilitarCampos(Boolean pEdicion){
            this.txtCoddoc.Enabled = (!pEdicion) ; 
            this.txtNroDoc.Enabled =  (!pEdicion); 
            this.txtCuotas.Enabled = (!pEdicion);  
            this.cbPeriodo.Enabled = (!pEdicion); 
            this.txtDescripcion.Enabled =  (!pEdicion);
            this.txtComMov.Enabled = (!pEdicion);
            this.cbFecdoc.Enabled = (!pEdicion);
            this.dtpFecValor.Enabled = (!pEdicion);
            this.txtMonto.Enabled = (!pEdicion);
            this.cbTipoArchivo.Enabled = (!pEdicion);

            
            this.agregarLicenciaToolStripMenuItem.Enabled = true;
            this.eliminarTitularToolStripMenuItem.Enabled = true;
            this.agregarTodosToolStripMenuItem.Enabled = (!pEdicion);
            this.eliminarTodosToolStripMenuItem.Enabled = (!pEdicion);
            this.titularesConGPSToolStripMenuItem.Enabled = (!pEdicion);


        }

        private void botonesForm1_ClickEventDelegateHandler(object sender, EventArgs e)
        {
            ToolStripItem miboton = (ToolStripItem)sender;
            //MessageBox.Show("tocaste un boton, boton " + miboton.Name + " TAB " + miboton.Tag); 



            switch (miboton.Tag.ToString())
            {
                case "EDIT":
                    {
                        // deberia llegar inyectado
                        Obligaciones una_Obligacion = new Obligaciones();
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        if (this.ADGVBusqueda.SelectedRows.Count == 0) return;
                        foreach (DataGridViewRow row in this.ADGVBusqueda.SelectedRows)
                        {
                            // INSERTE SU CODIGO
                            una_Obligacion = serviceModel.ObtenerRegistroxId(row.Cells["nro_trans"].Value.ToString());
                            break;
                        }

                        this.txtNroTrans.Text = una_Obligacion.TB_transCab.nro_trans.ToString(); 
                        this.txtCoddoc.Text = una_Obligacion.TB_transCab.cod_doc;
                        this.txtNroDoc.Text = una_Obligacion.TB_transCab.nro_doc.ToString();
                        this.txtCuotas.Text = una_Obligacion.TB_transCab.cuotas.ToString();
                        this.cbPeriodo.Text = una_Obligacion.TB_transCab.periodo.Trim();
                        this.txtDescripcion.Text = una_Obligacion.TB_transCab.descripcion;
                        this.txtComMov.Text = una_Obligacion.TB_transCab.com_mov;
                        this.cbFecdoc.Value = una_Obligacion.TB_transCab.fec_doc;
                        this.dtpFecValor.Value = una_Obligacion.TB_transCab.fec_valor;
                        this.txtMonto.Text = una_Obligacion.TB_transCab.imp_tot_ing.ToString();
                        HabilitarDeshabilitarCampos(true);
                        this.modoEdicion.Text = "SI";

                        this.Titulares = una_Obligacion.TB_ObligacionesTitulares.Select(c => new TB_ProveedoresExt(c.cod_tit, c.nrLicencia, c.nmNombre, c.nmApellido)).ToList<TB_ProveedoresExt>();
                        this.Lista_Vencimientos = una_Obligacion.TB_ObligacionesCuotas.Select(c => new TB_ObligacionesCuotasExt(c.nro_trans, c.cod_tit, c.nro_cuota, c.fecha_vencimiento.Value, c.importe.Value, c.nrLicencia, c.comentarios));

                        CargarGrillasTitularesCuotas(true);
                        /*
                            una_TB_transCab.cod_doc =    this.txtCoddoc.Text;
                            una_TB_transCab.nro_doc = int.Parse(this.txtNroDoc.Text);
                            una_TB_transCab.linea = 1;
                            una_TB_transCab.nro_trans = un_ServiceNumeradores.ObtenerValor("nro_trans");
                            una_TB_transCab.descripcion = this.txtDescripcion.Text;
                            una_TB_transCab.com_mov = this.txtComMov.Text; 
                            una_TB_transCab.usuario_mod = this.serviceModel.usuario_mod;
                            una_TB_transCab.cod_tit = 0;
                            una_TB_transCab.formulario = this.Name;
                            una_TB_transCab.bloque = "cabecera";
                            una_TB_transCab.seccion = "General";
                            una_TB_transCab.fec_doc = this.cbFecdoc.Value.Date;
                            una_TB_transCab.fec_valor = this.dtpFecValor.Value.Date; // fecha de inicio 
                            una_TB_transCab.terminal_mod = "PC01";
                            una_TB_transCab.serie_doc = 0;
                            una_TB_transCab.letra_doc = "O";
                            una_TB_transCab.cod_emp = ServiceParametros.ObtenerParametroBD("empresa");
                            una_Obligacion.TB_transCab = una_TB_transCab;
                            una_TB_transCab.fecha_mod = DateTime.Now;
                            this.serviceModel.CompletarAuditoria(una_Obligacion, una_TB_transCab.seccion,
                                                una_TB_transCab.bloque, "A", "Nuevo"); 
                        */
                        // Debemos completar la grillas   Titulares y  Lista_Vencimientos

                        //botonesForm1.configMododeEdicion(ABMBotonesForm.VIEW);
                        botonesForm1.configMododeEdicion(ABMBotonesForm.EDIT);
                        break;
                    }
                case "ADD":
                    {
                        this.modoEdicion.Text = "NO";
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        // INSERTE SU CODIGO
                        // Recuperar el documento OBAP con el numerador correspondiente  -- // deberia llegar inyectado Ioc
                        ServiceNumeradores un_ServiceNumeradores = new ServiceNumeradores(new dbSG2000Entities ());
                        this.txtCoddoc.Text =  "OBAP";
                        this.txtSerieDoc.Text = "0";                                        // deberia llegar inyectado Ioc
                        var txtnumerador = this.txtCoddoc.Text + this.txtSerieDoc.Text + (new ServiceParametros()).ObtenerParametro("empresa");
                        this.txtNroDoc.Text = un_ServiceNumeradores.ObtenerValor(txtnumerador).ToString();
                        this.cbFecdoc.Value = DateTime.Now.Date;
                        this.dtpFecValor.Value = DateTime.Now.Date;
                        HabilitarDeshabilitarCampos(false);
                        this.txtDescripcion.Text = "";
                        this.txtCuotas.Text = "";
                        this.txtMonto.Text = "";
                        this.cbPeriodo.SelectedIndex = -1;
                        this.ADGV_Titulares.Columns.Clear();
                        this.ADGV_TitularesCuotas.Columns.Clear();
                        botonesForm1.configMododeEdicion(ABMBotonesForm.ADD);
                        break;
                    }
                case "FIND":
                    {
                        this.modoEdicion.Text = "NO";
                        //serviceConciliaciones.obtenerUsuariosConciliaciones();
                        IEnumerable<Obligaciones> listadeRegistros = serviceModel.ObtenerRegistros(this.fechadesde.Value, this.fechahasta.Value, this.cbUsuariosConciliaciones.Text);
                        var listaRegistrosTrans_Cab =  listadeRegistros.Select(c => c.TB_transCab).ToList<TB_transCab>();

                        Dictionary<string, ADGVFieldAdapter> lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
                        //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
                        lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", false, false));
                        lista_campo_tipo.Add("nro_trans", new ADGVFieldAdapter("nro_trans", "NRO.TRANS", "nro_trans", "System.Decimal", false, false));
                        lista_campo_tipo.Add("nro_doc", new ADGVFieldAdapter("nro_doc", "NRO.DOC", "nro_doc", "System.Int32", true, true));
                        lista_campo_tipo.Add("descripcion", new ADGVFieldAdapter("descripcion", "DESCRIPCION", "descripcion", "System.String", true, true));
                        lista_campo_tipo.Add("fec_doc", new ADGVFieldAdapter("fec_doc", "FECHA", "fec_doc", "System.DateTime", true, true));
                        lista_campo_tipo.Add("usuario_mod", new ADGVFieldAdapter("usuario_mod", "USUARIO", "usuario_mod", "System.String", true, true));
                        lista_campo_tipo.Add("estado_registro", new ADGVFieldAdapter("estado_registro", "ESTADO", "estado_registro", "System.String", true, true));


                        cargarDataGridView_ADGV(this.ADGVBusqueda, listaRegistrosTrans_Cab, this.dataSet1, this.bindingSource1, lista_campo_tipo);

                        // this.cargarDataGridViewBusqueda_ADGV(ADGVBusqueda, listaRegistrosTrans_Cab, "NO", this.dataSet1, this.bindingSource1);
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        ActualizarCantidadRegistros(listadeRegistros.Count());
                        botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        break;

                    }

                case "OK":
                    {
                        if (this.modoEdicion.Text == "NO")
                        {
                            // Realizar validaciones 
                            if (!(validarIngresodeDatosCabecera())) return;
                            if (!(validarIngresodeGrilla())) return;
                            if (!altaRegistro()) return;
                        }
                        else
                        {
                            if (!(validarIngresodeDatosCabecera())) return;
                            if (!(validarIngresodeGrilla())) return;
                            if (!ediciondeRegistro()) return;
                        }

                        //cargarCombo(this.cbUsuariosConciliaciones, serviceConciliaciones.obtenerUsuariosConciliaciones());
                        this.modoEdicion.Text = "NO";
                        var btnFind = new ToolStripButton();
                        btnFind.Tag = "FIND";
                        MessageBox.Show("La operación se ha realizado con éxito.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        botonesForm1_ClickEventDelegateHandler(btnFind, null);
                        break;
                    }
                case "CANCEL":
                    {
                        this.modoEdicion.Text = "NO";
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.CANCEL);
                        var btnFind = new ToolStripButton();
                        btnFind.Tag = "FIND";
                        botonesForm1_ClickEventDelegateHandler(btnFind, null);
                        break;
                    }

                case "DELETE":
                    {
                        this.modoEdicion.Text = "NO";
                        foreach (DataGridViewRow row in ADGVBusqueda.SelectedRows)
                        {
                            Obligaciones unRegistro = serviceModel.ObtenerRegistroxId(row.Cells["nro_trans"].Value.ToString());
                            DialogResult dialogResult = MessageBox.Show("Confirma la eliminación del registro ", "Atención", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                            if (dialogResult == DialogResult.No) break;
                            // COMPLETAR ELIMINACION
                            try
                            {
                                serviceModel.AnularRegistro(unRegistro);
                            }
                            catch (ServiceObligacionesException ex)
                            {
                                var ObligacionesCompensados = "";
                                foreach (var item in ex.ListaCuponesCompensados)
	                            {
                                    ObligacionesCompensados = ObligacionesCompensados + " -  Licencia: " + item.nrLicencia.ToString() + " Nro Cupón Compensación " + item.nrCupon.ToString() + "\n"; 
	                            }
                                if (ObligacionesCompensados !="") {
                                    MessageBox.Show("Error: existen obligaciones compensadas\n" + ObligacionesCompensados, "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                    return;
                                }
                                MessageBox.Show("Error: " + ex.Message , "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);

                                return; 
                            }
                            MessageBox.Show("La operación se ha realizado con éxito.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                        var btnFind = new ToolStripButton();
                        btnFind.Tag = "FIND";
                        botonesForm1_ClickEventDelegateHandler(btnFind, null);
                        break;
                    }
                case "EXIT":
                    {
                        this.Close();
                        break;
                    }
            }

        }

        private bool validarIngresodeGrilla()
        {
            if (this.ADGV_Titulares.RowCount==0) 
            {
                MessageBox.Show(string.Format("Debe agregar el/los titulares.", this.txtMonto.Text), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.ADGV_Titulares.Focus();
                return false;
            }
            if (this.ADGV_TitularesCuotas.RowCount == 0)
            {
                MessageBox.Show("Debe ingresar los vencimientos.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.ADGV_Titulares.Focus();
                return false;
            } 
            return true;
        }


        private void ActualizarCantidadRegistros(int registros)
        {
            this.lblDgvBusquedaRegistros.Text = registros.ToString() + " - Registros";
        }

        public Boolean altaRegistro()
        {
            try
            {
                Obligaciones una_Obligacion = new Obligaciones();
                // En realidad ServiceNumeradores deberia llegar inyectado
                ServiceNumeradores un_ServiceNumeradores = new ServiceNumeradores(new dbSG2000Entities());
                TB_transCab una_TB_transCab =  new TB_transCab (); 
                una_TB_transCab.cod_doc =    this.txtCoddoc.Text;
                una_TB_transCab.nro_doc = int.Parse(this.txtNroDoc.Text);
                una_TB_transCab.linea = 1;
                una_TB_transCab.nro_trans = un_ServiceNumeradores.ObtenerValor("nro_trans");
                una_TB_transCab.descripcion = this.txtDescripcion.Text;
                una_TB_transCab.com_mov = this.txtComMov.Text; 
                una_TB_transCab.usuario_mod = this.serviceModel.usuario_mod;
                una_TB_transCab.cod_tit = 0;
                una_TB_transCab.formulario = this.Name;
                una_TB_transCab.bloque = "cabecera";
                una_TB_transCab.seccion = "General";
                una_TB_transCab.fec_doc = this.cbFecdoc.Value.Date;
                una_TB_transCab.fec_valor = this.dtpFecValor.Value.Date; // fecha de inicio 
                una_TB_transCab.terminal_mod = "PC01";
                una_TB_transCab.serie_doc = 0;
                una_TB_transCab.letra_doc = "O";
                una_TB_transCab.cod_emp = ServiceParametros.ObtenerParametroBD("empresa");
                una_Obligacion.TB_transCab = una_TB_transCab;
                una_TB_transCab.fecha_mod = DateTime.Now;
                una_TB_transCab.cuotas =  short.Parse(this.txtCuotas.Text);
                una_TB_transCab.periodo = this.cbPeriodo.Text ;
                una_TB_transCab.imp_tot_ing =  decimal.Parse( this.txtMonto.Text) ;
         
                this.serviceModel.CompletarAuditoria(una_Obligacion, una_TB_transCab.seccion,
                                                   una_TB_transCab.bloque, "A", "Nuevo");

                List<TB_ObligacionesTitulares> una_Lista_TB_ObligacionesTitulares = new List<TB_ObligacionesTitulares>();
                foreach (TB_ProveedoresExt item in this.Titulares )
                {
                    una_Lista_TB_ObligacionesTitulares.Add(item.ToTB_ObligacionesTitulares(una_TB_transCab.nro_trans)); 
                }
                una_Obligacion.TB_ObligacionesTitulares = una_Lista_TB_ObligacionesTitulares;


                List<TB_ObligacionesCuotas> una_Lista_TB_ObligacionesCuotas = new List<TB_ObligacionesCuotas>();
                foreach (TB_ObligacionesCuotasExt item in Lista_Vencimientos)
                {
                    una_Lista_TB_ObligacionesCuotas.Add ( item.ToTB_ObligacionesCuotas(una_TB_transCab.nro_trans));
                }
                una_Obligacion.TB_ObligacionesCuotas = una_Lista_TB_ObligacionesCuotas; 

                // Deberia emitar excepciones para determinar el comportamiento de la grabacion
                this.serviceModel.AgregarRegistro(una_Obligacion);
            }
            catch (ServiceObligacionesException ex)
            {
                MessageBox.Show(ex.Message , "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }


        public Boolean ediciondeRegistro()
        {

            try
            {
                Obligaciones una_Obligacion = new Obligaciones();
                ServiceNumeradores un_ServiceNumeradores = new ServiceNumeradores(new dbSG2000Entities());
                TB_transCab una_TB_transCab = new TB_transCab();
                una_TB_transCab.cod_doc = this.txtCoddoc.Text;
                una_TB_transCab.nro_doc = int.Parse(this.txtNroDoc.Text);
                una_TB_transCab.linea = 1;
                una_TB_transCab.nro_trans = int.Parse (this.txtNroTrans.Text);
                una_TB_transCab.descripcion = this.txtDescripcion.Text;
                una_TB_transCab.com_mov = this.txtComMov.Text;
                una_TB_transCab.usuario_mod = this.serviceModel.usuario_mod; // este podriar ser distinto a de alta
                una_TB_transCab.cod_tit = 0;
                una_TB_transCab.formulario = this.Name;
                una_TB_transCab.bloque = "cabecera";
                una_TB_transCab.seccion = "General";
                una_TB_transCab.fec_doc = this.cbFecdoc.Value.Date;
                una_TB_transCab.fec_valor = this.dtpFecValor.Value.Date; // fecha de inicio 
                una_TB_transCab.terminal_mod = "PC01";
                una_TB_transCab.serie_doc = 0;
                una_TB_transCab.letra_doc = "O";
                una_TB_transCab.cod_emp = ServiceParametros.ObtenerParametroBD("empresa");
                una_Obligacion.TB_transCab = una_TB_transCab;
                una_TB_transCab.fecha_mod = DateTime.Now;
                una_TB_transCab.cuotas = short.Parse(this.txtCuotas.Text);
                una_TB_transCab.periodo = this.cbPeriodo.Text;
                una_TB_transCab.imp_tot_ing = decimal.Parse(this.txtMonto.Text);

                this.serviceModel.CompletarAuditoria(una_Obligacion, una_TB_transCab.seccion,
                                                   una_TB_transCab.bloque, "A", "Nuevo");

                List<TB_ObligacionesTitulares> una_Lista_TB_ObligacionesTitulares = new List<TB_ObligacionesTitulares>();
                foreach (TB_ProveedoresExt item in this.Titulares)
                {
                    una_Lista_TB_ObligacionesTitulares.Add(item.ToTB_ObligacionesTitulares(una_TB_transCab.nro_trans));
                }
                una_Obligacion.TB_ObligacionesTitulares = una_Lista_TB_ObligacionesTitulares;


                List<TB_ObligacionesCuotas> una_Lista_TB_ObligacionesCuotas = new List<TB_ObligacionesCuotas>();
                foreach (TB_ObligacionesCuotasExt item in Lista_Vencimientos)
                {
                    una_Lista_TB_ObligacionesCuotas.Add(item.ToTB_ObligacionesCuotas(una_TB_transCab.nro_trans));
                }
                una_Obligacion.TB_ObligacionesCuotas = una_Lista_TB_ObligacionesCuotas;

                // Deberia emitar excepciones para determinar el comportamiento de la grabacion
                this.serviceModel.ModificarRegistro (una_Obligacion);                                            
            }
            catch (ServiceObligacionesException ex)
            {
                var ObligacionesCompensados = "";
                                foreach (var item in ex.ListaCuponesCompensados)
	                            {
                                    ObligacionesCompensados = ObligacionesCompensados + " -  Licencia: " + item.nrLicencia.ToString() + " Nro Cupón Compensación " + item.nrCupon.ToString() + "\n"; 
	                            }
                                if (ObligacionesCompensados !="") {
                                    MessageBox.Show("Error: existen obligaciones compensadas\n" + ObligacionesCompensados, "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                    return false;
                                }
                MessageBox.Show(ex.Message, "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;

        }


        private void botonesForm1_Load(object sender, EventArgs e)
        {

        }


        public void cargarCombo(ComboBox cb, IEnumerable<Object> lista)
        {

            cb.Items.Clear();
            foreach (object item in lista)
            {
                Type t = item.GetType();
                PropertyInfo[] pi = t.GetProperties();
                foreach (PropertyInfo p in pi)
                {
                    Console.WriteLine(p.Name + " " + p.GetValue(item, null));
                    cb.Items.Add(p.GetValue(item, null));
                }
            }

        }


        private void dataGridView2_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            var btnFind = new ToolStripButton();
            btnFind.Tag = "EDIT";
            botonesForm1_ClickEventDelegateHandler(btnFind, null);
        }

        private void dataGridView2_RowHeaderMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            var btnFind = new ToolStripButton();
            btnFind.Tag = "EDIT";
            botonesForm1_ClickEventDelegateHandler(btnFind, null);
        }

        private void cbUsuariosConciliaciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            //MessageBox.Show(cbUsuariosConciliaciones.Text);
        }

        private void panelbusqueda_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dataGridView2_FilterStringChanged(object sender, EventArgs e)
        {
            this.bindingSource1.Filter = this.ADGVBusqueda.FilterString;
            this.lblDgvBusquedaRegistros.Text = "Registros: " + this.bindingSource1.List.Count.ToString();
        }

        private void txtMonto_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = soloNumerosDecimales(e.KeyChar);
        }

        private void txtMonto_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtCuotas_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtCuotas_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = soloEnteros(e.KeyChar);
        }

        public bool soloEnteros(Char caracter){
            return !char.IsDigit(caracter) && !char.IsControl(caracter);
        }

        public bool soloNumerosDecimales(Char caracter)
        {
            return !char.IsDigit(caracter) && !char.IsControl(caracter) && (caracter.ToString()  !=  CultureInfo.CurrentUICulture.NumberFormat.NumberDecimalSeparator);
        }

        private bool validarIngresodeDatosCabecera()
        {
            // situacion sin archivo            
            if (this.cbTipoArchivo.Text.Trim().CompareTo ("") ==0){
                if ((this.txtDescripcion.Text.Trim().CompareTo ("")==0 ))
                {
                    MessageBox.Show("Debe ingresar descripción", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.txtDescripcion.Focus();
                    return false;
                }
                if (!Information.IsNumeric(this.txtMonto.Text))
                {
                    MessageBox.Show(string.Format("El monto ingresada no es válido {0}", this.txtMonto.Text), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.txtMonto.Focus();
                    return false;
                }
                if (!Information.IsNumeric(this.txtCuotas.Text))
                {
                    MessageBox.Show(string.Format ("la cuota ingresada no es válido {0}",this.txtCuotas.Text ), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.txtCuotas.Focus();
                    return false;
                }
            }
            
            // situacion con archivo
            if (this.cbTipoArchivo.Text !=""){

            }            
            return true;
        }


        private void agregarLicenciaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // si no cumple las validaciones nos vamos
            if (!validarIngresodeDatosCabecera()) return;

            FrmBuscarTitulares un_FrmBuscarTitulares = new FrmBuscarTitulares();
            // Enviamos la lista que ya se encuentra en el formulario 
            un_FrmBuscarTitulares.TitularesaExcluir = this.Titulares; 
            // excluir a los titulares que ya existen en la grilla
            un_FrmBuscarTitulares.ShowDialog();
            // antes de realizar estos validar que no agregar 
            if (this.Titulares == null)
                this.Titulares = un_FrmBuscarTitulares.Titulares;
            else
                this.Titulares.AddRange (un_FrmBuscarTitulares.Titulares) ;

            CargarGrillasTitularesCuotas();
        }

        private void CargarGrillasTitularesCuotas(Boolean pEdicion = false)
        {

            // cargamos nuevamente la lista
            Dictionary<string, ADGVFieldAdapter> lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
            //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
            lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", true, true));
            lista_campo_tipo.Add("cdProveedor", new ADGVFieldAdapter("cdProveedor", "COD.TITU", "cdProveedor", "System.Decimal", true, false));
            lista_campo_tipo.Add("nrLicencia", new ADGVFieldAdapter("nrLicencia", "LICENCIA", "nrLicencia", "System.Int32", true, true));
            lista_campo_tipo.Add("nmNombre", new ADGVFieldAdapter("nmNombre", "NOMBRE", "nmNombre", "System.String", true, true));
            lista_campo_tipo.Add("nmApellido", new ADGVFieldAdapter("nmApellido", "APELLIDO", "nmApellido", "System.String", true, true));

            cargarDataGridView_ADGV(this.ADGV_Titulares, this.Titulares, this.dataSet1, this.bindingSource1, lista_campo_tipo);

            if (this.ADGV_Titulares.Rows.Count == 0) return;

            ADGVInicilizations.ADGV_ColorearGrillaxCorteValorFormatearFecha(this.ADGV_Titulares, "nrLicencia", "");
            ServiceObligaciones un_ServiceObligaciones = new ServiceObligaciones(new dbSG2000Entities());

            this.Lista_Vencimientos = un_ServiceObligaciones.calcularVencimientos(this.Titulares, decimal.Parse(this.txtMonto.Text),
                decimal.Parse(this.txtCuotas.Text), this.dtpFecValor.Value, this.cbPeriodo.Text);

            // cargamos nuevamente la lista
            lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
            //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
            lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", true, true));
            lista_campo_tipo.Add("nro_trans", new ADGVFieldAdapter("nro_trans", "nro_trans", "nro_trans", "System.Int32", true, false));
            lista_campo_tipo.Add("cod_tit", new ADGVFieldAdapter("cod_tit", "COD.TITU", "cod_tit", "System.Decimal", true, false));
            lista_campo_tipo.Add("nrLicencia", new ADGVFieldAdapter("nrLicencia", "LICENCIA", "nrLicencia", "System.Int32", true, true));
            lista_campo_tipo.Add("nro_cuota", new ADGVFieldAdapter("nro_cuota", "NRO.CUOTA", "nro_cuota", "System.String", true, true));
            lista_campo_tipo.Add("importe", new ADGVFieldAdapter("importe", "IMPORTE", "importe", "System.String", true, true));
            lista_campo_tipo.Add("fecha_vencimiento", new ADGVFieldAdapter("fecha_vencimiento", "VENCIMIENTO", "fecha_vencimiento", "System.DateTime", true, true));

            cargarDataGridView_ADGV(this.ADGV_TitularesCuotas, this.Lista_Vencimientos, this.dataSet2, this.bindingSource2, lista_campo_tipo);
            ADGVInicilizations.ADGV_ColorearGrillaxCorteValorFormatearFecha(this.ADGV_TitularesCuotas, "nrLicencia", "fecha_vencimiento");
        }


        

        // Agregar a datagridview de titulares
        public void cargarDataGridView_ADGV(DataGridView dgv, IEnumerable<Object> lista,
                                        DataSet p_DataSet, BindingSource p_BindingSource, 
                                        Dictionary<string, ADGVFieldAdapter> p_lista_campo_tipo)
        {

            /*
             this.dataSet1.Clear();
             this.bindingSource1.Clear();
             this.dataGridView1.Rows.Clear(); 
            **/

            // A la lista la transfiere al DATASET
            p_DataSet = Extensiones.Extensions.ToDataSet(lista, p_lista_campo_tipo);
            //Al binding source le configuramos el dataset
            p_BindingSource.DataSource = p_DataSet;
            // Al binding source le configuramos su datamenber , sino no transfiere los datos al datagrid
            p_BindingSource.DataMember = p_DataSet.Tables[0].TableName;

            try
            {
                Trace.TraceInformation(dgv.ToString());
                Trace.TraceInformation(lista.ToString());

                dgv.AutoGenerateColumns = false;
                //dgv.Rows.Clear();
                dgv.Columns.Clear();

                foreach (var item in p_lista_campo_tipo)
                {
                    DataGridViewColumn columna = new DataGridViewColumn();
                    DataGridViewCell cell = new DataGridViewTextBoxCell();
                    columna.CellTemplate = cell;
                    columna.Name = item.Value.Name;
                    columna.HeaderText = item.Value.HeaderText;
                    columna.ReadOnly = item.Value.ReadOnly;
                    columna.Visible = item.Value.Visible;
                    columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna);
                    columna.DataPropertyName = item.Value.DataPropertyName;
                }

                dgv.DataSource = p_BindingSource;
                dgv.AutoResizeRowHeadersWidth(DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders);
            }
            catch (Exception ex)
            {
                var st = new StackTrace(ex, true);
                var frame = st.GetFrame(0);
                Trace.TraceError("Error Linea " + frame.GetFileLineNumber().ToString() + " columna " + frame.GetFileColumnNumber().ToString());
                Trace.TraceError(ex.ToString());
                throw;
            }

        }

        private void eliminarTitularToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (this.ADGV_Titulares.SelectedRows.Count == 0) return;

            foreach (DataGridViewRow row in this.ADGV_Titulares.SelectedRows)
            {
                TB_ProveedoresExt un_titu_nuevo = new TB_ProveedoresExt(int.Parse(row.Cells["cdProveedor"].Value.ToString()), row.Cells["nrLicencia"].Value.ToString(), row.Cells["nmNombre"].Value.ToString(), row.Cells["nmApellido"].Value.ToString());
                un_titu_nuevo  = Titulares.Find(x => x.cdProveedor == un_titu_nuevo.cdProveedor);
                Titulares.Remove(un_titu_nuevo);
            }
            CargarGrillasTitularesCuotas();
             
        }

        private void ADGV_Titulares_FilterStringChanged(object sender, EventArgs e)
        {
            this.bindingSource1.Filter = this.ADGV_Titulares.FilterString;
            //this.lblDgv1Registros.Text = "Registros: " + this.bindingSource1.List.Count.ToString(); 

        }

        private void ADGV_TitularesCuotas_FilterStringChanged(object sender, EventArgs e)
        {
            this.bindingSource2.Filter = this.ADGV_TitularesCuotas.FilterString;
            //this.lblDgv1Registros1.Text = "Registros: " + this.bindingSource2.List.Count.ToString(); 

        }

        private void ADGV_Titulares_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
                
        }

        private void txtDescripcion_TextChanged(object sender, EventArgs e)
        {
            CargarGrillasTitularesCuotas();
        }

        private void eliminarTodosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (this.ADGV_Titulares.SelectedRows.Count == 0) return;

            this.Titulares.Clear();
            this.ADGV_Titulares.DataSource = "";
            this.Lista_Vencimientos = null;
            this.ADGV_TitularesCuotas.DataSource = "";

        }

        private void agregarTodosToolStripMenuItem_Click(object sender, EventArgs e)
        {

            this.Titulares.Clear();
            this.ADGV_Titulares.DataSource = "";
            this.Lista_Vencimientos = null;
            this.ADGV_TitularesCuotas.DataSource = "";
            

            ServiceLicenciatarios miServiceLicenciatarios = new ServiceLicenciatarios(new dbSG2000Entities());
            IEnumerable<TB_Proveedores> lista;
            lista = miServiceLicenciatarios.ObtenerTodosLosRegistros();

            foreach (var item in lista)
            {
                TB_ProveedoresExt un_titu_nuevo = new TB_ProveedoresExt(item.cdProveedor , item.nrLicencia,  item.nmNombre, item.nmApellido);
                this.Titulares.Add(un_titu_nuevo);
            }
            CargarGrillasTitularesCuotas();

        }

        private void ADGVBusqueda_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void ADGVBusqueda_MouseDoubleClick(object sender, MouseEventArgs e)
        {

            var btnFind = new ToolStripButton();
            btnFind.Tag = "EDIT";
            botonesForm1_ClickEventDelegateHandler(btnFind, null);

    
        }

        private void titularesConGPSToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Titulares.Clear();
            this.ADGV_Titulares.DataSource = "";
            this.Lista_Vencimientos = null;
            this.ADGV_TitularesCuotas.DataSource = "";


            ServiceLicenciatarios miServiceLicenciatarios = new ServiceLicenciatarios(new dbSG2000Entities());
            IEnumerable<TB_Proveedores> lista;
            lista = miServiceLicenciatarios.ObtenerTodosLosTitularesConGPS();

            foreach (var item in lista)
            {
                TB_ProveedoresExt un_titu_nuevo = new TB_ProveedoresExt(item.cdProveedor, item.nrLicencia, item.nmNombre, item.nmApellido);
                this.Titulares.Add(un_titu_nuevo);
            }
            CargarGrillasTitularesCuotas();

        }

        private void panelcarga_Paint(object sender, PaintEventArgs e)
        {

        }

        


    } // Cierra la clase 
       
} // cierra el namespace