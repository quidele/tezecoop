namespace GpsGate.Samples.SOAP.Simple
{
	partial class GetLatestMessageRecordsControl
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
			this.comboBoxUsers = new System.Windows.Forms.ComboBox();
			this.buttonGetRecords = new System.Windows.Forms.Button();
			this.listViewRecords = new System.Windows.Forms.ListView();
			this.ColumnName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.ColumnData = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.ColumnUnit = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.ColumnDataType = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.ColumnTimeStamp = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this.SuspendLayout();
			// 
			// comboBoxUsers
			// 
			this.comboBoxUsers.FormattingEnabled = true;
			this.comboBoxUsers.Location = new System.Drawing.Point(4, 4);
			this.comboBoxUsers.Name = "comboBoxUsers";
			this.comboBoxUsers.Size = new System.Drawing.Size(210, 21);
			this.comboBoxUsers.TabIndex = 0;
			// 
			// buttonGetRecords
			// 
			this.buttonGetRecords.Location = new System.Drawing.Point(220, 4);
			this.buttonGetRecords.Name = "buttonGetRecords";
			this.buttonGetRecords.Size = new System.Drawing.Size(75, 23);
			this.buttonGetRecords.TabIndex = 1;
			this.buttonGetRecords.Text = "Get Records";
			this.buttonGetRecords.UseVisualStyleBackColor = true;
			this.buttonGetRecords.Click += new System.EventHandler(this.buttonGetRecords_Click);
			// 
			// listViewRecords
			// 
			this.listViewRecords.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.listViewRecords.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.ColumnName,
            this.ColumnData,
            this.ColumnUnit,
            this.ColumnDataType,
            this.ColumnTimeStamp});
			this.listViewRecords.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
			this.listViewRecords.Location = new System.Drawing.Point(6, 34);
			this.listViewRecords.Name = "listViewRecords";
			this.listViewRecords.Size = new System.Drawing.Size(590, 261);
			this.listViewRecords.TabIndex = 0;
			this.listViewRecords.UseCompatibleStateImageBehavior = false;
			// 
			// ColumnName
			// 
			this.ColumnName.Text = "Name";
			// 
			// ColumnData
			// 
			this.ColumnData.DisplayIndex = 2;
			this.ColumnData.Text = "Data";
			this.ColumnData.Width = 100;
			// 
			// ColumnUnit
			// 
			this.ColumnUnit.DisplayIndex = 1;
			this.ColumnUnit.Text = "Unit";
			// 
			// ColumnDataType
			// 
			this.ColumnDataType.Text = "Type";
			this.ColumnDataType.Width = 100;
			// 
			// ColumnTimeStamp
			// 
			this.ColumnTimeStamp.Text = "TimeStamp";
			this.ColumnTimeStamp.Width = 120;
			// 
			// GetLatestMessageRecordsControl
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.listViewRecords);
			this.Controls.Add(this.buttonGetRecords);
			this.Controls.Add(this.comboBoxUsers);
			this.Name = "GetLatestMessageRecordsControl";
			this.Size = new System.Drawing.Size(600, 300);
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.ComboBox comboBoxUsers;
		private System.Windows.Forms.Button buttonGetRecords;
		private System.Windows.Forms.ListView listViewRecords;
		private System.Windows.Forms.ColumnHeader ColumnName;
		private System.Windows.Forms.ColumnHeader ColumnUnit;
		private System.Windows.Forms.ColumnHeader ColumnData;
		private System.Windows.Forms.ColumnHeader ColumnDataType;
		private System.Windows.Forms.ColumnHeader ColumnTimeStamp;
	}
}
