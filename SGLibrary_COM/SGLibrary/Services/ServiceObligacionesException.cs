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
            this.ListaCuponesCompensados = new List<TB_Cupones>();
        }

        public ServiceObligacionesException(String message)
            : base(message)
        {
            this.ListaCuponesCompensados = new List<TB_Cupones>();
        }

        public ServiceObligacionesException(string message, Exception inner) 
            : base(message, inner)
        {
            this.ListaCuponesCompensados = new List<TB_Cupones>();
        }


        public ServiceObligacionesException(string message, List<TB_Cupones> listaCuponesCompensados)
        {
            ListaCuponesCompensados = listaCuponesCompensados;
        }

        

    }
}
