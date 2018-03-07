using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace SGLibrary
{
    public class ConfigBD
    {

        public String _ambiente;
        public String _dataSource;
        public String _initialCatalog;

        private static ConfigBD _instance;

        public String Ambiente
        {
            get
            {
                return _ambiente;
            }
        }
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

        private ConfigBD(String pAmbiente)
        {
            this._ambiente = pAmbiente;
            cargarArchivo(); 
        }

        public  static ConfigBD Instance(String pAmbiente)
        {
            if (_instance != null)  return _instance;
            _instance = new ConfigBD(pAmbiente);
            return _instance;

        }
       
        public void cargarArchivo()
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
                            case "Ambiente":
                                this._ambiente   = reader.Value;
                                break;
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

        }// cierra cargar archivo

    } // Cierra la clase
} // Cierra el NameSpace
