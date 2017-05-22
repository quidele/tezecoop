namespace GpsGate.Samples.SOAP.Simple
{
	partial class GenReportsControl
	{
		/// <summary> 
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary> 
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Component Designer generated code

		/// <summary> 
		/// Required method for Designer support - do not modify 
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.btnGetReports = new System.Windows.Forms.Button();
            this.lstReports = new System.Windows.Forms.ListBox();
            this.lblStartDate = new System.Windows.Forms.Label();
            this.lblEndDate = new System.Windows.Forms.Label();
            this.btnGenReport = new System.Windows.Forms.Button();
            this.lstHandlers = new System.Windows.Forms.ListBox();
            this.lblLstHandlers = new System.Windows.Forms.Label();
            this.btnReportStatus = new System.Windows.Forms.Button();
            this.btnGetReport = new System.Windows.Forms.Button();
            this.btnProcessingReports = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.dtPickerStart = new System.Windows.Forms.DateTimePicker();
            this.dtPickerEnd = new System.Windows.Forms.DateTimePicker();
            this.SuspendLayout();
            // 
            // btnGetReports
            // 
            this.btnGetReports.Location = new System.Drawing.Point(512, 33);
            this.btnGetReports.Name = "btnGetReports";
            this.btnGetReports.Size = new System.Drawing.Size(75, 23);
            this.btnGetReports.TabIndex = 1;
            this.btnGetReports.Text = "List Reports";
            this.btnGetReports.UseVisualStyleBackColor = true;
            this.btnGetReports.Click += new System.EventHandler(this.btnGetReports_Click);
            // 
            // lstReports
            // 
            this.lstReports.FormattingEnabled = true;
            this.lstReports.Location = new System.Drawing.Point(4, 59);
            this.lstReports.Name = "lstReports";
            this.lstReports.Size = new System.Drawing.Size(366, 238);
            this.lstReports.TabIndex = 2;
            this.lstReports.SelectedIndexChanged += new System.EventHandler(this.lstResults_SelectedIndexChanged);
            // 
            // lblStartDate
            // 
            this.lblStartDate.AutoSize = true;
            this.lblStartDate.Location = new System.Drawing.Point(4, 12);
            this.lblStartDate.Name = "lblStartDate";
            this.lblStartDate.Size = new System.Drawing.Size(55, 13);
            this.lblStartDate.TabIndex = 5;
            this.lblStartDate.Text = "Start Date";
            // 
            // lblEndDate
            // 
            this.lblEndDate.AutoSize = true;
            this.lblEndDate.Location = new System.Drawing.Point(168, 12);
            this.lblEndDate.Name = "lblEndDate";
            this.lblEndDate.Size = new System.Drawing.Size(52, 13);
            this.lblEndDate.TabIndex = 6;
            this.lblEndDate.Text = "End Date";
            // 
            // btnGenReport
            // 
            this.btnGenReport.Enabled = false;
            this.btnGenReport.Location = new System.Drawing.Point(513, 63);
            this.btnGenReport.Name = "btnGenReport";
            this.btnGenReport.Size = new System.Drawing.Size(75, 23);
            this.btnGenReport.TabIndex = 7;
            this.btnGenReport.Text = "Generate Report";
            this.btnGenReport.UseVisualStyleBackColor = true;
            this.btnGenReport.Click += new System.EventHandler(this.btnGenReport_Click);
            // 
            // lstHandlers
            // 
            this.lstHandlers.FormattingEnabled = true;
            this.lstHandlers.Location = new System.Drawing.Point(376, 62);
            this.lstHandlers.Name = "lstHandlers";
            this.lstHandlers.Size = new System.Drawing.Size(130, 238);
            this.lstHandlers.TabIndex = 8;
            this.lstHandlers.SelectedIndexChanged += new System.EventHandler(this.lstHandlers_SelectedIndexChanged);
            // 
            // lblLstHandlers
            // 
            this.lblLstHandlers.AutoSize = true;
            this.lblLstHandlers.Location = new System.Drawing.Point(377, 43);
            this.lblLstHandlers.Name = "lblLstHandlers";
            this.lblLstHandlers.Size = new System.Drawing.Size(90, 13);
            this.lblLstHandlers.TabIndex = 9;
            this.lblLstHandlers.Text = "Process Handlers";
            // 
            // btnReportStatus
            // 
            this.btnReportStatus.Enabled = false;
            this.btnReportStatus.Location = new System.Drawing.Point(513, 93);
            this.btnReportStatus.Name = "btnReportStatus";
            this.btnReportStatus.Size = new System.Drawing.Size(75, 23);
            this.btnReportStatus.TabIndex = 10;
            this.btnReportStatus.Text = "Get Status";
            this.btnReportStatus.UseVisualStyleBackColor = true;
            this.btnReportStatus.Click += new System.EventHandler(this.btnReportStatus_Click);
            // 
            // btnGetReport
            // 
            this.btnGetReport.Enabled = false;
            this.btnGetReport.Location = new System.Drawing.Point(513, 123);
            this.btnGetReport.Name = "btnGetReport";
            this.btnGetReport.Size = new System.Drawing.Size(75, 23);
            this.btnGetReport.TabIndex = 11;
            this.btnGetReport.Text = "Get Report";
            this.btnGetReport.UseVisualStyleBackColor = true;
            this.btnGetReport.Click += new System.EventHandler(this.btnGetReport_Click);
            // 
            // btnProcessingReports
            // 
            this.btnProcessingReports.Location = new System.Drawing.Point(513, 153);
            this.btnProcessingReports.Name = "btnProcessingReports";
            this.btnProcessingReports.Size = new System.Drawing.Size(75, 23);
            this.btnProcessingReports.TabIndex = 12;
            this.btnProcessingReports.Text = "Processing";
            this.btnProcessingReports.UseVisualStyleBackColor = true;
            this.btnProcessingReports.Click += new System.EventHandler(this.btnProcessingReports_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Enabled = false;
            this.btnCancel.Location = new System.Drawing.Point(513, 183);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 13;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // dtPickerStart
            // 
            this.dtPickerStart.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtPickerStart.Location = new System.Drawing.Point(65, 8);
            this.dtPickerStart.Name = "dtPickerStart";
            this.dtPickerStart.Size = new System.Drawing.Size(97, 20);
            this.dtPickerStart.TabIndex = 14;
            // 
            // dtPickerEnd
            // 
            this.dtPickerEnd.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtPickerEnd.Location = new System.Drawing.Point(226, 8);
            this.dtPickerEnd.Name = "dtPickerEnd";
            this.dtPickerEnd.Size = new System.Drawing.Size(113, 20);
            this.dtPickerEnd.TabIndex = 15;
            // 
            // GenReportsControl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dtPickerEnd);
            this.Controls.Add(this.dtPickerStart);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnProcessingReports);
            this.Controls.Add(this.btnGetReport);
            this.Controls.Add(this.btnReportStatus);
            this.Controls.Add(this.lblLstHandlers);
            this.Controls.Add(this.lstHandlers);
            this.Controls.Add(this.btnGenReport);
            this.Controls.Add(this.lblEndDate);
            this.Controls.Add(this.lblStartDate);
            this.Controls.Add(this.lstReports);
            this.Controls.Add(this.btnGetReports);
            this.Name = "GenReportsControl";
            this.Size = new System.Drawing.Size(600, 300);
            this.ResumeLayout(false);
            this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Button btnGetReports;
        private System.Windows.Forms.ListBox lstReports;
		private System.Windows.Forms.Label lblStartDate;
		private System.Windows.Forms.Label lblEndDate;
		private System.Windows.Forms.Button btnGenReport;
		private System.Windows.Forms.ListBox lstHandlers;
		private System.Windows.Forms.Label lblLstHandlers;
		private System.Windows.Forms.Button btnReportStatus;
		private System.Windows.Forms.Button btnGetReport;
		private System.Windows.Forms.Button btnProcessingReports;
		private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.DateTimePicker dtPickerStart;
        private System.Windows.Forms.DateTimePicker dtPickerEnd;
	}
}
