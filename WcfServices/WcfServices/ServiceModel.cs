using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace WcfServices
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



        public virtual object ObtenerRegistro(string p)
        {
            throw new NotImplementedException();
        }


        public virtual IEnumerable<Object> ObtenerRegistros(DateTime fechadesde, DateTime fechaHasta, String usuario)
        {
            throw new NotImplementedException();
        }

        public virtual void AnularRegistro(object unRegistro)
        {
            throw new NotImplementedException();
        }

        public virtual void AgregarRegistro(object unRegistro)
        {
            throw new NotImplementedException();
        }

        internal void ModificarRegistro()
        {
            throw new NotImplementedException();
        }

        public virtual string ListaErrores()
        {
            throw new NotImplementedException();
        }

        public virtual string Usuario { get; set; }

        public virtual string CajaAdm { get; set; }
    }
}