using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;


namespace SGLibrary
{
    public class ServiceModel
    {
        public ServiceModel()
        {
            string subPath = "Logs"; // your code goes here

            bool exists = System.IO.Directory.Exists(subPath);

            if (!exists)
                System.IO.Directory.CreateDirectory(subPath);

            Trace.Listeners.Add(new TextWriterTraceListener("Logs\\LOG_" + DateTime.Now.ToString().Replace("/", "").Replace(":", "") + ".log"));
            Trace.AutoFlush = true;
            Trace.TraceInformation("inicializando el logger");
    
        }



        internal object ObtenerRegistroBlanco()
        {
            throw new NotImplementedException();
        }

        internal IEnumerable<Object> ObtenerRegistros(DateTime dateTime1, DateTime dateTime2, string p)
        {
            throw new NotImplementedException();
        }

        internal object ObtenerRegistro(string p)
        {
            throw new NotImplementedException();
        }

        internal void AnularRegistro(object unRegistro)
        {
            throw new NotImplementedException();
        }

        internal void AgregarRegistro()
        {
            throw new NotImplementedException();
        }

        internal void ModificarRegistro()
        {
            throw new NotImplementedException();
        }

        public  virtual  string ListaErrores()
        {
            throw new NotImplementedException();
        }

        public string Usuario { get; set; }

        public string CajaAdm { get; set; }
    }
}
