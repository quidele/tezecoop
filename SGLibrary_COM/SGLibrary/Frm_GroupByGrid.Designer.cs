namespace SGLibrary
{
    partial class Frm_GroupByGrid
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
            this.groupByGrid1 = new SGLibrary.Extensiones.GroupByGrid();
            ((System.ComponentModel.ISupportInitialize)(this.groupByGrid1)).BeginInit();
            this.SuspendLayout();
            // 
            // groupByGrid1
            // 
            this.groupByGrid1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.groupByGrid1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupByGrid1.Location = new System.Drawing.Point(0, 0);
            this.groupByGrid1.Name = "groupByGrid1";
            this.groupByGrid1.Size = new System.Drawing.Size(541, 345);
            this.groupByGrid1.TabIndex = 0;
            // 
            // Frm_GroupByGrid
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(541, 345);
            this.Controls.Add(this.groupByGrid1);
            this.Name = "Frm_GroupByGrid";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.groupByGrid1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Extensiones.GroupByGrid groupByGrid1;
    }
}