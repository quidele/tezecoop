namespace GpsGate.Samples.SOAP.Simple
{
	partial class GetGateMessagesControl
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
			this.buttonSelect = new System.Windows.Forms.Button();
			this.comboBoxTracks = new System.Windows.Forms.ComboBox();
			this.listViewMessages = new System.Windows.Forms.ListView();
			this.TimeStamp = new System.Windows.Forms.ColumnHeader();
			this.Lat = new System.Windows.Forms.ColumnHeader();
			this.Lng = new System.Windows.Forms.ColumnHeader();
			this.Speed = new System.Windows.Forms.ColumnHeader();
			this.Alt = new System.Windows.Forms.ColumnHeader();
			this.SuspendLayout();
			// 
			// comboBoxUsers
			// 
			this.comboBoxUsers.FormattingEnabled = true;
			this.comboBoxUsers.Location = new System.Drawing.Point(3, 3);
			this.comboBoxUsers.Name = "comboBoxUsers";
			this.comboBoxUsers.Size = new System.Drawing.Size(160, 21);
			this.comboBoxUsers.TabIndex = 0;
			this.comboBoxUsers.SelectedIndexChanged += new System.EventHandler(this.comboBoxUsers_SelectedIndexChanged);
			// 
			// buttonSelect
			// 
			this.buttonSelect.Location = new System.Drawing.Point(384, 2);
			this.buttonSelect.Name = "buttonSelect";
			this.buttonSelect.Size = new System.Drawing.Size(75, 23);
			this.buttonSelect.TabIndex = 1;
			this.buttonSelect.Text = "Select";
			this.buttonSelect.UseVisualStyleBackColor = true;
			this.buttonSelect.Click += new System.EventHandler(this.buttonSelect_Click);
			// 
			// comboBoxTracks
			// 
			this.comboBoxTracks.FormattingEnabled = true;
			this.comboBoxTracks.Location = new System.Drawing.Point(169, 3);
			this.comboBoxTracks.Name = "comboBoxTracks";
			this.comboBoxTracks.Size = new System.Drawing.Size(209, 21);
			this.comboBoxTracks.TabIndex = 3;
			// 
			// listViewMessages
			// 
			this.listViewMessages.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
						| System.Windows.Forms.AnchorStyles.Left)
						| System.Windows.Forms.AnchorStyles.Right)));
			this.listViewMessages.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.TimeStamp,
            this.Lat,
            this.Lng,
            this.Speed,
            this.Alt});
			this.listViewMessages.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
			this.listViewMessages.Location = new System.Drawing.Point(6, 34);
			this.listViewMessages.Name = "listViewMessages";
			this.listViewMessages.Size = new System.Drawing.Size(590, 261);
			this.listViewMessages.TabIndex = 4;
			this.listViewMessages.UseCompatibleStateImageBehavior = false;
			// 
			// TimeStamp
			// 
			this.TimeStamp.Text = "TimeStamp";
			// 
			// Lat
			// 
			this.Lat.Text = "Lat";
			// 
			// Lng
			// 
			this.Lng.Text = "Lng";
			// 
			// Speed
			// 
			this.Speed.Text = "Speed (m/s)";
			// 
			// Alt
			// 
			this.Alt.Text = "Altitude (m)";
			// 
			// GetGateMessagesControl
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.listViewMessages);
			this.Controls.Add(this.comboBoxTracks);
			this.Controls.Add(this.buttonSelect);
			this.Controls.Add(this.comboBoxUsers);
			this.Name = "GetGateMessagesControl";
			this.Size = new System.Drawing.Size(600, 300);
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.ComboBox comboBoxUsers;
		private System.Windows.Forms.Button buttonSelect;
		private System.Windows.Forms.ComboBox comboBoxTracks;
		private System.Windows.Forms.ListView listViewMessages;
		private System.Windows.Forms.ColumnHeader TimeStamp;
		private System.Windows.Forms.ColumnHeader Lat;
		private System.Windows.Forms.ColumnHeader Lng;
		private System.Windows.Forms.ColumnHeader Speed;
		private System.Windows.Forms.ColumnHeader Alt;
	}
}
