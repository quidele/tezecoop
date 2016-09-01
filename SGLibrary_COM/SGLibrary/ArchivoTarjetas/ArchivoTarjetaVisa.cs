using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace SGLibrary.ArchivoTarjetas
{
    public class ArchivoTarjetaVisa : ArchivoTarjeta 
    {
        const int Cantidad_Columas_VISA = 11;

        public  override void ProcesarArchivo()
        {
            char separador ='\0';

            foreach (var item in this.Contenido)
            {

                if  (item.IndexOf(',') > 0)   separador = ',';
                if  (item.IndexOf(';') > 0)   separador = ';';

                string[] columnas= item.Split(separador);
                if ((columnas.Count() == Cantidad_Columas_VISA) && (columnas[0].CompareTo("Fecha Presentacion")!=0))
                {
                    TB_ArchivoTarjetaDetalle unTB_ArchivoTarjetaDetalle = new TB_ArchivoTarjetaDetalle();
                    for (int i = 0; i < columnas.Count(); i++)
                    {
                        switch (i)
                        {
                            case 0: unTB_ArchivoTarjetaDetalle.fechaPresentacion = DateTime.Parse(columnas[i]); break; // Fecha Presentacion
                            case 1: break; // Lote
                            case 2: unTB_ArchivoTarjetaDetalle.fechaPago = DateTime.Parse(columnas[i]); break; // Fecha Pago
                            case 3: break; // Descripcion
                            case 5: unTB_ArchivoTarjetaDetalle.comprobante = columnas[i]; break; // Comprobante
                            case 6: unTB_ArchivoTarjetaDetalle.tarjeta = columnas[i].Replace('X',' ').Trim(); break;  // Tarjeta
                            case 7: break; // Plan
                            case 8: break; // Cuota
                            case 9: break; // Moneda
                            case 10: unTB_ArchivoTarjetaDetalle.importe = Decimal.Parse(columnas[i], CultureInfo.InvariantCulture ); break;  // Importe
                            default:
                                break;
                        }
                    }
                   this.miArchivoTarjeta.TB_ArchivoTarjetaDetalle.Add(unTB_ArchivoTarjetaDetalle);
                }
              
            }

            throw new System.InvalidOperationException("Debe implementar este metodo clase ArchivoTarjeta");    
        }

    }
}
