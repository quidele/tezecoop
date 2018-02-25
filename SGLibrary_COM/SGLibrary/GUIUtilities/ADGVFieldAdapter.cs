using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.GUIUtilities
{
    public class ADGVFieldAdapter
    {
        public string Name { get; set; }
        public string HeaderText { get; set; }
        public string DataPropertyName { get; set; }
        public string Type { get; set; }
        public bool ReadOnly { get; set; }
        public bool Visible { get; set; }


        public ADGVFieldAdapter(string pName , string pHeaderText, string pDataPropertyName , string pType, bool pReadOnly , bool pVisible)
        {
            this.Name = pName;
            this.HeaderText = pHeaderText;
            this.DataPropertyName = pDataPropertyName;
            this.Type = pType;
            this.ReadOnly = pReadOnly;
            this.Visible = pVisible;
        }







    }
}
