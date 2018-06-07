namespace SGLibrary
{
    partial class FrmEstadoDeCuenta
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
            this.panelcarga = new System.Windows.Forms.Panel();
            this.cbUsuarios = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.fechahasta = new System.Windows.Forms.DateTimePicker();
            this.fechadesde = new System.Windows.Forms.DateTimePicker();
            this.label16 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.txtComMov = new System.Windows.Forms.TextBox();
            this.label14 = new System.Windows.Forms.Label();
            this.ADGV_TitularesCuotas = new ADGV.AdvancedDataGridView();
            this.ADGV_Titulares = new ADGV.AdvancedDataGridView();
            this.cbEstado = new System.Windows.Forms.ComboBox();
            this.label12 = new System.Windows.Forms.Label();
            this.txtnrLicencia = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtDescripcion = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.panelbusqueda = new System.Windows.Forms.Panel();
            this.lblDgvBusquedaRegistros = new System.Windows.Forms.Label();
            this.ADGVBusqueda = new ADGV.AdvancedDataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.status_bar_usuario = new System.Windows.Forms.StatusStrip();
            this.statusbar_usuario = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusbar_nrocaja = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusbar_bd = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusbar_servidor = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusbar_version = new System.Windows.Forms.ToolStripStatusLabel();
            this.status_bar_ambiente = new System.Windows.Forms.ToolStripStatusLabel();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.dataSet1 = new System.Data.DataSet();
            this.bindingSource2 = new System.Windows.Forms.BindingSource(this.components);
            this.dataSet2 = new System.Data.DataSet();
            this.botonesForm1 = new ControlesdeUsuario.BotonesForm();
            this.panelcarga.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ADGV_TitularesCuotas)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ADGV_Titulares)).BeginInit();
            this.panelbusqueda.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ADGVBusqueda)).BeginInit();
            this.status_bar_usuario.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet2)).BeginInit();
            this.SuspendLayout();
            // 
            // panelcarga
            // 
            this.panelcarga.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelcarga.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.panelcarga.Controls.Add(this.cbUsuarios);
            this.panelcarga.Controls.Add(this.label5);
            this.panelcarga.Controls.Add(this.label4);
            this.panelcarga.Controls.Add(this.label3);
            this.panelcarga.Controls.Add(this.fechahasta);
            this.panelcarga.Controls.Add(this.fechadesde);
            this.panelcarga.Controls.Add(this.label16);
            this.panelcarga.Controls.Add(this.label15);
            this.panelcarga.Controls.Add(this.txtComMov);
            this.panelcarga.Controls.Add(this.label14);
            this.panelcarga.Controls.Add(this.ADGV_TitularesCuotas);
            this.panelcarga.Controls.Add(this.ADGV_Titulares);
            this.panelcarga.Controls.Add(this.cbEstado);
            this.panelcarga.Controls.Add(this.label12);
            this.panelcarga.Controls.Add(this.txtnrLicencia);
            this.panelcarga.Controls.Add(this.label10);
            this.panelcarga.Controls.Add(this.txtDescripcion);
            this.panelcarga.Controls.Add(this.label9);
            this.panelcarga.Location = new System.Drawing.Point(25, 44);
            this.panelcarga.Name = "panelcarga";
            this.panelcarga.Size = new System.Drawing.Size(700, 431);
            this.panelcarga.TabIndex = 2;
            this.panelcarga.Paint += new System.Windows.Forms.PaintEventHandler(this.panelcarga_Paint);
            // 
            // cbUsuarios
            // 
            this.cbUsuarios.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbUsuarios.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbUsuarios.FormattingEnabled = true;
            this.cbUsuarios.Location = new System.Drawing.Point(570, 22);
            this.cbUsuarios.Margin = new System.Windows.Forms.Padding(2);
            this.cbUsuarios.Name = "cbUsuarios";
            this.cbUsuarios.Size = new System.Drawing.Size(123, 21);
            this.cbUsuarios.TabIndex = 49;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(566, 4);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(43, 13);
            this.label5.TabIndex = 48;
            this.label5.Text = "Usuario";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(174, 50);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(17, 13);
            this.label4.TabIndex = 47;
            this.label4.Text = "A:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 50);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(71, 13);
            this.label3.TabIndex = 46;
            this.label3.Text = "Fecha Desde";
            // 
            // fechahasta
            // 
            this.fechahasta.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.fechahasta.Location = new System.Drawing.Point(193, 46);
            this.fechahasta.Margin = new System.Windows.Forms.Padding(2);
            this.fechahasta.Name = "fechahasta";
            this.fechahasta.Size = new System.Drawing.Size(101, 20);
            this.fechahasta.TabIndex = 45;
            // 
            // fechadesde
            // 
            this.fechadesde.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.fechadesde.Location = new System.Drawing.Point(80, 46);
            this.fechadesde.Margin = new System.Windows.Forms.Padding(2);
            this.fechadesde.Name = "fechadesde";
            this.fechadesde.Size = new System.Drawing.Size(85, 20);
            this.fechadesde.TabIndex = 44;
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(4, 79);
            this.label16.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(71, 13);
            this.label16.TabIndex = 43;
            this.label16.Text = "Obligaciones:";
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(4, 267);
            this.label15.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(123, 13);
            this.label15.TabIndex = 42;
            this.label15.Text = "Detalle de vencimientos:";
            // 
            // txtComMov
            // 
            this.txtComMov.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtComMov.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtComMov.Location = new System.Drawing.Point(6, 409);
            this.txtComMov.Margin = new System.Windows.Forms.Padding(2);
            this.txtComMov.MaxLength = 40;
            this.txtComMov.Name = "txtComMov";
            this.txtComMov.Size = new System.Drawing.Size(681, 20);
            this.txtComMov.TabIndex = 40;
            // 
            // label14
            // 
            this.label14.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(6, 392);
            this.label14.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(81, 13);
            this.label14.TabIndex = 41;
            this.label14.Text = "Observaciones:";
            // 
            // ADGV_TitularesCuotas
            // 
            this.ADGV_TitularesCuotas.AllowUserToAddRows = false;
            this.ADGV_TitularesCuotas.AllowUserToDeleteRows = false;
            this.ADGV_TitularesCuotas.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ADGV_TitularesCuotas.AutoGenerateContextFilters = true;
            this.ADGV_TitularesCuotas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ADGV_TitularesCuotas.DateWithTime = false;
            this.ADGV_TitularesCuotas.Location = new System.Drawing.Point(7, 286);
            this.ADGV_TitularesCuotas.Margin = new System.Windows.Forms.Padding(2);
            this.ADGV_TitularesCuotas.Name = "ADGV_TitularesCuotas";
            this.ADGV_TitularesCuotas.RowTemplate.Height = 24;
            this.ADGV_TitularesCuotas.Size = new System.Drawing.Size(680, 100);
            this.ADGV_TitularesCuotas.TabIndex = 39;
            this.ADGV_TitularesCuotas.TimeFilter = false;
            this.ADGV_TitularesCuotas.FilterStringChanged += new System.EventHandler(this.ADGV_TitularesCuotas_FilterStringChanged);
            // 
            // ADGV_Titulares
            // 
            this.ADGV_Titulares.AllowUserToAddRows = false;
            this.ADGV_Titulares.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ADGV_Titulares.AutoGenerateContextFilters = true;
            this.ADGV_Titulares.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ADGV_Titulares.DateWithTime = false;
            this.ADGV_Titulares.Location = new System.Drawing.Point(5, 99);
            this.ADGV_Titulares.Margin = new System.Windows.Forms.Padding(2);
            this.ADGV_Titulares.Name = "ADGV_Titulares";
            this.ADGV_Titulares.RowTemplate.Height = 24;
            this.ADGV_Titulares.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.ADGV_Titulares.Size = new System.Drawing.Size(680, 166);
            this.ADGV_Titulares.TabIndex = 38;
            this.ADGV_Titulares.TimeFilter = false;
            this.ADGV_Titulares.FilterStringChanged += new System.EventHandler(this.ADGV_Titulares_FilterStringChanged);
            this.ADGV_Titulares.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.ADGV_Titulares_CellContentClick);
            this.ADGV_Titulares.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.ADGV_Titulares_MouseDoubleClick);
            // 
            // cbEstado
            // 
            this.cbEstado.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbEstado.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbEstado.FormattingEnabled = true;
            this.cbEstado.Items.AddRange(new object[] {
            "COBRADO",
            "COBRADO PARCIAL",
            "PENDIENTE",
            "TODOS"});
            this.cbEstado.Location = new System.Drawing.Point(422, 21);
            this.cbEstado.Margin = new System.Windows.Forms.Padding(2);
            this.cbEstado.Name = "cbEstado";
            this.cbEstado.Size = new System.Drawing.Size(144, 21);
            this.cbEstado.TabIndex = 35;
            this.cbEstado.SelectedIndexChanged += new System.EventHandler(this.cbEstado_SelectedIndexChanged);
            this.cbEstado.TextChanged += new System.EventHandler(this.cbEstado_TextChanged);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(422, 4);
            this.label12.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(43, 13);
            this.label12.TabIndex = 34;
            this.label12.Text = "Estado:";
            // 
            // txtnrLicencia
            // 
            this.txtnrLicencia.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtnrLicencia.Location = new System.Drawing.Point(6, 22);
            this.txtnrLicencia.Margin = new System.Windows.Forms.Padding(2);
            this.txtnrLicencia.MaxLength = 40;
            this.txtnrLicencia.Name = "txtnrLicencia";
            this.txtnrLicencia.Size = new System.Drawing.Size(66, 20);
            this.txtnrLicencia.TabIndex = 30;
            this.txtnrLicencia.TextChanged += new System.EventHandler(this.txtnrLicencia_TextChanged);
            this.txtnrLicencia.Enter += new System.EventHandler(this.txtnrLicencia_Enter);
            this.txtnrLicencia.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtnrLicencia_KeyDown);
            this.txtnrLicencia.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtMonto_KeyPress);
            this.txtnrLicencia.Leave += new System.EventHandler(this.txtnrLicencia_Leave);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(3, 7);
            this.label10.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(50, 13);
            this.label10.TabIndex = 31;
            this.label10.Text = "Licencia:";
            // 
            // txtDescripcion
            // 
            this.txtDescripcion.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtDescripcion.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtDescripcion.Location = new System.Drawing.Point(76, 22);
            this.txtDescripcion.Margin = new System.Windows.Forms.Padding(2);
            this.txtDescripcion.MaxLength = 50;
            this.txtDescripcion.Name = "txtDescripcion";
            this.txtDescripcion.ReadOnly = true;
            this.txtDescripcion.Size = new System.Drawing.Size(342, 20);
            this.txtDescripcion.TabIndex = 28;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(76, 7);
            this.label9.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(47, 13);
            this.label9.TabIndex = 29;
            this.label9.Text = "Nombre:";
            // 
            // panelbusqueda
            // 
            this.panelbusqueda.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelbusqueda.BackColor = System.Drawing.Color.LightBlue;
            this.panelbusqueda.Controls.Add(this.lblDgvBusquedaRegistros);
            this.panelbusqueda.Controls.Add(this.ADGVBusqueda);
            this.panelbusqueda.Controls.Add(this.label1);
            this.panelbusqueda.Location = new System.Drawing.Point(10, 44);
            this.panelbusqueda.Name = "panelbusqueda";
            this.panelbusqueda.Size = new System.Drawing.Size(738, 427);
            this.panelbusqueda.TabIndex = 0;
            this.panelbusqueda.Paint += new System.Windows.Forms.PaintEventHandler(this.panelbusqueda_Paint);
            // 
            // lblDgvBusquedaRegistros
            // 
            this.lblDgvBusquedaRegistros.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblDgvBusquedaRegistros.AutoSize = true;
            this.lblDgvBusquedaRegistros.Location = new System.Drawing.Point(13, 286);
            this.lblDgvBusquedaRegistros.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblDgvBusquedaRegistros.Name = "lblDgvBusquedaRegistros";
            this.lblDgvBusquedaRegistros.Size = new System.Drawing.Size(35, 13);
            this.lblDgvBusquedaRegistros.TabIndex = 8;
            this.lblDgvBusquedaRegistros.Text = "label6";
            // 
            // ADGVBusqueda
            // 
            this.ADGVBusqueda.AllowUserToAddRows = false;
            this.ADGVBusqueda.AllowUserToDeleteRows = false;
            this.ADGVBusqueda.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ADGVBusqueda.AutoGenerateContextFilters = true;
            this.ADGVBusqueda.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ADGVBusqueda.DateWithTime = false;
            this.ADGVBusqueda.Location = new System.Drawing.Point(13, 60);
            this.ADGVBusqueda.Margin = new System.Windows.Forms.Padding(2);
            this.ADGVBusqueda.MultiSelect = false;
            this.ADGVBusqueda.Name = "ADGVBusqueda";
            this.ADGVBusqueda.RowTemplate.Height = 24;
            this.ADGVBusqueda.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.ADGVBusqueda.Size = new System.Drawing.Size(712, 220);
            this.ADGVBusqueda.TabIndex = 7;
            this.ADGVBusqueda.TimeFilter = false;
            this.ADGVBusqueda.FilterStringChanged += new System.EventHandler(this.dataGridView2_FilterStringChanged);
            this.ADGVBusqueda.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.ADGVBusqueda_CellContentClick);
            this.ADGVBusqueda.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.ADGVBusqueda_MouseDoubleClick);
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
            this.statusbar_version,
            this.status_bar_ambiente});
            this.status_bar_usuario.Location = new System.Drawing.Point(0, 479);
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
            // status_bar_ambiente
            // 
            this.status_bar_ambiente.Name = "status_bar_ambiente";
            this.status_bar_ambiente.Size = new System.Drawing.Size(59, 17);
            this.status_bar_ambiente.Text = "Ambiente";
            // 
            // dataSet1
            // 
            this.dataSet1.DataSetName = "NewDataSet";
            // 
            // dataSet2
            // 
            this.dataSet2.DataSetName = "NewDataSet";
            // 
            // botonesForm1
            // 
            this.botonesForm1.AutoSize = true;
            this.botonesForm1.Location = new System.Drawing.Point(0, -2);
            this.botonesForm1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.botonesForm1.Name = "botonesForm1";
            this.botonesForm1.Size = new System.Drawing.Size(533, 27);
            this.botonesForm1.TabIndex = 6;
            this.botonesForm1.ClickEventDelegateHandler += new ControlesdeUsuario.BotonesForm.ClickDelegateHandler(this.botonesForm1_ClickEventDelegateHandler);
            this.botonesForm1.Load += new System.EventHandler(this.botonesForm1_Load_1);
            // 
            // FrmEstadoDeCuenta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(760, 501);
            this.Controls.Add(this.botonesForm1);
            this.Controls.Add(this.status_bar_usuario);
            this.Controls.Add(this.panelcarga);
            this.Controls.Add(this.panelbusqueda);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "FrmEstadoDeCuenta";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Estado De Cuenta";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmABMBase_Load);
            this.panelcarga.ResumeLayout(false);
            this.panelcarga.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ADGV_TitularesCuotas)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ADGV_Titulares)).EndInit();
            this.panelbusqueda.ResumeLayout(false);
            this.panelbusqueda.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ADGVBusqueda)).EndInit();
            this.status_bar_usuario.ResumeLayout(false);
            this.status_bar_usuario.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panelcarga;
        private System.Windows.Forms.Panel panelbusqueda;
        private System.Windows.Forms.Label label1;
        private ADGV.AdvancedDataGridView ADGVBusqueda;
        private System.Windows.Forms.StatusStrip status_bar_usuario;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_usuario;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_nrocaja;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_bd;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_servidor;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_version;
        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Data.DataSet dataSet1;
        private System.Windows.Forms.Label lblDgvBusquedaRegistros;
        private System.Windows.Forms.TextBox txtDescripcion;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtnrLicencia;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.ComboBox cbEstado;
        private ADGV.AdvancedDataGridView ADGV_Titulares;
        private ADGV.AdvancedDataGridView ADGV_TitularesCuotas;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.TextBox txtComMov;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.BindingSource bindingSource2;
        private System.Data.DataSet dataSet2;
        private System.Windows.Forms.ToolStripStatusLabel status_bar_ambiente;
        private System.Windows.Forms.ComboBox cbUsuarios;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DateTimePicker fechahasta;
        private System.Windows.Forms.DateTimePicker fechadesde;
        private ControlesdeUsuario.BotonesForm botonesForm1;
    }
}