namespace ControlesdeUsuario
{
    partial class BotonesForm
    {
        /// <summary> 
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de componentes

        /// <summary> 
        /// Método necesario para admitir el Diseñador. No se puede modificar 
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BotonesForm));
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.botonFIND = new System.Windows.Forms.ToolStripButton();
            this.botonEDIT = new System.Windows.Forms.ToolStripButton();
            this.botonADD = new System.Windows.Forms.ToolStripButton();
            this.botonDELETE = new System.Windows.Forms.ToolStripButton();
            this.botonOK = new System.Windows.Forms.ToolStripButton();
            this.botonCANCEL = new System.Windows.Forms.ToolStripButton();
            this.botonPRINT = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // toolStrip1
            // 
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.botonFIND,
            this.botonEDIT,
            this.botonADD,
            this.botonDELETE,
            this.botonOK,
            this.botonCANCEL,
            this.botonPRINT,
            this.toolStripButton1});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(596, 27);
            this.toolStrip1.TabIndex = 0;
            this.toolStrip1.Text = "toolStrip1";
            this.toolStrip1.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.toolStrip1_ItemClicked);
            // 
            // botonFIND
            // 
            this.botonFIND.Image = ((System.Drawing.Image)(resources.GetObject("botonFIND.Image")));
            this.botonFIND.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.botonFIND.Name = "botonFIND";
            this.botonFIND.Size = new System.Drawing.Size(66, 24);
            this.botonFIND.Tag = "FIND";
            this.botonFIND.Text = "FIND";
            this.botonFIND.Click += new System.EventHandler(this.toolStripButton1_Click);
            // 
            // botonEDIT
            // 
            this.botonEDIT.Image = ((System.Drawing.Image)(resources.GetObject("botonEDIT.Image")));
            this.botonEDIT.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.botonEDIT.Name = "botonEDIT";
            this.botonEDIT.Size = new System.Drawing.Size(64, 24);
            this.botonEDIT.Tag = "EDIT";
            this.botonEDIT.Text = "EDIT";
            this.botonEDIT.Click += new System.EventHandler(this.toolStripButton2_Click);
            // 
            // botonADD
            // 
            this.botonADD.Image = ((System.Drawing.Image)(resources.GetObject("botonADD.Image")));
            this.botonADD.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.botonADD.Name = "botonADD";
            this.botonADD.Size = new System.Drawing.Size(65, 24);
            this.botonADD.Tag = "ADD";
            this.botonADD.Text = "ADD";
            this.botonADD.Click += new System.EventHandler(this.toolStripButton3_Click);
            // 
            // botonDELETE
            // 
            this.botonDELETE.Image = ((System.Drawing.Image)(resources.GetObject("botonDELETE.Image")));
            this.botonDELETE.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.botonDELETE.Name = "botonDELETE";
            this.botonDELETE.Size = new System.Drawing.Size(83, 24);
            this.botonDELETE.Tag = "DELETE";
            this.botonDELETE.Text = "DELETE";
            this.botonDELETE.Click += new System.EventHandler(this.toolStripButton4_Click);
            // 
            // botonOK
            // 
            this.botonOK.Image = ((System.Drawing.Image)(resources.GetObject("botonOK.Image")));
            this.botonOK.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.botonOK.Name = "botonOK";
            this.botonOK.Size = new System.Drawing.Size(53, 24);
            this.botonOK.Tag = "OK";
            this.botonOK.Text = "OK";
            this.botonOK.Click += new System.EventHandler(this.toolStripButton5_Click);
            // 
            // botonCANCEL
            // 
            this.botonCANCEL.Image = ((System.Drawing.Image)(resources.GetObject("botonCANCEL.Image")));
            this.botonCANCEL.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.botonCANCEL.Name = "botonCANCEL";
            this.botonCANCEL.Size = new System.Drawing.Size(87, 24);
            this.botonCANCEL.Tag = "CANCEL";
            this.botonCANCEL.Text = "CANCEL";
            this.botonCANCEL.Click += new System.EventHandler(this.toolStripButton6_Click);
            // 
            // botonPRINT
            // 
            this.botonPRINT.Image = ((System.Drawing.Image)(resources.GetObject("botonPRINT.Image")));
            this.botonPRINT.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.botonPRINT.Name = "botonPRINT";
            this.botonPRINT.Size = new System.Drawing.Size(73, 24);
            this.botonPRINT.Tag = "PRINT";
            this.botonPRINT.Text = "PRINT";
            this.botonPRINT.Click += new System.EventHandler(this.toolStripButton7_Click);
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton1.Image = ((System.Drawing.Image)(resources.GetObject("toolStripButton1.Image")));
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(24, 24);
            this.toolStripButton1.Text = "toolStripButton1";
            // 
            // BotonesForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.Controls.Add(this.toolStrip1);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "BotonesForm";
            this.Size = new System.Drawing.Size(596, 34);
            this.Load += new System.EventHandler(this.BotonesForm_Load);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton botonFIND;
        private System.Windows.Forms.ToolStripButton botonEDIT;
        private System.Windows.Forms.ToolStripButton botonADD;
        private System.Windows.Forms.ToolStripButton botonDELETE;
        private System.Windows.Forms.ToolStripButton botonOK;
        private System.Windows.Forms.ToolStripButton botonCANCEL;
        private System.Windows.Forms.ToolStripButton botonPRINT;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
    }
}
