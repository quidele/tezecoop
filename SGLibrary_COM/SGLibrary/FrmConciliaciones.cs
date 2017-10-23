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
using SGLibrary.ArchivoTarjetas;
using System.Diagnostics;
using SGLibrary.Extensiones;
using SGLibrary.Exceptions;

namespace SGLibrary
{
    public partial class FrmConciliaciones : Form
    {


        public ServiceConciliacion serviceConciliaciones { get; set; }
        public ServiceConciliacionAutomatica serviceConciliacionesAutomaticas { get; set; }
        public ServiceConciliacionManual un_ServiceConciliacionManual { get; set; }
        public ServiceConciliacionTodoPago un_ServiceConciliacionTodoPago { get; set; }
        

        public FrmConciliaciones()
        {
            InitializeComponent();
        }

        private void FrmConciliaciones_Load(object sender, EventArgs e)
        {

            using (var context = new dbSG2000Entities())
            {
                this.statusbar_bd.Text = "Base de datos: " + context.Database.Connection.Database ;
                this.statusbar_servidor.Text = "Base de datos: " + context.Database.Connection.DataSource;
                this.statusbar_usuario.Text = "usuario: " + serviceConciliaciones.Usuario;
                this.statusbar_nrocaja.Text = "Caja Nro: " + serviceConciliaciones.CajaAdm;
                this.statusbar_version.Text = "Versión: " + typeof(SGLibrary.ServiceModel).Assembly.GetName().Version.ToString();
                //this.statusbar_version.Text = Application.
 
            }

            cargarCombo(this.cbUsuariosConciliaciones, serviceConciliaciones.obtenerUsuariosConciliaciones());
            botonesForm1.configMododeEdicion( ABMBotonesForm.FIND);
            this.panelcarga.Visible = false;
            this.panelbusqueda.Visible = true;
            this.fechadesde.Value = DateTime.Now.AddDays(-30).Date;
            this.fechahasta.Value = DateTime.Now.Date;
            this.botonesForm1.InicializarFindBoton();

            this.lblDgv1Registros.Text = "Registros: 0";

        }



        public void deshabilitarycolorearCompensados()
        {
            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                Console.WriteLine(item.Cells["CONCILIAR"].EditedFormattedValue);
                if ( item.Cells["COMPENSADO"].EditedFormattedValue.ToString() == "SI")
                {
                    item.ReadOnly = true;
                    item.DefaultCellStyle.BackColor = Color.Red;
                }
                
                if (this.txtflEstado.Text  =="E")
                {
                    item.ReadOnly = true;
                    item.DefaultCellStyle.BackColor = Color.Gray;
                }
            }
        }

