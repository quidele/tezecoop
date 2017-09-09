using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Globalization;

namespace GpsGate.Samples.SOAP.Simple
{
    public partial class GenReportsControl : UserControl
    {

        #region Report

        /// <summary>
        /// Simple class to allow listing of reports
        /// </summary>
        public class Report
        {
            public int Value
            {
                get;
                set;
            }

            public string Name
            {
                get;
                set;
            }

            public override string ToString()
            {
                return Name;
            }
        }

        #endregion

        #region Handle
        /// <summary>
        /// Simple class to allow listing of handles
        /// </summary>
        public class Handle
        {
            private int m_iHandleID;
            private string m_strState;

            #region Public Properties

            /// <summary>
            /// HandleID 
            /// </summary>
            public int ID
            {
                get
                {
                    return m_iHandleID;
                }
            }

            /// <summary>
            /// Report State, is report processing or done
            /// </summary>
            public string State
            {
                get
                {
                    return m_strState;
                }
            }

            #endregion

            /// <summary>
            /// Constructor that receives a reporting webservice response to GenerateReport or GetReportStatus
            /// methods. 
            /// </summary>
            /// <param name="xmlNode"></param>
            public Handle(XmlNode xmlNode)
            {
                try
                {
                    foreach (XmlNode child in xmlNode.ChildNodes)
                    {
                        if (child.Name.Equals("handleid", StringComparison.CurrentCultureIgnoreCase))
                        {
                            m_iHandleID = Convert.ToInt32(child.InnerText);
                        }
                        else if (child.Name.Equals("state", StringComparison.CurrentCultureIgnoreCase))
                        {
                            m_strState = child.InnerText;
                        }

                    }
                }
                catch (Exception)
                {
                    throw new Exception(xmlNode.OuterXml);
                }
            }

            public override string ToString()
            {
                return ID + " " + State;
            }
        }

        #endregion

        public GenReportsControl()
        {
            InitializeComponent();

            /*
             * Setting default values for start and end date.
             * Start Date -> Current Date
             * End Date -> Current Date minus 1 month
             */
            dtPickerStart.Value = DateTime.Now.Date.AddMonths(-1);
            dtPickerEnd.Value = DateTime.Now.Date;
        }

        /// <summary>
        /// Handle click of get reports button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnGetReports_Click(object sender, EventArgs e)
        {
            //Clear Report List
            lstReports.Items.Clear();
            //Get Report List from webservice
            var xmlResult = ServiceProxy.GetSimpleService().GetReports();
            string strReportID = string.Empty;
            string strName = string.Empty;

            //iterate all through all the report nodes in xml reponse
            foreach (XmlNode xmlReportNode in xmlResult.ChildNodes)
            {
                //get values of report id and  report name
                foreach (XmlNode xmlAttrNode in xmlReportNode.ChildNodes)
                {
                    if (xmlAttrNode.Name.Equals("id"))
                    {
                        strReportID = xmlAttrNode.InnerText;
                    }
                    else if (xmlAttrNode.Name.Equals("name"))
                    {
                        strName = xmlAttrNode.InnerText;
                    }
                }
                //Create new report object from data and adds to list control
                lstReports.Items.Add(new Report { Value = Convert.ToInt32(strReportID), Name = strName });
            }
            lstReports.SelectedItems.Clear();
            btnGenReport.Enabled = false;
        }

        /// <summary>
        /// Handles selection change in report list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void lstResults_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Enable generate button if a report is selected
            if (lstReports.SelectedItems.Count > 0)
            {
                btnGenReport.Enabled = true;
            }
        }

        /// <summary>
        /// Handle generate reportor button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnGenReport_Click(object sender, EventArgs e)
        {
            //get start and end date values from controls
            DateTime dtStartDate = dtPickerStart.Value;
            DateTime dtEndDate = dtPickerEnd.Value;

            //check start is before end date
            if (dtStartDate <= dtEndDate)
            {
                Report selectedItem = (Report)lstReports.SelectedItem;
                //call web service to start processing report
                var xmlResult = ServiceProxy.GetSimpleService().GenerateReport(selectedItem.Value, dtStartDate, dtEndDate);

                //evaluate if it failed - the user could have called for another report
                if (xmlResult.Name.Equals("error", StringComparison.CurrentCultureIgnoreCase))
                {
                    MessageBox.Show(xmlResult.InnerText);
                    return;
                }
                //add report handler to handler list.
                lstHandlers.Items.Add(new Handle(xmlResult));
            }
            else
            {
                MessageBox.Show("Selected Dates are not valid");
            }
        }

        /// <summary>
        /// Handle refresh status of called reports
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnReportStatus_Click(object sender, EventArgs e)
        {
            //get 
            Handle h = (Handle)lstHandlers.SelectedItem;
            //call web service
            Handle newHandle = new Handle(ServiceProxy.GetSimpleService().GetReportStatus(h.ID));

            lstHandlers.Items[lstHandlers.SelectedIndex] = newHandle;
            lstHandlers.Refresh();
        }

        /// <summary>
        /// Handle selected item change in handler list and change
        /// cancel and get status button state acording i.e. can´t
        /// cancel a report that is already processed
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void lstHandlers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lstHandlers.SelectedItem != null)
            {
                Handle h = (Handle)lstHandlers.SelectedItem;
                btnGetReport.Enabled = h.State.Equals("done", StringComparison.CurrentCultureIgnoreCase);
                if (h.State.Equals("processing", StringComparison.CurrentCultureIgnoreCase))
                {
                    btnReportStatus.Enabled = true;
                    btnCancel.Enabled = true;
                }
                else
                {
                    btnReportStatus.Enabled = false;
                    btnCancel.Enabled = false;
                }
            }
            else
            {
                btnGenReport.Enabled = false;
                btnReportStatus.Enabled = false;
            }
        }

        /// <summary>
        /// Handle generate report click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnGetReport_Click(object sender, EventArgs e)
        {
            try
            {
                //selected handle from list
                Handle h = (Handle)lstHandlers.SelectedItem;
                //call web service
                var xmlResult = ServiceProxy.GetSimpleService().FetchReport(h.ID);
                //chose name of excel file to save
                FileDialog fDiag = new SaveFileDialog();
                fDiag.Filter = "Excel Files (*.xlsx)|*.xlsx";

                DialogResult result = fDiag.ShowDialog();
                if (result == DialogResult.OK)
                {
                    //generate excel file from xml reportout
                    XLDocumentBuilder.Export(xmlResult, fDiag.FileName);
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }

        /// <summary>
        /// Get processing reports click handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnProcessingReports_Click(object sender, EventArgs e)
        {
            lstHandlers.Items.Clear();

            //Get Processing reports, this should only return one report.
            var xmlResult = ServiceProxy.GetSimpleService().GetProcessingReports();

            foreach (XmlNode xmlChild in xmlResult.ChildNodes)
            {
                lstHandlers.Items.Add(new Handle(xmlChild));
            }
        }

        /// <summary>
        /// Handle cancel report button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCancel_Click(object sender, EventArgs e)
        {
            Handle h = (Handle)lstHandlers.SelectedItem;
            var xmlResult = ServiceProxy.GetSimpleService().CancelReport(h.ID);
        }
    }
}
