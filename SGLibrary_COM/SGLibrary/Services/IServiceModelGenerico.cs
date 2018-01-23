using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public  class ServiceModelGenerico<T>
    {
        public virtual IEnumerable<T> ObtenerTodosLosRegistros()
        {   throw new NotImplementedException();
        }
        public virtual string Usuario { get; set; }
        public virtual string CajaAdm { get; set; }
        public virtual string Basededatos { get; set; }
        public virtual string Servidor { get; set; }
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

    }

}
