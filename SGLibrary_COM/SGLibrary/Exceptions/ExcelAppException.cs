using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;




namespace SGLibrary.Exceptions
{
    public class ExcelAppException : Exception 
    {
        public ExcelAppException()
        {

        }

        public ExcelAppException(String message)
            : base(message)
        {

        }

        public ExcelAppException(string message, Exception inner) 
            : base(message, inner)
        {
        }


    }
}

