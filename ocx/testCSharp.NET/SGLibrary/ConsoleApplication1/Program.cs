using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGLibrary;


namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            DBCOM_Class db = new DBCOM_Class();
            db.Init(); 
        }
    }
}