        private void botonesForm1_ClickEventDelegateHandler(object sender, EventArgs e)
        {
            ToolStripItem miboton = (ToolStripItem)sender;
            this.panelcarga.Enabled = true;
            this.cbtipoConciliacion.Visible = false;
            this.cbtipoConciliacion.Enabled = false;
            this.txtFormato.Visible = true;
            this.btnSelecccionarArchivoTarjeta.Enabled = true;
            //MessageBox.Show("tocaste un boton, boton " + miboton.Name + " TAB " + miboton.Tag); 




            switch (miboton.Tag.ToString ()){
                case "EDIT" : {
                    deshabilitarDGV1_HandlersCellFormating(dataGridView1);
                    this.panelcarga.Visible = true;
                    this.panelbusqueda.Visible  = false;

                    foreach (DataGridViewRow row in dataGridView2.SelectedRows)
                    {
                        this.modoEdicion.Text = "SI";
                        TB_Conciliacion una_conciliacion = serviceConciliaciones.obtenerConciliacion(row.Cells["ID"].Value.ToString());
                        this.txtIdConciliacion.Text = una_conciliacion.IdConciliacion.ToString();
                        this.txtdsUsuario.Text = una_conciliacion.dsUsuario;
                        this.txtnrCajaAdm.Text = una_conciliacion.nrCajaAdm.ToString();
                        this.txtflEstado.Text = una_conciliacion.flestado;
                        this.txtIdArchivo.Text = una_conciliacion.idArchivo.ToString(); // recuperamos el idArchivo 

                        if (una_conciliacion.idArchivo.ToString() != "")
                       {
                            //this.cbtipoConciliacion.Visible = false;
                            //this.txtFormato.Visible = true;
                            // this.txtFormato.Text = una_conciliacion.TB_ArchivoTarjeta.formato.Trim(); comentado en la version 4.9.2
                            this.txtNombreArchivoTarjeta.Text = una_conciliacion.TB_ArchivoTarjeta.nombreArchivoCompleto;
                        }
                        /* else {
                            this.txtFormato.Text = "Manual";
                        }*/

                        this.txtFormato.Text = una_conciliacion.formato.Trim(); 

                      
                        if (una_conciliacion.flestado =="E"){
                            botonesForm1.configMododeEdicion(ABMBotonesForm.VIEW);
                            this.panelcarga.Enabled = false;
                        }
                        else {
                            this.cbtipoConciliacion.Enabled = false;
                            this.btnSelecccionarArchivoTarjeta.Enabled = false;
                            botonesForm1.configMododeEdicion(ABMBotonesForm.EDIT);
                        }



                        switch (this.txtFormato.Text)
                        {
                            case "Todo Pago":
                                // probar este código
                                this.progressBar1.Minimum = 0;
                                var listaResultados = un_ServiceConciliacionTodoPago.ObtenerDetalleConciliacion(una_conciliacion.IdConciliacion);
                                this.progressBar1.Maximum = listaResultados.Count();
                                this.progressBar1.Visible = true;
                                //cargarDataGridViewCuponesTodoPago(dataGridView1, listaResultados , this.modoEdicion.Text);
                                cargarDataGridViewCuponesTodoPago_ADGV(dataGridView1, listaResultados, modoEdicion.Text, this.dataSet1, this.bindingSource1);
                                this.progressBar1.Visible = false;
                                break;
                            case "Manual":
                                cargarDataGridViewCupones_ADGV(dataGridView1, un_ServiceConciliacionManual.ObtenerDetalleConciliacion(una_conciliacion.IdConciliacion), this.modoEdicion.Text,dataSet1,bindingSource1);
                                break;
                            default:
                                cargarDataGridViewConciliacionAutomatica(dataGridView1, serviceConciliacionesAutomaticas.ObtenerDetalleConciliacionAutomatica(una_conciliacion.IdConciliacion), this.modoEdicion.Text, true,this.dataSet1 , this.bindingSource1);
                                break;
                        }


                    }

                    deshabilitarycolorearCompensados();
                    break;
                }
                case "ADD":
                    {
                        deshabilitarDGV1_HandlersCellFormating(dataGridView1);
                        this.modoEdicion.Text = "NO";
                        this.cbtipoConciliacion.Visible = true;
                        this.cbtipoConciliacion.Enabled = true;
                        this.txtdsUsuario.Text = serviceConciliaciones.Usuario ;
                        this.txtnrCajaAdm.Text = serviceConciliaciones.CajaAdm;
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        this.btnSelecccionarArchivoTarjeta.Enabled = false;
                        this.txtNombreArchivoTarjeta.Text = "";
                        dataGridView1.Columns.Clear();
                        //var listadeViajesaConciliar = serviceConciliaciones.ObtenerViajesaConciliar();
                        //cargarDataGridViewCupones(dataGridView1, listadeViajesaConciliar, modoEdicion.Text ); 
                        this.btnSelecccionarArchivoTarjeta.Enabled = false;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.ADD);
                        break;
                    }
                case "FIND":
                    {
        
                        //serviceConciliaciones.obtenerUsuariosConciliaciones();
                        var listadeConciliaciones = serviceConciliaciones.obtenerConciliaciones(this.fechadesde.Value, this.fechahasta.Value, this.cbUsuariosConciliaciones.Text, this.cbFormato.Text);
                        cargarDataGridViewConciliaciones(dataGridView2, listadeConciliaciones);
                        this.modoEdicion.Text = "NO";
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        break;
                        
                    }
                
                case "OK":
                    {

                        if (this.modoEdicion.Text  =="NO") 
                        {
                            if (!altadeconciliacion()) break;
                        }
                        else
                        {
                            if (!ediciondeconciliacion()) break;
                        }

                        cargarCombo(this.cbUsuariosConciliaciones, serviceConciliaciones.obtenerUsuariosConciliaciones());
                        this.modoEdicion.Text = "NO";
                        var btnFind = new ToolStripButton();
                        btnFind.Tag = "FIND";
                        MessageBox.Show("La operación se ha realizado con éxito.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        botonesForm1_ClickEventDelegateHandler(btnFind, null);
                        break;
                    }
                case "CANCEL":
                    {
                        this.modoEdicion.Text = "NO";
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.CANCEL);
                        break;
                    }

                case "DELETE":
                    {
                        this.modoEdicion.Text = "NO";
                        foreach (DataGridViewRow row in dataGridView2.SelectedRows)
                        {

                            if (row.Cells["ESTADO"].Value.ToString()=="E")
                            {
                                continue;
                            }
                            TB_Conciliacion una_conciliacion = serviceConciliaciones.obtenerConciliacion(row.Cells["ID"].Value.ToString());
                            DialogResult dialogResult = MessageBox.Show("Confirma la eliminación de la conciliación " + una_conciliacion.IdConciliacion.ToString(), "Atención", MessageBoxButtons.YesNo ,MessageBoxIcon.Question);
                             if(dialogResult == DialogResult.No ) break; 
                               // COMLETAR ELIMINACION
                              if (una_conciliacion.idArchivo.ToString() == "") 
                                 this.un_ServiceConciliacionManual.anularConciliacion (una_conciliacion);
                                 //serviceConciliaciones.anularConciliacion(una_conciliacion); // conciliacion manual
                             else
                                 serviceConciliacionesAutomaticas.anularConciliacionAutomatica(una_conciliacion); // conciliacion automatica 
                             MessageBox.Show("La operación se ha realizado con éxito.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        
                        }

                        var btnFind = new ToolStripButton();
                        btnFind.Tag = "FIND";
                        botonesForm1_ClickEventDelegateHandler(btnFind, null);

                        //this.panelcarga.Visible = false;
                        //this.panelbusqueda.Visible = true;
                        //botonesForm1.configMododeEdicion(ABMBotonesForm.DELETE);
                        
                        break;
                    }
                case "EXCEL":
                    {
                        exportaraExcel();
                        break;
                    }
                case "EXIT":
                    {
                        this.Close();
                        break;
                    }
            } 

        }

        private void deshabilitarDGV1_HandlersCellFormating(DataGridView dgv)
        {
            FieldInfo f1 = typeof(Control).GetField("CellFormatting",
            BindingFlags.Static | BindingFlags.NonPublic);
            if (f1 == null) return;
            object obj = f1.GetValue(dgv);
            PropertyInfo pi = dgv.GetType().GetProperty("Events",
                BindingFlags.NonPublic | BindingFlags.Instance);
            EventHandlerList list = (EventHandlerList)pi.GetValue(dgv, null);
            list.RemoveHandler(obj, list[obj]);
        }


