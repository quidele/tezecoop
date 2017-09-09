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
	public partial class GetUserTemplatesControl : UserControl
	{
		List<DirectoryService.SoapUserTemplate> m_lstUserTemplates = new List<DirectoryService.SoapUserTemplate>();

		public GetUserTemplatesControl()
		{
			InitializeComponent();

			try
			{
				this.Enabled = true;

				m_lstUserTemplates = new List<DirectoryService.SoapUserTemplate>(ServiceProxy.GetSimpleService().GetUserTemplates());

				comboBoxUserTemplates.ValueMember = "ID";
				comboBoxUserTemplates.DisplayMember = "Name";
				comboBoxUserTemplates.DataSource = m_lstUserTemplates;

				// Enables and setup the result table.
				listViewTemplateItems.Enabled = true;
				listViewTemplateItems.View = System.Windows.Forms.View.Details;
				listViewTemplateItems.Items.Clear();
			}
			catch (Exception ex)
			{
				// Show error.
				MessageBox.Show(ex.Message);
				this.Enabled = false;
			}
		}

		private void comboBoxUserTemplates_SelectedIndexChanged(object sender, EventArgs e)
		{
			listViewTemplateItems.Items.Clear();
			int iID = (int)comboBoxUserTemplates.SelectedValue;
			DirectoryService.SoapUserTemplate selectedTemplate = m_lstUserTemplates.Find(t => t.ID == iID);
			if (selectedTemplate != null)
			{
				foreach (DirectoryService.SoapUserTemplateItem templateItem in selectedTemplate.Items)
				{
					ListViewItem li = new ListViewItem(new string[]	{
							templateItem.FieldID,
							templateItem.Required.ToString()
						});

					listViewTemplateItems.Items.Add(li);
				}

				listViewTemplateItems.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
			}
		}
	}
}
