namespace SGLibrary
{
    partial class FrmABMDocumentos
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.panelcarga = new System.Windows.Forms.Panel();
            this.txtNomDoc = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtCoddoc = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.modoEdicion = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.panelbusqueda = new System.Windows.Forms.Panel();
            this.lblDgvBusquedaRegistros = new System.Windows.Forms.Label();
            this.DGV_Busqueda = new ADGV.AdvancedDataGridView();
            this.cbUsuariosConciliaciones = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.fechahasta = new System.Windows.Forms.DateTimePicker();
            this.fechadesde = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.status_bar_usuario = new System.Windows.Forms.StatusStrip();
            this.statusbar_usuario = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusbar_nrocaja = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusbar_bd = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusbar_servidor = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusbar_version = new System.Windows.Forms.ToolStripStatusLabel();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.dataSet1 = new System.Data.DataSet();
            this.botonesForm1 = new ControlesdeUsuario.BotonesForm();
            this.panelcarga.SuspendLayout();
            this.panelbusqueda.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGV_Busqueda)).BeginInit();
            this.status_bar_usuario.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet1)).BeginInit();
            this.SuspendLayout();
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // panelcarga
            // 
            this.panelcarga.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelcarga.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.panelcarga.Controls.Add(this.txtNomDoc);
            this.panelcarga.Controls.Add(this.label7);
            this.panelcarga.Controls.Add(this.txtCoddoc);
            this.panelcarga.Controls.Add(this.label6);
            this.panelcarga.Controls.Add(this.modoEdicion);
            this.panelcarga.Controls.Add(this.label2);
            this.panelcarga.Location = new System.Drawing.Point(25, 44);
            this.panelcarga.Name = "panelcarga";
            this.panelcarga.Size = new System.Drawing.Size(700, 314);
            this.panelcarga.TabIndex = 2;
            // 
            // txtNomDoc
            // 
            this.txtNomDoc.Location = new System.Drawing.Point(112, 64);
            this.txtNomDoc.Margin = new System.Windows.Forms.Padding(2);
            this.txtNomDoc.MaxLength = 40;
            this.txtNomDoc.Name = "txtNomDoc";
            this.txtNomDoc.Size = new System.Drawing.Size(342, 20);
            this.txtNomDoc.TabIndex = 2;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(43, 67);
            this.label7.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(66, 13);
            this.label7.TabIndex = 21;
            this.label7.Text = "Descripcion:";
            // 
            // txtCoddoc
            // 
            this.txtCoddoc.Location = new System.Drawing.Point(112, 37);
            this.txtCoddoc.Margin = new System.Windows.Forms.Padding(2);
            this.txtCoddoc.MaxLength = 4;
            this.txtCoddoc.Name = "txtCoddoc";
            this.txtCoddoc.Size = new System.Drawing.Size(96, 20);
            this.txtCoddoc.TabIndex = 1;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(65, 43);
            this.label6.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(43, 13);
            this.label6.TabIndex = 19;
            this.label6.Text = "Codigo:";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // modoEdicion
            // 
            this.modoEdicion.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.modoEdicion.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.modoEdicion.Location = new System.Drawing.Point(112, 7);
            this.modoEdicion.Margin = new System.Windows.Forms.Padding(2);
            this.modoEdicion.Name = "modoEdicion";
            this.modoEdicion.ReadOnly = true;
            this.modoEdicion.Size = new System.Drawing.Size(43, 20);
            this.modoEdicion.TabIndex = 18;
            this.modoEdicion.Visible = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(7, 9);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(95, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "Carga de los datos";
            // 
            // panelbusqueda
            // 
            this.panelbusqueda.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelbusqueda.BackColor = System.Drawing.Color.LightBlue;
            this.panelbusqueda.Controls.Add(this.lblDgvBusquedaRegistros);
            this.panelbusqueda.Controls.Add(this.DGV_Busqueda);
            this.panelbusqueda.Controls.Add(this.cbUsuariosConciliaciones);
            this.panelbusqueda.Controls.Add(this.label5);
            this.panelbusqueda.Controls.Add(this.label4);
            this.panelbusqueda.Controls.Add(this.label3);
            this.panelbusqueda.Controls.Add(this.fechahasta);
            this.panelbusqueda.Controls.Add(this.fechadesde);
            this.panelbusqueda.Controls.Add(this.label1);
            this.panelbusqueda.Location = new System.Drawing.Point(12, 44);
            this.panelbusqueda.Name = "panelbusqueda";
            this.panelbusqueda.Size = new System.Drawing.Size(736, 328);
            this.panelbusqueda.TabIndex = 0;
            this.panelbusqueda.Paint += new System.Windows.Forms.PaintEventHandler(this.panelbusqueda_Paint);
            // 
            // lblDgvBusquedaRegistros
            // 
            this.lblDgvBusquedaRegistros.AutoSize = true;
            this.lblDgvBusquedaRegistros.Location = new System.Drawing.Point(13, 304);
            this.lblDgvBusquedaRegistros.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblDgvBusquedaRegistros.Name = "lblDgvBusquedaRegistros";
            this.lblDgvBusquedaRegistros.Size = new System.Drawing.Size(35, 13);
            this.lblDgvBusquedaRegistros.TabIndex = 8;
            this.lblDgvBusquedaRegistros.Text = "label6";
            // 
            // DGV_Busqueda
            // 
            this.DGV_Busqueda.AutoGenerateContextFilters = true;
            this.DGV_Busqueda.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGV_Busqueda.DateWithTime = false;
            this.DGV_Busqueda.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.DGV_Busqueda.Location = new System.Drawing.Point(13, 60);
            this.DGV_Busqueda.Margin = new System.Windows.Forms.Padding(2);
            this.DGV_Busqueda.Name = "DGV_Busqueda";
            this.DGV_Busqueda.RowTemplate.Height = 24;
            this.DGV_Busqueda.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.DGV_Busqueda.Size = new System.Drawing.Size(710, 238);
            this.DGV_Busqueda.TabIndex = 7;
            this.DGV_Busqueda.TimeFilter = false;
            this.DGV_Busqueda.FilterStringChanged += new System.EventHandler(this.dataGridView2_FilterStringChanged);
            // 
            // cbUsuariosConciliaciones
            // 
            this.cbUsuariosConciliaciones.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbUsuariosConciliaciones.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbUsuariosConciliaciones.FormattingEnabled = true;
            this.cbUsuariosConciliaciones.Location = new System.Drawing.Point(365, 24);
            this.cbUsuariosConciliaciones.Margin = new System.Windows.Forms.Padding(2);
            this.cbUsuariosConciliaciones.Name = "cbUsuariosConciliaciones";
            this.cbUsuariosConciliaciones.Size = new System.Drawing.Size(157, 21);
            this.cbUsuariosConciliaciones.TabIndex = 6;
            this.cbUsuariosConciliaciones.SelectedIndexChanged += new System.EventHandler(this.cbUsuariosConciliaciones_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(318, 29);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(43, 13);
            this.label5.TabIndex = 5;
            this.label5.Text = "Usuario";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(185, 29);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(17, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = "A:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(17, 29);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(71, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Fecha Desde";
            // 
            // fechahasta
            // 
            this.fechahasta.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.fechahasta.Location = new System.Drawing.Point(204, 25);
            this.fechahasta.Margin = new System.Windows.Forms.Padding(2);
            this.fechahasta.Name = "fechahasta";
            this.fechahasta.Size = new System.Drawing.Size(101, 20);
            this.fechahasta.TabIndex = 2;
            // 
            // fechadesde
            // 
            this.fechadesde.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.fechadesde.Location = new System.Drawing.Point(91, 25);
            this.fechadesde.Margin = new System.Windows.Forms.Padding(2);
            this.fechadesde.Name = "fechadesde";
            this.fechadesde.Size = new System.Drawing.Size(85, 20);
            this.fechadesde.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 9);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(95, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Lista de Busqueda";
            // 
            // status_bar_usuario
            // 
            this.status_bar_usuario.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.status_bar_usuario.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.statusbar_usuario,
            this.statusbar_nrocaja,
            this.statusbar_bd,
            this.statusbar_servidor,
            this.statusbar_version});
            this.status_bar_usuario.Location = new System.Drawing.Point(0, 362);
            this.status_bar_usuario.Name = "status_bar_usuario";
            this.status_bar_usuario.Size = new System.Drawing.Size(760, 22);
            this.status_bar_usuario.TabIndex = 5;
            this.status_bar_usuario.Text = "statusStrip1";
            // 
            // statusbar_usuario
            // 
            this.statusbar_usuario.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.statusbar_usuario.Name = "statusbar_usuario";
            this.statusbar_usuario.Size = new System.Drawing.Size(47, 17);
            this.statusbar_usuario.Text = "Usuario";
            // 
            // statusbar_nrocaja
            // 
            this.statusbar_nrocaja.Name = "statusbar_nrocaja";
            this.statusbar_nrocaja.Size = new System.Drawing.Size(65, 17);
            this.statusbar_nrocaja.Text = "nro de caja";
            // 
            // statusbar_bd
            // 
            this.statusbar_bd.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.statusbar_bd.Name = "statusbar_bd";
            this.statusbar_bd.Size = new System.Drawing.Size(74, 17);
            this.statusbar_bd.Text = "statusbar_bd";
            // 
            // statusbar_servidor
            // 
            this.statusbar_servidor.Name = "statusbar_servidor";
            this.statusbar_servidor.Size = new System.Drawing.Size(102, 17);
            this.statusbar_servidor.Text = "statusbar_servidor";
            // 
            // statusbar_version
            // 
            this.statusbar_version.Name = "statusbar_version";
            this.statusbar_version.Size = new System.Drawing.Size(46, 17);
            this.statusbar_version.Text = "Versión";
            // 
            // dataSet1
            // 
            this.dataSet1.DataSetName = "NewDataSet";
            // 
            // botonesForm1
            // 
            this.botonesForm1.AutoSize = true;
            this.botonesForm1.Location = new System.Drawing.Point(0, 4);
            this.botonesForm1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.botonesForm1.MododeEdicion = ControlesdeUsuario.ABMBotonesForm.FIND;
            this.botonesForm1.Name = "botonesForm1";
            this.botonesForm1.Size = new System.Drawing.Size(613, 29);
            this.botonesForm1.TabIndex = 3;
            this.botonesForm1.ClickEventDelegateHandler += new ControlesdeUsuario.BotonesForm.ClickDelegateHandler(this.botonesForm1_ClickEventDelegateHandler);
            this.botonesForm1.Load += new System.EventHandler(this.botonesForm1_Load);
            // 
            // FrmABMDocumentos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(760, 384);
            this.Controls.Add(this.panelcarga);
            this.Controls.Add(this.status_bar_usuario);
            this.Controls.Add(this.botonesForm1);
            this.Controls.Add(this.panelbusqueda);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "FrmABMDocumentos";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Documentos";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmABMBase_Load);
            this.panelcarga.ResumeLayout(false);
            this.panelcarga.PerformLayout();
            this.panelbusqueda.ResumeLayout(false);
            this.panelbusqueda.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGV_Busqueda)).EndInit();
            this.status_bar_usuario.ResumeLayout(false);
            this.status_bar_usuario.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.Panel panelcarga;
        private System.Windows.Forms.Panel panelbusqueda;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker fechahasta;
        private System.Windows.Forms.DateTimePicker fechadesde;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cbUsuariosConciliaciones;
        private System.Windows.Forms.Label label5;
        private ControlesdeUsuario.BotonesForm botonesForm1;
        private System.Windows.Forms.TextBox modoEdicion;
        private ADGV.AdvancedDataGridView DGV_Busqueda;
        private System.Windows.Forms.StatusStrip status_bar_usuario;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_usuario;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_nrocaja;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_bd;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_servidor;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_version;
        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Data.DataSet dataSet1;
        private System.Windows.Forms.Label lblDgvBusquedaRegistros;
        private System.Windows.Forms.TextBox txtNomDoc;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtCoddoc;
        private System.Windows.Forms.Label label6;
    }
}