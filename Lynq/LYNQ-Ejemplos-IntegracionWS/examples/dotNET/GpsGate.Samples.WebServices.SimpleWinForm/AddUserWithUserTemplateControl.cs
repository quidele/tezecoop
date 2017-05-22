using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace GpsGate.Samples.SOAP.Simple
{
	public partial class AddUserWithUserTemplateControl : UserControl
	{
		public AddUserWithUserTemplateControl()
		{
			InitializeComponent();

			IEnumerable<DirectoryService.SoapUserTemplate> userTemplates = ServiceProxy.GetSimpleService().GetUserTemplates();
			comboBoxUserTemplates.ValueMember = "ID";
			comboBoxUserTemplates.DisplayMember = "Name";
			comboBoxUserTemplates.DataSource = userTemplates;
		}

		private void buttonAddUser_Click(object sender, EventArgs e)
		{
			try
			{
				if (string.IsNullOrEmpty(textBoxName.Text))
				{
					throw new Exception("Name is required");
				}
				if (string.IsNullOrEmpty(textBoxUsername.Text))
				{
					throw new Exception("Username is required");
				}
				if (comboBoxUserTemplates.Items.Count == 0)
				{
					throw new Exception("No user template selected. Make sure that there are user templates in the application.");
				}

				int iUserID = ServiceProxy.GetSimpleService().AddUserWithUserTemplate((int)comboBoxUserTemplates.SelectedValue, textBoxUsername.Text, textBoxName.Text, textBoxPassword.Text, textBoxDescription.Text);
				if (iUserID > 0)
				{
					listBoxResult.Items.Add("Successfully added new user with user template '" + comboBoxUserTemplates.SelectedValue + "'");
				}
				else
				{
					listBoxResult.Items.Add("Failed to add new user");
				}
			}
			catch (Exception ex)
			{
				// Show error.
				MessageBox.Show(ex.Message);
			}
		}

		private void buttonClear_Click(object sender, EventArgs e)
		{
			textBoxName.Text = "";
			textBoxUsername.Text = "";
			textBoxPassword.Text = "";
			textBoxDescription.Text = "";
		}
	}
}
