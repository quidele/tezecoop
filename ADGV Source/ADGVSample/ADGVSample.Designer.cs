namespace ADGVSample
{
    partial class ADGVSample
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ADGVSample));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.toolStrip = new System.Windows.Forms.ToolStrip();
            this.clearFiltersButton = new System.Windows.Forms.ToolStripButton();
            this.clearSortButton = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.searchButton = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripButton3 = new System.Windows.Forms.ToolStripButton();
            this.hideColumnButton = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton2 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripDropDownButton1 = new System.Windows.Forms.ToolStripDropDownButton();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.statusStrip = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.bindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dataSet = new System.Data.DataSet();
            this.dataGridView = new ADGV.AdvancedDataGridView();
            this.searchToolBar = new ADGV.SearchToolBar();
            this.toolStrip.SuspendLayout();
            this.statusStrip.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // toolStrip
            // 
            this.toolStrip.AutoSize = false;
            this.toolStrip.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.toolStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.clearFiltersButton,
            this.clearSortButton,
            this.toolStripSeparator1,
            this.searchButton,
            this.toolStripSeparator4,
            this.toolStripButton3,
            this.hideColumnButton,
            this.toolStripButton2,
            this.toolStripButton1,
            this.toolStripSeparator2,
            this.toolStripDropDownButton1});
            this.toolStrip.Location = new System.Drawing.Point(0, 0);
            this.toolStrip.Name = "toolStrip";
            this.toolStrip.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.toolStrip.Size = new System.Drawing.Size(1245, 49);
            this.toolStrip.TabIndex = 0;
            this.toolStrip.Text = "toolStrip1";
            this.toolStrip.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.toolStrip_ItemClicked);
            // 
            // clearFiltersButton
            // 
            this.clearFiltersButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.clearFiltersButton.Image = ((System.Drawing.Image)(resources.GetObject("clearFiltersButton.Image")));
            this.clearFiltersButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.clearFiltersButton.Name = "clearFiltersButton";
            this.clearFiltersButton.Size = new System.Drawing.Size(86, 46);
            this.clearFiltersButton.Text = "ClearFilters";
            this.clearFiltersButton.Click += new System.EventHandler(this.clearFilterButton_Click);
            // 
            // clearSortButton
            // 
            this.clearSortButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.clearSortButton.Image = ((System.Drawing.Image)(resources.GetObject("clearSortButton.Image")));
            this.clearSortButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.clearSortButton.Name = "clearSortButton";
            this.clearSortButton.Size = new System.Drawing.Size(74, 46);
            this.clearSortButton.Text = "ClearSort";
            this.clearSortButton.Click += new System.EventHandler(this.clearSortButton_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 49);
            // 
            // searchButton
            // 
            this.searchButton.CheckOnClick = true;
            this.searchButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.searchButton.Image = ((System.Drawing.Image)(resources.GetObject("searchButton.Image")));
            this.searchButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.searchButton.Name = "searchButton";
            this.searchButton.Size = new System.Drawing.Size(57, 46);
            this.searchButton.Text = "Search";
            this.searchButton.Click += new System.EventHandler(this.searchButton_Click);
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(6, 49);
            // 
            // toolStripButton3
            // 
            this.toolStripButton3.Checked = true;
            this.toolStripButton3.CheckOnClick = true;
            this.toolStripButton3.CheckState = System.Windows.Forms.CheckState.Checked;
            this.toolStripButton3.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.toolStripButton3.Image = ((System.Drawing.Image)(resources.GetObject("toolStripButton3.Image")));
            this.toolStripButton3.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton3.Name = "toolStripButton3";
            this.toolStripButton3.Size = new System.Drawing.Size(135, 46);
            this.toolStripButton3.Text = "Enabled \"int\" filter";
            this.toolStripButton3.Click += new System.EventHandler(this.toolStripButton3_Click);
            // 
            // hideColumnButton
            // 
            this.hideColumnButton.Checked = true;
            this.hideColumnButton.CheckOnClick = true;
            this.hideColumnButton.CheckState = System.Windows.Forms.CheckState.Checked;
            this.hideColumnButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.hideColumnButton.Image = ((System.Drawing.Image)(resources.GetObject("hideColumnButton.Image")));
            this.hideColumnButton.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.hideColumnButton.Name = "hideColumnButton";
            this.hideColumnButton.Size = new System.Drawing.Size(181, 46);
            this.hideColumnButton.Text = "Visible \"boolean\" column";
            this.hideColumnButton.Click += new System.EventHandler(this.hideColumnButton_Click);
            // 
            // toolStripButton2
            // 
            this.toolStripButton2.CheckOnClick = true;
            this.toolStripButton2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.toolStripButton2.Image = ((System.Drawing.Image)(resources.GetObject("toolStripButton2.Image")));
            this.toolStripButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton2.Name = "toolStripButton2";
            this.toolStripButton2.Size = new System.Drawing.Size(205, 46);
            this.toolStripButton2.Text = "Toggle \"date\" DateWithTime";
            this.toolStripButton2.Click += new System.EventHandler(this.toolStripButton2_Click);
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.CheckOnClick = true;
            this.toolStripButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.toolStripButton1.Image = ((System.Drawing.Image)(resources.GetObject("toolStripButton1.Image")));
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(191, 46);
            this.toolStripButton1.Text = "Enabled  \"date\"  TimeFilter";
            this.toolStripButton1.Click += new System.EventHandler(this.toolStripButton1_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(6, 49);
            // 
            // toolStripDropDownButton1
            // 
            this.toolStripDropDownButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.toolStripDropDownButton1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.toolStripSeparator3});
            this.toolStripDropDownButton1.Image = ((System.Drawing.Image)(resources.GetObject("toolStripDropDownButton1.Image")));
            this.toolStripDropDownButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripDropDownButton1.Name = "toolStripDropDownButton1";
            this.toolStripDropDownButton1.Size = new System.Drawing.Size(104, 46);
            this.toolStripDropDownButton1.Text = "Saved filters";
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(208, 26);
            this.toolStripMenuItem1.Text = "Save filter and sort";
            this.toolStripMenuItem1.Click += new System.EventHandler(this.toolStripMenuItem1_Click);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(205, 6);
            // 
            // statusStrip
            // 
            this.statusStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.statusStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1});
            this.statusStrip.Location = new System.Drawing.Point(0, 426);
            this.statusStrip.Name = "statusStrip";
            this.statusStrip.Padding = new System.Windows.Forms.Padding(1, 0, 19, 0);
            this.statusStrip.Size = new System.Drawing.Size(1245, 22);
            this.statusStrip.TabIndex = 1;
            this.statusStrip.Text = "statusStrip1";
            this.statusStrip.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.statusStrip_ItemClicked);
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(0, 17);
            // 
            // bindingSource
            // 
            this.bindingSource.AllowNew = true;
            this.bindingSource.DataSource = this.dataSet;
            this.bindingSource.Position = 0;
            this.bindingSource.ListChanged += new System.ComponentModel.ListChangedEventHandler(this.bindingSource_ListChanged);
            // 
            // dataSet
            // 
            this.dataSet.DataSetName = "NewDataSet";
            // 
            // dataGridView
            // 
            this.dataGridView.AllowUserToDeleteRows = false;
            this.dataGridView.AllowUserToOrderColumns = true;
            this.dataGridView.AutoGenerateColumns = false;
            this.dataGridView.AutoGenerateContextFilters = true;
            this.dataGridView.ColumnHeadersHeight = 22;
            this.dataGridView.DataSource = this.bindingSource;
            this.dataGridView.DateWithTime = true;
            this.dataGridView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView.Location = new System.Drawing.Point(0, 82);
            this.dataGridView.Margin = new System.Windows.Forms.Padding(4);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.ReadOnly = true;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.Red;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridView.RowHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dataGridView.Size = new System.Drawing.Size(1245, 344);
            this.dataGridView.TabIndex = 2;
            this.dataGridView.TimeFilter = false;
            this.dataGridView.SortStringChanged += new System.EventHandler(this.dataGridView_SortStringChanged);
            this.dataGridView.FilterStringChanged += new System.EventHandler(this.dataGridView_FilterStringChanged);
            this.dataGridView.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellContentClick);
            this.dataGridView.CellMouseDown += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dataGridView_CellMouseDown);
            // 
            // searchToolBar
            // 
            this.searchToolBar.AllowMerge = false;
            this.searchToolBar.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.searchToolBar.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.searchToolBar.Location = new System.Drawing.Point(0, 49);
            this.searchToolBar.MaximumSize = new System.Drawing.Size(0, 33);
            this.searchToolBar.MinimumSize = new System.Drawing.Size(0, 33);
            this.searchToolBar.Name = "searchToolBar";
            this.searchToolBar.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.searchToolBar.Size = new System.Drawing.Size(1245, 33);
            this.searchToolBar.TabIndex = 3;
            this.searchToolBar.Text = "searchToolBar1";
            this.searchToolBar.Search += new ADGV.SearchToolBarSearchEventHandler(this.searchToolBar_Search);
            this.searchToolBar.VisibleChanged += new System.EventHandler(this.searchToolBar_VisibleChanged);
            // 
            // ADGVSample
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1245, 448);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.searchToolBar);
            this.Controls.Add(this.toolStrip);
            this.Controls.Add(this.statusStrip);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "ADGVSample";
            this.Text = "ADGVSample";
            this.Load += new System.EventHandler(this.ADGVSample_Load);
            this.toolStrip.ResumeLayout(false);
            this.toolStrip.PerformLayout();
            this.statusStrip.ResumeLayout(false);
            this.statusStrip.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ToolStrip toolStrip;
        private System.Windows.Forms.StatusStrip statusStrip;
        private System.Windows.Forms.BindingSource bindingSource;
        private ADGV.AdvancedDataGridView dataGridView;
        private System.Data.DataSet dataSet;
        private System.Windows.Forms.ToolStripButton clearFiltersButton;
        private System.Windows.Forms.ToolStripButton clearSortButton;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.ToolStripButton searchButton;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripButton hideColumnButton;
        private ADGV.SearchToolBar searchToolBar;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
        private System.Windows.Forms.ToolStripButton toolStripButton2;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
        private System.Windows.Forms.ToolStripDropDownButton toolStripDropDownButton1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        private System.Windows.Forms.ToolStripButton toolStripButton3;
    }
}

