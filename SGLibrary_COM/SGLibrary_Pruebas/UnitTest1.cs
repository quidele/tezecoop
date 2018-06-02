using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SGLibrary;

namespace SGLibrary_Pruebas
{
    [TestClass]
    public class UnitTest1
    {
        
        [TestMethod]
        public void Test_CalcularCoeficienteTarjeta()
        {
            Double  vlPorcentajeIVA = 21.0;
            Double  vlPorcentajeTarjeta  = 5.0;
            var resultado = CalcularCoeficienteTarjeta (vlPorcentajeIVA ,  vlPorcentajeTarjeta);
            resultado = Math.Round(resultado,8);
            Assert.AreEqual (1.01061142 , resultado , "Error en Test_CalcularCoeficienteTarjeta. Expected : 1.01061142 - Resultado:  " + resultado.ToString()); 
        }

        private Double CalcularCoeficienteTarjeta(Double vlPorcentajeIVA , Double vlPorcentajeTarjeta   )
        {
            var resultado = 1 / ((2 + vlPorcentajeIVA / 100) + (vlPorcentajeTarjeta / 100) - (1 + vlPorcentajeIVA / 100) * (1 + vlPorcentajeTarjeta / 100));
            return resultado;
        }

        [TestMethod]
        public void Test_CalcularCoeficienteTarjetaIVA0()
        {
            Double vlPorcentajeIVA = 0;
            Double vlPorcentajeTarjeta = 5.0;
            var resultado = CalcularCoeficienteTarjeta(vlPorcentajeIVA, vlPorcentajeTarjeta);
            resultado = Math.Round(resultado, 8);
            Assert.AreEqual(1, resultado, "Error en Test_CalcularCoeficienteTarjeta. Expected : 1 - Resultado:  " + resultado.ToString());
        }

        [TestMethod]
        public void Test_CalcularCoeficienteTarjetaTC0()
        {
            Double vlPorcentajeIVA = 21;
            Double vlPorcentajeTarjeta = 0;
            var resultado = CalcularCoeficienteTarjeta(vlPorcentajeIVA, vlPorcentajeTarjeta);
            resultado = Math.Round(resultado, 8);
            Assert.AreEqual(1, resultado, "Error en Test_CalcularCoeficienteTarjeta. Expected : 1 - Resultado:  " + resultado.ToString());
        }
    }

}
