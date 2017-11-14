namespace SGLibrary
{
    partial class UCCircularProgressBar
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
            this.components = new System.ComponentModel.Container();
            this.circularProgressBar1 = new CircularProgressBar();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.SuspendLayout();
            // 
            // circularProgressBar1
            // 
            this.circularProgressBar1.Font = new System.Drawing.Font("Segoe UI", 15F);
            this.circularProgressBar1.ForeColor = System.Drawing.Color.DimGray;
            this.circularProgressBar1.LineColor = System.Drawing.Color.Silver;
            this.circularProgressBar1.Location = new System.Drawing.Point(0, 0);
            this.circularProgressBar1.Maximum = ((long)(10));
            this.circularProgressBar1.MinimumSize = new System.Drawing.Size(100, 100);
            this.circularProgressBar1.Name = "circularProgressBar1";
            this.circularProgressBar1.ProgressColor1 = System.Drawing.Color.Orange;
            this.circularProgressBar1.ProgressColor2 = System.Drawing.Color.Orange;
            this.circularProgressBar1.ProgressShape = CircularProgressBar._ProgressShape.Flat;
            this.circularProgressBar1.Size = new System.Drawing.Size(112, 112);
            this.circularProgressBar1.TabIndex = 0;
            this.circularProgressBar1.Text = "circularProgressBar1";
            this.circularProgressBar1.Value = ((long)(10));
            this.circularProgressBar1.Click += new System.EventHandler(this.circularProgressBar1_Click);
            // 
            // timer1
            // 
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // UCCircularProgressBar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.circularProgressBar1);
            this.Name = "UCCircularProgressBar";
            this.Size = new System.Drawing.Size(115, 117);
            this.Load += new System.EventHandler(this.UCCircularProgressBar_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private CircularProgressBar circularProgressBar1;
        private System.Windows.Forms.Timer timer1;
    }
}
