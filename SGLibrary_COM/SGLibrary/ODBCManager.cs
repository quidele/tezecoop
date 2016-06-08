
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Win32;

namespace SGLibrary
{
    ///<summary>
    /// Class to assist with creation and removal of ODBC DSN entries
    ///</summary>
    public static class ODBCManager
    {
    
        ///<summary>
        /// Checks the registry to see if a DSN exists with the specified name
        ///</summary>
        ///<param name="dsnName"></param>
        ///<returns></returns>
        public static String getDSNHost()
        {

            RegistryKey localMachine64 = RegistryKey.OpenBaseKey(RegistryHive.LocalMachine, RegistryView.Registry64);
            RegistryKey regKey = localMachine64.OpenSubKey(@"SOFTWARE\Wow6432Node\ODBC\ODBC.INI\SQL_Remoto");
            string currentKey;
            currentKey = regKey.GetValue("Server", "").ToString();
            return currentKey; 

        }


   
    }
}
