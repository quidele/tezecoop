using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Data.Objects;
using System.Transactions;
using SGLibrary.ArchivoTarjetas;
using System.Data.Entity.Validation;
using System.Data;
using System.Diagnostics;

namespace SGLibrary
{
    [Guid("65174DA4-2750-403E-A84F-AA685C296E26"),
    ClassInterface(ClassInterfaceType.None),
    ComSourceInterfaces(typeof(Conciliacion_Events))]
    public class ServiceConciliacionAutomatica : ServiceConciliacion 
    {

        public ServiceConciliacionAutomatica()
        {

        }


        public void procesarArchivo(ArchivoTarjeta miArchivo)
        {

            miArchivo.ProcesarArchivo(); // procesa el archivo , sin importar el formato
            Console.WriteLine(miArchivo.miArchivoTarjeta.formato + " " + miArchivo.miArchivoTarjeta.nombrearchivo);

            //ServiceConciliacionAutomatica un_ServiceConciliacionAutomatica = new ServiceConciliacionAutomatica();
            try
            {
            using (var context = new dbSG2000Entities())
            {
                using (TransactionScope transaction = new TransactionScope())
                {
                   
                    var item = context.TB_ArchivoTarjeta.Add(miArchivo.miArchivoTarjeta);
                    context.SaveChanges();
                    transaction.Complete(); 
                }

            }
          }
         catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
            {
                Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                foreach (var ve in eve.ValidationErrors)
                {
                    Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                        ve.PropertyName, ve.ErrorMessage);
                }
            }
            throw;
            }

       }


        // Conciliar 
        public void ConcilialiarAutomaticaticamente(TB_ArchivoTarjeta unTB_ArchivoTarjeta)
        {

            using (var context = new dbSG2000Entities())
            {
                try
                {
                // La logica de la conciliación queda suscripta en el SP
                    spu_conciliarAutomaticamente_Result resul = context.spu_conciliarAutomaticamente(unTB_ArchivoTarjeta.id).First();
                // verificar el resultado que devuelve el STORE
                 Console.WriteLine(resul.resultado + " " + resul.descripcion_error);
                }
                catch (EntityCommandCompilationException e)
                {
                    Console.WriteLine( e.Message);
                    throw;
                }
                
            }
          

        } // FIN DE


        public IEnumerable<Object> ObtenerViajesConciliadosAutomaticamente(Decimal  pIdArchivo)
        {

            using (var context = new dbSG2000Entities())
            {
                var listadeViajesaConciliar1 = (from c in context.TB_Cupones
                                                 join x in context.TB_ArchivoTarjetaDetalle
                                                    on c.nrCupon  equals x.nrCupon // Join entre las dos tablas
                                                where (c.flCobradoalCliente == false) && (c.flCompensado == false)
                                                && (c.flAnulado == false)
                                                && (new[] { "Tarjeta de Crédito", "Tarjeta de Débito" }.Contains(c.tpCupon))
                                                && (x.idarchivo == pIdArchivo) // filtramos por un archivo
                                                select new
                                                {
                                                    ID = c.nrCupon,
                                                    FECHA = c.dtCupon,
                                                    LICENCIA = c.nrLicencia,
                                                    DOC = c.tpComprobanteCliente,
                                                    LETRA = c.tpLetraCliente,
                                                    PDV = c.nrTalonarioCliente,
                                                    NRO = c.nrComprabanteCliente,
                                                    MONTO = c.vlMontoCupon,
                                                    MONTO_CLI = x.importe,
                                                    TARJETA = c.nrTarjeta,
                                                    TARJETA_CLI  = x.tarjeta,
                                                    CUPON = c.nrCuponPosnet,
                                                    CUPON_CLI = x.comprobante,
                                                    NIVEL = x.nrNivelConciliacion
                                                }).OrderBy(c => c.FECHA);

                // 'nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta' 
                Trace.TraceInformation(listadeViajesaConciliar1.ToString());
                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();

            }


        }


        public TB_ArchivoTarjeta obtenerArchivo(String pId)
        {

            Int32 id = Int32.Parse(pId);

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                TB_ArchivoTarjeta una_TB_ArchivoTarjeta = (from c in context.TB_ArchivoTarjeta
                                                    where c.id == id
                                                    select c)
                                                 .First();
                return una_TB_ArchivoTarjeta;
            }
        }
    }
}
