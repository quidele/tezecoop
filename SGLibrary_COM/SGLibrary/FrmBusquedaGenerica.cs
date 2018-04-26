using SGLibrary.GUIUtilities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SGLibrary
{
    public partial class FrmBusquedaGenerica : Form
    {

        public IEnumerable<Object> ListaSeleccion{ get; set; }
        public Dictionary<string, ADGVFieldAdapter> ListaCampoTipo { get; set; }
        public List<String> ListaResultado { get; set; }
        public Boolean MuestraIndice { get; set; }
        
        public FrmBusquedaGenerica()
        {
            InitializeComponent();
            this.ListaResultado = new List<String>();
        }

        private void FrmBusquedaGenerica_Load(object sender, EventArgs e)
        {
            ADGVInicilizations.CargarDataGridView(this.dgv, this.ListaSeleccion, this.dataSet1, this.bindingSource1, ListaCampoTipo, this.MuestraIndice);
        }

        private void dgv_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            foreach (DataGridViewRow row in this.dgv.SelectedRows)
            {
                ListaResultado.Add(row.Cells[0].Value.ToString());
            }
            this.Hide();
        }
    }
}
