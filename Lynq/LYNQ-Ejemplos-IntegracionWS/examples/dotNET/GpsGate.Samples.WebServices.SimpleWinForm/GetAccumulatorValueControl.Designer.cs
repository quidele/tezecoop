namespace GpsGate.Samples.SOAP.Simple
{
	partial class GetAccumulatorValueControl
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
			this.comboBoxUsers = new System.Windows.Forms.ComboBox();
			this.labelAccumulatorValue = new System.Windows.Forms.Label();
			this.comboBoxAccumulatorName = new System.Windows.Forms.ComboBox();
			this.labelAccumulatorName = new System.Windows.Forms.Label();
			this.labelUser = new System.Windows.Forms.Label();
			this.labelValue = new System.Windows.Forms.Label();
			this.buttonGetAccumulatorValue = new System.Windows.Forms.Button();
			this.panelTime = new System.Windows.Forms.Panel();
			this.dateTimePicker = new System.Windows.Forms.DateTimePicker();
			this.checkBoxUseTime = new System.Windows.Forms.CheckBox();
			this.panelTime.SuspendLayout();
			this.SuspendLayout();
			// 
			// comboBoxUsers
			// 
			this.comboBoxUsers.FormattingEnabled = true;
			this.comboBoxUsers.Location = new System.Drawing.Point(128, 45);
			this.comboBoxUsers.Name = "comboBoxUsers";
			this.comboBoxUsers.Size = new System.Drawing.Size(210, 21);
			this.comboBoxUsers.TabIndex = 0;
			// 
			// labelAccumulatorValue
			// 
			this.labelAccumulatorValue.AutoSize = true;
			this.labelAccumulatorValue.Location = new System.Drawing.Point(35, 189);
			this.labelAccumulatorValue.Name = "labelAccumulatorValue";
			this.labelAccumulatorValue.Size = new System.Drawing.Size(37, 13);
			this.labelAccumulatorValue.TabIndex = 1;
			this.labelAccumulatorValue.Text = "Value:";
			// 
			// comboBoxAccumulatorName
			// 
			this.comboBoxAccumulatorName.FormattingEnabled = true;
			this.comboBoxAccumulatorName.Items.AddRange(new object[] {
            "Odometer"});
			this.comboBoxAccumulatorName.Location = new System.Drawing.Point(128, 18);
			this.comboBoxAccumulatorName.Name = "comboBoxAccumulatorName";
			this.comboBoxAccumulatorName.Size = new System.Drawing.Size(141, 21);
			this.comboBoxAccumulatorName.TabIndex = 2;
			// 
			// labelAccumulatorName
			// 
			this.labelAccumulatorName.AutoSize = true;
			this.labelAccumulatorName.Location = new System.Drawing.Point(35, 21);
			this.labelAccumulatorName.Name = "labelAccumulatorName";
			this.labelAccumulatorName.Size = new System.Drawing.Size(69, 13);
			this.labelAccumulatorName.TabIndex = 3;
			this.labelAccumulatorName.Text = "Accumulator:";
			// 
			// labelUser
			// 
			this.labelUser.AutoSize = true;
			this.labelUser.Location = new System.Drawing.Point(35, 49);
			this.labelUser.Name = "labelUser";
			this.labelUser.Size = new System.Drawing.Size(32, 13);
			this.labelUser.TabIndex = 4;
			this.labelUser.Text = "User:";
			// 
			// labelValue
			// 
			this.labelValue.AutoSize = true;
			this.labelValue.Location = new System.Drawing.Point(125, 189);
			this.labelValue.Name = "labelValue";
			this.labelValue.Size = new System.Drawing.Size(27, 13);
			this.labelValue.TabIndex = 5;
			this.labelValue.Text = "N/A";
			// 
			// buttonGetAccumulatorValue
			// 
			this.buttonGetAccumulatorValue.Location = new System.Drawing.Point(35, 144);
			this.buttonGetAccumulatorValue.Name = "buttonGetAccumulatorValue";
			this.buttonGetAccumulatorValue.Size = new System.Drawing.Size(75, 23);
			this.buttonGetAccumulatorValue.TabIndex = 6;
			this.buttonGetAccumulatorValue.Text = "Get Value";
			this.buttonGetAccumulatorValue.UseVisualStyleBackColor = true;
			this.buttonGetAccumulatorValue.Click += new System.EventHandler(this.buttonGetAccumulatorValue_Click);
			// 
			// panelTime
			// 
			this.panelTime.Controls.Add(this.dateTimePicker);
			this.panelTime.Location = new System.Drawing.Point(38, 102);
			this.panelTime.Name = "panelTime";
			this.panelTime.Size = new System.Drawing.Size(527, 30);
			this.panelTime.TabIndex = 9;
			this.panelTime.Visible = false;
			// 
			// dateTimePicker
			// 
			this.dateTimePicker.CustomFormat = "yyyy-MM-dd HH:mm:ss";
			this.dateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
			this.dateTimePicker.Location = new System.Drawing.Point(90, 3);
			this.dateTimePicker.Name = "dateTimePicker";
			this.dateTimePicker.Size = new System.Drawing.Size(141, 20);
			this.dateTimePicker.TabIndex = 9;
			// 
			// checkBoxUseTime
			// 
			this.checkBoxUseTime.AutoSize = true;
			this.checkBoxUseTime.Location = new System.Drawing.Point(128, 79);
			this.checkBoxUseTime.Name = "checkBoxUseTime";
			this.checkBoxUseTime.Size = new System.Drawing.Size(118, 17);
			this.checkBoxUseTime.TabIndex = 10;
			this.checkBoxUseTime.Text = "Specify Time (UTC)";
			this.checkBoxUseTime.UseVisualStyleBackColor = true;
			this.checkBoxUseTime.CheckedChanged += new System.EventHandler(this.checkBoxUseTime_CheckedChanged);
			// 
			// GetAccumulatorValueControl
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.checkBoxUseTime);
			this.Controls.Add(this.panelTime);
			this.Controls.Add(this.buttonGetAccumulatorValue);
			this.Controls.Add(this.labelValue);
			this.Controls.Add(this.labelUser);
			this.Controls.Add(this.labelAccumulatorName);
			this.Controls.Add(this.comboBoxAccumulatorName);
			this.Controls.Add(this.labelAccumulatorValue);
			this.Controls.Add(this.comboBoxUsers);
			this.Name = "GetAccumulatorValueControl";
			this.Size = new System.Drawing.Size(600, 300);
			this.panelTime.ResumeLayout(false);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.ComboBox comboBoxUsers;
		private System.Windows.Forms.Label labelAccumulatorValue;
		private System.Windows.Forms.ComboBox comboBoxAccumulatorName;
		private System.Windows.Forms.Label labelAccumulatorName;
		private System.Windows.Forms.Label labelUser;
		private System.Windows.Forms.Label labelValue;
		private System.Windows.Forms.Button buttonGetAccumulatorValue;
		private System.Windows.Forms.Panel panelTime;
		private System.Windows.Forms.DateTimePicker dateTimePicker;
		private System.Windows.Forms.CheckBox checkBoxUseTime;
	}
}
