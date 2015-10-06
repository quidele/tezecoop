namespace SGLibrary
{
    partial class FrmSeleccionarImpresora
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
            this.cbImpresoras = new System.Windows.Forms.ComboBox();
            this.btn_selecccionar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtImpresora = new System.Windows.Forms.TextBox();
            this.printDialog1 = new System.Windows.Forms.PrintDialog();
            this.SuspendLayout();
            // 
            // cbImpresoras
            // 
            this.cbImpresoras.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbImpresoras.FormattingEnabled = true;
            this.cbImpresoras.Location = new System.Drawing.Point(31, 47);
            this.cbImpresoras.Name = "cbImpresoras";
            this.cbImpresoras.Size = new System.Drawing.Size(322, 21);
            this.cbImpresoras.TabIndex = 0;
            // 
            // btn_selecccionar
            // 
            this.btn_selecccionar.Location = new System.Drawing.Point(31, 94);
            this.btn_selecccionar.Name = "btn_selecccionar";
            this.btn_selecccionar.Size = new System.Drawing.Size(90, 35);
            this.btn_selecccionar.TabIndex = 1;
            this.btn_selecccionar.Text = "Seleccionar";
            this.btn_selecccionar.UseVisualStyleBackColor = true;
            this.btn_selecccionar.Click += new System.EventHandler(this.btn_selecccionar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(28, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(97, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Lista de impresoras";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(28, 158);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(115, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Impresora Selecionada";
            this.label2.Visible = false;
            // 
            // txtImpresora
            // 
            this.txtImpresora.Location = new System.Drawing.Point(31, 176);
            this.txtImpresora.Name = "txtImpresora";
            this.txtImpresora.ReadOnly = true;
            this.txtImpresora.Size = new System.Drawing.Size(322, 20);
            this.txtImpresora.TabIndex = 4;
            this.txtImpresora.Visible = false;
            // 
            // printDialog1
            // 
            this.printDialog1.UseEXDialog = true;
            // 
            // FrmSeleccionarImpresora
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(380, 263);
            this.ControlBox = false;
            this.Controls.Add(this.txtImpresora);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btn_selecccionar);
            this.Controls.Add(this.cbImpresoras);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmSeleccionarImpresora";
            this.Text = "Seleccionar Impresora";
            this.Load += new System.EventHandler(this.Form2_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cbImpresoras;
        private System.Windows.Forms.Button btn_selecccionar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtImpresora;
        private System.Windows.Forms.PrintDialog printDialog1;
    }
}