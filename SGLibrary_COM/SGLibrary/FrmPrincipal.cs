using SGLibrary.Services;
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
    public partial class FrmPrincipal : Form
    {
        public FrmPrincipal()
        {
            InitializeComponent();
        }


        public ServiceModelGenerico<Obligaciones> serviceModel { get; set; }

        private void FrmPrincipal_Load(object sender, EventArgs e)
        {

        }

        private void busquedaDeComprobantesToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FrmBuscarComprobantes miFrmBuscarComprobantes = new FrmBuscarComprobantes();
            miFrmBuscarComprobantes.Show();
        }

        private void obligacionesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmObligaciones miFrmObligaciones = new FrmObligaciones ();
            miFrmObligaciones.serviceModel = this.serviceModel; 
            miFrmObligaciones.Show ();
            
        }

        private void conciliacionesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            

            FrmConciliaciones f1 = new FrmConciliaciones();
            f1.serviceConciliaciones = new ServiceConciliacion();
            f1.serviceConciliaciones.CajaActiva(this.serviceModel.CajaAdm);
            f1.serviceConciliaciones.UsuarioActivo(this.serviceModel.Usuario);
            f1.serviceConciliacionesAutomaticas = new ServiceConciliacionAutomatica();
            f1.serviceConciliacionesAutomaticas.CajaActiva(this.serviceModel.CajaAdm);
            f1.serviceConciliacionesAutomaticas.UsuarioActivo(this.serviceModel.Usuario);
            f1.un_ServiceConciliacionManual = new ServiceConciliacionManual();
            f1.un_ServiceConciliacionManual.CajaActiva(this.serviceModel.CajaAdm);
            f1.un_ServiceConciliacionManual.UsuarioActivo(this.serviceModel.Usuario);
            f1.un_ServiceConciliacionTodoPago = new ServiceConciliacionTodoPago();
            f1.un_ServiceConciliacionTodoPago.CajaActiva(this.serviceModel.CajaAdm);
            f1.un_ServiceConciliacionTodoPago.UsuarioActivo(this.serviceModel.Usuario);
            f1.serviceConciliacionesAutomaticasAMCA = new ServiceConciliacionAutomaticaAMCA();
            f1.serviceConciliacionesAutomaticasAMCA.CajaActiva(this.serviceModel.CajaAdm);
            f1.serviceConciliacionesAutomaticasAMCA.UsuarioActivo(this.serviceModel.Usuario);
            f1.ShowDialog();
        }
    }
}
