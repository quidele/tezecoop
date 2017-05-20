using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace SGLibrary.ArchivoTarjetas
{
    public  class ArchivoTarjeta
    {

        public ArchivoTarjeta()
        {

        }

        protected List<string> _contenido;
        
        protected TB_ArchivoTarjeta _archivoTarjeta;
        protected String _nombreArchivo;

        public TB_ArchivoTarjeta miArchivoTarjeta
        {
            get { return (TB_ArchivoTarjeta)_archivoTarjeta; }
            set { _archivoTarjeta = value; }
        }


        public String NombreArchivo
        {
            get { return (String) _nombreArchivo ; }
        }


        public List<string> Contenido
        {
            get { return _contenido; }
        }
  
        public virtual void ProcesarArchivo()
        {
            throw new System.InvalidOperationException("El cliente debe implementar este metodo clase ArchivoTarjeta");
        }


        public virtual void AbrirArchivo(string pNombreArchivo, string pUsuario)
        {
            throw new System.InvalidOperationException("El cliente debe implementar este metodo clase ArchivoTarjeta");

        }

        public List<ColumnaArchivoTarjeta>   ObtenerColumnasArchivoTarjeta(){
            List<ColumnaArchivoTarjeta> listaColumnasArchivoTarjeta = new List<ColumnaArchivoTarjeta>();

            /*
             * case 0: unTB_ArchivoTarjetaDetalle.fechaPresentacion = DateTime.Parse(columnas[i]).Date; break; // Fecha Presentacion
                            case 1: break; // Lote
                            case 2: unTB_ArchivoTarjetaDetalle.fechaPago = DateTime.Parse(columnas[i]).Date; break; // Fecha Pago
                            case 3: break; // Descripcion
                            case 5: unTB_ArchivoTarjetaDetalle.comprobante = columnas[i]; break; // Comprobante
                            case 6: unTB_ArchivoTarjetaDetalle.tarjeta = columnas[i].Replace('X',' ').Trim(); break;  // Tarjeta
                            case 7: break; // Plan
                            case 8: break; // Cuota
                            case 9: unTB_ArchivoTarjetaDetalle.moneda = columnas[i].Replace("pesos", "PES").Trim(); break;  // Moneda
                            case 10: unTB_ArchivoTarjetaDetalle.importe = Decimal.Parse(columnas[i].Replace(".",""), CultureInfo.InvariantCulture ) / 100 ; break;  // Importe
                            default:*/

            listaColumnasArchivoTarjeta.Add(new ColumnaArchivoTarjeta("Fecha de Presentación", 1));
            listaColumnasArchivoTarjeta.Add(new ColumnaArchivoTarjeta("Fecha de Pago", 2));
            listaColumnasArchivoTarjeta.Add(new ColumnaArchivoTarjeta("Cupon", 3));   // comprobante 
            listaColumnasArchivoTarjeta.Add(new ColumnaArchivoTarjeta("Tarjeta", 4));   // comprobante 
            listaColumnasArchivoTarjeta.Add(new ColumnaArchivoTarjeta("Importe", 5));   // comprobante 
            return listaColumnasArchivoTarjeta;
        }
        
        
    }
}
