using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Reflection;
using SGLibrary.ArchivoTarjetas;
using SGLibrary.Extensiones;

namespace SGLibrary
{
    public partial class FrmXLSSelect : Form
    {

        public Boolean  bProcesa;
        public ServiceExcel miServiceXLS;
        

        public FrmXLSSelect()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // Cargamos las hojas disponibles para el archivo XLS 
            // cargarCombo(this.cbHojas, miServiceXLS.obtenerNombresHojas());
            this.cbHojas.Items.AddRange(miServiceXLS.obtenerNombresHojas().ToArray<String>()  ); 
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
                    cb.Items.Add(item);
                }
            }

        }

        private void cbHojas_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Configuramos la hoja 
            miServiceXLS.SeleccionaHoja(cbHojas.Text );
            List<RelColumnasXLSSAT> listaColumansXLS = miServiceXLS.ObtenerNombresdeColumnas();
            cargarDataGridViewAsignacionColummasXLSaTarjeta(this.dataGridViewRelColumnasXLSaTarjeta, listaColumansXLS); 

        }




        public void cargarDataGridViewAsignacionColummasXLSaTarjeta(DataGridView dgv, IEnumerable<Object> lista)
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

            DataGridViewComboBoxColumn cmb = new DataGridViewComboBoxColumn();
            cmb.HeaderText = "Columna Tarjeta";
            cmb.Name = "colTarjeta";
            cmb.MaxDropDownItems = 4;

            cmb.Items.Add("");
            cmb.Items.AddRange  ( ArchivoTarjeta.ObtenerColumnasArchivoTarjeta ().ToArray <String> ()  );
            
                            
            dgv.Columns.Add(cmb);

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

                //if (p_modoEdicion == "SI")
                //{
                //    dgv.Rows[row].Cells["CONCILIAR"].Value = true;
                //    dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value = dgv.Rows[row].Cells["FECHA_ACREDITACION"].Value.ToString().Remove(10);
                //}

            }


        }

    } // Fin de la clase 
}
