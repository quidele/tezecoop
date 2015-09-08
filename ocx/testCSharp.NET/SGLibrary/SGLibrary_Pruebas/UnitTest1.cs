using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SGLibrary;

namespace SGLibrary_Pruebas
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            DBCOM_Class db = new DBCOM_Class();
            db.Init(); 
        }
    }
}