        public void exportaraExcel()
        {
            // Deshabilitamos el Evento que realizar el formateo

            try
            {

            

            String nombreArchivo;
            OpenFileDialog openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            openFileDialog1.Title = "Excel Spreadsheet";
            openFileDialog1.FileName = "";
            openFileDialog1.DefaultExt = ".xlsx";
            openFileDialog1.AddExtension = true;
            openFileDialog1.Filter = "Excel Worksheets|*.xls; *.xlsx";
            openFileDialog1.CheckFileExists = false;

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                /* MessageBox.Show ( openFileDialog1.FileName); */
                nombreArchivo = openFileDialog1.FileName;
                nombreArchivo = (nombreArchivo + "x").Replace(".xlsxx", ".xlsx");
                ServiceExcel miServiceExcel = new ServiceExcel();
                if (this.panelcarga.Visible)
                {
                    miServiceExcel.ExportarAExcel(this.dataGridView1, nombreArchivo);
                    // Habilitamos el Evento que realizar el formateo
                }
                else
                    miServiceExcel.ExportarAExcel(this.dataGridView2, nombreArchivo);
                MessageBox.Show(this, "El archivo se ha generado con éxito", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            }
            catch (ExcelAppException e)
            {
                MessageBox.Show( e.Message ,"Atención" , MessageBoxButtons.OK, MessageBoxIcon.Warning  );
            }

        }


        public Boolean  altadeconciliacion()
        {

            List<Decimal> lista = new List<Decimal>();
            List<TB_ConciliacionDetalleEx> listaAutomatica = new List<TB_ConciliacionDetalleEx>();

            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                Console.WriteLine(item.Cells["CONCILIAR"].EditedFormattedValue);
                if (item.Cells["CONCILIAR"].EditedFormattedValue.ToString() == "True")
                {

                    switch (this.cbtipoConciliacion.Text)
                    {
                        case "Todo Pago":
                            if (item.Cells["FECHA_ACREDITACION"].EditedFormattedValue.ToString() == "")
                            {
                                MessageBox.Show("Debe completar la fecha de acreditación", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                dataGridView1.Focus();
                                return false;
                            }
                            TB_ConciliacionDetalleEx una_TB_ConciliacionDetalle = new TB_ConciliacionDetalleEx();
                            una_TB_ConciliacionDetalle.nrCupon = Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString());
                            una_TB_ConciliacionDetalle.fechaPago = DateTime.Parse(item.Cells["FECHA_ACREDITACION"].EditedFormattedValue.ToString());
                            una_TB_ConciliacionDetalle.dtCupon = DateTime.Parse(item.Cells["FECHA"].EditedFormattedValue.ToString());
                            listaAutomatica.Add(una_TB_ConciliacionDetalle);
                            break;
                        case "Manual" : 
                            if (item.Cells["FECHA_ACREDITACION"].EditedFormattedValue.ToString() == "")
                            {
                                MessageBox.Show("Debe completar la fecha de acreditación", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                dataGridView1.Focus();
                                return false;
                            }
                            TB_ConciliacionDetalleEx una_TB_ConciliacionDetalle1 = new TB_ConciliacionDetalleEx();
                            una_TB_ConciliacionDetalle1.nrCupon = Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString());
                            una_TB_ConciliacionDetalle1.fechaPago = DateTime.Parse(item.Cells["FECHA_ACREDITACION"].EditedFormattedValue.ToString());
                            una_TB_ConciliacionDetalle1.dtCupon = DateTime.Parse(item.Cells["FECHA"].EditedFormattedValue.ToString());
                            listaAutomatica.Add(una_TB_ConciliacionDetalle1);
                            break;
                        default:
                            TB_ConciliacionDetalleEx una_TB_ConciliacionDetalle2 = new TB_ConciliacionDetalleEx();
                            una_TB_ConciliacionDetalle2.nrCupon = Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString());
                            una_TB_ConciliacionDetalle2.IdArchivoTarjetaDetalle = long.Parse(item.Cells["IdArchivoTarjetaDetalle"].EditedFormattedValue.ToString());
                            una_TB_ConciliacionDetalle2.fechaPago = DateTime.Parse(item.Cells["FECHA_PAGO"].EditedFormattedValue.ToString());
                            una_TB_ConciliacionDetalle2.dtCupon = DateTime.Parse(item.Cells["FECHA"].EditedFormattedValue.ToString());
                            listaAutomatica.Add(una_TB_ConciliacionDetalle2);
                            break;
                            
                    }

                }
                //DataGridViewCheckBoxColumn unControl = (DataGridViewCheckBoxColumn) item.Cells["CONCILIAR"].;
                //Console.WriteLine ( unControl.TrueValue);
            }

            if ((lista.Count() == 0) && (listaAutomatica.Count() == 0))
            {
                MessageBox.Show("Debe seleccionar algún comprobante.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                dataGridView1.Focus();
                return false;
            }

            var una_conciliacion = new TB_Conciliacion();
            una_conciliacion.dtConciliacion = this.cbdtConciliacion.Value;


             switch (this.cbtipoConciliacion.Text)
                    {
                        case "Todo Pago":
                            una_conciliacion.formato = this.cbtipoConciliacion.Text;
                            un_ServiceConciliacionTodoPago.agregarConciliacion(listaAutomatica, una_conciliacion);
                            //serviceConciliaciones.agregarConciliacion(listaAutomatica, una_conciliacion);
                            break;
                        case "Manual" : 
                            una_conciliacion.formato = this.cbtipoConciliacion.Text;
                            un_ServiceConciliacionManual.agregarConciliacion(listaAutomatica, una_conciliacion);
                            //serviceConciliaciones.agregarConciliacion(listaAutomatica, una_conciliacion);
                            break;
                        default:
                             // si estamos en una conciliacion automatica
                            una_conciliacion.idArchivo = int.Parse(this.txtIdArchivo.Text); // Asignamos el idArchivo de la conciliacion automatica
                            una_conciliacion.formato = this.cbtipoConciliacion.Text;
                            serviceConciliacionesAutomaticas.agregarConciliacion(listaAutomatica, una_conciliacion);
                            break;
                            
                    }

            return true;
        }


        public Boolean ediciondeconciliacion()
        {
            List<Decimal> listaCupones = new List<Decimal>();
            List<Decimal> listaCuponesConciliados = new List<Decimal>();
            List<Decimal> listaCuponesDesconciliados = new List<Decimal>();

            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                Console.WriteLine(item.Cells["CONCILIAR"].EditedFormattedValue);
                if (item.Cells["CONCILIAR"].EditedFormattedValue.ToString() == "True" && item.Cells["COMPENSADO"].EditedFormattedValue.ToString() == "NO")
                {
                    listaCuponesConciliados.Add(Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString()));
                }

