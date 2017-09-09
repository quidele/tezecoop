namespace GpsGate.Samples.SOAP.Simple
{
	partial class Form1
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
			this.statusStrip1 = new System.Windows.Forms.StatusStrip();
			this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
			this.PanelMain = new System.Windows.Forms.Panel();
			this.MenuFile = new System.Windows.Forms.MenuStrip();
			this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.MenuItemConnect = new System.Windows.Forms.ToolStripMenuItem();
			this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.actionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.addDeviceToUserToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.addUserWithUserTemplateToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.findClosestVToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.getGateMessagesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.getLatestMessageRecordsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.getManageableDeviceDefinitionsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.getUsersInGroupToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.getUserTemplatesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.getReportsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.getAccumulatorValueToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.statusStrip1.SuspendLayout();
			this.MenuFile.SuspendLayout();
			this.SuspendLayout();
			// 
			// statusStrip1
			// 
			this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1});
			this.statusStrip1.Location = new System.Drawing.Point(0, 586);
			this.statusStrip1.Name = "statusStrip1";
			this.statusStrip1.Size = new System.Drawing.Size(613, 22);
			this.statusStrip1.TabIndex = 0;
			this.statusStrip1.Text = "statusStrip1";
			// 
			// toolStripStatusLabel1
			// 
			this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
			this.toolStripStatusLabel1.Size = new System.Drawing.Size(79, 17);
			this.toolStripStatusLabel1.Text = "Disconnected";
			// 
			// PanelMain
			// 
			this.PanelMain.AutoSize = true;
			this.PanelMain.BackColor = System.Drawing.SystemColors.Control;
			this.PanelMain.Dock = System.Windows.Forms.DockStyle.Fill;
			this.PanelMain.Location = new System.Drawing.Point(0, 24);
			this.PanelMain.Name = "PanelMain";
			this.PanelMain.Size = new System.Drawing.Size(613, 562);
			this.PanelMain.TabIndex = 1;
			// 
			// MenuFile
			// 
			this.MenuFile.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.actionToolStripMenuItem});
			this.MenuFile.Location = new System.Drawing.Point(0, 0);
			this.MenuFile.Name = "MenuFile";
			this.MenuFile.Size = new System.Drawing.Size(613, 24);
			this.MenuFile.TabIndex = 2;
			this.MenuFile.Text = "File";
			// 
			// fileToolStripMenuItem
			// 
			this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemConnect,
            this.exitToolStripMenuItem});
			this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
			this.fileToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
			this.fileToolStripMenuItem.Text = "File";
			// 
			// MenuItemConnect
			// 
			this.MenuItemConnect.Name = "MenuItemConnect";
			this.MenuItemConnect.Size = new System.Drawing.Size(152, 22);
			this.MenuItemConnect.Text = "Connect";
			this.MenuItemConnect.Click += new System.EventHandler(this.connectToolStripMenuItem_Click);
			// 
			// exitToolStripMenuItem
			// 
			this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
			this.exitToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
			this.exitToolStripMenuItem.Text = "Exit";
			this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
			// 
			// actionToolStripMenuItem
			// 
			this.actionToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.addDeviceToUserToolStripMenuItem,
            this.addUserWithUserTemplateToolStripMenuItem,
            this.findClosestVToolStripMenuItem,
            this.getGateMessagesToolStripMenuItem,
            this.getLatestMessageRecordsToolStripMenuItem,
            this.getManageableDeviceDefinitionsToolStripMenuItem,
            this.getUsersInGroupToolStripMenuItem,
            this.getUserTemplatesToolStripMenuItem,
            this.getReportsToolStripMenuItem,
            this.getAccumulatorValueToolStripMenuItem});
			this.actionToolStripMenuItem.Enabled = false;
			this.actionToolStripMenuItem.Name = "actionToolStripMenuItem";
			this.actionToolStripMenuItem.Size = new System.Drawing.Size(54, 20);
			this.actionToolStripMenuItem.Text = "Action";
			// 
			// addDeviceToUserToolStripMenuItem
			// 
			this.addDeviceToUserToolStripMenuItem.Name = "addDeviceToUserToolStripMenuItem";
			this.addDeviceToUserToolStripMenuItem.Size = new System.Drawing.Size(249, 22);
			this.addDeviceToUserToolStripMenuItem.Text = "AddDeviceToUser";
			this.addDeviceToUserToolStripMenuItem.Click += new System.EventHandler(this.addDeviceToUserToolStripMenuItem_Click);
			// 
			// addUserWithUserTemplateToolStripMenuItem
			// 
			this.addUserWithUserTemplateToolStripMenuItem.Name = "addUserWithUserTemplateToolStripMenuItem";
			this.addUserWithUserTemplateToolStripMenuItem.Size = new System.Drawing.Size(249, 22);
			this.addUserWithUserTemplateToolStripMenuItem.Text = "AddUserWithUserTemplate";
			this.addUserWithUserTemplateToolStripMenuItem.Click += new System.EventHandler(this.addUserWithUserTemplateToolStripMenuItem_Click);
			// 
			// findClosestVToolStripMenuItem
			// 
			this.findClosestVToolStripMenuItem.Name = "findClosestVToolStripMenuItem";
			this.findClosestVToolStripMenuItem.Size = new System.Drawing.Size(249, 22);
			this.findClosestVToolStripMenuItem.Text = "Find closest User";
			this.findClosestVToolStripMenuItem.Click += new System.EventHandler(this.findClosestVToolStripMenuItem_Click);
			// 
			// getGateMessagesToolStripMenuItem
			// 
			this.getGateMessagesToolStripMenuItem.Name = "getGateMessagesToolStripMenuItem";
			this.getGateMessagesToolStripMenuItem.Size = new System.Drawing.Size(249, 22);
			this.getGateMessagesToolStripMenuItem.Text = "GetGateMessages";
			this.getGateMessagesToolStripMenuItem.Click += new System.EventHandler(this.getGateMessagesToolStripMenuItem_Click);
			// 
			// getLatestMessageRecordsToolStripMenuItem
			// 
			this.getLatestMessageRecordsToolStripMenuItem.Name = "getLatestMessageRecordsToolStripMenuItem";
			this.getLatestMessageRecordsToolStripMenuItem.Size = new System.Drawing.Size(249, 22);
			this.getLatestMessageRecordsToolStripMenuItem.Text = "GetLatestMessageRecords";
			this.getLatestMessageRecordsToolStripMenuItem.Click += new System.EventHandler(this.getLatestMessageRecordsToolStripMenuItem_Click);
			// 
			// getManageableDeviceDefinitionsToolStripMenuItem
			// 
			this.getManageableDeviceDefinitionsToolStripMenuItem.Name = "getManageableDeviceDefinitionsToolStripMenuItem";
			this.getManageableDeviceDefinitionsToolStripMenuItem.Size = new System.Drawing.Size(249, 22);
			this.getManageableDeviceDefinitionsToolStripMenuItem.Text = "GetManageableDeviceDefinitions";
			this.getManageableDeviceDefinitionsToolStripMenuItem.Click += new System.EventHandler(this.getManageableDeviceDefinitionsToolStripMenuItem_Click);
			// 
			// getUsersInGroupToolStripMenuItem
			// 
			this.getUsersInGroupToolStripMenuItem.Name = "getUsersInGroupToolStripMenuItem";
			this.getUsersInGroupToolStripMenuItem.Size = new System.Drawing.Size(249, 22);
			this.getUsersInGroupToolStripMenuItem.Text = "GetUsersInGroup";
			this.getUsersInGroupToolStripMenuItem.Click += new System.EventHandler(this.getUsersInGroupToolStripMenuItem_Click);
			// 
			// getUserTemplatesToolStripMenuItem
			// 
			this.getUserTemplatesToolStripMenuItem.Name = "getUserTemplatesToolStripMenuItem";
			this.getUserTemplatesToolStripMenuItem.Size = new System.Drawing.Size(249, 22);
			this.getUserTemplatesToolStripMenuItem.Text = "GetUserTemplates";
			this.getUserTemplatesToolStripMenuItem.Click += new System.EventHandler(this.getUserTemplatesToolStripMenuItem_Click);
			// 
			// getReportsToolStripMenuItem
			// 
			this.getReportsToolStripMenuItem.Name = "getReportsToolStripMenuItem";
			this.getReportsToolStripMenuItem.Size = new System.Drawing.Size(249, 22);
			this.getReportsToolStripMenuItem.Text = "GetReports";
			this.getReportsToolStripMenuItem.Click += new System.EventHandler(this.getReportsToolStripMenuItem_Click);
			// 
			// getAccumulatorValueToolStripMenuItem
			// 
			this.getAccumulatorValueToolStripMenuItem.Name = "getAccumulatorValueToolStripMenuItem";
			this.getAccumulatorValueToolStripMenuItem.Size = new System.Drawing.Size(249, 22);
			this.getAccumulatorValueToolStripMenuItem.Text = "GetAccumulatorValue";
			this.getAccumulatorValueToolStripMenuItem.Click += new System.EventHandler(this.getAccumulatorValueToolStripMenuItem_Click);
			// 
			// Form1
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(613, 608);
			this.Controls.Add(this.PanelMain);
			this.Controls.Add(this.statusStrip1);
			this.Controls.Add(this.MenuFile);
			this.Name = "Form1";
			this.Text = "Form1";
			this.statusStrip1.ResumeLayout(false);
			this.statusStrip1.PerformLayout();
			this.MenuFile.ResumeLayout(false);
			this.MenuFile.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.StatusStrip statusStrip1;
		private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
		private System.Windows.Forms.Panel PanelMain;
		private System.Windows.Forms.MenuStrip MenuFile;
		private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem MenuItemConnect;
		private System.Windows.Forms.ToolStripMenuItem actionToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem getLatestMessageRecordsToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem getUsersInGroupToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem getGateMessagesToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem findClosestVToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem getReportsToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem getManageableDeviceDefinitionsToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem getUserTemplatesToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem addUserWithUserTemplateToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem addDeviceToUserToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem getAccumulatorValueToolStripMenuItem;
	}
}

