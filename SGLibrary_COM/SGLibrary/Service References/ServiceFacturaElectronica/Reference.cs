﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.36392
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SGLibrary.ServiceFacturaElectronica {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ResultadoSolicitarCAE", Namespace="http://schemas.datacontract.org/2004/07/WCFWSFEAFIPTezecoop")]
    [System.SerializableAttribute()]
    public partial class ResultadoSolicitarCAE : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string CAEField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string CAEFchVtoField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string CodigoErrorField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string DescripcionErrorField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string DocNroField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string ResultadoField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string CAE {
            get {
                return this.CAEField;
            }
            set {
                if ((object.ReferenceEquals(this.CAEField, value) != true)) {
                    this.CAEField = value;
                    this.RaisePropertyChanged("CAE");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string CAEFchVto {
            get {
                return this.CAEFchVtoField;
            }
            set {
                if ((object.ReferenceEquals(this.CAEFchVtoField, value) != true)) {
                    this.CAEFchVtoField = value;
                    this.RaisePropertyChanged("CAEFchVto");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string CodigoError {
            get {
                return this.CodigoErrorField;
            }
            set {
                if ((object.ReferenceEquals(this.CodigoErrorField, value) != true)) {
                    this.CodigoErrorField = value;
                    this.RaisePropertyChanged("CodigoError");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string DescripcionError {
            get {
                return this.DescripcionErrorField;
            }
            set {
                if ((object.ReferenceEquals(this.DescripcionErrorField, value) != true)) {
                    this.DescripcionErrorField = value;
                    this.RaisePropertyChanged("DescripcionError");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string DocNro {
            get {
                return this.DocNroField;
            }
            set {
                if ((object.ReferenceEquals(this.DocNroField, value) != true)) {
                    this.DocNroField = value;
                    this.RaisePropertyChanged("DocNro");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Resultado {
            get {
                return this.ResultadoField;
            }
            set {
                if ((object.ReferenceEquals(this.ResultadoField, value) != true)) {
                    this.ResultadoField = value;
                    this.RaisePropertyChanged("Resultado");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceFacturaElectronica.IServiceFacturaElectronica")]
    public interface IServiceFacturaElectronica {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceFacturaElectronica/DoWork", ReplyAction="http://tempuri.org/IServiceFacturaElectronica/DoWorkResponse")]
        void DoWork();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceFacturaElectronica/SolicitarCAE", ReplyAction="http://tempuri.org/IServiceFacturaElectronica/SolicitarCAEResponse")]
        SGLibrary.ServiceFacturaElectronica.ResultadoSolicitarCAE SolicitarCAE(decimal IdSolicitud);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IServiceFacturaElectronicaChannel : SGLibrary.ServiceFacturaElectronica.IServiceFacturaElectronica, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ServiceFacturaElectronicaClient : System.ServiceModel.ClientBase<SGLibrary.ServiceFacturaElectronica.IServiceFacturaElectronica>, SGLibrary.ServiceFacturaElectronica.IServiceFacturaElectronica {
        
        public ServiceFacturaElectronicaClient() {
        }
        
        public ServiceFacturaElectronicaClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ServiceFacturaElectronicaClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ServiceFacturaElectronicaClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ServiceFacturaElectronicaClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public void DoWork() {
            base.Channel.DoWork();
        }
        
        public SGLibrary.ServiceFacturaElectronica.ResultadoSolicitarCAE SolicitarCAE(decimal IdSolicitud) {
            return base.Channel.SolicitarCAE(IdSolicitud);
        }
    }
}
