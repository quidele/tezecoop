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
using Microsoft.VisualBasic;
using System.Threading;


namespace SGLibrary
{
    public partial class FrmPresentacionesCAI : Form
    {


        public ServiceCAI serviceModel { get; set; }
        private TB_PresentacionesCAI una_presentacion_actual;



        public FrmPresentacionesCAI()
        {
            InitializeComponent();
            // inicializamos el servicio pricinpal para el form
        }

        private void FrmConciliaciones_Load(object sender, EventArgs e)
        {

            using (var context = new dbSG2000Entities())
            {
                this.statusbar_bd.Text = "Base de datos: " + context.Database.Connection.Database;
                this.statusbar_servidor.Text = "Base de datos: " + context.Database.Connection.DataSource;
                this.statusbar_usuario.Text = "usuario: " + serviceModel.Usuario;
                this.statusbar_nrocaja.Text = "Caja Nro: " + serviceModel.CajaAdm;
                this.statusbar_version.Text = "Versión: " + typeof(SGLibrary.ServiceModel).Assembly.GetName().Version.ToString();

            }

            cargarCombo ( this.cbUsuarios, serviceModel.obtenerUsuarios() );

            botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
            this.panelcarga.Visible = false;
            this.panelbusqueda.Visible = true;
            this.fechadesde.Value = DateTime.Now.AddDays(-30).Date;
            this.fechahasta.Value = DateTime.Now.Date;
            this.botonesForm1.InicializarFindBoton();
        }



