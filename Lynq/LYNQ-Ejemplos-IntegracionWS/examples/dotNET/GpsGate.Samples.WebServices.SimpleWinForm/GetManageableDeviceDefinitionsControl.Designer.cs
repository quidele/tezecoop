namespace GpsGate.Samples.SOAP.Simple
{
	partial class GetManageableDeviceDefinitionsControl
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
			this.listViewManageableDeviceDefs = new System.Windows.Forms.ListView();
			this.ColumnID = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.ColumnName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.ColumnDescription = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.ColumnNamespace = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.ColumnProtocolID = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.SuspendLayout();
			// 
			// listViewManageableDeviceDefs
			// 
			this.listViewManageableDeviceDefs.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.listViewManageableDeviceDefs.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.ColumnID,
            this.ColumnName,
            this.ColumnDescription,
            this.ColumnNamespace,
            this.ColumnProtocolID});
			this.listViewManageableDeviceDefs.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
			this.listViewManageableDeviceDefs.Location = new System.Drawing.Point(5, 20);
			this.listViewManageableDeviceDefs.Name = "listViewManageableDeviceDefs";
			this.listViewManageableDeviceDefs.Size = new System.Drawing.Size(600, 300);
			this.listViewManageableDeviceDefs.TabIndex = 1;
			this.listViewManageableDeviceDefs.UseCompatibleStateImageBehavior = false;
			// 
			// ColumnID
			// 
			this.ColumnID.Text = "ID";
			// 
			// ColumnName
			// 
			this.ColumnName.Text = "Name";
			// 
			// ColumnDescription
			// 
			this.ColumnDescription.Text = "Description";
			// 
			// ColumnNamespace
			// 
			this.ColumnNamespace.Text = "Namespace";
			// 
			// ColumnProtocolID
			// 
			this.ColumnProtocolID.Text = "ProtocolID";
			// 
			// GetManageableDeviceDefinitionsControl
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.listViewManageableDeviceDefs);
			this.Name = "GetManageableDeviceDefinitionsControl";
			this.Size = new System.Drawing.Size(600, 300);
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.ListView listViewManageableDeviceDefs;
		private System.Windows.Forms.ColumnHeader ColumnID;
		private System.Windows.Forms.ColumnHeader ColumnName;
		private System.Windows.Forms.ColumnHeader ColumnDescription;
		private System.Windows.Forms.ColumnHeader ColumnNamespace;
		private System.Windows.Forms.ColumnHeader ColumnProtocolID;
	}
}
