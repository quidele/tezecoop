namespace SGLibrary
{
    partial class FrmXLSSelect
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
            this.printDialog1 = new System.Windows.Forms.PrintDialog();
            this.cbHojas = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.dataGridViewRelColumnasXLSaTarjeta = new System.Windows.Forms.DataGridView();
            this.btnProcesar = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewRelColumnasXLSaTarjeta)).BeginInit();
            this.SuspendLayout();
            // 
            // printDialog1
            // 
            this.printDialog1.UseEXDialog = true;
            // 
            // cbHojas
            // 
            this.cbHojas.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbHojas.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.cbHojas.FormattingEnabled = true;
            this.cbHojas.Location = new System.Drawing.Point(49, 11);
            this.cbHojas.Margin = new System.Windows.Forms.Padding(2);
            this.cbHojas.Name = "cbHojas";
            this.cbHojas.Size = new System.Drawing.Size(157, 21);
            this.cbHojas.TabIndex = 8;
            this.cbHojas.SelectedIndexChanged += new System.EventHandler(this.cbHojas_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(11, 19);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(34, 13);
            this.label5.TabIndex = 7;
            this.label5.Text = "Hojas";
            // 
            // dataGridViewRelColumnasXLSaTarjeta
            // 
            this.dataGridViewRelColumnasXLSaTarjeta.AllowUserToAddRows = false;
            this.dataGridViewRelColumnasXLSaTarjeta.AllowUserToDeleteRows = false;
            this.dataGridViewRelColumnasXLSaTarjeta.AllowUserToOrderColumns = true;
            this.dataGridViewRelColumnasXLSaTarjeta.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewRelColumnasXLSaTarjeta.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewRelColumnasXLSaTarjeta.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.dataGridViewRelColumnasXLSaTarjeta.Location = new System.Drawing.Point(14, 52);
            this.dataGridViewRelColumnasXLSaTarjeta.Margin = new System.Windows.Forms.Padding(2);
            this.dataGridViewRelColumnasXLSaTarjeta.Name = "dataGridViewRelColumnasXLSaTarjeta";
            this.dataGridViewRelColumnasXLSaTarjeta.RowTemplate.Height = 24;
            this.dataGridViewRelColumnasXLSaTarjeta.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewRelColumnasXLSaTarjeta.Size = new System.Drawing.Size(439, 258);
            this.dataGridViewRelColumnasXLSaTarjeta.TabIndex = 14;
            // 
            // btnProcesar
            // 
            this.btnProcesar.Location = new System.Drawing.Point(224, 11);
            this.btnProcesar.Name = "btnProcesar";
            this.btnProcesar.Size = new System.Drawing.Size(75, 23);
            this.btnProcesar.TabIndex = 15;
            this.btnProcesar.Text = "Procesar";
            this.btnProcesar.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(305, 11);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 16;
            this.button2.Text = "Cancelar";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // FrmXLSSelect
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(464, 321);
            this.ControlBox = false;
            this.Controls.Add(this.button2);
            this.Controls.Add(this.btnProcesar);
            this.Controls.Add(this.dataGridViewRelColumnasXLSaTarjeta);
            this.Controls.Add(this.cbHojas);
            this.Controls.Add(this.label5);
            this.Name = "FrmXLSSelect";
            this.Text = "Formato XLS - Tarjeta";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewRelColumnasXLSaTarjeta)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PrintDialog printDialog1;
        private System.Windows.Forms.ComboBox cbHojas;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DataGridView dataGridViewRelColumnasXLSaTarjeta;
        private System.Windows.Forms.Button btnProcesar;
        private System.Windows.Forms.Button button2;
    }
}