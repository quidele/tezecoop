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
	public partial class AddDeviceControl : UserControl
	{
		List<DirectoryService.SoapUserTemplate> m_lstUserTemplates = new List<DirectoryService.SoapUserTemplate>();
		List<DirectoryService.SoapDeviceDefinition> m_lstDeviceDefinitions = new List<DirectoryService.SoapDeviceDefinition>();
		List<GpsGate.Samples.SOAP.User> m_lstUsers = new List<User>();

		public AddDeviceControl()
		{
			InitializeComponent();

			// Get device definition.
			m_lstDeviceDefinitions = new List<DirectoryService.SoapDeviceDefinition>(ServiceProxy.GetSimpleService().GetManageableDeviceDefinitions());
			
			// Get user templates that we have access to.
			m_lstUserTemplates = new List<DirectoryService.SoapUserTemplate>(ServiceProxy.GetSimpleService().GetUserTemplates());

			if (m_lstUserTemplates.Count > 0)
			{
				// Get users that have the first selected user template.
				m_lstUsers = ServiceProxy.GetSimpleService().GetUsersInUserTemplate(m_lstUserTemplates[0].ID);
			}

			comboBoxDeviceDefinition.ValueMember = "ID";
			comboBoxDeviceDefinition.DisplayMember = "Name";
			comboBoxDeviceDefinition.DataSource = m_lstDeviceDefinitions;

			comboBoxUserTemplates.ValueMember = "ID";
			comboBoxUserTemplates.DisplayMember = "Name";
			comboBoxUserTemplates.DataSource = m_lstUserTemplates;

			comboBoxOwnerUser.ValueMember = "ID";
			comboBoxOwnerUser.DisplayMember = "Username";
			comboBoxOwnerUser.DataSource = m_lstUsers;
		}

		private void buttonAddDevice_Click(object sender, EventArgs e)
		{
			try
			{
				if (comboBoxDeviceDefinition.Items.Count == 0)
				{
					throw new Exception("Device Definition is required");
				}
				if (comboBoxOwnerUser.Items.Count == 0)
				{
					throw new Exception("Owner User is required. Please select a user template that has users.");
				}

				int iMobileNetworkID = 0;
				if (string.IsNullOrEmpty(textBoxMobileNetworkID.Text) == false && int.TryParse(textBoxMobileNetworkID.Text, out iMobileNetworkID) == false) 
				{
					// Could not parse the provided mobile network ID as an integer.

					throw new Exception("Could not parse the provided mobile network ID as a number.");
				}

				//  Validate using user template required flags for some known fields.
				int iSelectedUserTemplateID = (int)comboBoxUserTemplates.SelectedValue;
				DirectoryService.SoapUserTemplate selectedTemplate = m_lstUserTemplates.Find(t => t.ID == iSelectedUserTemplateID);
				if (selectedTemplate != null)
				{
					List<DirectoryService.SoapUserTemplateItem> lstTemplateItems = new List<DirectoryService.SoapUserTemplateItem>(selectedTemplate.Items);

					// Validate using required flag of the user template of certain known fields.
					DirectoryService.SoapUserTemplateItem deviceIMEITemplateItem = lstTemplateItems.Find(item => item.FieldID == "device1.deviceIMEI");
					if (deviceIMEITemplateItem != null)
					{
						if (deviceIMEITemplateItem.Required && string.IsNullOrEmpty(textBoxIMEI.Text))
						{
							throw new Exception("User template requires IMEI.");
						}
					}

					DirectoryService.SoapUserTemplateItem deviceNameTemplateItem = lstTemplateItems.Find(item => item.FieldID == "device1.deviceName");
					if (deviceNameTemplateItem != null)
					{
						if (deviceNameTemplateItem.Required && string.IsNullOrEmpty(textBoxDeviceName.Text))
						{
							throw new Exception("User template requires device Device Name.");
						}
					}

					DirectoryService.SoapUserTemplateItem deviceMSISDNTemplateItem = lstTemplateItems.Find(item => item.FieldID == "device1.devicePhoneNumber");
					if (deviceMSISDNTemplateItem != null)
					{
						if (deviceMSISDNTemplateItem.Required && string.IsNullOrEmpty(textBoxMSISDN.Text))
						{
							throw new Exception("User template requires device Phone Number.");
						}
					}
				}

				// Validate using some known identifier labels from the device definition.
				int iDeviceDefID = (int)comboBoxDeviceDefinition.SelectedValue;
				DirectoryService.SoapDeviceDefinition deviceDef = m_lstDeviceDefinitions.Find(dd => dd.ID == iDeviceDefID);
				if (deviceDef != null && deviceDef.DeviceIdentifierLabel != null)
				{
					if(deviceDef.DeviceIdentifierLabel.ToLower() == "imei")
					{
						// device is identified by IMEI so we require it.
						if (string.IsNullOrEmpty(textBoxIMEI.Text))
						{
							throw new Exception("Device definition requires IMEI.");
						}
					}
					else if (deviceDef.DeviceIdentifierLabel.ToLower() == "msisdn")
					{
						// device is identified by MSISDN so we require it.
						if (string.IsNullOrEmpty(textBoxMSISDN.Text))
						{
							throw new Exception("Device definition requires Phone Number.");
						}
					}
				}

				ServiceProxy.GetSimpleService().AddDevice(
					(int)comboBoxOwnerUser.SelectedValue,
					textBoxDeviceName.Text,
					textBoxIMEI.Text,
					textBoxMSISDN.Text,
					textBoxEmail.Text,
					textBoxIP.Text,
					textBoxPort.Text,
					textBoxAPN.Text,
					textBoxGPRSUsername.Text,
					textBoxGPRSPassword.Text,
					(int)comboBoxDeviceDefinition.SelectedValue,
					iMobileNetworkID,
					textBoxDevicePassword.Text
				);

				listBoxResult.Items.Add("Successfully added device to user " + comboBoxOwnerUser.SelectedText);
			}
			catch (Exception ex)
			{
				listBoxResult.Items.Add("Failed to add new device: " + ex.Message);

				// Show error.
				MessageBox.Show(ex.Message);
			}
		}

		private void buttonClear_Click(object sender, EventArgs e)
		{
			textBoxDeviceName.Text = "";
			textBoxIMEI.Text = "";
			textBoxMSISDN.Text = "";
			textBoxEmail.Text = "";
			textBoxIP.Text = "";
			textBoxPort.Text = "";
			textBoxAPN.Text = "";
			textBoxGPRSUsername.Text = "";
			textBoxGPRSPassword.Text = "";
			textBoxMobileNetworkID.Text = "";
			textBoxDevicePassword.Text = "";
		}

		private void comboBoxUserTemplates_SelectedIndexChanged(object sender, EventArgs e)
		{
			m_lstUsers = ServiceProxy.GetSimpleService().GetUsersInUserTemplate((int)comboBoxUserTemplates.SelectedValue);
			comboBoxOwnerUser.DataSource = null;
			comboBoxOwnerUser.ValueMember = "ID";
			comboBoxOwnerUser.DisplayMember = "Username";
			comboBoxOwnerUser.DataSource = m_lstUsers;			
		}
	}
}
