namespace SGLibrary
{
    partial class FrmPrincipal
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.busquedaDeComprobantesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.busquedaDeComprobantesToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.obligacionesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.conciliacionesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.obligacionesEstadoDeCuentaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.busquedaDeComprobantesToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(284, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(12, 20);
            // 
            // busquedaDeComprobantesToolStripMenuItem
            // 
            this.busquedaDeComprobantesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.busquedaDeComprobantesToolStripMenuItem1,
            this.obligacionesToolStripMenuItem,
            this.conciliacionesToolStripMenuItem,
            this.obligacionesEstadoDeCuentaToolStripMenuItem});
            this.busquedaDeComprobantesToolStripMenuItem.Name = "busquedaDeComprobantesToolStripMenuItem";
            this.busquedaDeComprobantesToolStripMenuItem.Size = new System.Drawing.Size(76, 20);
            this.busquedaDeComprobantesToolStripMenuItem.Text = "Programas";
            // 
            // busquedaDeComprobantesToolStripMenuItem1
            // 
            this.busquedaDeComprobantesToolStripMenuItem1.Name = "busquedaDeComprobantesToolStripMenuItem1";
            this.busquedaDeComprobantesToolStripMenuItem1.Size = new System.Drawing.Size(246, 22);
            this.busquedaDeComprobantesToolStripMenuItem1.Text = "Busqueda de Comprobantes";
            this.busquedaDeComprobantesToolStripMenuItem1.Click += new System.EventHandler(this.busquedaDeComprobantesToolStripMenuItem1_Click);
            // 
            // obligacionesToolStripMenuItem
            // 
            this.obligacionesToolStripMenuItem.Name = "obligacionesToolStripMenuItem";
            this.obligacionesToolStripMenuItem.Size = new System.Drawing.Size(246, 22);
            this.obligacionesToolStripMenuItem.Text = "Obligaciones";
            this.obligacionesToolStripMenuItem.Click += new System.EventHandler(this.obligacionesToolStripMenuItem_Click);
            // 
            // conciliacionesToolStripMenuItem
            // 
            this.conciliacionesToolStripMenuItem.Name = "conciliacionesToolStripMenuItem";
            this.conciliacionesToolStripMenuItem.Size = new System.Drawing.Size(246, 22);
            this.conciliacionesToolStripMenuItem.Text = "Conciliaciones";
            this.conciliacionesToolStripMenuItem.Click += new System.EventHandler(this.conciliacionesToolStripMenuItem_Click);
            // 
            // obligacionesEstadoDeCuentaToolStripMenuItem
            // 
            this.obligacionesEstadoDeCuentaToolStripMenuItem.Name = "obligacionesEstadoDeCuentaToolStripMenuItem";
            this.obligacionesEstadoDeCuentaToolStripMenuItem.Size = new System.Drawing.Size(246, 22);
            this.obligacionesEstadoDeCuentaToolStripMenuItem.Text = "Estado de Cuenta - Obligaciones";
            this.obligacionesEstadoDeCuentaToolStripMenuItem.Click += new System.EventHandler(this.obligacionesEstadoDeCuentaToolStripMenuItem_Click);
            // 
            // FrmPrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 262);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "FrmPrincipal";
            this.Text = "Ejecución de Programas";
            this.Load += new System.EventHandler(this.FrmPrincipal_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem busquedaDeComprobantesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem busquedaDeComprobantesToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem obligacionesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem conciliacionesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem obligacionesEstadoDeCuentaToolStripMenuItem;
    }
}