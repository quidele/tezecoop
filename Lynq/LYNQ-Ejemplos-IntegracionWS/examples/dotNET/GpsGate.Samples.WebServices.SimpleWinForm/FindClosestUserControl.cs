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
	/// user control that find the closest user for a given position.
	/// </summary>
	public partial class FindClosestUserControl : UserControl
	{
		/// <summary>
		/// Creates a new FindClosestUserControl.
		/// </summary>
		public FindClosestUserControl()
		{
			InitializeComponent();

			listViewUsers.View = System.Windows.Forms.View.Details;
			listViewUsers.Enabled = false;
			
			// Load views and populate the drop down
			try
			{
				List<View> views = ServiceProxy.GetSimpleService().GetViews();
				comboBoxViews.DisplayMember = "Name";
				comboBoxViews.DataSource = views;

				// Disable drop down list if no views found.
				comboBoxViews.Enabled = comboBoxViews.Items.Count > 0;
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message);
			}
		}

		/// <summary>
		/// Button search clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void buttonSearch_Click(object sender, EventArgs e)
		{
			double dblLat = 0.0;
			double dblLng = 0.0;

			//Parse lat and lng from text boxes.
			if (double.TryParse(textBoxLat.Text, out dblLat) == false)
			{
				MessageBox.Show("Invalid Latitude");
			}
			else if (double.TryParse(textBoxLng.Text, out dblLng) == false)
			{
				MessageBox.Show("Invalid Longitude");
			}
			else
			{
				var pos = new Position { Longitude = dblLng, Latitude = dblLat };

				// Get selected view id
				View view = comboBoxViews.SelectedItem as View;

				// Set view ID to 0 if no found (0 == disable view filtering)
				int iViewID = view != null ? view.ID : 0;

				// Gert the users for the given view.
				List<User> users = ServiceProxy.GetSimpleService().GetUsers("vehicles", iViewID);

				// Seup the result table.
				listViewUsers.Enabled = true;
				listViewUsers.Items.Clear();

				// Sort list of users by closest user.
				users.Sort(delegate(User a, User b)
				{
					// Get user a distance to the position.
					double dblDistanceA = a.TrackPoint.Position.Distance(pos);

					// Gert user b distance to the position.
					double dblDistanceB = b.TrackPoint.Position.Distance(pos);

					// Compare the position.
					return dblDistanceA.CompareTo(dblDistanceB);
				});

				// Add sorted users to ListView
				foreach (User user in users)
				{
					string strDistance = user.TrackPoint.Position.Distance(pos).ToString("0.");
					ListViewItem li = new ListViewItem(new string[]	{
						strDistance,
						user.ID.ToString(),
						user.Name,
						user.Username,
						user.TrackPoint.Position.Latitude.ToString("0.00000"),
						user.TrackPoint.Position.Longitude.ToString("0.00000"),
						user.TrackPoint.Position.Altidude.ToString("0.00000"),
						user.TrackPoint.UTC.ToString(),
						user.LastTransportProtocol,
						user.DeviceActivity.ToString()
					});

					listViewUsers.Items.Add(li);
				}

				listViewUsers.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
			}
		}
	}
}
