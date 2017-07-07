using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SGLibrary.Extensiones; 

namespace SGLibrary
{
    public partial class Frm_GroupByGrid : Form
    {

        

        public Frm_GroupByGrid()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
             
            DataTable dt =new DataTable();
            dt.Columns.Add (new DataColumn("Column1"));
            dt.Columns.Add (new DataColumn("Column2"));
            dt.Columns.Add (new DataColumn("Column3"));

                  
    

            dt.Rows.Add("aleksy", "Rugby", "!!!");
            dt.Rows.Add("aleksander", "football", "ASDAS" );
            dt.Rows.Add( "aleksy", "hurtles", "1121" );
            dt.Rows.Add( "bazyli", "baseball", "000" );
            dt.Rows.Add( "aleksander", "car racing", "LSDFJ" );
            dt.Rows.Add( "bazyli", "boxing", "2kefrjek" );
            dt.Rows.Add( "bazyli", "cricket", "salka" );
            dt.Rows.Add( "grzegorz", "volleyball", "asd" );
            dt.Rows.Add( "aleksy", "boxing", "wsw" );
            dt.DefaultView.Sort = "Column1";
            groupByGrid1.DataSource = dt;

        }
    }
}
