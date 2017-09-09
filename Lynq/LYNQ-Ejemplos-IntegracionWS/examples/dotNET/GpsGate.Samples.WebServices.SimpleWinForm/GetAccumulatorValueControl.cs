using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using System.Globalization;

namespace GpsGate.Samples.SOAP.Simple
{
	/// <summary>
	/// User control that gets latest value for a given user and accumulator.
	/// </summary>
	public partial class GetAccumulatorValueControl : UserControl
	{
		private List<User> m_lstUsers = new List<User>();

		public GetAccumulatorValueControl()
		{
			InitializeComponent();

			comboBoxAccumulatorName.SelectedIndex = 0;

			try
			{
				this.Enabled = true;

				// Get the available users.
				List<User> m_lstUsers = ServiceProxy.GetSimpleService().GetUsers("Vehicles", 0);

				// Bind the users to drop down list.
				comboBoxUsers.DataSource = m_lstUsers;
				comboBoxUsers.DisplayMember = "Name";

				labelValue.Text = "";
			}
			catch (Exception ex)
			{
				// Show error.
				MessageBox.Show(ex.Message);
				this.Enabled = false;
			}
		}

		private void m_showAccumulatorValue()
		{
			labelValue.Text = "Loading...";

			// Get the selected user from drop down list.
			User selectedUser = comboBoxUsers.SelectedItem as User;
			string strAccumulator = comboBoxAccumulatorName.SelectedItem as string;
			DateTime dtSelectedDate = dateTimePicker.Value;

			try
			{
				DirectoryService.SoapAccumulator accumulator = ServiceProxy.GetSimpleService().GetAccumulator(selectedUser.ID, strAccumulator);
				if(accumulator == null || accumulator.ID == 0)
				{
					throw new Exception(string.Format("Accumulator type '{0}' not found for user {1}", strAccumulator, selectedUser.ID));
				}

				DirectoryService.SoapAccumulatorData accData = null;

				if (checkBoxUseTime.Checked)
				{
					accData = ServiceProxy.GetSimpleService().GetAccumulatorValue(accumulator.ID, dtSelectedDate);
				}
				else
				{
					accData = ServiceProxy.GetSimpleService().GetLatestAccumulatorValue(accumulator.ID);
				}

				labelValue.Text = accData != null ? accData.Value.ToString(CultureInfo.InvariantCulture) : "N/A";
			}
			catch (Exception ex)
			{
				// Display error.
				labelValue.Text = "N/A";
				MessageBox.Show(ex.Message);
			}
		}

		private void buttonGetAccumulatorValue_Click(object sender, EventArgs e)
		{
			m_showAccumulatorValue();
		}

		private void checkBoxUseTime_CheckedChanged(object sender, EventArgs e)
		{
			panelTime.Visible = checkBoxUseTime.Checked;
		}
	}
}
