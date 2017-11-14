namespace SGLibrary
{
    partial class FrmCircularProgressBar
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
            this.ucCircularProgressBar1 = new SGLibrary.UCCircularProgressBar();
            this.SuspendLayout();
            // 
            // ucCircularProgressBar1
            // 
            this.ucCircularProgressBar1.Location = new System.Drawing.Point(1, 3);
            this.ucCircularProgressBar1.Name = "ucCircularProgressBar1";
            this.ucCircularProgressBar1.Size = new System.Drawing.Size(108, 117);
            this.ucCircularProgressBar1.TabIndex = 0;
            // 
            // FrmCircularProgressBar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(121, 120);
            this.Controls.Add(this.ucCircularProgressBar1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "FrmCircularProgressBar";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.FrmCircularProgressBar_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private UCCircularProgressBar ucCircularProgressBar1;




    }
}