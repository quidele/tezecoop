using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public  class ServiceModelGenerico<T>
    {
        public ServiceModelGenerico()
        {
            string subPath = "Logs2"; // your code goes here
            bool exists = System.IO.Directory.Exists(subPath);
            if (!exists)
                System.IO.Directory.CreateDirectory(subPath);

            Trace.Listeners.Add(new TextWriterTraceListener("Logs2\\LOG_" + DateTime.Now.ToString().Replace("/", "").Replace(":", "") + ".log"));
            Trace.AutoFlush = true;
            Trace.TraceInformation("inicializando el logger desde ServiceModelGenerico");
        }


        public virtual string Usuario { get; set; }
        public virtual string CajaAdm { get; set; }
        public virtual string Basededatos { get; set; }
        public virtual string Servidor { get; set; }

        public String usuario_mod { get; set; }
        public DateTime fecha_mod { get; set; }
        public String terminal_mod { get; set; }
        public String operacion_mod { get; set; }
        public String estado_registro { get; set; }
        public String formulario { get; set; }
        public String seccion { get; set; }
        public String bloque { get; set; }
        public int linea { get; set; }

        

        protected String _lista_errores;

        public String ListaErrores()
        {
            return this._lista_errores;
        }


        public virtual IEnumerable<Object> obtenerUsuarios()
        {
            throw new NotImplementedException();
        }

        public virtual IEnumerable<T> ObtenerTodosLosRegistros()
        {
            throw new NotImplementedException();
        }
        public virtual T ObtenerRegistroBlanco()
        {
          throw new NotImplementedException();
        }
        public virtual T ObtenerRegistroxId(string Id)
        {
            throw new NotImplementedException();
        }
        public virtual IEnumerable<T> ObtenerRegistros(DateTime fechadesde, DateTime fechaHasta, String usuario)
        {
            throw new NotImplementedException();
        }
        public virtual void AnularRegistro(T unRegistro)
        {
            throw new NotImplementedException();
        }
        public virtual void AgregarRegistro(T unRegistro)
        {
            throw new NotImplementedException();
        }
        public virtual void ModificarRegistro(T unRegistro)
        {
            throw new NotImplementedException();
        }


        public virtual T CompletarAuditoria(T obj, String p_seccion, String p_bloque, String p_estado_registro, String p_operacion_mod)
        {
            throw new NotImplementedException();
        }

        public virtual  T ObtenerRegistro(string p)
        {
            throw new NotImplementedException();
        }


        public void TraceInformation(String paramLog) 
        {
            /* crear pattern de grabacion */
            Trace.TraceInformation(paramLog);
        }


        public virtual IEnumerable<T> ObtenerTodosLosRegistrosConExclusion(List<T> lista_a_excluir)
        {
            throw new NotImplementedException();
        }


    }// Cierra Clase

} // Cierra NameSpace
