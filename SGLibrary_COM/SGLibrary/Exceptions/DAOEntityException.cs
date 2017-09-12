using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Exceptions
{
    public class DAOEntityException : Exception 
    {
        public DAOEntityException()
        {

        }

        public DAOEntityException(String message)
            : base(message)
        {

        }

        public DAOEntityException(string message, Exception inner) 
            : base(message, inner)
        {
        }


    }
}
