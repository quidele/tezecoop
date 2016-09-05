using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Data.Objects;
using System.Transactions;
using SGLibrary.ArchivoTarjetas;

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

            using (var context = new dbSG2000Entities())
            {
                using (TransactionScope transaction = new TransactionScope())
                {
                    TB_ArchivoTarjeta una_TB_ArchivoTarjeta = new TB_ArchivoTarjeta(); 
                    una_TB_ArchivoTarjeta.dsUsuario  = miArchivo.miArchivoTarjeta.dsUsuario ;
                    una_TB_ArchivoTarjeta.formato = "VISA";
                    una_TB_ArchivoTarjeta.dtproceso =  miArchivo.miArchivoTarjeta.dtproceso ; 
                    una_TB_ArchivoTarjeta.nombrearchivo =  miArchivo.miArchivoTarjeta.nombrearchivo ;

                    var item = context.TB_ArchivoTarjeta.Add(una_TB_ArchivoTarjeta);
                    context.SaveChanges();
                    transaction.Complete(); 
                }

            }


        }



        // Conciliar 
        public void ConcilialiarAutomaticaticamente(TB_ArchivoTarjeta unTB_ArchivoTarjeta)
        {


            using (var context = new dbSG2000Entities())
            {
                // La logica de la conciliación queda suscripta en el SP
                spu_conciliarAutomaticamente_Result resul = context.spu_conciliarAutomaticamente(unTB_ArchivoTarjeta.id).First();
                // verificar el resultado que devuelve el SP
                // resul.resultado 
            }


        }


    }
}
