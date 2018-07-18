using SGLibrary.ServiceFacturaElectronica;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Windows.Forms;

namespace SGLibrary
{
    public partial class FrmFacturaElectronica : Form
    {
        public FrmFacturaElectronica()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
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

            EndpointAddress endpoint = new EndpointAddress("http://localhost:49857/ServiceFacturaElectronica.svc?wsdl");
            ServiceFacturaElectronicaClient client = new ServiceFacturaElectronicaClient (binding, endpoint);

            client.DoWork();
            client.Close();
        }
    }
}
