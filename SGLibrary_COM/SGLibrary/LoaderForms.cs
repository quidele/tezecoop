﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Windows.Forms;
using SGLibrary.Mocks;

namespace SGLibrary
{
    

    [Guid("1E9AF149-048E-40E5-9B37-A399CA82950E")]
    public interface LoaderForms_Interface
    {
        [DispId(1)]
        void execFormulario(string nombre);
        [DispId(2)]
        void UsuarioActivo(string usuario);
        [DispId(3)]
        void CajaActiva(string caja);
        [DispId(4)]
        void AmbienteActivo(string ambiente);
    }

    // Events interface para LoaderForms 
    [Guid("29E9CB38-451C-40E0-AE9A-3C7B6F857C59"),
    InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
    public interface LoaderForms_Events
    {
    }


    [Guid("5D57578F-6786-4F9B-B7F9-6A362E360816"),
    ClassInterface(ClassInterfaceType.None),
    ComSourceInterfaces(typeof(LoaderForms_Events))]
    public class LoaderForms : ServiceModel, LoaderForms_Interface
    {

        private String _usuarioActivo;
        private String _cajactiva;
        private List<String> _listado_Errores=new List<String>();
        private String _ambiente;


        public override string Usuario
        {
            get
            {
                return this._usuarioActivo;
            }
            set
            {
                this._usuarioActivo = value;
            }
        }


        public override string CajaAdm
        {
            get
            {
                return this._cajactiva;
            }
            set
            {
                this._cajactiva = value;
            }
        }


        public override string Ambiente
        {
            get
            {
                return this._ambiente ;
            }
            set
            {
                this._ambiente = value;
            }
        }

        public override String ListaErrores()
        {
            String lista_errores = "";
            foreach (var item in this._listado_Errores)
            {
                lista_errores = lista_errores + "\n" + item;
            }
            return lista_errores;
        }


        public void UsuarioActivo(string value)
        {
            this._usuarioActivo = value;

        }


        public void CajaActiva(string value)
        {
            this._cajactiva = value;

        }



        public void execFormulario(string value)
        {


            /* 
                TB_documentos un_docu = new TB_documentos();
                un_docu.cod_doc = "OBAE";
                un_docu.nom_doc = "Nombre de Documento OBAE";
                un_docu.usuario_mod = "quidele";
                un_docu.fecha_mod = DateTime.Now;
             */

            // MetodoEulises(un_docu); 

            
            // Implmentar en proximas version en la proximas versiones
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => value).GetLog();


            var configBD_Ambiente = ConfigBD.Instance(this._ambiente); 

            try
            {
                Object  f = new Form ();
                switch (value)
                {
                    case "FrmConciliaciones":
                        FrmConciliaciones f1 = new FrmConciliaciones();
                        f1.serviceConciliaciones = new ServiceConciliacion();
                        f1.serviceConciliaciones.CajaActiva(this._cajactiva);
                        f1.serviceConciliaciones.UsuarioActivo(this._usuarioActivo);
                        f1.serviceConciliacionesAutomaticas = new ServiceConciliacionAutomatica();
                        f1.serviceConciliacionesAutomaticas.CajaActiva(this._cajactiva);
                        f1.serviceConciliacionesAutomaticas.UsuarioActivo(this._usuarioActivo);
                        f1.un_ServiceConciliacionManual = new ServiceConciliacionManual();
                        f1.un_ServiceConciliacionManual.CajaActiva(this.CajaAdm);
                        f1.un_ServiceConciliacionManual.UsuarioActivo(this.Usuario);
                        f1.un_ServiceConciliacionTodoPago = new ServiceConciliacionTodoPago();
                        f1.un_ServiceConciliacionTodoPago.CajaActiva(this.CajaAdm);
                        f1.un_ServiceConciliacionTodoPago.UsuarioActivo(this.Usuario);
                        f1.serviceConciliacionesAutomaticasAMCA = new ServiceConciliacionAutomaticaAMCA();
                        f1.serviceConciliacionesAutomaticasAMCA.CajaActiva(this.CajaAdm);
                        f1.serviceConciliacionesAutomaticasAMCA.UsuarioActivo(this.Usuario);
                        f1.ShowDialog();
                        f = (Form)f1;
                        break;
                    case "FrmResumenNrosCAIs":
                        FrmResumenNrosCAIs f2 = new FrmResumenNrosCAIs();
                        f2.serviceModel = this;
                        f = (Form)f2;
                        break;
                    case "FrmPresentacionesCAI":
                        FrmPresentacionesCAI f3 = new FrmPresentacionesCAI();
                        ServiceCAI serviceCAI = new ServiceCAI();
                        serviceCAI.Usuario = this.Usuario;
                        serviceCAI.CajaAdm = this.CajaAdm;
                        f3.serviceModel =  serviceCAI ;
                        f = (Form)f3;
                        break;
                    case "rpt_AnalisisDeudores":
                        SGLibrary.Reportes.rpt_AnalisisDeudores f4 = new SGLibrary.Reportes.rpt_AnalisisDeudores();
                        f = (Form)f4;
                        break;
                    default:
                        break;
                    case "ServiceTarifas":
                        ServiceTarifas miServiceTarifas = new ServiceTarifas();
                        miServiceTarifas.cargarTarifas();
                        return;
                    case "Frm_GroupByGrid":
                        SGLibrary.Frm_GroupByGrid f5 = new SGLibrary.Frm_GroupByGrid();
                        f = (Form)f5;
                        break;
                    case "FrmCargaTarifasEjemploADGV":
                        FrmCargaTarifasEjemploADGV f6 = new FrmCargaTarifasEjemploADGV();
                        f = (Form)f6;
                        break;
                    case "Form1":
                        FrmCircularProgressBar f7 = new FrmCircularProgressBar();
                        f = (Form)f7;
                        break;
                    case "FrmABMDocumentos":
                        FrmABMDocumentos f8 = new FrmABMDocumentos();
                        f8.serviceModel = new Services.ServiceDocumentos(new dbSG2000Entities ());
                        f8.serviceModel.CajaAdm  = this._cajactiva;
                        f8.serviceModel.Usuario  = this._usuarioActivo;
                        f8.serviceModel.usuario_mod = this.Usuario;
                        f8.serviceModel.terminal_mod = "PC01";
                        f8.serviceModel.formulario = "FrmABMDocumentos";
                        f = (Form)f8;
                        break;
                    case "FrmObligaciones":
                        FrmObligaciones f9 = new FrmObligaciones();

                        // dbSG2000EntitiesMocks
                        // f9.serviceModel = new Services.ServiceObligaciones(new dbSG2000EntitiesMocks());  // Probar MOCKS
                        f9.serviceModel = new Services.ServiceObligaciones(new dbSG2000Entities());  // Probar MOCKS
                        f9.serviceModel.CajaAdm  = this._cajactiva;
                        f9.serviceModel.Usuario  = this._usuarioActivo;
                        f9.serviceModel.usuario_mod = this.Usuario;
                        f9.serviceModel.Ambiente = this.Ambiente;
                        f9.serviceModel.terminal_mod = "PC01";
                        f9.serviceModel.formulario = "FrmObligaciones";
                        f = (Form)f9;
                        break;
                    case "FrmEstadoDeCuenta": 
                        FrmEstadoDeCuenta f11 = new FrmEstadoDeCuenta();
                        f11.serviceModel = new Services.ServiceObligaciones(new dbSG2000Entities()); 
                        f11.serviceModel.CajaAdm  = "0";
                        f11.serviceModel.Usuario  = this._usuarioActivo;
                        f11.serviceModel.usuario_mod = this.Usuario;
                        f11.serviceModel.Ambiente = this.Ambiente;
                        f11.serviceModel.terminal_mod = "PC01";
                        f = (Form)f11;
                        break;
                    case "FrmPrincipal":
                        FrmPrincipal f10 = new FrmPrincipal();
                        f10.serviceModel = new Services.ServiceObligaciones(new dbSG2000Entities());
                        f10.serviceModel.CajaAdm = this._cajactiva;
                        f10.serviceModel.Usuario = this._usuarioActivo;
                        f10.serviceModel.usuario_mod = this.Usuario;
                        f10.serviceModel.terminal_mod = "PC01";
                        f10.serviceModel.formulario = "FrmObligaciones";
                        f = (Form)f10;
                        break;

                }

                Form objForm = (Form) f;
                objForm.ShowDialog();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                Trace.TraceError(ex.Message);
                System.Windows.Forms.MessageBox.Show(ex.Message, "ERROR ");
            }
        }

        public void MetodoEulises(TB_documentos un_docu)
        {

            // Implmentar en proximas version en la proximas versiones
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => un_docu).GetLog();
        }


        public  void AmbienteActivo(string ambiente)
        {
            this._ambiente = ambiente; 
        }
    }
}
