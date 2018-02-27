namespace SGLibrary
{
    partial class FrmObligaciones
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
            this.agregarLicenciaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.eliminarTitularToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.panelcarga = new System.Windows.Forms.Panel();
            this.label17 = new System.Windows.Forms.Label();
            this.cbFecValor = new System.Windows.Forms.DateTimePicker();
            this.label16 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.txtComMov = new System.Windows.Forms.TextBox();
            this.label14 = new System.Windows.Forms.Label();
            this.ADGV_TitularesCuotas = new ADGV.AdvancedDataGridView();
            this.ADGV_Titulares = new ADGV.AdvancedDataGridView();
            this.cbTipoArchivo = new System.Windows.Forms.ComboBox();
            this.label13 = new System.Windows.Forms.Label();
            this.cbPeriodo = new System.Windows.Forms.ComboBox();
            this.label12 = new System.Windows.Forms.Label();
            this.txtCuotas = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txtMonto = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtDescripcion = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.cbFecdoc = new System.Windows.Forms.DateTimePicker();
            this.label8 = new System.Windows.Forms.Label();
            this.txtNroDoc = new System.Windows.Forms.TextBox();
            this.txtSerieDoc = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtCoddoc = new System.Windows.Forms.TextBox();
            this.modoEdicion = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.panelbusqueda = new System.Windows.Forms.Panel();
            this.lblDgvBusquedaRegistros = new System.Windows.Forms.Label();
            this.ADGVBusqueda = new ADGV.AdvancedDataGridView();
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
            this.bindingSource2 = new System.Windows.Forms.BindingSource(this.components);
            this.dataSet2 = new System.Data.DataSet();
            this.botonesForm1 = new ControlesdeUsuario.BotonesForm();
            this.contextMenuStrip1.SuspendLayout();
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
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.agregarLicenciaToolStripMenuItem,
            this.eliminarTitularToolStripMenuItem});
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(165, 48);
            // 
            // agregarLicenciaToolStripMenuItem
            // 
            this.agregarLicenciaToolStripMenuItem.Name = "agregarLicenciaToolStripMenuItem";
            this.agregarLicenciaToolStripMenuItem.Size = new System.Drawing.Size(164, 22);
            this.agregarLicenciaToolStripMenuItem.Text = "Agregar Titulares";
            this.agregarLicenciaToolStripMenuItem.Click += new System.EventHandler(this.agregarLicenciaToolStripMenuItem_Click);
            // 
            // eliminarTitularToolStripMenuItem
            // 
            this.eliminarTitularToolStripMenuItem.Name = "eliminarTitularToolStripMenuItem";
            this.eliminarTitularToolStripMenuItem.Size = new System.Drawing.Size(164, 22);
            this.eliminarTitularToolStripMenuItem.Text = "Eliminar Titular";
            this.eliminarTitularToolStripMenuItem.Click += new System.EventHandler(this.eliminarTitularToolStripMenuItem_Click);
            // 
            // panelcarga
            // 
            this.panelcarga.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelcarga.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.panelcarga.Controls.Add(this.label17);
            this.panelcarga.Controls.Add(this.cbFecValor);
            this.panelcarga.Controls.Add(this.label16);
            this.panelcarga.Controls.Add(this.label15);
            this.panelcarga.Controls.Add(this.txtComMov);
            this.panelcarga.Controls.Add(this.label14);
            this.panelcarga.Controls.Add(this.ADGV_TitularesCuotas);
            this.panelcarga.Controls.Add(this.ADGV_Titulares);
            this.panelcarga.Controls.Add(this.cbTipoArchivo);
            this.panelcarga.Controls.Add(this.label13);
            this.panelcarga.Controls.Add(this.cbPeriodo);
            this.panelcarga.Controls.Add(this.label12);
            this.panelcarga.Controls.Add(this.txtCuotas);
            this.panelcarga.Controls.Add(this.label11);
            this.panelcarga.Controls.Add(this.txtMonto);
            this.panelcarga.Controls.Add(this.label10);
            this.panelcarga.Controls.Add(this.txtDescripcion);
            this.panelcarga.Controls.Add(this.label9);
            this.panelcarga.Controls.Add(this.label6);
            this.panelcarga.Controls.Add(this.cbFecdoc);
            this.panelcarga.Controls.Add(this.label8);
            this.panelcarga.Controls.Add(this.txtNroDoc);
            this.panelcarga.Controls.Add(this.txtSerieDoc);
            this.panelcarga.Controls.Add(this.label7);
            this.panelcarga.Controls.Add(this.txtCoddoc);
            this.panelcarga.Controls.Add(this.modoEdicion);
            this.panelcarga.Controls.Add(this.label2);
            this.panelcarga.Location = new System.Drawing.Point(25, 44);
            this.panelcarga.Name = "panelcarga";
            this.panelcarga.Size = new System.Drawing.Size(700, 431);
            this.panelcarga.TabIndex = 2;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(589, 50);
            this.label17.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(80, 13);
            this.label17.TabIndex = 45;
            this.label17.Text = "Fecha de Inicio";
            // 
            // cbFecValor
            // 
            this.cbFecValor.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.cbFecValor.Location = new System.Drawing.Point(592, 68);
            this.cbFecValor.Margin = new System.Windows.Forms.Padding(2);
            this.cbFecValor.Name = "cbFecValor";
            this.cbFecValor.Size = new System.Drawing.Size(85, 20);
            this.cbFecValor.TabIndex = 44;
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(7, 137);
            this.label16.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(50, 13);
            this.label16.TabIndex = 43;
            this.label16.Text = "Titulares:";
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(7, 317);
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
            this.ADGV_TitularesCuotas.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ADGV_TitularesCuotas.AutoGenerateContextFilters = true;
            this.ADGV_TitularesCuotas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ADGV_TitularesCuotas.DateWithTime = false;
            this.ADGV_TitularesCuotas.Location = new System.Drawing.Point(7, 336);
            this.ADGV_TitularesCuotas.Margin = new System.Windows.Forms.Padding(2);
            this.ADGV_TitularesCuotas.Name = "ADGV_TitularesCuotas";
            this.ADGV_TitularesCuotas.RowTemplate.Height = 24;
            this.ADGV_TitularesCuotas.Size = new System.Drawing.Size(680, 48);
            this.ADGV_TitularesCuotas.TabIndex = 39;
            this.ADGV_TitularesCuotas.TimeFilter = false;
            this.ADGV_TitularesCuotas.FilterStringChanged += new System.EventHandler(this.ADGV_TitularesCuotas_FilterStringChanged);
            // 
            // ADGV_Titulares
            // 
            this.ADGV_Titulares.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ADGV_Titulares.AutoGenerateContextFilters = true;
            this.ADGV_Titulares.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ADGV_Titulares.ContextMenuStrip = this.contextMenuStrip1;
            this.ADGV_Titulares.DateWithTime = false;
            this.ADGV_Titulares.Location = new System.Drawing.Point(7, 154);
            this.ADGV_Titulares.Margin = new System.Windows.Forms.Padding(2);
            this.ADGV_Titulares.Name = "ADGV_Titulares";
            this.ADGV_Titulares.RowTemplate.Height = 24;
            this.ADGV_Titulares.Size = new System.Drawing.Size(680, 157);
            this.ADGV_Titulares.TabIndex = 38;
            this.ADGV_Titulares.TimeFilter = false;
            this.ADGV_Titulares.FilterStringChanged += new System.EventHandler(this.ADGV_Titulares_FilterStringChanged);
            // 
            // cbTipoArchivo
            // 
            this.cbTipoArchivo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbTipoArchivo.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbTipoArchivo.FormattingEnabled = true;
            this.cbTipoArchivo.Items.AddRange(new object[] {
            "Movistar"});
            this.cbTipoArchivo.Location = new System.Drawing.Point(7, 110);
            this.cbTipoArchivo.Margin = new System.Windows.Forms.Padding(2);
            this.cbTipoArchivo.Name = "cbTipoArchivo";
            this.cbTipoArchivo.Size = new System.Drawing.Size(182, 21);
            this.cbTipoArchivo.TabIndex = 37;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(7, 93);
            this.label13.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(77, 13);
            this.label13.TabIndex = 36;
            this.label13.Text = "Carga Archivo:";
            // 
            // cbPeriodo
            // 
            this.cbPeriodo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbPeriodo.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbPeriodo.FormattingEnabled = true;
            this.cbPeriodo.Items.AddRange(new object[] {
            "Mensual",
            "Semanal",
            "Semestral",
            "Anual"});
            this.cbPeriodo.Location = new System.Drawing.Point(491, 67);
            this.cbPeriodo.Margin = new System.Windows.Forms.Padding(2);
            this.cbPeriodo.Name = "cbPeriodo";
            this.cbPeriodo.Size = new System.Drawing.Size(97, 21);
            this.cbPeriodo.TabIndex = 35;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(491, 50);
            this.label12.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(46, 13);
            this.label12.TabIndex = 34;
            this.label12.Text = "Periodo:";
            // 
            // txtCuotas
            // 
            this.txtCuotas.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtCuotas.Location = new System.Drawing.Point(423, 68);
            this.txtCuotas.Margin = new System.Windows.Forms.Padding(2);
            this.txtCuotas.MaxLength = 2;
            this.txtCuotas.Name = "txtCuotas";
            this.txtCuotas.Size = new System.Drawing.Size(66, 20);
            this.txtCuotas.TabIndex = 32;
            this.txtCuotas.TextChanged += new System.EventHandler(this.txtCuotas_TextChanged);
            this.txtCuotas.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtCuotas_KeyPress);
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(420, 50);
            this.label11.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(43, 13);
            this.label11.TabIndex = 33;
            this.label11.Text = "Cuotas:";
            // 
            // txtMonto
            // 
            this.txtMonto.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtMonto.Location = new System.Drawing.Point(353, 68);
            this.txtMonto.Margin = new System.Windows.Forms.Padding(2);
            this.txtMonto.MaxLength = 40;
            this.txtMonto.Name = "txtMonto";
            this.txtMonto.Size = new System.Drawing.Size(66, 20);
            this.txtMonto.TabIndex = 30;
            this.txtMonto.TextChanged += new System.EventHandler(this.txtMonto_TextChanged);
            this.txtMonto.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtMonto_KeyPress);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(350, 50);
            this.label10.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(40, 13);
            this.label10.TabIndex = 31;
            this.label10.Text = "Monto:";
            // 
            // txtDescripcion
            // 
            this.txtDescripcion.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtDescripcion.Location = new System.Drawing.Point(7, 68);
            this.txtDescripcion.Margin = new System.Windows.Forms.Padding(2);
            this.txtDescripcion.MaxLength = 40;
            this.txtDescripcion.Name = "txtDescripcion";
            this.txtDescripcion.Size = new System.Drawing.Size(342, 20);
            this.txtDescripcion.TabIndex = 28;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(7, 50);
            this.label9.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(66, 13);
            this.label9.TabIndex = 29;
            this.label9.Text = "Descripcion:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(164, 9);
            this.label6.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(37, 13);
            this.label6.TabIndex = 27;
            this.label6.Text = "Fecha";
            // 
            // cbFecdoc
            // 
            this.cbFecdoc.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.cbFecdoc.Location = new System.Drawing.Point(167, 28);
            this.cbFecdoc.Margin = new System.Windows.Forms.Padding(2);
            this.cbFecdoc.Name = "cbFecdoc";
            this.cbFecdoc.Size = new System.Drawing.Size(85, 20);
            this.cbFecdoc.TabIndex = 26;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(96, 9);
            this.label8.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(44, 13);
            this.label8.TabIndex = 25;
            this.label8.Text = "Número";
            // 
            // txtNroDoc
            // 
            this.txtNroDoc.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtNroDoc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtNroDoc.Location = new System.Drawing.Point(96, 28);
            this.txtNroDoc.Margin = new System.Windows.Forms.Padding(2);
            this.txtNroDoc.MaxLength = 4;
            this.txtNroDoc.Name = "txtNroDoc";
            this.txtNroDoc.ReadOnly = true;
            this.txtNroDoc.Size = new System.Drawing.Size(67, 20);
            this.txtNroDoc.TabIndex = 24;
            // 
            // txtSerieDoc
            // 
            this.txtSerieDoc.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtSerieDoc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtSerieDoc.Location = new System.Drawing.Point(61, 28);
            this.txtSerieDoc.Margin = new System.Windows.Forms.Padding(2);
            this.txtSerieDoc.MaxLength = 4;
            this.txtSerieDoc.Name = "txtSerieDoc";
            this.txtSerieDoc.ReadOnly = true;
            this.txtSerieDoc.Size = new System.Drawing.Size(31, 20);
            this.txtSerieDoc.TabIndex = 23;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(61, 9);
            this.label7.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(31, 13);
            this.label7.TabIndex = 22;
            this.label7.Text = "Serie";
            // 
            // txtCoddoc
            // 
            this.txtCoddoc.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtCoddoc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtCoddoc.Location = new System.Drawing.Point(7, 28);
            this.txtCoddoc.Margin = new System.Windows.Forms.Padding(2);
            this.txtCoddoc.MaxLength = 4;
            this.txtCoddoc.Name = "txtCoddoc";
            this.txtCoddoc.ReadOnly = true;
            this.txtCoddoc.Size = new System.Drawing.Size(51, 20);
            this.txtCoddoc.TabIndex = 20;
            // 
            // modoEdicion
            // 
            this.modoEdicion.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.modoEdicion.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.modoEdicion.Location = new System.Drawing.Point(564, 9);
            this.modoEdicion.Margin = new System.Windows.Forms.Padding(2);
            this.modoEdicion.Name = "modoEdicion";
            this.modoEdicion.ReadOnly = true;
            this.modoEdicion.Size = new System.Drawing.Size(123, 20);
            this.modoEdicion.TabIndex = 18;
            this.modoEdicion.Visible = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(7, 9);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(27, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "Doc";
            // 
            // panelbusqueda
            // 
            this.panelbusqueda.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelbusqueda.BackColor = System.Drawing.Color.LightBlue;
            this.panelbusqueda.Controls.Add(this.lblDgvBusquedaRegistros);
            this.panelbusqueda.Controls.Add(this.ADGVBusqueda);
            this.panelbusqueda.Controls.Add(this.cbUsuariosConciliaciones);
            this.panelbusqueda.Controls.Add(this.label5);
            this.panelbusqueda.Controls.Add(this.label4);
            this.panelbusqueda.Controls.Add(this.label3);
            this.panelbusqueda.Controls.Add(this.fechahasta);
            this.panelbusqueda.Controls.Add(this.fechadesde);
            this.panelbusqueda.Controls.Add(this.label1);
            this.panelbusqueda.Location = new System.Drawing.Point(12, 44);
            this.panelbusqueda.Name = "panelbusqueda";
            this.panelbusqueda.Size = new System.Drawing.Size(736, 445);
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
            // ADGVBusqueda
            // 
            this.ADGVBusqueda.AutoGenerateContextFilters = true;
            this.ADGVBusqueda.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ADGVBusqueda.DateWithTime = false;
            this.ADGVBusqueda.Location = new System.Drawing.Point(13, 60);
            this.ADGVBusqueda.Margin = new System.Windows.Forms.Padding(2);
            this.ADGVBusqueda.Name = "ADGVBusqueda";
            this.ADGVBusqueda.RowTemplate.Height = 24;
            this.ADGVBusqueda.Size = new System.Drawing.Size(710, 238);
            this.ADGVBusqueda.TabIndex = 7;
            this.ADGVBusqueda.TimeFilter = false;
            this.ADGVBusqueda.FilterStringChanged += new System.EventHandler(this.dataGridView2_FilterStringChanged);
            // 
            // cbUsuariosConciliaciones
            // 
            this.cbUsuariosConciliaciones.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbUsuariosConciliaciones.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbUsuariosConciliaciones.FormattingEnabled = true;
            this.cbUsuariosConciliaciones.Location = new System.Drawing.Point(365, 24);
            this.cbUsuariosConciliaciones.Margin = new System.Windows.Forms.Padding(2);
            this.cbUsuariosConciliaciones.Name = "cbUsuariosConciliaciones";
            this.cbUsuariosConciliaciones.Size = new System.Drawing.Size(123, 21);
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
            this.botonesForm1.Location = new System.Drawing.Point(0, 4);
            this.botonesForm1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.botonesForm1.MododeEdicion = ControlesdeUsuario.ABMBotonesForm.FIND;
            this.botonesForm1.Name = "botonesForm1";
            this.botonesForm1.Size = new System.Drawing.Size(613, 29);
            this.botonesForm1.TabIndex = 3;
            this.botonesForm1.ClickEventDelegateHandler += new ControlesdeUsuario.BotonesForm.ClickDelegateHandler(this.botonesForm1_ClickEventDelegateHandler);
            this.botonesForm1.Load += new System.EventHandler(this.botonesForm1_Load);
            // 
            // FrmObligaciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(760, 501);
            this.Controls.Add(this.status_bar_usuario);
            this.Controls.Add(this.botonesForm1);
            this.Controls.Add(this.panelcarga);
            this.Controls.Add(this.panelbusqueda);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "FrmObligaciones";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Obligaciones";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmABMBase_Load);
            this.contextMenuStrip1.ResumeLayout(false);
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
        private System.Windows.Forms.TextBox txtNroDoc;
        private System.Windows.Forms.TextBox txtSerieDoc;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtCoddoc;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.DateTimePicker cbFecdoc;
        private System.Windows.Forms.TextBox txtDescripcion;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtMonto;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox txtCuotas;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.ComboBox cbPeriodo;
        private System.Windows.Forms.ComboBox cbTipoArchivo;
        private System.Windows.Forms.Label label13;
        private ADGV.AdvancedDataGridView ADGV_Titulares;
        private ADGV.AdvancedDataGridView ADGV_TitularesCuotas;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.TextBox txtComMov;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.DateTimePicker cbFecValor;
        private System.Windows.Forms.ToolStripMenuItem agregarLicenciaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem eliminarTitularToolStripMenuItem;
        private System.Windows.Forms.BindingSource bindingSource2;
        private System.Data.DataSet dataSet2;
    }
}