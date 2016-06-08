using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Diagnostics; 

namespace SGLibrary
{



    [Guid("31DCAFBA-3C79-4F71-9B54-D69CB8BDBE11")]
    public interface Printer_Interface
    {
        [DispId(20)]
        string ConfigPrinter(string windowsname);
        [DispId(21)]
        void RollbackPrinter();

    }

    // Events interface para destinos 
    [Guid("5F5D4CB8-46EB-4769-8A0B-8EC74F926102"),
    InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
    public interface Printer_Events
    {
    }


    [Guid("AFA9A171-2A10-4953-B62D-90FE4D022FFA"),
    ClassInterface(ClassInterfaceType.None),
    ComSourceInterfaces(typeof(Printer_Events))]
    public class ServicePrinter : Printer_Interface
    {
        PrinterManager printer_manager; 
        
        public ServicePrinter()
        {
            Trace.Listeners.Add(new TextWriterTraceListener("MyTextFile.log"));
            Trace.AutoFlush = true; 
            Trace.TraceInformation("inicializando el logger");
            printer_manager = new PrinterManager(); 
        }


        public string ConfigPrinter(string windowstitle)
        {
                
                Trace.TraceInformation("ConfigPrinter");
                FrmSeleccionarImpresora f = new FrmSeleccionarImpresora();
                f.Text = "Seleccionar Impresora: " + windowstitle.ToUpper(); 
                f.ShowDialog();
                return "ConfigurarImpresora la clase ServicePrinter";

        }

        public void RollbackPrinter()
        {
            Trace.TraceInformation("RollbackPrinter");
            printer_manager.rollback(); 
        }



    }
}
