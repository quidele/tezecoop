using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Management;


namespace SGLibrary
{
    public class PrinterManager
    {
        private string originalDefaultPrinter; 

        public PrinterManager ()
	    {
            originalDefaultPrinter = getDefaultPrinter();
	    }
        

        public string getDefaultPrinter()
        {   
            ManagementObjectSearcher search = new ManagementObjectSearcher();
            ManagementObjectCollection results;
            search = new ManagementObjectSearcher("select * from win32_printer Where Default = True ");
            results = search.Get();
            foreach (ManagementObject printer in results)
            {
                return printer["Name"].ToString () ;
            }
            return string.Empty ; 
        }

        public List<String> getAllPrinters()
        {
            ManagementObjectSearcher search = new ManagementObjectSearcher();
            ManagementObjectCollection results;
            search = new ManagementObjectSearcher("select * from win32_printer  ");
            results = search.Get();
            List<String> printers_list = new List<String>(); 
            foreach (ManagementObject printer in results)
            {
                printers_list.Add(printer["Name"].ToString());
            }
            return printers_list; 
        }


        public void setDefaultPrinter(string selectedPrinter)
        {
            ManagementObjectSearcher search = new ManagementObjectSearcher();
            ManagementObjectCollection results;
            Object[] arg = new Object[1];
            search = new ManagementObjectSearcher("select * from win32_printer  ");
            results = search.Get();
            foreach (ManagementObject print in results)
            {
                if (print["Name"].Equals(selectedPrinter))
                {
                    print.InvokeMethod("SetDefaultPrinter", arg);
                }
            }
            
        }


        


        public void rollback()
        {
            ManagementObjectSearcher search = new ManagementObjectSearcher();
            ManagementObjectCollection results;
            Object[] arg = new Object[1];
            search = new ManagementObjectSearcher("select * from win32_printer  ");
            results = search.Get();
            foreach (ManagementObject print in results)
            {
                if (print["Name"].Equals(originalDefaultPrinter))
                {
                    print.InvokeMethod("SetDefaultPrinter", arg);
                }
            }

        }
    }



}
