using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;

namespace GpsGate.Samples.SOAP.Simple
{
	/// <summary>
	/// UserControl manage GpsGate Server Login 
	/// </summary>
	public partial class LoginControl : UserControl
	{

		public delegate void LoginDelegate(LoginControl sender, string strUsername, int iApplicationID, string strSessionID);
		
		/// <summary>
		/// Called on successful login.
		/// </summary>
		public event LoginDelegate OnLoginSuccess;
		
		/// <summary>
		/// Creates a new LoginControl
		/// </summary>
		public LoginControl()
		{
			InitializeComponent();
		}

		/// <summary>
		/// "Login" button clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void buttonLogin_Click(object sender, EventArgs e)
		{
			try
			{
				// Get username, password and application ID from text boxes.
				string strUsername = textBoxLogin.Text;
				string strPassword = textBoxPassword.Text;
				int iApplicationID = int.Parse(textBoxAppID.Text);

				// Get the GpsGate.Samples.SOAP.ServiceProxy object.
				ServiceProxy service = ServiceProxy.GetSimpleService();

				// Call Login and get session ID.
				string strSessionID = service.Login(strUsername, strPassword, iApplicationID);

				// Call successful login event.
				if (OnLoginSuccess != null)
				{
					OnLoginSuccess(this, strUsername, iApplicationID, strSessionID);
				}
			}
			catch (Exception ex)
			{
				// Show errors.
				MessageBox.Show(ex.Message);
			}
		}
	}
}
