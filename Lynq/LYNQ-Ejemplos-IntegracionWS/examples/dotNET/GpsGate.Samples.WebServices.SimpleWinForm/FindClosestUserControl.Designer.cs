namespace GpsGate.Samples.SOAP.Simple
{
	partial class FindClosestUserControl
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
			this.comboBoxViews = new System.Windows.Forms.ComboBox();
			this.labelSelectView = new System.Windows.Forms.Label();
			this.labelLatLng = new System.Windows.Forms.Label();
			this.textBoxLat = new System.Windows.Forms.TextBox();
			this.textBoxLng = new System.Windows.Forms.TextBox();
			this.buttonSearch = new System.Windows.Forms.Button();
			this.listViewUsers = new System.Windows.Forms.ListView();
			this.ColumnID = new System.Windows.Forms.ColumnHeader();
			this.ColumnName = new System.Windows.Forms.ColumnHeader();
			this.ColumnUsername = new System.Windows.Forms.ColumnHeader();
			this.ColumnLatitude = new System.Windows.Forms.ColumnHeader();
			this.ColumnLongitude = new System.Windows.Forms.ColumnHeader();
			this.ColumnAltitude = new System.Windows.Forms.ColumnHeader();
			this.ColumnTimeStamp = new System.Windows.Forms.ColumnHeader();
			this.ColumnProtocol = new System.Windows.Forms.ColumnHeader();
			this.ColumnActivity = new System.Windows.Forms.ColumnHeader();
			this.ColumnDistance = new System.Windows.Forms.ColumnHeader();
			this.SuspendLayout();
			// 
			// comboBoxViews
			// 
			this.comboBoxViews.FormattingEnabled = true;
			this.comboBoxViews.Location = new System.Drawing.Point(78, 3);
			this.comboBoxViews.Name = "comboBoxViews";
			this.comboBoxViews.Size = new System.Drawing.Size(121, 21);
			this.comboBoxViews.TabIndex = 0;
			// 
			// labelSelectView
			// 
			this.labelSelectView.AutoSize = true;
			this.labelSelectView.Location = new System.Drawing.Point(3, 6);
			this.labelSelectView.Name = "labelSelectView";
			this.labelSelectView.Size = new System.Drawing.Size(69, 13);
			this.labelSelectView.TabIndex = 1;
			this.labelSelectView.Text = "Choose View";
			// 
			// labelLatLng
			// 
			this.labelLatLng.AutoSize = true;
			this.labelLatLng.Location = new System.Drawing.Point(206, 6);
			this.labelLatLng.Name = "labelLatLng";
			this.labelLatLng.Size = new System.Drawing.Size(45, 13);
			this.labelLatLng.TabIndex = 2;
			this.labelLatLng.Text = "Lat/Lng";
			// 
			// textBoxLat
			// 
			this.textBoxLat.Location = new System.Drawing.Point(257, 4);
			this.textBoxLat.Name = "textBoxLat";
			this.textBoxLat.Size = new System.Drawing.Size(100, 20);
			this.textBoxLat.TabIndex = 3;
			// 
			// textBoxLng
			// 
			this.textBoxLng.Location = new System.Drawing.Point(363, 4);
			this.textBoxLng.Name = "textBoxLng";
			this.textBoxLng.Size = new System.Drawing.Size(100, 20);
			this.textBoxLng.TabIndex = 4;
			// 
			// buttonSearch
			// 
			this.buttonSearch.Location = new System.Drawing.Point(469, 3);
			this.buttonSearch.Name = "buttonSearch";
			this.buttonSearch.Size = new System.Drawing.Size(75, 23);
			this.buttonSearch.TabIndex = 5;
			this.buttonSearch.Text = "Search";
			this.buttonSearch.UseVisualStyleBackColor = true;
			this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
			// 
			// listViewUsers
			// 
			this.listViewUsers.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
						| System.Windows.Forms.AnchorStyles.Left)
						| System.Windows.Forms.AnchorStyles.Right)));
			this.listViewUsers.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.ColumnDistance,
            this.ColumnID,
            this.ColumnName,
            this.ColumnUsername,
            this.ColumnLatitude,
            this.ColumnLongitude,
            this.ColumnAltitude,
            this.ColumnTimeStamp,
            this.ColumnProtocol,
            this.ColumnActivity});
			this.listViewUsers.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
			this.listViewUsers.Location = new System.Drawing.Point(6, 34);
			this.listViewUsers.Name = "listViewUsers";
			this.listViewUsers.Size = new System.Drawing.Size(590, 261);
			this.listViewUsers.TabIndex = 6;
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
			this.ColumnTimeStamp.Text = "Position Time";
			// 
			// ColumnProtocol
			// 
			this.ColumnProtocol.Text = "Last Transport Protocol";
			// 
			// ColumnActivity
			// 
			this.ColumnActivity.Text = "Last Activity";
			// 
			// ColumnDistance
			// 
			this.ColumnDistance.Text = "Distance to target (m)";
			// 
			// FindClosestUserControl
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.listViewUsers);
			this.Controls.Add(this.buttonSearch);
			this.Controls.Add(this.textBoxLng);
			this.Controls.Add(this.textBoxLat);
			this.Controls.Add(this.labelLatLng);
			this.Controls.Add(this.labelSelectView);
			this.Controls.Add(this.comboBoxViews);
			this.Name = "FindClosestUserControl";
			this.Size = new System.Drawing.Size(600, 300);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.ComboBox comboBoxViews;
		private System.Windows.Forms.Label labelSelectView;
		private System.Windows.Forms.Label labelLatLng;
		private System.Windows.Forms.TextBox textBoxLat;
		private System.Windows.Forms.TextBox textBoxLng;
		private System.Windows.Forms.Button buttonSearch;
		private System.Windows.Forms.ListView listViewUsers;
		private System.Windows.Forms.ColumnHeader ColumnID;
		private System.Windows.Forms.ColumnHeader ColumnName;
		private System.Windows.Forms.ColumnHeader ColumnDistance;
		private System.Windows.Forms.ColumnHeader ColumnUsername;
		private System.Windows.Forms.ColumnHeader ColumnLatitude;
		private System.Windows.Forms.ColumnHeader ColumnLongitude;
		private System.Windows.Forms.ColumnHeader ColumnAltitude;
		private System.Windows.Forms.ColumnHeader ColumnTimeStamp;
		private System.Windows.Forms.ColumnHeader ColumnProtocol;
		private System.Windows.Forms.ColumnHeader ColumnActivity;

	}
}
