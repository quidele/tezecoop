using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public class ServiceObligacionesException: Exception 
    {

        public List<TB_Cupones> ListaCuponesCompensados { get; set; }

        public ServiceObligacionesException()
        {

        }

        public ServiceObligacionesException(String message)
            : base(message)
        {

        }

        public ServiceObligacionesException(string message, Exception inner) 
            : base(message, inner)
        {
        }


        public ServiceObligacionesException(string message, List<TB_Cupones> listaCuponesCompensados)
        {
            ListaCuponesCompensados = listaCuponesCompensados;
        }

    }
}
