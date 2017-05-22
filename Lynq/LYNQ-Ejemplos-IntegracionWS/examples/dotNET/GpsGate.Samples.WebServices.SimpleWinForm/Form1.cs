using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace GpsGate.Samples.SOAP.Simple
{
	/// <summary>
	/// Main for for the example application.
	/// Sample application aims to demonstraite the usage of the GpsGate Server SOAP API.
	/// The sample calls a couple of the web methods and display the response.
	/// </summary>
	public partial class Form1 : Form
	{
		public Form1()
		{
			InitializeComponent();
		}

		/// <summary>
		/// Called on a succesfull login by LoginControl.
		/// </summary>
		/// <param name="sender">The login control fired the event.</param>
		/// <param name="strUsername">Username of logged in user.</param>
		/// <param name="iApplicationID">ID of the application logged on to.</param>
		/// <param name="strSessionID">Session ID returned by GpsGate Server.</param>
		private void m_LoginControl_OnLoginSuccess(LoginControl sender, string strUsername, int iApplicationID, string strSessionID)
		{
			// Set startus strip text.
			toolStripStatusLabel1.Text = string.Format("Loged in as: {0} in application: {1}", strUsername, iApplicationID);

			// Remove the login control from the main pane on successful login.
			PanelMain.Controls.Remove(sender);

			// Enables the "Action" menu
			actionToolStripMenuItem.Enabled = true;
		}

		/// <summary>
		/// "File" --> "Connect" menu item clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void connectToolStripMenuItem_Click(object sender, EventArgs e)
		{
			// Clear all controls in main pane.
			PanelMain.Controls.Clear();

			// Create new login control.
			LoginControl m_LoginControl = new LoginControl();

			// Add OnLoginSuccess listener.
			m_LoginControl.OnLoginSuccess += new LoginControl.LoginDelegate(m_LoginControl_OnLoginSuccess);

			// Add login control to main pane.
			PanelMain.Controls.Add(m_LoginControl);
		}

		/// <summary>
		/// "File" --> "Exit" menu item clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void exitToolStripMenuItem_Click(object sender, EventArgs e)
		{
			// Close main form.
			this.Close();
		}


		/// <summary>
		/// "Action" --> "GetLatestGateMessageRecords" menu item clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void getLatestMessageRecordsToolStripMenuItem_Click(object sender, EventArgs e)
		{
			// Clear main pane.
			PanelMain.Controls.Clear();

			// Create new GetLatestMessageRecordsControl
			GetLatestMessageRecordsControl msgc = new GetLatestMessageRecordsControl();
			msgc.Dock = DockStyle.Fill;

			// Add GetLatestMessageRecordsControl to main pane.
			PanelMain.Controls.Add(msgc);
		}

		/// <summary>
		/// "Action" --> "GetUsersInGroup" menu item clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void getUsersInGroupToolStripMenuItem_Click(object sender, EventArgs e)
		{
			// Clear main pane.
			PanelMain.Controls.Clear();

			// Creates a new GetusersInGroup control.
			GetUsersInGroupControl guc = new GetUsersInGroupControl();
			guc.Dock = DockStyle.Fill;

			// Add GetusersInGroup control to main pane.
			PanelMain.Controls.Add(guc);
		}

		/// <summary>
		/// 
		/// "Action" --> "GetGateMessages" menu item cliecked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void getGateMessagesToolStripMenuItem_Click(object sender, EventArgs e)
		{
			// Clear main pane.
			PanelMain.Controls.Clear();

			// Creates a new GetGateMessagesControl control.
			GetGateMessagesControl gmc = new GetGateMessagesControl();
			gmc.Dock = DockStyle.Fill;

			// Add GetGateMessagesControl to main pane.
			PanelMain.Controls.Add(gmc);
		}

		/// <summary>
		/// "Action" --> "Find closest User" menu item clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void findClosestVToolStripMenuItem_Click(object sender, EventArgs e)
		{
			// Clear main pane.
			PanelMain.Controls.Clear();

			// Creates a new FindClosestUserControl control.
			FindClosestUserControl fcuc = new FindClosestUserControl();
			fcuc.Dock = DockStyle.Fill;

			// Add FindClosestUserControl to main pane.
			PanelMain.Controls.Add(fcuc);
		}

		private void getReportsToolStripMenuItem_Click(object sender, EventArgs e)
		{
			PanelMain.Controls.Clear();

			GenReportsControl grc = new GenReportsControl();

			grc.Dock = DockStyle.Fill;

			PanelMain.Controls.Add(grc);
		}

		private void getManageableDeviceDefinitionsToolStripMenuItem_Click(object sender, EventArgs e)
		{
			PanelMain.Controls.Clear();

			GetManageableDeviceDefinitionsControl control = new GetManageableDeviceDefinitionsControl();

			control.Dock = DockStyle.Fill;

			PanelMain.Controls.Add(control);
		}

		private void getUserTemplatesToolStripMenuItem_Click(object sender, EventArgs e)
		{
			PanelMain.Controls.Clear();

			GetUserTemplatesControl control = new GetUserTemplatesControl();

			control.Dock = DockStyle.Fill;

			PanelMain.Controls.Add(control);
		}

		private void addUserWithUserTemplateToolStripMenuItem_Click(object sender, EventArgs e)
		{
			PanelMain.Controls.Clear();

			AddUserWithUserTemplateControl control = new AddUserWithUserTemplateControl();

			control.Dock = DockStyle.Fill;

			PanelMain.Controls.Add(control);
		}

		private void addDeviceToUserToolStripMenuItem_Click(object sender, EventArgs e)
		{
			PanelMain.Controls.Clear();

			AddDeviceControl control = new AddDeviceControl();

			control.Dock = DockStyle.Fill;

			PanelMain.Controls.Add(control);
		}

		private void getAccumulatorValueToolStripMenuItem_Click(object sender, EventArgs e)
		{
			PanelMain.Controls.Clear();

			GetAccumulatorValueControl control = new GetAccumulatorValueControl();
			control.Dock = DockStyle.Fill;

			PanelMain.Controls.Add(control);
		}
	}
}