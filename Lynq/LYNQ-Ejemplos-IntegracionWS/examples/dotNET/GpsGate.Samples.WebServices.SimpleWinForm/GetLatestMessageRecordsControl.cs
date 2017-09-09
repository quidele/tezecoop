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
	/// User control that gets latest GateMessages for a given user.
	/// </summary>
	public partial class GetLatestMessageRecordsControl : UserControl
	{
		/// <summary>
		/// Creates a new GetLatestMessageRecordsControl.
		/// </summary>
		public GetLatestMessageRecordsControl()
		{
			InitializeComponent();

			try
			{
				this.Enabled = true;
				
				// Get the available users.
				List<User> users = ServiceProxy.GetSimpleService().GetUsers("Vehicles", 0);

				// Bind the users to drop down list.
				comboBoxUsers.DataSource = users;
				comboBoxUsers.DisplayMember = "Name";

				// Disables ti result table until we get any result.
				listViewRecords.Enabled = false;
			}
			catch (Exception ex)
			{
				// Show error.
				MessageBox.Show(ex.Message);
				this.Enabled = false;
			}
		}

		/// <summary>
		/// Get records button clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void buttonGetRecords_Click(object sender, EventArgs e)
		{
			try
			{
				// Get the selected user from drop down list.
				User selectedUser = comboBoxUsers.SelectedItem as User;

				// use ServiceProxy to get latest GateMessages.
				List<GateMessage> messages = ServiceProxy.GetSimpleService().GetLatestGateRecords(selectedUser.ID, true);

				// Enables and setup the result table.
				listViewRecords.Enabled = true;
				listViewRecords.View = System.Windows.Forms.View.Details;
				listViewRecords.Items.Clear();

				// Go through all returned GateMessages
				foreach (GateMessage msg in messages)
				{
					// Go through each GateMessageRecord
					foreach (GateMessageRecord record in msg.Records)
					{
						// Add new Item to result table.
						ListViewItem li = new ListViewItem(new string[]	{
							record.Field.Name,				// Field name E.g "Fuel level", "SOS" etc
							record.Data.Data,				// The data.
							record.Field.Unit,				// Unit 
							record.Data.DataType,			// Type
							msg.TrackPoint.UTC.ToString(),	// the UTC time stamp
						});

						listViewRecords.Items.Add(li);
					}
				}

				// Reseize the result table to fit the content.
				listViewRecords.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
			}
			catch (Exception ex)
			{
				// Display error.
				MessageBox.Show(ex.Message);
			}
		}
	}
}
