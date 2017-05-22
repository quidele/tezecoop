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
	/// User control that gets GateMessages for a TrackInfo.
	/// </summary>
	public partial class GetGateMessagesControl : UserControl
	{
		/// <summary>
		/// Create a new GetGateMessagesControl user control.
		/// </summary>
		public GetGateMessagesControl()
		{
			InitializeComponent();

			try
			{
				// Get users in vehicle group and populate the DropDown list.
				comboBoxUsers.DataSource = ServiceProxy.GetSimpleService().GetUsers("vehicles", 0);
				comboBoxUsers.DisplayMember = "Name";
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message);
			}
		}

		/// <summary>
		/// Button select user clicked.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void buttonSelect_Click(object sender, EventArgs e)
		{
			try
			{
				// Get all trackInfo for the given user.
				TrackInfo selectedTrack = (TrackInfo)comboBoxTracks.SelectedItem;
				List<GateMessage> messages = ServiceProxy.GetSimpleService().GetGateMessageByTrackInfoId(selectedTrack.ID, selectedTrack.Bounds.MinTime, selectedTrack.Bounds.MaxTime, 0, 500, true, null);

				// Setup the result table.
				listViewMessages.Enabled = true;
				listViewMessages.View = System.Windows.Forms.View.Details;
				listViewMessages.Items.Clear();

				// Since we dont knwow which GateMessageRecords the user have we need to create the coulmns in list control
				// dynamically while new columns found in result.

				// Create Dictionary of column name and value.
				Dictionary<string, string> colValue = new Dictionary<string, string>();

				// List of values, this will be built up depending on the content found in the GateMessages.
				List<string> values = new List<string>();

				foreach (GateMessage msg in messages)
				{
					// Add columns that always will be found.
					values.Add(msg.TrackPoint.UTC.ToString());
					values.Add(msg.TrackPoint.Position.Latitude.ToString());
					values.Add(msg.TrackPoint.Position.Longitude.ToString());
					values.Add(msg.TrackPoint.Velocity.Speed.ToString());
					values.Add(msg.TrackPoint.Position.Altidude.ToString());

					// Ge through the GateMessage records to find values.
					foreach (GateMessageRecord rec in msg.Records)
					{
						// If column not already in ListView --> create and ad it.
						if (listViewMessages.Columns.ContainsKey(rec.Field.Name) == false)
						{
							// Create a column with the field name E.g "Fuel level".
							ColumnHeader c = new ColumnHeader();
							c.Name = rec.Field.Name;
							c.Text = rec.Field.Name;

							listViewMessages.Columns.Add(c);
						}

						// Set the column value for current row to our dictionary.
						colValue[rec.Field.Name] = rec.Data.Data;
					}

					// Go through the dictionary of columns and values for the current message and build up the value list.
					foreach (ColumnHeader col in listViewMessages.Columns)
					{
						if (colValue.ContainsKey(col.Name))
						{
							values.Add(colValue[col.Name]);
						}
						else if(string.IsNullOrEmpty(col.Name) == false)
						{
							values.Add(string.Empty);
						}
					}

					// Create a new list row and add it to the result list.
					ListViewItem li = new ListViewItem(values.ToArray());
					listViewMessages.Items.Add(li);

					// Clear column dictinary and values.
					values.Clear();
					colValue.Clear();
				}

				// Reseize the list to fit result.
				listViewMessages.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message);
			}
		}

		/// <summary>
		/// Called when selected user changed in user drop down list.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void comboBoxUsers_SelectedIndexChanged(object sender, EventArgs e)
		{
			// Get the selected
			User selectedUser = (User)comboBoxUsers.SelectedItem;
			
			// Fetch the trackInfo´s for the selected user and populate the drop down list.
			comboBoxTracks.DataSource = ServiceProxy.GetSimpleService().GetTracksByUsers(new int[] { selectedUser.ID }, DateTime.MinValue, DateTime.MaxValue);
			comboBoxTracks.Format += delegate(object sender2, ListControlConvertEventArgs e2)
			{
				TrackInfo ti = e2.ListItem as TrackInfo;
				e2.Value = string.Format("{0} - {1}", ti.Bounds.MinTime, ti.Bounds.MaxTime);
			};
		}
	}
}
