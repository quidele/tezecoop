using SGLibrary.Entities;
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
        public List<Ambientes> listaAmbientes = new List<Ambientes>();

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
            
            if (pAmbiente == "") this._ambiente = "sql2018";
            else
                this._ambiente = pAmbiente;

            cargarArchivo();
            var ambiente_usuario = listaAmbientes.Where(c => c.Ambiente == this._ambiente).First();
            this._initialCatalog  = ambiente_usuario.InitialCatalog;
            this._dataSource  = ambiente_usuario.DataSource;

        }

        public  static ConfigBD Instance(String pAmbiente)
        {
            if (_instance != null)  return _instance;
            _instance = new ConfigBD(pAmbiente);
            return _instance;

        }
       
        public void cargarArchivo()
        {

            var un_ambiente = new Ambientes();
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
                                un_ambiente = new Ambientes();
                                listaAmbientes.Add(un_ambiente);
                                un_ambiente.Ambiente = reader.Value;
                                // this._ambiente   = reader.Value;
                                break;
                            case "DataSource":  
                                // this._dataSource =reader.Value;
                                un_ambiente.DataSource  = reader.Value;
                                break;
                            case   "InitialCatalog": 
                                // this._initialCatalog  = reader.Value;
                                un_ambiente.InitialCatalog  = reader.Value;
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
