﻿namespace SGLibrary
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.txtIdConciliacion = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txtdsUsuario = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.dtConciliacion = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.panelbusqueda = new System.Windows.Forms.Panel();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.fechahasta = new System.Windows.Forms.DateTimePicker();
            this.fechadesde = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.botonesForm1 = new ControlesdeUsuario.BotonesForm();
            this.panelcarga.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.panelbusqueda.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.SuspendLayout();
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(67, 4);
            // 
            // panelcarga
            // 
            this.panelcarga.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelcarga.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.panelcarga.Controls.Add(this.dataGridView1);
            this.panelcarga.Controls.Add(this.txtIdConciliacion);
            this.panelcarga.Controls.Add(this.label8);
            this.panelcarga.Controls.Add(this.txtdsUsuario);
            this.panelcarga.Controls.Add(this.label6);
            this.panelcarga.Controls.Add(this.label7);
            this.panelcarga.Controls.Add(this.dtConciliacion);
            this.panelcarga.Controls.Add(this.label2);
            this.panelcarga.Location = new System.Drawing.Point(33, 54);
            this.panelcarga.Margin = new System.Windows.Forms.Padding(4);
            this.panelcarga.Name = "panelcarga";
            this.panelcarga.Size = new System.Drawing.Size(933, 386);
            this.panelcarga.TabIndex = 2;
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.dataGridView1.Location = new System.Drawing.Point(25, 114);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(883, 241);
            this.dataGridView1.TabIndex = 12;
            // 
            // txtIdConciliacion
            // 
            this.txtIdConciliacion.Location = new System.Drawing.Point(139, 46);
            this.txtIdConciliacion.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtIdConciliacion.Name = "txtIdConciliacion";
            this.txtIdConciliacion.Size = new System.Drawing.Size(112, 22);
            this.txtIdConciliacion.TabIndex = 11;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(41, 48);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(58, 17);
            this.label8.TabIndex = 10;
            this.label8.Text = "Número";
            // 
            // txtdsUsuario
            // 
            this.txtdsUsuario.Location = new System.Drawing.Point(320, 43);
            this.txtdsUsuario.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtdsUsuario.Name = "txtdsUsuario";
            this.txtdsUsuario.Size = new System.Drawing.Size(216, 22);
            this.txtdsUsuario.TabIndex = 9;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(257, 48);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(57, 17);
            this.label6.TabIndex = 8;
            this.label6.Text = "Usuario";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(41, 81);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(47, 17);
            this.label7.TabIndex = 7;
            this.label7.Text = "Fecha";
            // 
            // dtConciliacion
            // 
            this.dtConciliacion.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtConciliacion.Location = new System.Drawing.Point(139, 76);
            this.dtConciliacion.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dtConciliacion.Name = "dtConciliacion";
            this.dtConciliacion.Size = new System.Drawing.Size(112, 22);
            this.dtConciliacion.TabIndex = 6;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(9, 11);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(125, 17);
            this.label2.TabIndex = 0;
            this.label2.Text = "carga de los datos";
            // 
            // panelbusqueda
            // 
            this.panelbusqueda.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelbusqueda.BackColor = System.Drawing.Color.LightBlue;
            this.panelbusqueda.Controls.Add(this.dataGridView2);
            this.panelbusqueda.Controls.Add(this.comboBox1);
            this.panelbusqueda.Controls.Add(this.label5);
            this.panelbusqueda.Controls.Add(this.label4);
            this.panelbusqueda.Controls.Add(this.label3);
            this.panelbusqueda.Controls.Add(this.fechahasta);
            this.panelbusqueda.Controls.Add(this.fechadesde);
            this.panelbusqueda.Controls.Add(this.label1);
            this.panelbusqueda.Location = new System.Drawing.Point(16, 54);
            this.panelbusqueda.Margin = new System.Windows.Forms.Padding(4);
            this.panelbusqueda.Name = "panelbusqueda";
            this.panelbusqueda.Size = new System.Drawing.Size(925, 342);
            this.panelbusqueda.TabIndex = 0;
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
            this.dataGridView2.Location = new System.Drawing.Point(17, 114);
            this.dataGridView2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.RowTemplate.Height = 24;
            this.dataGridView2.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView2.Size = new System.Drawing.Size(888, 209);
            this.dataGridView2.TabIndex = 13;
            // 
            // comboBox1
            // 
            this.comboBox1.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(121, 63);
            this.comboBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(208, 24);
            this.comboBox1.TabIndex = 6;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(27, 65);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(57, 17);
            this.label5.TabIndex = 5;
            this.label5.Text = "Usuario";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(247, 36);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(21, 17);
            this.label4.TabIndex = 4;
            this.label4.Text = "A:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(23, 36);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(92, 17);
            this.label3.TabIndex = 3;
            this.label3.Text = "Fecha Desde";
            // 
            // fechahasta
            // 
            this.fechahasta.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.fechahasta.Location = new System.Drawing.Point(272, 31);
            this.fechahasta.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.fechahasta.Name = "fechahasta";
            this.fechahasta.Size = new System.Drawing.Size(133, 22);
            this.fechahasta.TabIndex = 2;
            // 
            // fechadesde
            // 
            this.fechadesde.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.fechadesde.Location = new System.Drawing.Point(121, 31);
            this.fechadesde.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.fechadesde.Name = "fechadesde";
            this.fechadesde.Size = new System.Drawing.Size(112, 22);
            this.fechadesde.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(19, 11);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(126, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Lista de Busqueda";
            // 
            // botonesForm1
            // 
            this.botonesForm1.AutoSize = true;
            this.botonesForm1.Location = new System.Drawing.Point(0, 5);
            this.botonesForm1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.botonesForm1.MododeEdicion = ControlesdeUsuario.ABMBotonesForm.FIND;
            this.botonesForm1.Name = "botonesForm1";
            this.botonesForm1.Size = new System.Drawing.Size(817, 36);
            this.botonesForm1.TabIndex = 3;
            this.botonesForm1.ClickEventDelegateHandler += new ControlesdeUsuario.BotonesForm.ClickDelegateHandler(this.botonesForm1_ClickEventDelegateHandler);
            this.botonesForm1.Load += new System.EventHandler(this.botonesForm1_Load);
            // 
            // FrmConciliaciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1013, 473);
            this.Controls.Add(this.botonesForm1);
            this.Controls.Add(this.panelbusqueda);
            this.Controls.Add(this.panelcarga);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "FrmConciliaciones";
            this.Text = "Conciliaciones";
            this.Load += new System.EventHandler(this.FrmConciliaciones_Load);
            this.panelcarga.ResumeLayout(false);
            this.panelcarga.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.panelbusqueda.ResumeLayout(false);
            this.panelbusqueda.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
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
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtdsUsuario;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.DateTimePicker dtConciliacion;
        private System.Windows.Forms.TextBox txtIdConciliacion;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridView dataGridView2;
        private ControlesdeUsuario.BotonesForm botonesForm1;
    }
}