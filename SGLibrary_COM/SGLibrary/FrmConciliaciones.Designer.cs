namespace SGLibrary
{
    partial class FrmConciliaciones
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
            this.lblDgv1Registros = new System.Windows.Forms.Label();
            this.dataGridView1 = new ADGV.AdvancedDataGridView();
            this.label12 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.txtIdArchivo = new System.Windows.Forms.TextBox();
            this.btnSelecccionarArchivoTarjeta = new System.Windows.Forms.Button();
            this.txtNombreArchivoTarjeta = new System.Windows.Forms.TextBox();
            this.modoEdicion = new System.Windows.Forms.TextBox();
            this.txtflEstado = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtnrCajaAdm = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.txtIdConciliacion = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txtdsUsuario = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.cbdtConciliacion = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.cbtipoConciliacion = new System.Windows.Forms.ComboBox();
            this.txtFormato = new System.Windows.Forms.TextBox();
            this.panelbusqueda = new System.Windows.Forms.Panel();
            this.button1 = new System.Windows.Forms.Button();
            this.label13 = new System.Windows.Forms.Label();
            this.cbFormato = new System.Windows.Forms.ComboBox();
            this.cbUsuariosConciliaciones = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.fechahasta = new System.Windows.Forms.DateTimePicker();
            this.fechadesde = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
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
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.panelbusqueda.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
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
            this.panelcarga.Controls.Add(this.lblDgv1Registros);
            this.panelcarga.Controls.Add(this.dataGridView1);
            this.panelcarga.Controls.Add(this.label12);
            this.panelcarga.Controls.Add(this.label11);
            this.panelcarga.Controls.Add(this.txtIdArchivo);
            this.panelcarga.Controls.Add(this.btnSelecccionarArchivoTarjeta);
            this.panelcarga.Controls.Add(this.txtNombreArchivoTarjeta);
            this.panelcarga.Controls.Add(this.modoEdicion);
            this.panelcarga.Controls.Add(this.txtflEstado);
            this.panelcarga.Controls.Add(this.label10);
            this.panelcarga.Controls.Add(this.txtnrCajaAdm);
            this.panelcarga.Controls.Add(this.label9);
            this.panelcarga.Controls.Add(this.txtIdConciliacion);
            this.panelcarga.Controls.Add(this.label8);
            this.panelcarga.Controls.Add(this.txtdsUsuario);
            this.panelcarga.Controls.Add(this.label6);
            this.panelcarga.Controls.Add(this.label7);
            this.panelcarga.Controls.Add(this.cbdtConciliacion);
            this.panelcarga.Controls.Add(this.label2);
            this.panelcarga.Controls.Add(this.cbtipoConciliacion);
            this.panelcarga.Controls.Add(this.txtFormato);
            this.panelcarga.Location = new System.Drawing.Point(25, 44);
            this.panelcarga.Name = "panelcarga";
            this.panelcarga.Size = new System.Drawing.Size(977, 314);
            this.panelcarga.TabIndex = 2;
            this.panelcarga.Paint += new System.Windows.Forms.PaintEventHandler(this.panelcarga_Paint);
            // 
            // lblDgv1Registros
            // 
            this.lblDgv1Registros.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblDgv1Registros.AutoSize = true;
            this.lblDgv1Registros.Location = new System.Drawing.Point(16, 295);
            this.lblDgv1Registros.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblDgv1Registros.Name = "lblDgv1Registros";
            this.lblDgv1Registros.Size = new System.Drawing.Size(41, 13);
            this.lblDgv1Registros.TabIndex = 26;
            this.lblDgv1Registros.Text = "label14";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.AllowUserToResizeColumns = false;
            this.dataGridView1.AllowUserToResizeRows = false;
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.AutoGenerateContextFilters = true;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.DateWithTime = false;
            this.dataGridView1.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnF2;
            this.dataGridView1.Location = new System.Drawing.Point(18, 93);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(940, 201);
            this.dataGridView1.TabIndex = 12;
            this.dataGridView1.TimeFilter = false;
            this.dataGridView1.SortStringChanged += new System.EventHandler(this.dataGridView1_SortStringChanged);
            this.dataGridView1.FilterStringChanged += new System.EventHandler(this.dataGridView1_FilterStringChanged);
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick_1);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(751, 41);
            this.label12.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(42, 13);
            this.label12.TabIndex = 25;
            this.label12.Text = "Edición";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(666, 41);
            this.label11.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(55, 13);
            this.label11.TabIndex = 24;
            this.label11.Text = "Id Archivo";
            // 
            // txtIdArchivo
            // 
            this.txtIdArchivo.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtIdArchivo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtIdArchivo.Location = new System.Drawing.Point(723, 36);
            this.txtIdArchivo.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtIdArchivo.Name = "txtIdArchivo";
            this.txtIdArchivo.ReadOnly = true;
            this.txtIdArchivo.Size = new System.Drawing.Size(24, 20);
            this.txtIdArchivo.TabIndex = 22;
            // 
            // btnSelecccionarArchivoTarjeta
            // 
            this.btnSelecccionarArchivoTarjeta.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSelecccionarArchivoTarjeta.Location = new System.Drawing.Point(932, 65);
            this.btnSelecccionarArchivoTarjeta.Name = "btnSelecccionarArchivoTarjeta";
            this.btnSelecccionarArchivoTarjeta.Size = new System.Drawing.Size(26, 22);
            this.btnSelecccionarArchivoTarjeta.TabIndex = 20;
            this.btnSelecccionarArchivoTarjeta.Text = "...";
            this.btnSelecccionarArchivoTarjeta.UseVisualStyleBackColor = true;
            this.btnSelecccionarArchivoTarjeta.Click += new System.EventHandler(this.btnSelecccionarArchivoTarjeta_Click);
            // 
            // txtNombreArchivoTarjeta
            // 
            this.txtNombreArchivoTarjeta.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtNombreArchivoTarjeta.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtNombreArchivoTarjeta.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtNombreArchivoTarjeta.Location = new System.Drawing.Point(248, 66);
            this.txtNombreArchivoTarjeta.Name = "txtNombreArchivoTarjeta";
            this.txtNombreArchivoTarjeta.ReadOnly = true;
            this.txtNombreArchivoTarjeta.Size = new System.Drawing.Size(683, 20);
            this.txtNombreArchivoTarjeta.TabIndex = 19;
            // 
            // modoEdicion
            // 
            this.modoEdicion.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.modoEdicion.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.modoEdicion.Location = new System.Drawing.Point(808, 36);
            this.modoEdicion.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.modoEdicion.Name = "modoEdicion";
            this.modoEdicion.ReadOnly = true;
            this.modoEdicion.Size = new System.Drawing.Size(24, 20);
            this.modoEdicion.TabIndex = 17;
            // 
            // txtflEstado
            // 
            this.txtflEstado.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtflEstado.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtflEstado.Location = new System.Drawing.Point(635, 37);
            this.txtflEstado.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtflEstado.Name = "txtflEstado";
            this.txtflEstado.ReadOnly = true;
            this.txtflEstado.Size = new System.Drawing.Size(27, 20);
            this.txtflEstado.TabIndex = 16;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(592, 41);
            this.label10.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(40, 13);
            this.label10.TabIndex = 15;
            this.label10.Text = "Estado";
            // 
            // txtnrCajaAdm
            // 
            this.txtnrCajaAdm.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtnrCajaAdm.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtnrCajaAdm.Location = new System.Drawing.Point(425, 37);
            this.txtnrCajaAdm.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtnrCajaAdm.Name = "txtnrCajaAdm";
            this.txtnrCajaAdm.ReadOnly = true;
            this.txtnrCajaAdm.Size = new System.Drawing.Size(163, 20);
            this.txtnrCajaAdm.TabIndex = 14;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(368, 39);
            this.label9.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(55, 13);
            this.label9.TabIndex = 13;
            this.label9.Text = "Caja Adm.";
            // 
            // txtIdConciliacion
            // 
            this.txtIdConciliacion.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtIdConciliacion.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtIdConciliacion.Location = new System.Drawing.Point(64, 35);
            this.txtIdConciliacion.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtIdConciliacion.Name = "txtIdConciliacion";
            this.txtIdConciliacion.ReadOnly = true;
            this.txtIdConciliacion.Size = new System.Drawing.Size(85, 20);
            this.txtIdConciliacion.TabIndex = 11;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(16, 37);
            this.label8.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(44, 13);
            this.label8.TabIndex = 10;
            this.label8.Text = "Número";
            // 
            // txtdsUsuario
            // 
            this.txtdsUsuario.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtdsUsuario.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtdsUsuario.Location = new System.Drawing.Point(201, 35);
            this.txtdsUsuario.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtdsUsuario.Name = "txtdsUsuario";
            this.txtdsUsuario.ReadOnly = true;
            this.txtdsUsuario.Size = new System.Drawing.Size(163, 20);
            this.txtdsUsuario.TabIndex = 9;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(154, 41);
            this.label6.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(43, 13);
            this.label6.TabIndex = 8;
            this.label6.Text = "Usuario";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(16, 67);
            this.label7.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(37, 13);
            this.label7.TabIndex = 7;
            this.label7.Text = "Fecha";
            // 
            // cbdtConciliacion
            // 
            this.cbdtConciliacion.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.cbdtConciliacion.Location = new System.Drawing.Point(56, 65);
            this.cbdtConciliacion.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cbdtConciliacion.Name = "cbdtConciliacion";
            this.cbdtConciliacion.Size = new System.Drawing.Size(85, 20);
            this.cbdtConciliacion.TabIndex = 6;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(7, 9);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(94, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "carga de los datos";
            // 
            // cbtipoConciliacion
            // 
            this.cbtipoConciliacion.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbtipoConciliacion.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbtipoConciliacion.FormattingEnabled = true;
            this.cbtipoConciliacion.Items.AddRange(new object[] {
            "Visa",
            "Master",
            "Manual",
            "Todo Pago",
            "Amca Amex",
            "Amca Visa",
            "Amca Master"});
            this.cbtipoConciliacion.Location = new System.Drawing.Point(146, 65);
            this.cbtipoConciliacion.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cbtipoConciliacion.Name = "cbtipoConciliacion";
            this.cbtipoConciliacion.Size = new System.Drawing.Size(97, 21);
            this.cbtipoConciliacion.TabIndex = 21;
            this.cbtipoConciliacion.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // txtFormato
            // 
            this.txtFormato.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtFormato.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtFormato.Location = new System.Drawing.Point(146, 66);
            this.txtFormato.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtFormato.Name = "txtFormato";
            this.txtFormato.ReadOnly = true;
            this.txtFormato.Size = new System.Drawing.Size(96, 20);
            this.txtFormato.TabIndex = 23;
            // 
            // panelbusqueda
            // 
            this.panelbusqueda.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelbusqueda.BackColor = System.Drawing.Color.LightBlue;
            this.panelbusqueda.Controls.Add(this.button1);
            this.panelbusqueda.Controls.Add(this.label13);
            this.panelbusqueda.Controls.Add(this.cbFormato);
            this.panelbusqueda.Controls.Add(this.cbUsuariosConciliaciones);
            this.panelbusqueda.Controls.Add(this.label5);
            this.panelbusqueda.Controls.Add(this.label4);
            this.panelbusqueda.Controls.Add(this.label3);
            this.panelbusqueda.Controls.Add(this.fechahasta);
            this.panelbusqueda.Controls.Add(this.fechadesde);
            this.panelbusqueda.Controls.Add(this.label1);
            this.panelbusqueda.Controls.Add(this.dataGridView2);
            this.panelbusqueda.Location = new System.Drawing.Point(12, 44);
            this.panelbusqueda.Name = "panelbusqueda";
            this.panelbusqueda.Size = new System.Drawing.Size(1005, 328);
            this.panelbusqueda.TabIndex = 0;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(464, 48);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(137, 23);
            this.button1.TabIndex = 16;
            this.button1.Text = "Buscar Viaje";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(259, 55);
            this.label13.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(28, 13);
            this.label13.TabIndex = 15;
            this.label13.Text = "Tipo";
            this.label13.Click += new System.EventHandler(this.label13_Click);
            // 
            // cbFormato
            // 
            this.cbFormato.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbFormato.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbFormato.FormattingEnabled = true;
            this.cbFormato.Items.AddRange(new object[] {
            "Visa",
            "Master",
            "Manual",
            "Todo Pago"});
            this.cbFormato.Location = new System.Drawing.Point(290, 50);
            this.cbFormato.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cbFormato.Name = "cbFormato";
            this.cbFormato.Size = new System.Drawing.Size(157, 21);
            this.cbFormato.TabIndex = 14;
            // 
            // cbUsuariosConciliaciones
            // 
            this.cbUsuariosConciliaciones.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbUsuariosConciliaciones.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbUsuariosConciliaciones.FormattingEnabled = true;
            this.cbUsuariosConciliaciones.Location = new System.Drawing.Point(91, 50);
            this.cbUsuariosConciliaciones.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cbUsuariosConciliaciones.Name = "cbUsuariosConciliaciones";
            this.cbUsuariosConciliaciones.Size = new System.Drawing.Size(157, 21);
            this.cbUsuariosConciliaciones.TabIndex = 6;
            this.cbUsuariosConciliaciones.SelectedIndexChanged += new System.EventHandler(this.cbUsuariosConciliaciones_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(20, 55);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(43, 13);
            this.label5.TabIndex = 5;
            this.label5.Text = "Usuario";
            this.label5.Click += new System.EventHandler(this.label5_Click);
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
            this.fechahasta.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.fechahasta.Name = "fechahasta";
            this.fechahasta.Size = new System.Drawing.Size(101, 20);
            this.fechahasta.TabIndex = 2;
            // 
            // fechadesde
            // 
            this.fechadesde.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.fechadesde.Location = new System.Drawing.Point(91, 25);
            this.fechadesde.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
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
            // dataGridView2
            // 
            this.dataGridView2.AllowUserToAddRows = false;
            this.dataGridView2.AllowUserToDeleteRows = false;
            this.dataGridView2.AllowUserToOrderColumns = true;
            this.dataGridView2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.dataGridView2.Location = new System.Drawing.Point(13, 82);
            this.dataGridView2.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.RowTemplate.Height = 24;
            this.dataGridView2.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView2.Size = new System.Drawing.Size(977, 231);
            this.dataGridView2.TabIndex = 13;
            this.dataGridView2.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView2_CellContentClick);
            this.dataGridView2.CellContentDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView2_CellContentDoubleClick);
            this.dataGridView2.RowHeaderMouseDoubleClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dataGridView2_RowHeaderMouseDoubleClick);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
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
            this.status_bar_usuario.Size = new System.Drawing.Size(1029, 22);
            this.status_bar_usuario.TabIndex = 4;
            this.status_bar_usuario.Text = "statusStrip1";
            this.status_bar_usuario.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.statusStrip1_ItemClicked);
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
            this.statusbar_servidor.Click += new System.EventHandler(this.statusbar_servidor_Click);
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
            this.botonesForm1.Size = new System.Drawing.Size(837, 29);
            this.botonesForm1.TabIndex = 3;
            this.botonesForm1.ClickEventDelegateHandler += new ControlesdeUsuario.BotonesForm.ClickDelegateHandler(this.botonesForm1_ClickEventDelegateHandler);
            this.botonesForm1.Load += new System.EventHandler(this.botonesForm1_Load);
            // 
            // FrmConciliaciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1029, 384);
            this.Controls.Add(this.status_bar_usuario);
            this.Controls.Add(this.botonesForm1);
            this.Controls.Add(this.panelcarga);
            this.Controls.Add(this.panelbusqueda);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "FrmConciliaciones";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Conciliaciones";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmConciliaciones_Load);
            this.panelcarga.ResumeLayout(false);
            this.panelcarga.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.panelbusqueda.ResumeLayout(false);
            this.panelbusqueda.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
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
        private System.Windows.Forms.TextBox txtdsUsuario;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.DateTimePicker cbdtConciliacion;
        private System.Windows.Forms.TextBox txtIdConciliacion;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.DataGridView dataGridView2;
        private ControlesdeUsuario.BotonesForm botonesForm1;
        private System.Windows.Forms.TextBox txtnrCajaAdm;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtflEstado;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox modoEdicion;
        private System.Windows.Forms.ComboBox cbtipoConciliacion;
        private System.Windows.Forms.Button btnSelecccionarArchivoTarjeta;
        private System.Windows.Forms.TextBox txtNombreArchivoTarjeta;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.TextBox txtIdArchivo;
        private System.Windows.Forms.TextBox txtFormato;
        private System.Windows.Forms.StatusStrip status_bar_usuario;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_usuario;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_bd;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_nrocaja;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_servidor;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.ToolStripStatusLabel statusbar_version;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.ComboBox cbFormato;
        private ADGV.AdvancedDataGridView dataGridView1;
        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Data.DataSet dataSet1;
        private System.Windows.Forms.Label lblDgv1Registros;
        private System.Windows.Forms.Button button1;
    }
}