using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Globalization;
using SGLibrary.Recursos_Localizables;


namespace ControlesdeUsuario
{
    public partial class BotonesForm : UserControl
    {


        public ABMBotonesForm MododeEdicion { get; set; }

        public BotonesForm()
        {
            InitializeComponent();
        }

        public delegate void ClickDelegateHandler(object sender, EventArgs e);
        public event ClickDelegateHandler ClickEventDelegateHandler;
 

        private void BotonesForm_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo("ES-ES");
            this.botonFIND.Text = StringResources.botonBuscarText;
            this.botonEDIT.Text = StringResources.botonEditarText;

            this.botonADD.Text = StringResources.botonADDText;
            this.botonDELETE.Text = StringResources.botonDELETEText;
            this.botonOK.Text = StringResources.botonOKText;
            this.botonCANCEL.Text = StringResources.botonCANCELText;
            this.botonPRINT.Text = StringResources.botonPRINTText;
            this.botonEXIT.Text = StringResources.botonEXITText;

            this.botonFIND.Image = StringResources.Image_btn_form_find;
            this.botonEDIT.Image = StringResources.Image_btn_form_edit;
            this.botonADD.Image = StringResources.Image_btn_form_add;
            this.botonDELETE.Image = StringResources.Image_btn_form_del;
            this.botonOK.Image = StringResources.Image_btn_form_ok;
            this.botonCANCEL.Image = StringResources.Image_form_cancel;
            this.botonPRINT.Image = StringResources.Image_btn_form_print;
            this.botonEXIT.Image = StringResources.Image_btn_form_exit;
        }


        public void InicializarFindBoton() {
            this.botonFIND.PerformClick();
        }

        

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            ClickEventDelegateHandler.Invoke(sender, e);
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            ClickEventDelegateHandler.Invoke(sender, e);
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            ClickEventDelegateHandler.Invoke(sender, e);
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            ClickEventDelegateHandler.Invoke(sender, e);
        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            ClickEventDelegateHandler.Invoke(sender, e);
        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {
            ClickEventDelegateHandler.Invoke(sender, e);
        }

        private void toolStripButton7_Click(object sender, EventArgs e)
        {
            ClickEventDelegateHandler.Invoke(sender, e);
        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        public void configMododeEdicion(ABMBotonesForm modo)
        {
            //this.MododeEdicion = modo;
            this.MododeEdicion = modo;
            switch (modo)
            {
                case ABMBotonesForm.FIND:
                    this.botonFIND.Visible = true;
                    this.botonEDIT.Visible = true;
                    this.botonFIND.Visible = true;
                    this.botonADD.Visible = true;
                    this.botonDELETE.Visible = true;
                    this.botonOK.Visible = false;
                    this.botonCANCEL.Visible = false;
                    this.botonPRINT.Visible = true;
                    this.botonEXIT.Visible = true;
                    this.botonEXCEL.Visible = true;
                    
                    break;
                case ABMBotonesForm.EDIT:
                    this.botonFIND.Visible = false;
                    this.botonEDIT.Visible = false;
                    this.botonFIND.Visible = false;
                    this.botonADD.Visible = false;
                    this.botonDELETE.Visible = false;
                    this.botonOK.Visible = true;
                    this.botonCANCEL.Visible = true;
                    this.botonPRINT.Visible = false;
                    this.botonEXIT.Visible = false;
                    break;
                case ABMBotonesForm.ADD:
                    this.botonFIND.Visible = false;
                    this.botonEDIT.Visible = false;
                    this.botonFIND.Visible = false;
                    this.botonADD.Visible = false;
                    this.botonDELETE.Visible = false;
                    this.botonOK.Visible = true;
                    this.botonCANCEL.Visible = true;
                    this.botonPRINT.Visible = false;
                    this.botonEXIT.Visible = false;
                    this.botonEXCEL.Visible = true;
                    break;
                case ABMBotonesForm.DELETE:
                    this.botonFIND.Visible = true;
                    this.botonEDIT.Visible = true;
                    this.botonADD.Visible = true;
                    this.botonDELETE.Visible = true;
                    this.botonOK.Visible = false;
                    this.botonCANCEL.Visible = false;
                    this.botonPRINT.Visible = true;
                    this.botonEXIT.Visible = false;
                    break;
                case ABMBotonesForm.SAVE:
                    this.botonFIND.Visible = true;
                    this.botonEDIT.Visible = true;
                    this.botonADD.Visible = true;
                    this.botonDELETE.Visible = true;
                    this.botonOK.Visible = false;
                    this.botonCANCEL.Visible = false;
                    this.botonPRINT.Visible = true;
                    this.botonEXIT.Visible = true;
                    this.botonEXCEL.Visible = true;
                    break;
                case ABMBotonesForm.CANCEL:
                    this.botonFIND.Visible = true;
                    this.botonEDIT.Visible = true;
                    this.botonEDIT.Visible = true;
                    this.botonADD.Visible = true;
                    this.botonDELETE.Visible = true;
                    this.botonOK.Visible = false;
                    this.botonCANCEL.Visible = false;
                    this.botonPRINT.Visible = true;
                    this.botonEXIT.Visible = true;
                    this.botonEXCEL.Visible = true;
                    break;
                case ABMBotonesForm.VIEW:
                    this.botonFIND.Visible = false;
                    this.botonEDIT.Visible = false;
                    this.botonFIND.Visible = false;
                    this.botonADD.Visible = false;
                    this.botonDELETE.Visible = false;
                    this.botonOK.Visible = false;
                    this.botonCANCEL.Visible = false;
                    this.botonPRINT.Visible = false;
                    this.botonEXIT.Visible = true;
                    this.botonEXCEL.Visible = true;
                    break;
                default:
                    break;
            }

            this.Refresh();
            
        }

        private void botonEXIT_Click(object sender, EventArgs e)
        {
            ClickEventDelegateHandler.Invoke(sender, e);
        }

        private void botonEXCEL_Click(object sender, EventArgs e)
        {

        }

    }
}
    