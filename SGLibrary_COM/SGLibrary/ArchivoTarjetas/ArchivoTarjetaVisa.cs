using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.ArchivoTarjetas
{
    public class ArchivoTarjetaVisa : ArchivoTarjeta 
    {
        const int Cantidad_Columas_VISA = 11;

        public  override void procesarArchivo(String pdsUsuario)
        {


            this.miArchivoTarjeta.dsUsuario = pdsUsuario;
            this.miArchivoTarjeta.formato = "VISA";
            this.miArchivoTarjeta.dtproceso = DateTime.Now;
            this.miArchivoTarjeta.nombrearchivo = this.NombreArchivo;


        

            foreach (var item in this.Contenido)
            {
                TB_ArchivoTarjetaDetalle unTB_ArchivoTarjetaDetalle = new TB_ArchivoTarjetaDetalle();
                string[] columnas= item.Split(';');
                if (columnas.Count() == Cantidad_Columas_VISA)
                {
                    for (int i = 0; i < columnas.Count(); i++)
                    {
                        switch (i)
                        {
                            case 0: unTB_ArchivoTarjetaDetalle.fechaPresentacion = DateTime.Parse(columnas[i]); break; // Fecha Presentacion
                            case 1:  // Lote
                            case 2: unTB_ArchivoTarjetaDetalle.fechaPago = DateTime.Parse(columnas[i]); break; // Fecha Pago
                            case 3:  // Descripcion
                            case 5:  // Comprobante
                            case 6: unTB_ArchivoTarjetaDetalle.tarjeta = columnas[i].Replace('X',' ').Trim(); break;  // Tarjeta
                            case 7:  // Plan
                            case 8:  // Cuota
                            case 9:  // Moneda
                            case 10: unTB_ArchivoTarjetaDetalle.importe = Decimal.Parse(columnas[i]); break;  // Importe
                            default:
                                break;
                        }
                    }
                }
                this.miArchivoTarjeta.TB_ArchivoTarjetaDetalle.Add(unTB_ArchivoTarjetaDetalle);
            }

            throw new System.InvalidOperationException("Debe implementar este metodo clase ArchivoTarjeta");    
        }

    }
}
