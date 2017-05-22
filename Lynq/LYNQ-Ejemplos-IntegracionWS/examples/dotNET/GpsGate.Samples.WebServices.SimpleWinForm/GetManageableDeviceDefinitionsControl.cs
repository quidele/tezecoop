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
	public partial class GetManageableDeviceDefinitionsControl : UserControl
	{
		public GetManageableDeviceDefinitionsControl()
		{
			InitializeComponent();

			try
			{
				this.Enabled = true;

				// Get the manageable device definitions.
				IEnumerable<DirectoryService.SoapDeviceDefinition> deviceDefinitions = ServiceProxy.GetSimpleService().GetManageableDeviceDefinitions();

				// Enables and setup the result table.
				listViewManageableDeviceDefs.Enabled = true;
				listViewManageableDeviceDefs.View = System.Windows.Forms.View.Details;
				listViewManageableDeviceDefs.Items.Clear();

				// Go through all returned device definitions
				foreach (DirectoryService.SoapDeviceDefinition deviceDef in deviceDefinitions)
				{
					// Add new Item to result table.
					ListViewItem li = new ListViewItem(new string[]	{
						deviceDef.ID.ToString(),
						deviceDef.Name,
						deviceDef.Description,
						deviceDef.NamespaceName,
						deviceDef.ProtocolID					
					});

					listViewManageableDeviceDefs.Items.Add(li);
				}

				// Reseize the result table to fit the content.
				listViewManageableDeviceDefs.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
			}
			catch (Exception ex)
			{
				// Show error.
				MessageBox.Show(ex.Message);
				this.Enabled = false;
			}
		}
	}
}
