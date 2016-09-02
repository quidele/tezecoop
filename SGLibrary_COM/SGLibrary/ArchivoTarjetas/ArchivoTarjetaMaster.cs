

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace SGLibrary.ArchivoTarjetas
{
    public class ArchivoTarjetaMaster : ArchivoTarjeta 
    {
        const int Cantidad_Columas = 11;

        public  override void ProcesarArchivo()
        {
            char separador ='\0';

            foreach (var item in this.Contenido)
            {

                if  (item.IndexOf(',') > 0)   separador = ',';
                if  (item.IndexOf(';') > 0)   separador = ';';

                string[] columnas= item.Split(separador);
                if ((columnas.Count() == Cantidad_Columas) && (columnas[0].CompareTo("Comercio")!=0))
                {
                    TB_ArchivoTarjetaDetalle unTB_ArchivoTarjetaDetalle = new TB_ArchivoTarjetaDetalle();
                    for (int i = 0; i < columnas.Count(); i++)
                    {
                        switch (i)
                        {
                            case 0: unTB_ArchivoTarjetaDetalle.fechaPresentacion = DateTime.Parse(columnas[i]); break; // Comercio
                            case 1: break; // Fecha Presentaci�n
                            case 2: unTB_ArchivoTarjetaDetalle.fechaPago = DateTime.Parse(columnas[i]); break; // Tipo Movimiento
                            case 3: break; // Tarjeta (4 �lt. Dig.)
                            case 4: unTB_ArchivoTarjetaDetalle.comprobante = columnas[i]; break; // Nro. Cup�n
                            case 5: unTB_ArchivoTarjetaDetalle.tarjeta = columnas[i].Replace('X', ' ').Trim(); break;  // Marca
                            case 6: break; // Moneda
                            case 7: break; // Imp. Bruto
                            case 8: break; // Dto. Arancel
                            case 9: unTB_ArchivoTarjetaDetalle.importe = Decimal.Parse(columnas[i], CultureInfo.InvariantCulture); break;  // Fecha Pago
                            case 10: break;  // Fecha Pago
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
