﻿namespace SGLibrary
{
    partial class FrmBuscarComprobantes
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
            this.label7 = new System.Windows.Forms.Label();
            this.fechadesde = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.fechahasta = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtnrCuponPosnet = new System.Windows.Forms.TextBox();
            this.txtnrTarjeta = new System.Windows.Forms.TextBox();
            this.cbEmpresa = new System.Windows.Forms.ComboBox();
            this.txtnrLicencia = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtFactura = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.dataGridView1 = new ADGV.AdvancedDataGridView();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.dataSet1 = new System.Data.DataSet();
            this.lblDgv1Registros = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet1)).BeginInit();
            this.SuspendLayout();
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(15, 5);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(47, 17);
            this.label7.TabIndex = 9;
            this.label7.Text = "Fecha";
            // 
            // fechadesde
            // 
            this.fechadesde.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.fechadesde.Location = new System.Drawing.Point(15, 26);
            this.fechadesde.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.fechadesde.Name = "fechadesde";
            this.fechadesde.Size = new System.Drawing.Size(112, 22);
            this.fechadesde.TabIndex = 8;
            this.fechadesde.ValueChanged += new System.EventHandler(this.fechadesde_ValueChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(136, 5);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(45, 17);
            this.label1.TabIndex = 11;
            this.label1.Text = "Hasta";
            // 
            // fechahasta
            // 
            this.fechahasta.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.fechahasta.Location = new System.Drawing.Point(140, 26);
            this.fechahasta.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.fechahasta.Name = "fechahasta";
            this.fechahasta.Size = new System.Drawing.Size(112, 22);
            this.fechahasta.TabIndex = 10;
            this.fechahasta.ValueChanged += new System.EventHandler(this.fechahasta_ValueChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(435, 5);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(97, 17);
            this.label2.TabIndex = 12;
            this.label2.Text = "Cupon Posnet";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(541, 5);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(100, 17);
            this.label3.TabIndex = 13;
            this.label3.Text = "Nro de Tarjeta";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(260, 5);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(64, 17);
            this.label4.TabIndex = 14;
            this.label4.Text = "Empresa";
            // 
            // txtnrCuponPosnet
            // 
            this.txtnrCuponPosnet.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtnrCuponPosnet.Location = new System.Drawing.Point(429, 25);
            this.txtnrCuponPosnet.Margin = new System.Windows.Forms.Padding(4);
            this.txtnrCuponPosnet.Name = "txtnrCuponPosnet";
            this.txtnrCuponPosnet.Size = new System.Drawing.Size(103, 22);
            this.txtnrCuponPosnet.TabIndex = 15;
            this.txtnrCuponPosnet.TextChanged += new System.EventHandler(this.txtnrCuponPosnet_TextChanged);
            // 
            // txtnrTarjeta
            // 
            this.txtnrTarjeta.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtnrTarjeta.Location = new System.Drawing.Point(545, 25);
            this.txtnrTarjeta.Margin = new System.Windows.Forms.Padding(4);
            this.txtnrTarjeta.Name = "txtnrTarjeta";
            this.txtnrTarjeta.Size = new System.Drawing.Size(103, 22);
            this.txtnrTarjeta.TabIndex = 16;
            this.txtnrTarjeta.TextChanged += new System.EventHandler(this.txtnrTarjeta_TextChanged);
            // 
            // cbEmpresa
            // 
            this.cbEmpresa.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbEmpresa.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbEmpresa.FormattingEnabled = true;
            this.cbEmpresa.Items.AddRange(new object[] {
            "VISA",
            "MASTER/Maestro",
            "AMEX",
            "CABAL",
            "OTRA"});
            this.cbEmpresa.Location = new System.Drawing.Point(264, 23);
            this.cbEmpresa.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbEmpresa.Name = "cbEmpresa";
            this.cbEmpresa.Size = new System.Drawing.Size(157, 24);
            this.cbEmpresa.TabIndex = 22;
            this.cbEmpresa.SelectedIndexChanged += new System.EventHandler(this.cbEmpresa_SelectedIndexChanged);
            // 
            // txtnrLicencia
            // 
            this.txtnrLicencia.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtnrLicencia.Location = new System.Drawing.Point(653, 25);
            this.txtnrLicencia.Margin = new System.Windows.Forms.Padding(4);
            this.txtnrLicencia.Name = "txtnrLicencia";
            this.txtnrLicencia.Size = new System.Drawing.Size(57, 22);
            this.txtnrLicencia.TabIndex = 24;
            this.txtnrLicencia.TextChanged += new System.EventHandler(this.txtnrLicencia_TextChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(649, 5);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 17);
            this.label5.TabIndex = 23;
            this.label5.Text = "Licencia";
            // 
            // txtFactura
            // 
            this.txtFactura.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtFactura.Location = new System.Drawing.Point(720, 25);
            this.txtFactura.Margin = new System.Windows.Forms.Padding(4);
            this.txtFactura.Name = "txtFactura";
            this.txtFactura.Size = new System.Drawing.Size(112, 22);
            this.txtFactura.TabIndex = 26;
            this.txtFactura.TextChanged += new System.EventHandler(this.txtFactura_TextChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(716, 5);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(56, 17);
            this.label6.TabIndex = 25;
            this.label6.Text = "Factura";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.AutoGenerateContextFilters = true;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.DateWithTime = false;
            this.dataGridView1.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnF2;
            this.dataGridView1.Location = new System.Drawing.Point(19, 60);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(972, 384);
            this.dataGridView1.TabIndex = 27;
            this.dataGridView1.TimeFilter = false;
            this.dataGridView1.SortStringChanged += new System.EventHandler(this.dataGridView1_SortStringChanged);
            this.dataGridView1.FilterStringChanged += new System.EventHandler(this.dataGridView1_FilterStringChanged);
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(843, 21);
            this.btnBuscar.Margin = new System.Windows.Forms.Padding(4);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(100, 28);
            this.btnBuscar.TabIndex = 28;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = true;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // dataSet1
            // 
            this.dataSet1.DataSetName = "NewDataSet";
            // 
            // lblDgv1Registros
            // 
            this.lblDgv1Registros.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblDgv1Registros.AutoSize = true;
            this.lblDgv1Registros.Location = new System.Drawing.Point(19, 450);
            this.lblDgv1Registros.Name = "lblDgv1Registros";
            this.lblDgv1Registros.Size = new System.Drawing.Size(84, 17);
            this.lblDgv1Registros.TabIndex = 29;
            this.lblDgv1Registros.Text = "Registros: 0";
            // 
            // FrmBuscarComprobantes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1005, 470);
            this.Controls.Add(this.lblDgv1Registros);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.txtFactura);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtnrLicencia);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.cbEmpresa);
            this.Controls.Add(this.txtnrTarjeta);
            this.Controls.Add(this.txtnrCuponPosnet);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.fechahasta);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.fechadesde);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "FrmBuscarComprobantes";
            this.Text = "FrmBuscarComprobantes";
            this.Load += new System.EventHandler(this.FrmBuscarComprobantes_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.DateTimePicker fechadesde;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker fechahasta;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtnrCuponPosnet;
        private System.Windows.Forms.TextBox txtnrTarjeta;
        private System.Windows.Forms.ComboBox cbEmpresa;
        private System.Windows.Forms.TextBox txtnrLicencia;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtFactura;
        private System.Windows.Forms.Label label6;
        private ADGV.AdvancedDataGridView dataGridView1;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Data.DataSet dataSet1;
        private System.Windows.Forms.Label lblDgv1Registros;
    }
}