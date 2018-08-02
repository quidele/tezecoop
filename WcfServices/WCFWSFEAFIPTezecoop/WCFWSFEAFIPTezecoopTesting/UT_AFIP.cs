using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WCFWSFEAFIPTezecoop.AFIP; 

namespace WCFWSFEAFIPTezecoopTesting
{
    [TestClass]
    public class UT_AFIP
    {
        [TestMethod]
        public void ValidarCUIT()
        {
            var resultado = AFIP.ValidarCUIT ("20-25475222-4");
            Assert.AreEqual(1, resultado, "La cuit no es valida EQ");

            resultado = AFIP.ValidarCUIT("20-00923647-4");
            Assert.AreEqual(1, resultado, "La cuit no es valida CUALQUIERA 1");

            resultado = AFIP.ValidarCUIT("27-17819903-5");
            Assert.AreEqual(1, resultado, "La cuit no es valida CUALQUIERA 2");

            resultado = AFIP.ValidarCUIT("30-63140976-4");
            Assert.AreEqual(1, resultado, "La cuit no es valida BCO CIUDAD");


            resultado = AFIP.ValidarCUIT("20-25475222-3");
            Assert.AreEqual(0, resultado, "La cuit no es valida y el sistema dice que si caso EQ");

            resultado = AFIP.ValidarCUIT("20-00923647-3");
            Assert.AreEqual(0, resultado, "La cuit no es valida y el sistema dice que si caso CUALQUIERA 1");

            resultado = AFIP.ValidarCUIT("27-17819903-3");
            Assert.AreEqual(0, resultado, "La cuit no es valida y el sistema dice que si caso CUALQUIERA 2");

            resultado = AFIP.ValidarCUIT("30-63140976-3");
            Assert.AreEqual(0, resultado, "La cuit no es valida y el sistema dice que si caso  BCO CIUDAD");

            

        }



    }
}
