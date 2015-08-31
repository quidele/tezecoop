using System;
using System.Runtime.InteropServices;
using System.IO;
using System.Text;





namespace SGLibrary
{

    [Guid("C976853C-AE8F-42DE-9141-693C94DC4B68")]
    public interface DBCOM_Interface
    {
        [DispId(1)]
        string Init();
      
    }

    // Events interface Database_COMObjectEvents 
    [Guid("631300E0-E4A9-4E33-B267-12A79AD29AC1"),
    InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
    public interface DBCOM_Events
    {
    }


    [Guid("6D674AFE-E5CF-4135-8A22-68DFB13A9CCB"),
    ClassInterface(ClassInterfaceType.None),
    ComSourceInterfaces(typeof(DBCOM_Events))]
    public class DBCOM_Class : DBCOM_Interface
    {

        public DBCOM_Class()
        {
        }

        public string  Init()
        {
            return ("procedure INIT ok");   
        }
       

    }
}
