using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;

namespace SGLibrary
{


    [Guid("E961DE42-DB2C-4DED-98CC-33EBF8A8A551")]
    public interface Destinos_Interface
    {
        [DispId(10)]
        string Inicializar();

    }

    // Events interface para destinos 
    [Guid("706598E0-6FB2-4E08-9B09-685A7043E881"),
    InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
    public interface Destinos_Events
    {
    }


    [Guid("1D7925E4-E974-4159-A359-595AF179C2A8"),
    ClassInterface(ClassInterfaceType.None),
    ComSourceInterfaces(typeof(Destinos_Events))]
    public class ServiceDestinos : Destinos_Interface
    {
        public string Inicializar()
        {

            using (var context = new dbSG2000Entities())
            {
                // Perform data access using the context 

                // return first customer 
                var destinos = (from c in context.TB_Productos
                            select c).First();
                Console.WriteLine(destinos.cdProducto );
                Console.WriteLine(destinos.dsProducto );

                return "inicializando la clase ServiceDestinos PRODUCTO" + destinos.dsProducto + " server HOST " + ODBCManager.getDSNHost();
            }

        }
    }

}
