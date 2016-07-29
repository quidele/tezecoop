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
        public String _initialCatalog; 

        public String DataSource
        {
           get{
              return   _dataSource; 
            }
        }

        public String InitialCatalog
        {
            get
            {
                return _initialCatalog;
            }
        }
 
        public ConfigBD()
        {
            String _nombreelemento="";
            XmlTextReader reader = new XmlTextReader("ConfigBD.xml");
					        
            while (reader.Read()) 
            {
            switch (reader.NodeType) 
            {
            case XmlNodeType.Element: // The node is an element.
                Console.Write("<" + reader.Name);
                _nombreelemento = reader.Name;
                Console.WriteLine(">");
                break;
            case XmlNodeType.Text: //Display the text in each element.
                Console.WriteLine (reader.Value);
                switch (_nombreelemento){
                    case "DataSource":  
                        this._dataSource =reader.Value;  
                        break;
                    case   "InitialCatalog": 
                        this._initialCatalog  = reader.Value;
                        break;
                }
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
