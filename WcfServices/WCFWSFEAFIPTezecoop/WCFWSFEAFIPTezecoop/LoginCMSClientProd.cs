using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WCFWSFEAFIPTezecoop.wsaa_prod;


namespace WCFWSFEAFIPTezecoop
{
    public class LoginCMSClientProd : ILoginCMSClient  
    {
        LoginCMSClient myLoginProd = new wsaa_prod.LoginCMSClient();

        public string loginCms(string param)
        {
            return myLoginProd.loginCms(param);
        }


        public void Close()
        {
            myLoginProd.Close(); 
        }


        public void Dispose()
        {
            myLoginProd.Close(); 
        }
    }
}