                if (item.Cells["CONCILIAR"].EditedFormattedValue.ToString() == "False" && item.Cells["COMPENSADO"].EditedFormattedValue.ToString() == "NO")
                {
                    listaCuponesDesconciliados.Add(Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString()));
                }
                //DataGridViewCheckBoxColumn unControl = (DataGridViewCheckBoxColumn) item.Cells["CONCILIAR"].;
                //Console.WriteLine ( unControl.TrueValue);
                listaCupones.Add (Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString()));
            }

            if (listaCuponesConciliados.Count() == 0)
            {
                MessageBox.Show("Debe seleccionar algún comprobante");
                dataGridView1.Focus();
                return false;
            }

            var una_conciliacion = new TB_Conciliacion();
            una_conciliacion.dtConciliacion = this.cbdtConciliacion.Value;
            una_conciliacion.IdConciliacion = int.Parse  ( this.txtIdConciliacion.Text);


            try {
                 switch (this.txtFormato.Text)
                    {
                        case "Todo Pago":
                         this.un_ServiceConciliacionTodoPago.modificarConciliacion(listaCuponesDesconciliados, listaCuponesConciliados, una_conciliacion);
                            break;
                        case "Manual" : 
                            this.un_ServiceConciliacionManual.modificarConciliacion(listaCuponesDesconciliados, listaCuponesConciliados, una_conciliacion);
                            break;
                        default:
                            serviceConciliacionesAutomaticas.modificarConciliacionAutomatica(listaCuponesDesconciliados, listaCuponesConciliados, una_conciliacion);
                            break;
                            
                    }
            } catch (Exception ex ){
                MessageBox.Show(ex.Message + serviceConciliaciones.ListaErrores(), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }

        public void cargarDataGridViewCupones(DataGridView dgv, IEnumerable<Object> lista , String p_modoEdicion  )
        {

            //dgv.Rows.Clear();
            dgv.Columns.Clear();

            foreach (var item in lista)
            {

                Type t = item.GetType();
                PropertyInfo[] pi = t.GetProperties();

                foreach (PropertyInfo p in pi)
                {

                    DataGridViewColumn columna = new DataGridViewColumn();
                    DataGridViewCell cell = new DataGridViewTextBoxCell();
                    columna.CellTemplate = cell;
                    columna.Name = p.Name;
                    columna.HeaderText = p.Name;
                    columna.ReadOnly = true;
                    columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna);
                }
                break;
            }

            DataGridViewCheckBoxColumn doWork = new DataGridViewCheckBoxColumn();
            doWork.Name = "CONCILIAR";
            doWork.HeaderText = "CONCILIAR";
            doWork.FalseValue = "0";
            doWork.TrueValue = "1";

            dgv.Columns.Add(doWork);

            if (p_modoEdicion !="SI") {
                CalendarColumn doWork1 = new CalendarColumn();
                doWork1.Name = "FECHA_ACREDITACION";
                doWork1.HeaderText = "FECHA DE ACREDITACION";
                doWork1.DefaultCellStyle.Format = "d";
                dgv.Columns.Add(doWork1);
            }


            foreach (object item in lista)
            {
                var row = dgv.Rows.Add();
                Type t =item.GetType();
                PropertyInfo[] pi = t.GetProperties();
                foreach (PropertyInfo p in pi)
                {
                    Console.WriteLine(p.Name + " " + p.GetValue(item, null));
                    dgv.Rows[row].Cells[p.Name].Value = p.GetValue(item, null);
                }

                if (p_modoEdicion=="SI") 
                {
                    dgv.Rows[row].Cells["CONCILIAR"].Value = true;
                    dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value = dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value.ToString().Remove(10);
                }

            }


        }


        public void cargarDataGridViewCupones_ADGV(DataGridView dgv, IEnumerable<Object> lista, 
                                                   String p_modoEdicion, DataSet p_DataSet, BindingSource p_BindingSource)
        {
            Dictionary<string, string> lista_campo_tipo = new Dictionary<string, string>();
            lista_campo_tipo.Add("Nº", "System.Decimal");
            lista_campo_tipo.Add("ID", "System.Decimal");
            lista_campo_tipo.Add("FECHA", "System.DateTime");
            lista_campo_tipo.Add("LICENCIA", "System.Int32");
            lista_campo_tipo.Add("DOC", "System.String");
            lista_campo_tipo.Add("LETRA", "System.String");
            lista_campo_tipo.Add("PDV", "System.String");
            lista_campo_tipo.Add("NRO", "System.String");
            lista_campo_tipo.Add("MONTO", "System.Double");
            lista_campo_tipo.Add("EMPRESA", "System.String");
            lista_campo_tipo.Add("TARJETA", "System.String");
            lista_campo_tipo.Add("DOCU", "System.String");
            lista_campo_tipo.Add("DOCU_NRO", "System.String");
            lista_campo_tipo.Add("CUPON", "System.String");
            lista_campo_tipo.Add("CONCILIAR", "System.Boolean");
            if (p_modoEdicion == "SI")
            {
                lista_campo_tipo.Add("COMPENSADO", "System.String");
            }
            lista_campo_tipo.Add("FECHA_ACREDITACION", "System.DateTime");

            // A la lista la transfiere al DATASET
            p_DataSet = Extensiones.Extensions.ToDataSet(lista, lista_campo_tipo);
            //Al binding source le configuramos el dataset
            p_BindingSource.DataSource = p_DataSet;
            // Al binding source le configuramos su datamenber , sino no transfiere los datos al datagrid
            p_BindingSource.DataMember = p_DataSet.Tables[0].TableName;

            try
            {
                Trace.TraceInformation(dgv.ToString());
                Trace.TraceInformation(lista.ToString());
            
    
                //dgv.Rows.Clear();
                dgv.Columns.Clear();
                dgv.AutoGenerateColumns = false;

                foreach (var item in lista)
                {

                    Type t = item.GetType();
                    PropertyInfo[] pi = t.GetProperties();

                    DataGridViewColumn columna1 = new DataGridViewColumn();
                    DataGridViewCell cell1 = new DataGridViewTextBoxCell();
                    columna1.CellTemplate = cell1;
                    columna1.Name = "Nº";
                    columna1.HeaderText = "Nº";
                    columna1.ReadOnly = true;
                    columna1.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna1);
                    columna1.DataPropertyName = "Nº";  

                    foreach (PropertyInfo p in pi)
                    {
                        if (p.Name.CompareTo("CONCILIAR") == 0) continue;
                        if (p.Name.CompareTo("FECHA_ACREDITACION") == 0) continue;
                        DataGridViewColumn columna = new DataGridViewColumn();
                        DataGridViewCell cell = new DataGridViewTextBoxCell();
                        columna.CellTemplate = cell;
                        columna.Name = p.Name;
                        columna.HeaderText = p.Name;
                        columna.ReadOnly = true;
                        columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                        columna.DataPropertyName = p.Name;
                        dgv.Columns.Add(columna);
                    }
                    break;
                }

                DataGridViewCheckBoxColumn doWork = new DataGridViewCheckBoxColumn();
                doWork.Name = "CONCILIAR";
                doWork.HeaderText = "CONCILIAR";
                doWork.FalseValue = false;
                doWork.TrueValue = true;
                doWork.DataPropertyName = "CONCILIAR";
                dgv.Columns.Add(doWork);

               /* if (p_modoEdicion != "SI")
                {*/
                    CalendarColumn doWork1 = new CalendarColumn();
                    doWork1.Name = "FECHA_ACREDITACION";
                    doWork1.HeaderText = "FECHA DE ACREDITACION";
                    doWork1.DefaultCellStyle.Format = "d";
                    doWork1.DataPropertyName = "FECHA_ACREDITACION"; 
                    dgv.Columns.Add(doWork1);
                /*}*/



                // Modificamos los Encabezados de las columnas
                foreach (DataGridViewColumn item in dgv.Columns)
                {
                    item.HeaderText = item.HeaderText.Replace("_", " ");
                }
                dgv.DataSource = p_BindingSource;
                dgv.AutoResizeRowHeadersWidth(DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders);

                //-------- Agregamos el 
                dataGridView1_ConciliacionManual_Inicilizacion();

            }
            catch (Exception ex)
            {
                var st = new StackTrace(ex, true);
                var frame = st.GetFrame(0);
                Trace.TraceError("Error Linea " + frame.GetFileLineNumber().ToString() + " columna " + frame.GetFileColumnNumber().ToString());
                Trace.TraceError(ex.ToString());
                throw;
            }

        } // Cierra  cargarDataGridViewCupones_ADGV

        private void dataGridView1_ConciliacionManual_Inicilizacion()
        {



            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                var row = item;
                if (this.modoEdicion.Text == "SI")  // Si es estado de Edición
                {
                    row.Cells["CONCILIAR"].Value = true;
                    row.Cells["FECHA_ACREDITACION"].Value = row.Cells["FECHA_ACREDITACION"].Value.ToString().Remove(10);
                    row.Cells["FECHA_ACREDITACION"].ReadOnly = true; 
                }
            }

        }


        public void cargarDataGridViewCuponesTodoPago(DataGridView dgv, IEnumerable<Object> lista, String p_modoEdicion)
        {

            //dgv.Rows.Clear();
            dgv.Columns.Clear();

            foreach (var item in lista)
            {

                Type t = item.GetType();
                PropertyInfo[] pi = t.GetProperties();

                foreach (PropertyInfo p in pi)
                {
                    
                    if (p_modoEdicion != "SI") {
                        if (p.Name == "FECHA_ACREDITACION") continue;
                    }

                    DataGridViewColumn columna = new DataGridViewColumn();
                    DataGridViewCell cell = new DataGridViewTextBoxCell();
                    columna.CellTemplate = cell;
                    columna.Name = p.Name;
                    columna.HeaderText = p.Name;
                    columna.ReadOnly = true;
                    columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna);
                }
                break;
            }

            DataGridViewCheckBoxColumn doWork = new DataGridViewCheckBoxColumn();
            doWork.Name = "CONCILIAR";
            doWork.HeaderText = "CONCILIAR";
            doWork.FalseValue = "0";
            doWork.TrueValue = "1";

            dgv.Columns.Add(doWork);

            if (p_modoEdicion != "SI")
            {
                CalendarColumn doWork1 = new CalendarColumn();
                doWork1.Name = "FECHA_ACREDITACION";
                doWork1.HeaderText = "FECHA DE ACREDITACION";
                doWork1.DefaultCellStyle.Format = "d";
                dgv.Columns.Add(doWork1);
            }

            var i = 0;

            foreach (object item in lista)
            {

                this.progressBar1.BringToFront();
                dgv.Refresh();
                //System.Threading.Thread.Sleep(10);
                Application.DoEvents();
                this.progressBar1.Increment(i++);
                var row = dgv.Rows.Add();

                dgv.Rows[row].HeaderCell.Value = i.ToString();

                Type t = item.GetType();
                PropertyInfo[] pi = t.GetProperties();
                foreach (PropertyInfo p in pi)
                {
                    Console.WriteLine(p.Name + " " + p.GetValue(item, null));
                    dgv.Rows[row].Cells[p.Name].Value = p.GetValue(item, null);
                }

                if (p_modoEdicion == "SI")
                {
                    dgv.Rows[row].Cells["CONCILIAR"].Value = true;
                    dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value = dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value.ToString().Remove(10);
                }
                else
                {
                    dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value = dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value.ToString();
                    DateTime dt;
                    DateTime.TryParse(dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value.ToString (), out dt);
                    dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value = dt.AddDays(10);
                }

            }

            dgv.BringToFront();
            dgv.Refresh();


        }


        public void cargarDataGridViewCuponesTodoPago_ADGV(DataGridView dgv, IEnumerable<Object> lista,
                                                   String p_modoEdicion, DataSet p_DataSet, BindingSource p_BindingSource)
        {
            Dictionary<string, string> lista_campo_tipo = new Dictionary<string, string>();
            lista_campo_tipo.Add("Nº", "System.Decimal");
            lista_campo_tipo.Add("ID", "System.Decimal");
            lista_campo_tipo.Add("FECHA", "System.DateTime");
            lista_campo_tipo.Add("LICENCIA", "System.Int32");
            lista_campo_tipo.Add("DOC", "System.String");
            lista_campo_tipo.Add("LETRA", "System.String");
            lista_campo_tipo.Add("PDV", "System.String");
            lista_campo_tipo.Add("NRO", "System.String");
            lista_campo_tipo.Add("MONTO", "System.Double");
            lista_campo_tipo.Add("EMPRESA", "System.String");
            lista_campo_tipo.Add("TARJETA", "System.String");
            lista_campo_tipo.Add("DOCU", "System.String");
            lista_campo_tipo.Add("DOCU_NRO", "System.String");
            lista_campo_tipo.Add("CUPON", "System.String");
            lista_campo_tipo.Add("CONCILIAR", "System.Boolean");
            if (p_modoEdicion == "SI")
            {
                lista_campo_tipo.Add("COMPENSADO", "System.String");
            }
            lista_campo_tipo.Add("FECHA_ACREDITACION", "System.DateTime");

            // A la lista la transfiere al DATASET
            p_DataSet = Extensiones.Extensions.ToDataSet(lista, lista_campo_tipo);
            //Al binding source le configuramos el dataset
            p_BindingSource.DataSource = p_DataSet;
            // Al binding source le configuramos su datamenber , sino no transfiere los datos al datagrid
            p_BindingSource.DataMember = p_DataSet.Tables[0].TableName;

            try
            {
                Trace.TraceInformation(dgv.ToString());
                Trace.TraceInformation(lista.ToString());


                //dgv.Rows.Clear();
                dgv.Columns.Clear();
                dgv.AutoGenerateColumns = false;

                foreach (var item in lista)
                {

                    Type t = item.GetType();
                    PropertyInfo[] pi = t.GetProperties();

                    DataGridViewColumn columna1 = new DataGridViewColumn();
                    DataGridViewCell cell1 = new DataGridViewTextBoxCell();
                    columna1.CellTemplate = cell1;
                    columna1.Name = "Nº";
                    columna1.HeaderText = "Nº";
                    columna1.ReadOnly = true;
                    columna1.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna1);
                    columna1.DataPropertyName = "Nº";

                    foreach (PropertyInfo p in pi)
                    {
                        if (p.Name.CompareTo("CONCILIAR") == 0) continue;
                        if (p.Name.CompareTo("FECHA_ACREDITACION") == 0) continue;
                        DataGridViewColumn columna = new DataGridViewColumn();
                        DataGridViewCell cell = new DataGridViewTextBoxCell();
                        columna.CellTemplate = cell;
                        columna.Name = p.Name;
                        columna.HeaderText = p.Name;
                        columna.ReadOnly = true;
                        columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                        columna.DataPropertyName = p.Name;
                        dgv.Columns.Add(columna);
                    }
                    break;
                }

                DataGridViewCheckBoxColumn doWork = new DataGridViewCheckBoxColumn();
                doWork.Name = "CONCILIAR";
                doWork.HeaderText = "CONCILIAR";
                doWork.FalseValue = false;
                doWork.TrueValue = true;
                doWork.DataPropertyName = "CONCILIAR";
                dgv.Columns.Add(doWork);

                /*if (p_modoEdicion != "SI")
                {*/
                    CalendarColumn doWork1 = new CalendarColumn();
                    doWork1.Name = "FECHA_ACREDITACION";
                    doWork1.HeaderText = "FECHA DE ACREDITACION";
                    doWork1.DefaultCellStyle.Format = "d";
                    doWork1.DataPropertyName = "FECHA_ACREDITACION";
                    dgv.Columns.Add(doWork1);
                /*}*/



                // Modificamos los Encabezados de las columnas
                foreach (DataGridViewColumn item in dgv.Columns)
                {
                    item.HeaderText = item.HeaderText.Replace("_", " ");
                }

                dgv.DataSource = p_BindingSource;
                dgv.AutoResizeRowHeadersWidth(DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders);
                dataGridView1_ConciliacionManualTodoPago_Inicializacion();

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

        private void dataGridView1_ConciliacionManualTodoPago_Inicializacion()
        {


            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                var row = item;
                if (this.modoEdicion.Text == "SI")
                {
                    row.Cells["CONCILIAR"].Value = true;
                    row.Cells["FECHA_ACREDITACION"].Value = row.Cells["FECHA_ACREDITACION"].Value.ToString().Remove(10);
                }
                else
                {
                    row.Cells["FECHA_ACREDITACION"].Value = row.Cells["FECHA_ACREDITACION"].Value.ToString();
                    DateTime dt;
                    DateTime.TryParse(row.Cells["FECHA_ACREDITACION"].Value.ToString(), out dt);
                    row.Cells["FECHA_ACREDITACION"].Value = dt.AddDays(10);
                }
            }


        }





        public void cargarDataGridViewConciliacionAutomatica(DataGridView dgv, IEnumerable<Object> lista_datos, String p_modoEdicion, bool crea_encabezados, DataSet p_DataSet, BindingSource p_BindingSource)
        {
            Dictionary<string, string> lista_campo_tipo = new Dictionary<string, string>();
            lista_campo_tipo.Add("Nº", "System.Decimal");
            lista_campo_tipo.Add("ID", "System.Decimal");
            lista_campo_tipo.Add("FECHA", "System.DateTime");
            lista_campo_tipo.Add("LICENCIA", "System.Int32");
            lista_campo_tipo.Add("DOC", "System.String");
            lista_campo_tipo.Add("LETRA", "System.String");
            lista_campo_tipo.Add("PDV", "System.String");
            lista_campo_tipo.Add("NRO", "System.String");
            lista_campo_tipo.Add("MONTO", "System.Double");
            lista_campo_tipo.Add("MONTO_ARCHI", "System.Double");
            lista_campo_tipo.Add("EMPRESA", "System.String");
            lista_campo_tipo.Add("TARJETA", "System.String");
            lista_campo_tipo.Add("TARJETA_ARCHI", "System.String");
            lista_campo_tipo.Add("CUPON", "System.String");
            lista_campo_tipo.Add("CUPON_ARCHI", "System.String");
            lista_campo_tipo.Add("NIVEL", "System.Int32");
            lista_campo_tipo.Add("IdArchivoTarjetaDetalle", "System.Decimal");
            lista_campo_tipo.Add("FECHA_PAGO", "System.DateTime");
            lista_campo_tipo.Add("CONCILIAR", "System.Boolean");
     

            // A la lista la transfiere al DATASET
            p_DataSet = Extensiones.Extensions.ToDataSet(lista_datos, lista_campo_tipo );
            //Al binding source le configuramos el dataset
            p_BindingSource.DataSource = p_DataSet;
            // Al binding source le configuramos su datamenber , sino no transfiere los datos al datagrid
            p_BindingSource.DataMember = p_DataSet.Tables[0].TableName;
       

            try
            {
                Trace.TraceInformation(dgv.ToString());
                Trace.TraceInformation(lista_datos.ToString());
                
       
            if (crea_encabezados)
            {
                dgv.AutoGenerateColumns = false;
                //dgv.Rows.Clear();
                dgv.Columns.Clear();

                foreach (var item in lista_datos)
                {

                    Type t = item.GetType();
                    PropertyInfo[] pi = t.GetProperties();

                    DataGridViewColumn columna1 = new DataGridViewColumn();
                    DataGridViewCell cell1 = new DataGridViewTextBoxCell();
                    columna1.CellTemplate = cell1;
                    columna1.Name = "Nº";
                    columna1.HeaderText = "Nº";
                    columna1.ReadOnly = true;
                    columna1.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna1);
                    columna1.DataPropertyName = "Nº";  


                    foreach (PropertyInfo p in pi)
                    {
                        DataGridViewColumn columna = new DataGridViewColumn();
                        DataGridViewCell cell = new DataGridViewTextBoxCell();
                        columna.CellTemplate = cell;
                        columna.Name = p.Name;
                        columna.HeaderText = p.Name;
                        columna.ReadOnly = true;
                        columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                        switch (    columna.Name )
                        {
                            case "NIVEL": columna.Visible = false; break;
                            case "IdArchivoTarjetaDetalle": columna.Visible = false; break;
                        }
                        dgv.Columns.Add(columna);
                        columna.DataPropertyName = columna.Name;  
                                  // esta propiedad es la permite enlazar la columna del datagridview con el 
                                  // con la columna del datasource: definida en la creacion de dataset
               
                    }
                    break;
                }

               
                DataGridViewCheckBoxColumn doWork = new DataGridViewCheckBoxColumn();
                doWork.Name = "CONCILIAR";
                doWork.HeaderText = "CONCILIAR";
                doWork.FalseValue = "0";
                doWork.TrueValue = "1";
                doWork.DataPropertyName = "CONCILIAR";  
                dgv.Columns.Add(doWork);

            } //crea_encabezados

            // Modificamos los Encabezados de las columnas
            foreach (DataGridViewColumn item in dgv.Columns)
            {
                   item.HeaderText = item.HeaderText.Replace("_", " ");
            }
            dgv.DataSource = p_BindingSource;
            dgv.AutoResizeRowHeadersWidth(DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders);

            dataGridView1_ConciliacionAutomatica_Inicilizacion();


            }
            catch (Exception ex)
            {
                var st = new StackTrace(ex, true);
                var frame = st.GetFrame(0);
                Trace.TraceError("Error Linea " + frame.GetFileLineNumber().ToString() + " columna " +  frame.GetFileColumnNumber().ToString());
                Trace.TraceError(ex.ToString());
                throw; 
            }
           
        }

        private void dataGridView1_ConciliacionAutomatica_Inicilizacion()
        {


            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                var row = item;
                switch (row.Cells["NIVEL"].Value.ToString())
                {
                    case "-1": row.Cells["CONCILIAR"].Value = false;
                        row.ReadOnly = true;
                        row.DefaultCellStyle.BackColor = Color.White;
                        row.DefaultCellStyle.ForeColor = Color.Black;
                        break;
                    case "1": row.DefaultCellStyle.BackColor = Color.DarkGreen;
                        row.DefaultCellStyle.ForeColor = Color.White;
                        row.Cells["CONCILIAR"].Value = true;
                        break;
                    case "2": row.DefaultCellStyle.BackColor = Color.LightBlue; break;
                    case "3": row.DefaultCellStyle.BackColor = Color.Orange; break;
                    case "4": row.DefaultCellStyle.BackColor = Color.OrangeRed; break;
                    default:
                        row.Cells["CONCILIAR"].Value = false;
                        row.ReadOnly = true;
                        row.DefaultCellStyle.BackColor = Color.White;
                        row.DefaultCellStyle.ForeColor = Color.Black;
                        break;
                }
                row.Cells["FECHA_PAGO"].Value = row.Cells["FECHA_PAGO"].Value.ToString().Remove(10);
            }
        }

        public void cargarDataGridViewConciliaciones(DataGridView dgv, IEnumerable<Object> lista)
        {

            //dgv.Rows.Clear();
            dgv.Columns.Clear();

            foreach (var item in lista)
            {

                Type t = item.GetType();
                PropertyInfo[] pi = t.GetProperties();

                foreach (PropertyInfo p in pi)
                {
                    DataGridViewColumn columna = new DataGridViewColumn();
                    DataGridViewCell cell = new DataGridViewTextBoxCell();
                    columna.CellTemplate = cell;
                    columna.Name = p.Name;
                    columna.HeaderText = p.Name;
                    columna.ReadOnly = true;
                    columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna);
                }
                break;
            }



            foreach (object item in lista)
            {
                var row = dgv.Rows.Add();
                Type t = item.GetType();
                PropertyInfo[] pi = t.GetProperties();
                foreach (PropertyInfo p in pi)
                {
                    Console.WriteLine(p.Name + " " + p.GetValue(item, null));
                    dgv.Rows[row].Cells[p.Name].Value = p.GetValue(item, null);
                }
            }

            // Modificamos los Encabezados de las columnas
            foreach (DataGridViewColumn item in dgv.Columns)
            {
                item.HeaderText = item.HeaderText.Replace("_", " ");
            }
                

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
                    cb.Items.Add ( p.GetValue(item, null));
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

        private void btnSelecccionarArchivoTarjeta_Click(object sender, EventArgs e)
        {
            this.btnSelecccionarArchivoTarjeta.Enabled = false;
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                /* MessageBox.Show ( openFileDialog1.FileName); */
            nombreArchivo = openFileDialog1.FileName;
                txtNombreArchivoTarjeta.Text = openFileDialog1.FileName;
                Cursor.Current = Cursors.WaitCursor;
                Application.DoEvents();
                procesarArchivo(openFileDialog1.FileName);
                Cursor.Current = Cursors.Default;
                this.dataGridView1.Focus(); // hacemos foco en la grilla para evitar errores re seleccion de archivo
            }
            this.btnSelecccionarArchivoTarjeta.Enabled = true;

        }


        public string nombreArchivo { get; set; }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

            this.dataGridView1.DataSource = "";
            this.lblDgv1Registros.Text = "Registros: " + this.dataGridView1.Rows.Count;
            this.txtFormato.Text = this.cbtipoConciliacion.Text; 
            switch (cbtipoConciliacion.Text )
            {
                case "Manual":
                    this.txtNombreArchivoTarjeta.Text = "";
                    this.btnSelecccionarArchivoTarjeta.Enabled = false;
                    var listadeViajesaConciliar = serviceConciliaciones.ObtenerViajesaConciliar();
                    //cargarDataGridViewCupones(dataGridView1, listadeViajesaConciliar, modoEdicion.Text ); 
                    cargarDataGridViewCupones_ADGV (dataGridView1, listadeViajesaConciliar, modoEdicion.Text,this.dataSet1 , this.bindingSource1 );
                    break;
                case "Todo Pago":
                    this.txtNombreArchivoTarjeta.Text = "";
                    this.btnSelecccionarArchivoTarjeta.Enabled = false;
                    var listadeViajesaConciliarTodoPago = this.un_ServiceConciliacionTodoPago.ObtenerViajesaConciliar();
                    //cargarDataGridViewCuponesTodoPago(dataGridView1, listadeViajesaConciliarTodoPago, modoEdicion.Text);
                    cargarDataGridViewCuponesTodoPago_ADGV (dataGridView1, listadeViajesaConciliarTodoPago, modoEdicion.Text,this.dataSet1 , this.bindingSource1 );
                    break;
                default:
                    this.cbtipoConciliacion.Enabled = true;   
                    this.txtNombreArchivoTarjeta.Text = "";
                    this.btnSelecccionarArchivoTarjeta.Enabled = true;
                    this.btnSelecccionarArchivoTarjeta.PerformClick();
                    break;
            }


            this.lblDgv1Registros.Text = "Registros: " + this.dataGridView1.Rows.Count;
        }


        /*
        Visa
        Master
        Manual
        Todo Pago
        Amca Amex
        Amca Visa
        Amca Master
         */

        private void procesarArchivo(String pNombreArchivo )
        {
            ArchivoTarjeta miArchivo;
            switch (cbtipoConciliacion.Text)
            {
                case "Amca Amex": miArchivo = new ArchivoTarjetaAMCA(new ArchivoTarjetaAmex(), cbtipoConciliacion.Text); break;
                case "Amca Visa": miArchivo = new ArchivoTarjetaAMCA(new ArchivoTarjetaVisa(), cbtipoConciliacion.Text); break;
                case "Amca Master": miArchivo = new ArchivoTarjetaAMCA(new ArchivoTarjetaMaster(), cbtipoConciliacion.Text); break;
                case "Visa":
                    miArchivo = new ArchivoTarjetaVisa();
                    break;
                case "Master":
                    miArchivo = new ArchivoTarjetaMaster();
                    break;
                default :
                    MessageBox.Show("Debe seleccionar el tipo de conciliación.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return; 
            }

            // realizar apertura del archivo lectura del contenido en forma generica
            miArchivo.AbrirArchivo(pNombreArchivo, this.txtdsUsuario.Text);
            Console.WriteLine(miArchivo.miArchivoTarjeta.formato  +" " +  miArchivo.miArchivoTarjeta.nombrearchivo);
            
            this.serviceConciliacionesAutomaticas.procesarArchivo(miArchivo);
            this.serviceConciliacionesAutomaticas.ConcilialiarAutomaticaticamente(miArchivo.miArchivoTarjeta);
            var listadeViajesaConciliar1 = this.serviceConciliacionesAutomaticas.ObtenerViajesNoConciliadosAutomaticamente(miArchivo.miArchivoTarjeta.id);
            var listadeViajesaConciliar2 = this.serviceConciliacionesAutomaticas.ObtenerViajesConciliadosAutomaticamente(miArchivo.miArchivoTarjeta.id);
            var  listadeViajesaConciliar3 = listadeViajesaConciliar1.Concat(listadeViajesaConciliar2);

            this.progressBar1.Minimum = 0;
            this.progressBar1.Maximum = listadeViajesaConciliar3.Count();  //  listadeViajesaConciliar1.Count()  +  listadeViajesaConciliar2.Count();  
            this.progressBar1.Visible = true;

                                                                                                                                  
            
            cargarDataGridViewConciliacionAutomatica(dataGridView1, listadeViajesaConciliar3, modoEdicion.Text, true
                , this.dataSet1, this.bindingSource1);
                
            //cargarDataGridViewConciliacionAutomatica(dataGridView1, listadeViajesaConciliar1, modoEdicion.Text, true);
            //cargarDataGridViewConciliacionAutomatica(dataGridView1, listadeViajesaConciliar2, modoEdicion.Text, false);
            this.progressBar1.Visible = false;
            this.txtIdArchivo.Text = miArchivo.miArchivoTarjeta.id.ToString();
            // obtener los viajes conciliados automaticamente mas  

        }

        private void statusStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void statusbar_servidor_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label13_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_ColumnAdded(object sender, DataGridViewColumnEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_FilterStringChanged(object sender, EventArgs e)
        {

            this.bindingSource1.Filter = this.dataGridView1.FilterString;
            this.lblDgv1Registros.Text = "Registros: " + this.bindingSource1.List.Count.ToString();
            // Habilitamos el Evento que realizar el formateo

          

        }

        private void dataGridView1_SortStringChanged(object sender, EventArgs e)
        {

            this.bindingSource1.Sort = this.dataGridView1.SortString;
            // Habilitamos el Evento que realizar el formateo


        }

        private void button1_Click(object sender, EventArgs e)
        {
            FrmBuscarComprobantes miFrmBuscarComprobantes = new FrmBuscarComprobantes();
            miFrmBuscarComprobantes.Show ();
        }



   
    }
}