        public void deshabilitarycolorearGrillaABM()
        {
            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
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

            switch (miboton.Tag.ToString())
            {
                case "EDIT":
                    {
                        TB_PresentacionesCAI un_registro=null;
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.EDIT);
                        foreach (DataGridViewRow row in dataGridView2.SelectedRows)
                        {
                            this.modoEdicion.Text = "SI";
                            un_registro = (TB_PresentacionesCAI)serviceModel.ObtenerRegistro(row.Cells["ID"].Value.ToString());
                            una_presentacion_actual = un_registro;
                        }
                        
                        this.txtdsUsuario.Text = un_registro.dsUsuario;
                        this.txtflEstado.Text = un_registro.flestado;
                        this.txtIdPresentacion.Text = un_registro.IdPresentacion.ToString();
                        this.txtnrAnio.Text = un_registro.nrAnio.ToString();
                        this.cbnrMes.Text =   Strings.Right ("0" +  un_registro.nrMes.ToString(),2);
                        this.cbdtPresentacion.Enabled = false;
                        this.txtnrAnio.Enabled = false;
                        this.cbnrMes.Enabled = false;
                        this.btnObtenerResumenEstadoCAIs.Enabled = false;

                        var resultado = serviceModel.ObtenerDetalle(un_registro.IdPresentacion.ToString());
                        cargarDataGridViewEdicion(dataGridView1, resultado, this.modoEdicion.Text);
                        deshabilitarycolorearGrillaABM();
                        break;
                    }
                case "ADD":
                    {
                        this.modoEdicion.Text = "NO";
                        this.txtdsUsuario.Text = serviceModel.Usuario;
                        this.txtnrCajaAdm.Text = serviceModel.CajaAdm;
                        this.txtflEstado.Text = "A";
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        dataGridView1.Columns.Clear();
                        botonesForm1.configMododeEdicion(ABMBotonesForm.ADD);
                        break;
                    }
                case "FIND":
                    {
                        var listadeRegistros = serviceModel.ObtenerRegistros(this.fechadesde.Value, this.fechahasta.Value, this.cbUsuarios.Text);
                        cargarDataGridViewBusqueda(dataGridView2, listadeRegistros);
                        this.modoEdicion.Text = "NO";
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        break;

                    }

                case "OK":
                    {
                        if (this.modoEdicion.Text == "NO")
                        {
                            if (!altadeRegistro()) break;
                        }
                        else
                        {
                            //if (!ediciondeRegistro()) break;
                        }

                        MessageBox.Show("La presetanción se ha guardado con éxito, se procedera a generar el archivo.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);


                        this.progressBar1.Minimum = 1;
                        this.progressBar1.Maximum = 10;
                        this.progressBar1.Visible = true;
                        Thread t = new Thread(delegate()
                            {
                                int i = 0;
                                while (true)
                                {
                                    if (i < this.progressBar1.Maximum)
                                         i++;
                                    else
                                         i=10;

                                    MethodInvoker m = new MethodInvoker(() => { progressBar1.Value = i;
                                    progressBar1.Refresh(); this.Refresh(); this.progressBar1.PerformLayout();
                                    this.progressBar1.PerformStep();  Application.DoEvents();
                                    });
                                    progressBar1.Invoke(m) ;
                                }
                            });
                        t.Start();
                        Thread.Sleep(1000);
                        spu_generarPresentacionCAI_v4_9_4_Result resultado = serviceModel.generarPresentacionCAI(una_presentacion_actual.IdPresentacion);
                        t.Suspend();
                        this.progressBar1.Visible = false;
                        if (resultado.resultado.CompareTo ( "OK")==0)
                            MessageBox.Show(resultado.Descrip, "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        else
                            MessageBox.Show(resultado.Descrip, "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);

                        cargarCombo(this.cbUsuarios, serviceModel.obtenerUsuarios());
                        this.modoEdicion.Text = "NO";
                        var btnFind = new ToolStripButton();
                        btnFind.Tag = "FIND";
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
                            TB_PresentacionesCAI un_registro = (TB_PresentacionesCAI)serviceModel.ObtenerRegistro(row.Cells["ID"].Value.ToString());
                            DialogResult dialogResult = MessageBox.Show("Confirma la eliminación de la presentación " + un_registro.IdPresentacion, "Atención", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                            if (dialogResult == DialogResult.No) break;
                            // COMLETAR ELIMINACION
                            // serviceModel.anularPresentacion
                            serviceModel.AnularRegistro(un_registro);
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




        public Boolean altadeRegistro()
        {
            if (!validarEntradadeDatos())
                return false;
            

            List<TB_PresentacionesCAIDetalle> lista = new List<TB_PresentacionesCAIDetalle>();
            /*  validar a nivel de Items*/
            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                TB_PresentacionesCAIDetalle un_TB_PresentacionesCAIDetalle = new TB_PresentacionesCAIDetalle ();
                un_TB_PresentacionesCAIDetalle.nrCAI =  item.Cells["CAI"].EditedFormattedValue.ToString();
                un_TB_PresentacionesCAIDetalle.PDV =  item.Cells["PDV"].EditedFormattedValue.ToString(); 
                un_TB_PresentacionesCAIDetalle.Letra  = item.Cells["Letra"].EditedFormattedValue.ToString();
                un_TB_PresentacionesCAIDetalle.nrUltNroComprobante = int.Parse ( item.Cells["UltNroComprobante"].EditedFormattedValue.ToString()) ;
                un_TB_PresentacionesCAIDetalle.dtInsercion = DateTime.Today;
                un_TB_PresentacionesCAIDetalle.tpComprobante  = item.Cells["DOC"].EditedFormattedValue.ToString();
                lista.Add (un_TB_PresentacionesCAIDetalle);

            }

            if ((lista.Count() == 0))
            {
                MessageBox.Show("Debe poseer la informacion de la a presentar.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                dataGridView1.Focus();
                return false;
            }

            TB_PresentacionesCAI una_presentacion = new TB_PresentacionesCAI();
            una_presentacion.nrAnio = int.Parse(this.txtnrAnio.Text);
            una_presentacion.nrMes = int.Parse(this.cbnrMes.Text); 
            una_presentacion.dtPresentacion = this.cbdtPresentacion.Value.Date;
            una_presentacion.flestado = "A";
            una_presentacion.dsUsuario = serviceModel.Usuario;
            una_presentacion.dtModificacion = DateTime.Now;
            una_presentacion.TB_PresentacionesCAIDetalle = lista;
            //serviceModel.agregarPresentacionCAI(una_presentacion, lista);
            serviceModel.AgregarRegistro(una_presentacion);
            una_presentacion_actual = una_presentacion;
            return true;
        }

        private bool validarEntradadeDatos()
        {

            if (!Information.IsNumeric(this.cbnrMes.Text))
            {
                MessageBox.Show("El mes ingresado no es válido", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.cbnrMes.Focus();
                return false;
            }

            if (!Information.IsNumeric(this.txtnrAnio.Text))
            {
                MessageBox.Show("El año ingresado no es válido", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.cbnrMes.Focus();
                return false;
            }

            return true;
        }


        public Boolean ediciondeRegistro()
        {
            List<Decimal> listaClaveRegistros = new List<Decimal>();

            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                // Si existen modificaciones agregar a la lista    
                listaClaveRegistros.Add(Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString()));
            }

            if (listaClaveRegistros.Count() == 0)
            {
                MessageBox.Show("Debe seleccionar algún registro");
                dataGridView1.Focus();
                return false;
            }

            return true;
        }

        public void cargarDataGridViewEdicion(DataGridView dgv, IEnumerable<Object> lista, String p_modoEdicion)
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


        }


        public void cargarDataGridViewBusqueda(DataGridView dgv, IEnumerable<Object> lista)
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

        private void botonesForm1_Load(object sender, EventArgs e)
        {

        }

        private void btnObtenerResumenEstadoCAIs_Click(object sender, EventArgs e)
        {

            if (!validarEntradadeDatos())
                return;
            
            var listadeRegistros = this.serviceModel.obtenerEstadoCAIs( int.Parse(this.cbnrMes.Text) , int.Parse(this.txtnrAnio.Text) );

            cargarDataGridViewEdicion(dataGridView1, listadeRegistros , this.modoEdicion.Text);
            deshabilitarycolorearGrillaABM();
        }

        private void progressBar1_Click(object sender, EventArgs e)
        {

        }



    } // Cierre declaracion Clase 
} // Cierre namespace
