using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.ArchivoTarjetas
{
    public class ArchivoTarjetaVisa : ArchivoTarjeta 
    {
        

        public  override void procesarArchivo()
        {



            foreach (var item in this.Contenido)
            {
                item.Split(";");
            }

            throw new System.InvalidOperationException("Debe implementar este metodo clase ArchivoTarjeta");    
        }

    }
}
