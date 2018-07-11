using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography.X509Certificates;

namespace WCFWSFEAFIPTezecoop
{
    /// <summary> 
    /// Clase principal 
    /// </summary> 
    /// <remarks></remarks> 
    public   abstract class Ticket
    {
        private Int64 _cuit;
        private string _sign;
        private string _token; 
 
 

        public Int64 Cuit
        { 
            get{ return _cuit;
            }
            set{  _cuit = value;
            }
        }

        public string Sign
        {
            get
            {
                return _sign;
            }
            set
            {
                _sign = value;
            }
        }

        public string Token
        {
            get
            {
                return _token;
            }
            set
            {
                _token = value;
            }
        }

        public abstract void GetTicket();
        
    }
}
