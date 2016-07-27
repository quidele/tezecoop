using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace SGLibrary
{
    public class ConfigBD
    {

        public String _dataSource; 

        public String DataSource
        {
           get{
              return   _dataSource; 
            }
        }

 
        public ConfigBD()
        {
            XmlTextReader reader = new XmlTextReader("ConfigBD.xml");
					        
            while (reader.Read()) 
            {
            switch (reader.NodeType) 
            {
            case XmlNodeType.Element: // The node is an element.
                Console.Write("<" + reader.Name);
            Console.WriteLine(">");
                break;
            case XmlNodeType.Text: //Display the text in each element.
                Console.WriteLine (reader.Value);
                this._dataSource = reader.Value;
                break;
            case XmlNodeType. EndElement: //Display the end of the element.
                Console.Write("</" + reader.Name);
            Console.WriteLine(">");
                break;
            }
            }
        }
    }
}
