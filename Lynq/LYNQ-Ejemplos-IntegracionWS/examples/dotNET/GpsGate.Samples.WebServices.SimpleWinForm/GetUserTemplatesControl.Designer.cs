namespace GpsGate.Samples.SOAP.Simple
{
	partial class GetUserTemplatesControl
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

		#region Component Designer generated code

		/// <summary> 
		/// Required method for Designer support - do not modify 
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.listViewTemplateItems = new System.Windows.Forms.ListView();
			this.ColumnFieldID = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.ColumnRequired = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.labelUserTemplates = new System.Windows.Forms.Label();
			this.comboBoxUserTemplates = new System.Windows.Forms.ComboBox();
			this.labelUserTemplateItems = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// listViewTemplateItems
			// 
			this.listViewTemplateItems.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.listViewTemplateItems.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.ColumnFieldID,
            this.ColumnRequired});
			this.listViewTemplateItems.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
			this.listViewTemplateItems.Location = new System.Drawing.Point(213, 27);
			this.listViewTemplateItems.MultiSelect = false;
			this.listViewTemplateItems.Name = "listViewTemplateItems";
			this.listViewTemplateItems.Size = new System.Drawing.Size(360, 254);
			this.listViewTemplateItems.TabIndex = 4;
			this.listViewTemplateItems.UseCompatibleStateImageBehavior = false;
			// 
			// ColumnFieldID
			// 
			this.ColumnFieldID.Text = "FieldID";
			// 
			// ColumnRequired
			// 
			this.ColumnRequired.Text = "Required";
			// 
			// labelUserTemplates
			// 
			this.labelUserTemplates.AutoSize = true;
			this.labelUserTemplates.Location = new System.Drawing.Point(15, 11);
			this.labelUserTemplates.Name = "labelUserTemplates";
			this.labelUserTemplates.Size = new System.Drawing.Size(76, 13);
			this.labelUserTemplates.TabIndex = 9;
			this.labelUserTemplates.Text = "User Template";
			// 
			// comboBoxUserTemplates
			// 
			this.comboBoxUserTemplates.FormattingEnabled = true;
			this.comboBoxUserTemplates.Location = new System.Drawing.Point(18, 27);
			this.comboBoxUserTemplates.Name = "comboBoxUserTemplates";
			this.comboBoxUserTemplates.Size = new System.Drawing.Size(174, 21);
			this.comboBoxUserTemplates.TabIndex = 8;
			this.comboBoxUserTemplates.SelectedIndexChanged += new System.EventHandler(this.comboBoxUserTemplates_SelectedIndexChanged);
			// 
			// labelUserTemplateItems
			// 
			this.labelUserTemplateItems.AutoSize = true;
			this.labelUserTemplateItems.Location = new System.Drawing.Point(210, 11);
			this.labelUserTemplateItems.Name = "labelUserTemplateItems";
			this.labelUserTemplateItems.Size = new System.Drawing.Size(104, 13);
			this.labelUserTemplateItems.TabIndex = 10;
			this.labelUserTemplateItems.Text = "User Template Items";
			// 
			// GetUserTemplatesControl
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.labelUserTemplateItems);
			this.Controls.Add(this.labelUserTemplates);
			this.Controls.Add(this.comboBoxUserTemplates);
			this.Controls.Add(this.listViewTemplateItems);
			this.Name = "GetUserTemplatesControl";
			this.Size = new System.Drawing.Size(600, 300);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.ListView listViewTemplateItems;
		private System.Windows.Forms.ColumnHeader ColumnFieldID;
		private System.Windows.Forms.ColumnHeader ColumnRequired;
		private System.Windows.Forms.Label labelUserTemplates;
		private System.Windows.Forms.ComboBox comboBoxUserTemplates;
		private System.Windows.Forms.Label labelUserTemplateItems;
	}
}
