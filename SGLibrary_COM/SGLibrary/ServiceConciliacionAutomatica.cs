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
                    TB_ArchivoTarjeta una_TB_ArchivoTarjeta = new TB_ArchivoTarjeta(); 
                    una_TB_ArchivoTarjeta.dsUsuario  = miArchivo.miArchivoTarjeta.dsUsuario ;
                    una_TB_ArchivoTarjeta.formato = "VISA";
                    //una_TB_ArchivoTarjeta.dtproceso =  miArchivo.miArchivoTarjeta.dtproceso ; 
                    una_TB_ArchivoTarjeta.nombrearchivo =  miArchivo.miArchivoTarjeta.nombrearchivo ;

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
                 spu_conciliarAutomaticamente_Result resul = context.spu_conciliarAutomaticamente(2).First();
                // verificar el resultado que devuelve el STORE
                 Console.WriteLine(resul.resultado + " " + resul.descripcion_error);
                }
                catch (EntityCommandCompilationException e)
                {
                    Console.WriteLine( e.Message);
                    throw;
                }
                
            }
          

            


        }


    }
}
