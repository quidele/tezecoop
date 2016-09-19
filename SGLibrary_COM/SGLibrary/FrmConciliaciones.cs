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

namespace SGLibrary
{
    public partial class FrmConciliaciones : Form
    {


        public ServiceConciliacion serviceConciliaciones { get; set; }
        public ServiceConciliacionAutomatica serviceConciliacionesAutomaticas { get; set; }

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
            }

            cargarCombo(this.cbUsuariosConciliaciones, serviceConciliaciones.obtenerUsuariosConciliaciones());
            botonesForm1.configMododeEdicion( ABMBotonesForm.FIND);
            this.panelcarga.Visible = false;
            this.panelbusqueda.Visible = true;
            this.fechadesde.Value = DateTime.Now.AddDays(-30).Date;
            this.fechahasta.Value = DateTime.Now.Date;
            this.botonesForm1.InicializarFindBoton();
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
            this.cbtipoConciliacion.Visible = true;
            this.cbtipoConciliacion.Enabled = true;
            this.txtFormato.Visible = false;
            this.btnSelecccionarArchivoTarjeta.Enabled = true;
            //MessageBox.Show("tocaste un boton, boton " + miboton.Name + " TAB " + miboton.Tag); 



            switch (miboton.Tag.ToString ()){
                case "EDIT" : {
                    
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
                            this.cbtipoConciliacion.Visible = false;
                            this.txtFormato.Visible = true;
                            this.txtFormato.Text = una_conciliacion.TB_ArchivoTarjeta.formato.Trim();
                            this.txtNombreArchivoTarjeta.Text = una_conciliacion.TB_ArchivoTarjeta.nombreArchivoCompleto;
                        }
                        else {
                            this.txtFormato.Text = "Manual";
                        }

                      
                        if (una_conciliacion.flestado =="E"){
                            botonesForm1.configMododeEdicion(ABMBotonesForm.VIEW);
                            this.panelcarga.Enabled = false;
                        }
                        else {
                            this.cbtipoConciliacion.Enabled = false;
                            this.btnSelecccionarArchivoTarjeta.Enabled = false;
                            botonesForm1.configMododeEdicion(ABMBotonesForm.EDIT);
                        }

                        if (una_conciliacion.idArchivo.ToString() != "")
                        {
                            cargarDataGridViewConciliacionAutomatica(dataGridView1, serviceConciliacionesAutomaticas.ObtenerDetalleConciliacionAutomatica(una_conciliacion.IdConciliacion), this.modoEdicion.Text);
                        }
                        else
                        {
                            cargarDataGridViewCupones(dataGridView1, serviceConciliaciones.ObtenerDetalleConciliacion(una_conciliacion.IdConciliacion), this.modoEdicion.Text);
                        }

                    }

