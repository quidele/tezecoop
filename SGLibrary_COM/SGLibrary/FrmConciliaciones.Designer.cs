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
            this.botonesForm1 = new WindowsFormsApplication1.BotonesForm();
            this.SuspendLayout();
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(67, 4);
            // 
            // botonesForm1
            // 
            this.botonesForm1.AutoSize = true;
            this.botonesForm1.Location = new System.Drawing.Point(1, 0);
            this.botonesForm1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.botonesForm1.Name = "botonesForm1";
            this.botonesForm1.Size = new System.Drawing.Size(641, 27);
            this.botonesForm1.TabIndex = 1;
            this.botonesForm1.ClickEventDelegateHandler += new WindowsFormsApplication1.BotonesForm.ClickDelegateHandler(this.botonesForm1_ClickEventDelegateHandler);
            this.botonesForm1.Load += new System.EventHandler(this.botonesForm1_Load);
            // 
            // FrmConciliaciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(672, 253);
            this.Controls.Add(this.botonesForm1);
            this.Name = "FrmConciliaciones";
            this.Text = "Conciliaciones";
            this.Load += new System.EventHandler(this.FrmConciliaciones_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private WindowsFormsApplication1.BotonesForm botonesForm1;
    }
}