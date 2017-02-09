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

namespace SGLibrary
{
    public partial class FormularioBase1 : Form
    {


        public ServiceModel serviceModel { get; set; }
        


        public FormularioBase1()
        {
            InitializeComponent();
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
                //this.statusbar_version.Text = Application.

            }

            
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

                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        foreach (DataGridViewRow row in dataGridView2.SelectedRows)
                        {
                            this.modoEdicion.Text = "SI";
                            Object  una_registro = serviceModel.ObtenerRegistro  (row.Cells["ID"].Value.ToString());
                            
                        }
                        deshabilitarycolorearGrillaABM ();
                        break;
                    }
                case "ADD":
                    {
                        this.modoEdicion.Text = "NO";

                        this.cbtipoConciliacion.Visible = true;
                        this.cbtipoConciliacion.Enabled = true;
                        this.txtdsUsuario.Text = serviceModel.Usuario;
                        this.txtnrCajaAdm.Text = serviceModel.CajaAdm;
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        dataGridView1.Columns.Clear();
                        botonesForm1.configMododeEdicion(ABMBotonesForm.ADD);
                        break;
                    }
                case "FIND":
                    {
                        
                        var listadeRegistros = serviceModel.ObtenerRegistros  (this.fechadesde.Value, this.fechahasta.Value, "CLAVE");
                        cargarDataGridViewConciliaciones(dataGridView2, listadeRegistros);
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
                            if (!ediciondeRegistro()) break;
                        }

                        
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

                            
                            Object  un_registro = serviceModel.ObtenerRegistro  (row.Cells["ID"].Value.ToString());
                            DialogResult dialogResult = MessageBox.Show("Confirma la eliminación del registro " + un_registro.ToString(), "Atención", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                            if (dialogResult == DialogResult.No) break;
                            // COMLETAR ELIMINACION
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
                        case "Manual":
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


            

            return true;
        }


        public Boolean ediciondeRegistro()
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
                listaCupones.Add(Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString()));
            }

            if (listaCuponesConciliados.Count() == 0)
            {
                MessageBox.Show("Debe seleccionar algún comprobante");
                dataGridView1.Focus();
                return false;
            }

            var una_conciliacion = new TB_Conciliacion();
            una_conciliacion.dtConciliacion = this.cbdtConciliacion.Value;
            una_conciliacion.IdConciliacion = int.Parse(this.txtIdConciliacion.Text);


           
            return true;
        }

        public void cargarDataGridViewCupones(DataGridView dgv, IEnumerable<Object> lista, String p_modoEdicion)
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

            if (p_modoEdicion != "SI")
            {
                CalendarColumn doWork1 = new CalendarColumn();
                doWork1.Name = "FECHA_ACREDITACION";
                doWork1.HeaderText = "FECHA DE ACREDITACION";
                doWork1.DefaultCellStyle.Format = "d";
                dgv.Columns.Add(doWork1);
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

                if (p_modoEdicion == "SI")
                {
                    dgv.Rows[row].Cells["CONCILIAR"].Value = true;
                    dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value = dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value.ToString().Remove(10);
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

                    if (p_modoEdicion != "SI")
                    {
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

                if (p_modoEdicion == "SI")
                {
                    dgv.Rows[row].Cells["CONCILIAR"].Value = true;
                    dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value = dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value.ToString().Remove(10);
                }
                else
                {
                    dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value = dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value.ToString();
                    DateTime dt;
                    DateTime.TryParse(dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value.ToString(), out dt);
                    dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value = dt.AddDays(10);
                }

            }


        }


        public void cargarDataGridViewConciliacionAutomatica(DataGridView dgv, IEnumerable<Object> lista, String p_modoEdicion, bool crea_encabezados)
        {



            try
            {
                Trace.TraceInformation(dgv.ToString());
                Trace.TraceInformation(lista.ToString());


                if (crea_encabezados)
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
                            switch (columna.Name)
                            {
                                case "NIVEL": columna.Visible = false; break;
                                case "IdArchivoTarjetaDetalle": columna.Visible = false; break;
                            }
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

                } //crea_encabezados

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
                    }

                    switch (dgv.Rows[row].Cells["NIVEL"].Value.ToString())
                    {
                        case "-1": dgv.Rows[row].Cells["CONCILIAR"].Value = false;
                            dgv.Rows[row].ReadOnly = true;
                            dgv.Rows[row].DefaultCellStyle.BackColor = Color.White;
                            dgv.Rows[row].DefaultCellStyle.ForeColor = Color.Black;
                            break;
                        case "1": dgv.Rows[row].DefaultCellStyle.BackColor = Color.DarkGreen;
                            dgv.Rows[row].DefaultCellStyle.ForeColor = Color.White;
                            dgv.Rows[row].Cells["CONCILIAR"].Value = true;
                            break;
                        case "2": dgv.Rows[row].DefaultCellStyle.BackColor = Color.LightBlue; break;
                        case "3": dgv.Rows[row].DefaultCellStyle.BackColor = Color.Orange; break;
                        case "4": dgv.Rows[row].DefaultCellStyle.BackColor = Color.OrangeRed; break;
                        default:
                            dgv.Rows[row].Cells["CONCILIAR"].Value = false;
                            dgv.Rows[row].ReadOnly = true;
                            dgv.Rows[row].DefaultCellStyle.BackColor = Color.White;
                            dgv.Rows[row].DefaultCellStyle.ForeColor = Color.Black;
                            break;
                    }

                    dgv.Rows[row].Cells["FECHA_PAGO"].Value = dgv.Rows[row].Cells["FECHA_PAGO"].Value.ToString().Remove(10);

                }


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


        

        public string nombreArchivo { get; set; }



        private void statusStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void statusbar_servidor_Click(object sender, EventArgs e)
        {

        }


    }
}
