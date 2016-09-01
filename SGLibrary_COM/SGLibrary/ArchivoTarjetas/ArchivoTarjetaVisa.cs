using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.ArchivoTarjetas
{
    public class ArchivoTarjetaVisa : ArchivoTarjeta 
    {
        

        public  override void procesarArchivo(String pdsUsuario)
        {


            this.miArchivoTarjeta.dsUsuario = pdsUsuario;
            this.miArchivoTarjeta.formato = "VISA";
            this.miArchivoTarjeta.dtproceso = DateTime.Now;
            this.miArchivoTarjeta.nombrearchivo = this.NombreArchivo;

            foreach (var item in this.Contenido)
            {

                string[] columnas= item.Split(';');
                if (columnas.Count() == 11)
                {
                    for (int i = 0; i < columnas.Count(); i++)
                    {
                        switch (i)
                        {
                            case 0:  // Fecha Presentacion
                            case 1:  // Lote
                            case 2:  // Fecha Pago
                            case 3:  // Descripcion
                            case 4:  // Fecha Origen
                            case 5:  // Comprobante
                            case 6:  // Tarjeta
                            case 7:  // Plan
                            case 8:  // Cuota
                            case 9:  // Moneda
                            case 10: // Importe
                            default:
                                break;
                        }
                    }
                }
                
            }

            throw new System.InvalidOperationException("Debe implementar este metodo clase ArchivoTarjeta");    
        }

    }
}