                    deshabilitarycolorearCompensados();
                    break;
                }
                case "ADD":
                    {
                        this.modoEdicion.Text = "NO";
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
                        var listadeConciliaciones = serviceConciliaciones.obtenerConciliaciones(this.fechadesde.Value, this.fechahasta.Value , this.cbUsuariosConciliaciones.Text   );
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
                            TB_Conciliacion una_conciliacion = serviceConciliaciones.obtenerConciliacion(row.Cells["ID"].Value.ToString());
                            DialogResult dialogResult = MessageBox.Show("Confirma la eliminación de la conciliación " + una_conciliacion.IdConciliacion.ToString(), "Atención", MessageBoxButtons.YesNo ,MessageBoxIcon.Question);
                             if(dialogResult == DialogResult.No ) break; 
                            // COMLETAR ELIMINACION
                             serviceConciliaciones.anularConciliacion(una_conciliacion);
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
                case "EXIT":
                    {
                        this.Close();
                        break;
                    }
            } 

        }


        public Boolean  altadeconciliacion()
        {

            List<Decimal> lista = new List<Decimal>();
            List<TB_ConciliacionDetalle> listaAutomatica = new List<TB_ConciliacionDetalle>();

            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                Console.WriteLine(item.Cells["CONCILIAR"].EditedFormattedValue);
                if (item.Cells["CONCILIAR"].EditedFormattedValue.ToString() == "True")
                {
                   
                    if (this.cbtipoConciliacion.Text != "Manual") 
                    {
                        TB_ConciliacionDetalle una_TB_ConciliacionDetalle = new TB_ConciliacionDetalle();
                        una_TB_ConciliacionDetalle.nrCupon = Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString());
                        una_TB_ConciliacionDetalle.IdArchivoTarjetaDetalle = long.Parse(item.Cells["IdArchivoTarjetaDetalle"].EditedFormattedValue.ToString());
                        una_TB_ConciliacionDetalle.fechaPago = DateTime.Parse(item.Cells["FECHA_PAGO"].EditedFormattedValue.ToString());
                        listaAutomatica.Add (una_TB_ConciliacionDetalle);
                    }
                    else
                    {
                        lista.Add(Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString()));
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
            if (this.cbtipoConciliacion.Text != "Manual")
            {
                // si estamos en una conciliacion automatica
                una_conciliacion.idArchivo = int.Parse(this.txtIdArchivo.Text); // Asignamos el idArchivo de la conciliacion automatica
                serviceConciliacionesAutomaticas.agregarConciliacion(listaAutomatica, una_conciliacion);
            }
            else // Conciliacion manual
            {
                serviceConciliaciones.agregarConciliacion(lista, una_conciliacion);
            }
            return true;
        }


        public Boolean ediciondeconciliacion()
        {
            List<Decimal> listaCupones = new List<Decimal>();
            List<Decimal> listaCuponesConciliados = new List<Decimal>();

            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                Console.WriteLine(item.Cells["CONCILIAR"].EditedFormattedValue);
                if (item.Cells["CONCILIAR"].EditedFormattedValue.ToString() == "True" && item.Cells["COMPENSADO"].EditedFormattedValue.ToString() == "NO")
                {
                    listaCuponesConciliados.Add(Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString()));
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
                if (this.txtFormato.Text == "Manual")
                    serviceConciliaciones.modificarConciliacion(listaCupones, listaCuponesConciliados, una_conciliacion);
                else
                    serviceConciliacionesAutomaticas.modificarConciliacionAutomatica(listaCupones, listaCuponesConciliados, una_conciliacion);

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
                }


            }


        }


        public void cargarDataGridViewConciliacionAutomatica(DataGridView dgv, IEnumerable<Object> lista, String p_modoEdicion)
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
                    switch (    columna.Name )
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

            var i=0;

            foreach (object item in lista)
            {
                this.progressBar1.BringToFront();
                dgv.Refresh();
                System.Threading.Thread.Sleep(10);
        
                this.progressBar1.Increment(i++);
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
                }

                switch (dgv.Rows[row].Cells["NIVEL"].Value.ToString())
                {
                    case "1": dgv.Rows[row].DefaultCellStyle.BackColor = Color.DarkGreen;
                               dgv.Rows[row].Cells["CONCILIAR"].Value = true;
                        break;
                    case "2": dgv.Rows[row].DefaultCellStyle.BackColor = Color.LightBlue; break;
                    case "3": dgv.Rows[row].DefaultCellStyle.BackColor = Color.Orange; break;
                    case "4": dgv.Rows[row].DefaultCellStyle.BackColor = Color.OrangeRed; break;
                    default:
                 break;
	            }

                dgv.Rows[row].Cells["FECHA_PAGO"].Value = dgv.Rows[row].Cells["FECHA_PAGO"].Value .ToString().Remove(10);
       
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
                procesarArchivo(openFileDialog1.FileName);
            }
            this.btnSelecccionarArchivoTarjeta.Enabled = true;

        }


        public string nombreArchivo { get; set; }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (cbtipoConciliacion.Text )
            {
                case "Manual":
                    this.txtNombreArchivoTarjeta.Text = "";
                    this.btnSelecccionarArchivoTarjeta.Enabled = false;
                    var listadeViajesaConciliar = serviceConciliaciones.ObtenerViajesaConciliar();
                    cargarDataGridViewCupones(dataGridView1, listadeViajesaConciliar, modoEdicion.Text ); 
                    break;
                default:
                    this.cbtipoConciliacion.Enabled = true;
                    this.dataGridView1.Rows.Clear();
                    this.txtNombreArchivoTarjeta.Text = "";
                    this.btnSelecccionarArchivoTarjeta.Enabled = true;
                    this.btnSelecccionarArchivoTarjeta.PerformClick();
                    break;
            }
        }


        private void procesarArchivo(String pNombreArchivo )
        {
            ArchivoTarjeta miArchivo;
            switch (cbtipoConciliacion.Text)
            {
                case "Visa":
                    miArchivo = new ArchivoTarjetaVisa();
                    break;
                default :
                     miArchivo = new ArchivoTarjetaMaster();
                    break;

            }
            // realizar apertura del archivo lectura del contenido en forma generica
            miArchivo.AbrirArchivo(pNombreArchivo, this.txtdsUsuario.Text);
            Console.WriteLine(miArchivo.miArchivoTarjeta.formato  +" " +  miArchivo.miArchivoTarjeta.nombrearchivo);
            this.serviceConciliacionesAutomaticas.procesarArchivo(miArchivo); 
            this.serviceConciliacionesAutomaticas.ConcilialiarAutomaticaticamente(miArchivo.miArchivoTarjeta);

            var listadeViajesaConciliar = this.serviceConciliacionesAutomaticas.ObtenerViajesConciliadosAutomaticamente(miArchivo.miArchivoTarjeta.id);
            this.progressBar1.Minimum = 0;
            this.progressBar1.Maximum = listadeViajesaConciliar.Count();
            this.progressBar1.Visible = true;
            cargarDataGridViewConciliacionAutomatica (dataGridView1, listadeViajesaConciliar, modoEdicion.Text);
            this.progressBar1.Visible = false;

            this.txtIdArchivo.Text = miArchivo.miArchivoTarjeta.id.ToString();
            // obtener los viajes conciliados automaticamente mas  

        }

        private void statusStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }
    }
}
