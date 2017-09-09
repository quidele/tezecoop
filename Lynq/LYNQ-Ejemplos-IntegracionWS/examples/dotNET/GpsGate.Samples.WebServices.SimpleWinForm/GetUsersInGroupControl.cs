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
	/// <summary>
	/// User control that gets all users in a given group.
	/// Control can update it self an color code users if the have been updated since last chcek.
	/// </summary>
	public partial class GetUsersInGroupControl : UserControl
	{
		// Time stamp for when the last check to GpsGate Server was made.
		private DateTime m_dtLastChecked = DateTime.MinValue;

		/// <summary>
		/// Creates a new GetUsersInGroupControl user conrtol
		/// </summary>
		public GetUsersInGroupControl()
		{
			InitializeComponent();

			// Disable List with users until we have any result.
			listViewUsers.Enabled = false;

			// Load views and populate the drop down
			try
			{
				List<View> views = ServiceProxy.GetSimpleService().GetViews();
				comboBoxViews.DisplayMember = "Name";
				comboBoxViews.DataSource = views;

				// Disable if no views
				comboBoxViews.Enabled = comboBoxViews.Items.Count > 0;
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message);
			}
		}

		/// <summary>
		/// Get Users button clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void buttonGetUsers_Click(object sender, EventArgs e)
		{
			try
			{
				// Set last checked to Query time
				m_dtLastChecked = DateTime.UtcNow;

				// Get group name from textbox.
				string strGroupName = textBoxGroupName.Text;

				// Get selected view ID
				View view = comboBoxViews.SelectedItem as View;
				int iViewID = view != null ? view.ID : 0;

				// Get those users
				List<User> users = ServiceProxy.GetSimpleService().GetUsers(strGroupName, iViewID);

				// Setup ListView
				listViewUsers.Enabled = true;
				listViewUsers.View = System.Windows.Forms.View.Details;
				listViewUsers.Items.Clear();
				
				// Add fetched users to ListView
				foreach (var user in users)
				{
					var strCustomFields = user.CustomFields.Aggregate("", (current, kvp) => current + string.Format("({0} -> {1} )", kvp.Key, kvp.Value));

					ListViewItem li = new ListViewItem(new string[]	{
						user.ID.ToString(),
						user.Name,
						user.Username,
						user.TrackPoint.Position.Latitude.ToString(),
						user.TrackPoint.Position.Longitude.ToString(),
						user.TrackPoint.Position.Altidude.ToString(),
						user.TrackPoint.UTC.ToString(),
						user.LastTransportProtocol,
						user.DeviceActivity.ToString(),
						strCustomFields
					});

					listViewUsers.Items.Add(li);
				}

				// Enable Check updates button
				buttonCheckChanges.Enabled = true;

				// Reseize result list to fit content.
				listViewUsers.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message);
			}
		}

		/// <summary>
		/// Button check changes clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void buttonCheckChanges_Click(object sender, EventArgs e)
		{
			try
			{
				// Counters to count differences
				int iUpdated = 0;
				int iNew = 0;

				// Get Group name from textbox
				string strGroupName = textBoxGroupName.Text;

				// Get selected view id
				View view = comboBoxViews.SelectedItem as View;
				int iViewID = view != null ? view.ID : 0;

				// Get Users updated since last query
				List<User> users = ServiceProxy.GetSimpleService().GetUpdatedUsers(strGroupName, 0, int.MaxValue, iViewID, m_dtLastChecked);

				// Set new update time stamp since last query
				m_dtLastChecked = DateTime.UtcNow;

				// Go through updated users and set updated users row to Yellow and new users to green
				foreach (User user in users)
				{
					bool bFound = false;

					foreach (ListViewItem item in listViewUsers.Items)
					{
						bFound = false;
						// Reset background color
						item.BackColor = Color.White;

						if (int.Parse(item.SubItems[0].Text) == user.ID) // Updated
						{
							// User updated, set row Yellow
							item.BackColor = Color.Yellow;
							bFound = true;

							// Increment updated counter
							iUpdated++;
							break;
						}
					}

					// Not in list. We have found a new user!
					if (bFound == false)
					{
						// Increment found new counter
						iNew++;
						var strCustomFields = user.CustomFields.Aggregate("", (current, kvp) => current + string.Format("({0} -> {1} )", kvp.Key, kvp.Value));
						ListViewItem li = new ListViewItem(new string[]	{
							user.ID.ToString(),
							user.Name,
							user.Username,
							user.TrackPoint.Position.Latitude.ToString(),
							user.TrackPoint.Position.Longitude.ToString(),
							user.TrackPoint.Position.Altidude.ToString(),
							user.TrackPoint.UTC.ToString(),
							user.LastTransportProtocol,
							user.DeviceActivity.ToString(),
							strCustomFields
						});

						li.BackColor = Color.LightGreen;
						listViewUsers.Items.Add(li);
					}
				}

				// Update label with changes.
				labelUpdateInfo.Text = string.Format("{0} updated, {1} added since {2}", iUpdated, iNew, m_dtLastChecked);
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message);
			}
		}
	}
}
