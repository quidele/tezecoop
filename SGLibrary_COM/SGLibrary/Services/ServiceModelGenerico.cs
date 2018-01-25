using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public  class ServiceModelGenerico<T>
    {


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
        public virtual string ListaErrores()
        {
            throw new NotImplementedException();
        }

        public object CompletarAuditoria(object obj, String p_seccion, String p_bloque, String p_estado_registro, String p_operacion_mod)
        {

            var objAuditoria = (Auditoria) obj;

            objAuditoria.usuario_mod = this.usuario_mod;
            objAuditoria.fecha_mod = DateTime.Now;
            objAuditoria.terminal_mod = this.terminal_mod;
            objAuditoria.operacion_mod = p_operacion_mod;
            objAuditoria.estado_registro = p_estado_registro;
            objAuditoria.formulario = this.formulario;
            objAuditoria.seccion = p_seccion ;
            objAuditoria.bloque = p_bloque ;
            objAuditoria.linea = 1;
            
            return objAuditoria;
        }

        public virtual  T ObtenerRegistro(string p)
        {
            throw new NotImplementedException();
        }
    }

}
