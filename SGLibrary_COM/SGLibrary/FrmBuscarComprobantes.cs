using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Windows.Forms;

namespace SGLibrary
{
    public partial class FrmBuscarComprobantes : Form
    {
        public FrmBuscarComprobantes()
        {
            InitializeComponent();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {

            var txtBuscar = this.txtnrCuponPosnet.Text.Trim() + this.txtnrTarjeta.Text.Trim() + this.txtnrLicencia.Text.Trim() + this.txtFactura.Text.Trim();
            if (txtBuscar.Trim().Length == 0)
            {
                MessageBox.Show(this, "Debe ingresar algún campo de búsqueda", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.txtnrCuponPosnet.Focus();
                return;
            }

            ServiceCupones miServiceCupones = new ServiceCupones ();
            var listaViajes = miServiceCupones.BuscarViajes(this.fechadesde.Value, this.fechahasta.Value, this.cbEmpresa.Text,
                                          this.txtnrCuponPosnet.Text, this.txtnrTarjeta.Text, this.txtnrLicencia.Text , this.txtFactura.Text );
            cargarDataGridView(this.dataGridView1, listaViajes);
        }

        public void cargarDataGridView(DataGridView dgv, IEnumerable<Object> lista)
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

        private void txtFactura_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtnrLicencia_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtnrTarjeta_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtnrCuponPosnet_TextChanged(object sender, EventArgs e)
        {

        }

        private void cbEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void fechahasta_ValueChanged(object sender, EventArgs e)
        {

        }

        private void fechadesde_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}
