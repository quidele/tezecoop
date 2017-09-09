namespace GpsGate.Samples.SOAP.Simple
{
	partial class GetUsersInGroupControl
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
			this.textBoxGroupName = new System.Windows.Forms.TextBox();
			this.labelGroupName = new System.Windows.Forms.Label();
			this.buttonGetUsers = new System.Windows.Forms.Button();
			this.buttonCheckChanges = new System.Windows.Forms.Button();
			this.labelUpdateInfo = new System.Windows.Forms.Label();
			this.comboBoxViews = new System.Windows.Forms.ComboBox();
			this.listViewUsers = new System.Windows.Forms.ListView();
			this.ColumnID = new System.Windows.Forms.ColumnHeader();
			this.ColumnName = new System.Windows.Forms.ColumnHeader();
			this.ColumnUsername = new System.Windows.Forms.ColumnHeader();
			this.ColumnLatitude = new System.Windows.Forms.ColumnHeader();
			this.ColumnLongitude = new System.Windows.Forms.ColumnHeader();
			this.ColumnAltitude = new System.Windows.Forms.ColumnHeader();
			this.ColumnTimeStamp = new System.Windows.Forms.ColumnHeader();
			this.ColumnProtocol = new System.Windows.Forms.ColumnHeader();
			this.ColumnDeviceActivity = new System.Windows.Forms.ColumnHeader();
			this.ColumnCustomFields = new System.Windows.Forms.ColumnHeader();
			this.SuspendLayout();
			// 
			// textBoxGroupName
			// 
			this.textBoxGroupName.Location = new System.Drawing.Point(74, 8);
			this.textBoxGroupName.Name = "textBoxGroupName";
			this.textBoxGroupName.Size = new System.Drawing.Size(100, 20);
			this.textBoxGroupName.TabIndex = 1;
			// 
			// labelGroupName
			// 
			this.labelGroupName.AutoSize = true;
			this.labelGroupName.Location = new System.Drawing.Point(3, 11);
			this.labelGroupName.Name = "labelGroupName";
			this.labelGroupName.Size = new System.Drawing.Size(65, 13);
			this.labelGroupName.TabIndex = 2;
			this.labelGroupName.Text = "Group name";
			// 
			// buttonGetUsers
			// 
			this.buttonGetUsers.Location = new System.Drawing.Point(307, 7);
			this.buttonGetUsers.Name = "buttonGetUsers";
			this.buttonGetUsers.Size = new System.Drawing.Size(75, 23);
			this.buttonGetUsers.TabIndex = 3;
			this.buttonGetUsers.Text = "Get Users";
			this.buttonGetUsers.UseVisualStyleBackColor = true;
			this.buttonGetUsers.Click += new System.EventHandler(this.buttonGetUsers_Click);
			// 
			// buttonCheckChanges
			// 
			this.buttonCheckChanges.Enabled = false;
			this.buttonCheckChanges.Location = new System.Drawing.Point(388, 7);
			this.buttonCheckChanges.Name = "buttonCheckChanges";
			this.buttonCheckChanges.Size = new System.Drawing.Size(97, 23);
			this.buttonCheckChanges.TabIndex = 5;
			this.buttonCheckChanges.Text = "Check Changes";
			this.buttonCheckChanges.UseVisualStyleBackColor = true;
			this.buttonCheckChanges.Click += new System.EventHandler(this.buttonCheckChanges_Click);
			// 
			// labelUpdateInfo
			// 
			this.labelUpdateInfo.AutoSize = true;
			this.labelUpdateInfo.Location = new System.Drawing.Point(491, 12);
			this.labelUpdateInfo.Name = "labelUpdateInfo";
			this.labelUpdateInfo.Size = new System.Drawing.Size(0, 13);
			this.labelUpdateInfo.TabIndex = 6;
			// 
			// comboBoxViews
			// 
			this.comboBoxViews.FormattingEnabled = true;
			this.comboBoxViews.Location = new System.Drawing.Point(180, 8);
			this.comboBoxViews.Name = "comboBoxViews";
			this.comboBoxViews.Size = new System.Drawing.Size(121, 21);
			this.comboBoxViews.TabIndex = 7;
			// 
			// listViewUsers
			// 
			this.listViewUsers.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
						| System.Windows.Forms.AnchorStyles.Left)
						| System.Windows.Forms.AnchorStyles.Right)));
			this.listViewUsers.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.ColumnID,
            this.ColumnName,
            this.ColumnUsername,
            this.ColumnLatitude,
            this.ColumnLongitude,
            this.ColumnAltitude,
            this.ColumnTimeStamp,
            this.ColumnProtocol,
            this.ColumnDeviceActivity,
			this.ColumnCustomFields});
			this.listViewUsers.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
			this.listViewUsers.Location = new System.Drawing.Point(6, 34);
			this.listViewUsers.Name = "listViewUsers";
			this.listViewUsers.Size = new System.Drawing.Size(590, 261);
			this.listViewUsers.TabIndex = 0;
			this.listViewUsers.UseCompatibleStateImageBehavior = false;
			
			// 
			// ColumnID
			// 
			this.ColumnID.Text = "ID";
			// 
			// ColumnName
			// 
			this.ColumnName.Text = "Name";
			// 
			// ColumnUsername
			// 
			this.ColumnUsername.Text = "Username";
			// 
			// ColumnLatitude
			// 
			this.ColumnLatitude.Text = "Latitude";
			// 
			// ColumnLongitude
			// 
			this.ColumnLongitude.Text = "Longitude";
			// 
			// ColumnAltitude
			// 
			this.ColumnAltitude.Text = "Altitude";
			// 
			// ColumnTimeStamp
			// 
			this.ColumnTimeStamp.Text = "Position time";
			// 
			// ColumnProtocol
			// 
			this.ColumnProtocol.Text = "Last Transport Protocol";
			// 
			// ColumnDeviceActivity
			// 
			this.ColumnDeviceActivity.Text = "Last Activity";
			//
			// ColumnCustomFields
			//
			this.ColumnCustomFields.Text = "Custom Fields";

			// 
			// GetUsersInGroupControl
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.AutoSize = true;
			this.BackColor = System.Drawing.SystemColors.Control;
			this.Controls.Add(this.listViewUsers);
			this.Controls.Add(this.comboBoxViews);
			this.Controls.Add(this.labelUpdateInfo);
			this.Controls.Add(this.buttonCheckChanges);
			this.Controls.Add(this.buttonGetUsers);
			this.Controls.Add(this.labelGroupName);
			this.Controls.Add(this.textBoxGroupName);
			this.Name = "GetUsersInGroupControl";
			this.Size = new System.Drawing.Size(600, 300);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.TextBox textBoxGroupName;
		private System.Windows.Forms.Label labelGroupName;
		private System.Windows.Forms.Button buttonGetUsers;
		private System.Windows.Forms.Button buttonCheckChanges;
		private System.Windows.Forms.Label labelUpdateInfo;
		private System.Windows.Forms.ComboBox comboBoxViews;
		private System.Windows.Forms.ListView listViewUsers;
		private System.Windows.Forms.ColumnHeader ColumnID;
		private System.Windows.Forms.ColumnHeader ColumnName;
		private System.Windows.Forms.ColumnHeader ColumnUsername;
		private System.Windows.Forms.ColumnHeader ColumnLatitude;
		private System.Windows.Forms.ColumnHeader ColumnLongitude;
		private System.Windows.Forms.ColumnHeader ColumnAltitude;
		private System.Windows.Forms.ColumnHeader ColumnTimeStamp;
		private System.Windows.Forms.ColumnHeader ColumnProtocol;
		private System.Windows.Forms.ColumnHeader ColumnDeviceActivity;
		private System.Windows.Forms.ColumnHeader ColumnCustomFields;
	}
}
