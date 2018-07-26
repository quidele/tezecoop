using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;
using SGLibrary.ServiceFacturaElectronica;
using System.Runtime.InteropServices;

namespace SGLibrary.FacturaElectronica
{

    // Events interface para destinos 
    [Guid("D16751F6-BA42-4E75-B3C9-2980830F356D"),
    InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
    public interface ServiceFacturaElectronicaCliente_Events
    {
    }

    [Guid("B895ABA1-C1F8-4BFA-997B-F2F4629193C4"),
    ClassInterface(ClassInterfaceType.None),
    ComSourceInterfaces(typeof(ServiceFacturaElectronicaCliente_Events))]
    public class ServiceFacturaElectronicaCliente : IServiceFacturaElectronicaCliente
    {

        private string _CAE ;
        private string _CAEFchVto ;
        private string _nro_doc_afip ;
        private string _CodigoError;
        private string _DescripcionError; 

        bool IServiceFacturaElectronicaCliente.SolicitarCAE(decimal IdSolicitud)
        {
            BasicHttpBinding binding = new BasicHttpBinding();
            binding.Name = "Service1SoapBinding";
            binding.CloseTimeout = System.TimeSpan.Parse("00:01:00");

            binding.OpenTimeout = System.TimeSpan.Parse("00:01:00");
            binding.ReceiveTimeout = System.TimeSpan.Parse("00:10:00");
            binding.SendTimeout = System.TimeSpan.Parse("00:01:00");

            binding.AllowCookies = false;
            binding.BypassProxyOnLocal = false;
            binding.HostNameComparisonMode = System.ServiceModel.HostNameComparisonMode.StrongWildcard;

            binding.MaxBufferSize = 65536;
            binding.MaxBufferPoolSize = 524288;
            binding.MaxReceivedMessageSize = 65536;

            binding.MessageEncoding = System.ServiceModel.WSMessageEncoding.Text;
            binding.TextEncoding = System.Text.Encoding.UTF8;
            binding.TransferMode = System.ServiceModel.TransferMode.Buffered;

            binding.UseDefaultWebProxy = true;
            binding.ReaderQuotas.MaxDepth = 32;
            binding.ReaderQuotas.MaxStringContentLength = 8192;

            binding.ReaderQuotas.MaxArrayLength = 16384;
            binding.ReaderQuotas.MaxBytesPerRead = 4096;
            binding.ReaderQuotas.MaxNameTableCharCount = 16384;

            binding.Security.Mode = System.ServiceModel.BasicHttpSecurityMode.None;
            binding.Security.Transport.ClientCredentialType = HttpClientCredentialType.None;
            binding.Security.Transport.ProxyCredentialType = HttpProxyCredentialType.None;

            binding.Security.Transport.Realm = "";
            binding.Security.Message.ClientCredentialType = BasicHttpMessageCredentialType.UserName;
            binding.Security.Message.AlgorithmSuite = System.ServiceModel.Security.SecurityAlgorithmSuite.Default;

            // La url debe ser parametrizada en el archivo ConfigBD.xml
            EndpointAddress endpoint = new EndpointAddress("http://localhost:49857/ServiceFacturaElectronica.svc?wsdl");
            ServiceFacturaElectronicaClient client = new ServiceFacturaElectronicaClient(binding, endpoint);

            ResultadoSolicitarCAE resultado = (ResultadoSolicitarCAE)client.SolicitarCAE(IdSolicitud);

            this._CAE = resultado.CAE;
            this._CAEFchVto = resultado.CAEFchVto;
            this._nro_doc_afip = resultado.DocNro;
            this._CodigoError  = resultado.CodigoError;
            this._DescripcionError = resultado.DescripcionError;
            /* client.DoWork(); */
            client.Close();
            return true;

        }


        public string CAE()
        {
            return _CAE;
        }

        public string CAEFchVto()
        {
            return _CAEFchVto;
        }

        public string nro_doc_afip()
        {
            return _nro_doc_afip;
        }


        public string CodigoError()
        {
            return _CodigoError;
        }

        public string DescripcionError()
        {
            return _DescripcionError;
        }

        


    }
}
