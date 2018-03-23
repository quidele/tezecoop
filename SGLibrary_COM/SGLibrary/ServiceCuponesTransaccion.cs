using SGLibrary.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace SGLibrary
{


    public class ServiceCuponesTransaccion : ServiceCupones  
    {

        public static  string TARJETA_DE_CREDITO = "Tarjeta de Crédito";
        public static  string TARJETA_DE_DEBITO = "Tarjeta de Débito";
        public static  string TARJETA_DE_TODO_PAGO = "Todo Pago";

        dbSG2000Entities context;
        double _PORC_RECARGO_TC;
        double _PORC_RECARGO_TD;
        double _PORC_RECARGO_TP;

        public ServiceCuponesTransaccion(dbSG2000Entities pdbSG2000Entities)
        {

            context = pdbSG2000Entities;
            // Modificar Condicion de ventas  (tpCupon)
            // PORC_RECARGO_TC	8,7
            // PORC_RECARGO_TD	8,6
            // PORC_RECARGO_TP	8,7
            this._PORC_RECARGO_TC = double.Parse( ServiceParametros.ObtenerParametroBD("PORC_RECARGO_TC"));
            this._PORC_RECARGO_TD = double.Parse(ServiceParametros.ObtenerParametroBD("PORC_RECARGO_TD"));
            this._PORC_RECARGO_TP = double.Parse(ServiceParametros.ObtenerParametroBD("PORC_RECARGO_TP"));
            
        }


        /// <summary>
        /// grabar movimientos contables para reflejar la salida del dinero
        /// </summary>
        /// <param name="una_conciliacion"></param>
        /// <returns></returns>
        public void GrabarCuponTransaccion(Double pvlPesos, decimal pnrCajaCliente, String pdsUsuario, int pnro_trans, int pnrLicencia,
                                                    String pnrFactura, DateTime pdtFecha, String pdsLeyenda,
                                                    int  pcdCliente , String ptpComprobanteCliente ,
                                                    String pnrComprabanteCliente, String pnrTalonarioCliente,
                                                    String ptpLetraCliente, double pvlMontoCupon,
                                                    double pvlComision , String pdsObservacion,String pdsDestino, string ptpCupon ) 
        {

            /* var paramLog = new SGLibrary.Utility.ParamLogUtility(() => pvlPesos, () => pnrCaja,
                                    () => pnro_trans, () => pnrLicencia, () => pnrFactura,
                                    () => pdtFecha,  () => pdsObservaccion, () => pcdCliente,
                                    () => ptpComprobanteCliente, () => pnrComprabanteCliente,
                                    () => pnrTalonarioCliente, () => ptpLetraCliente, () => pvlMontoCupon, () => pvlComision
                ).GetLog();
            Trace.TraceInformation(paramLog);
             * 
             */

            try
            {
                //  Setear conceptos y caja
                //  Obtener la entidad Usuario
                TB_Cupones unCupon = new TB_Cupones();

                var max = (from p in context.TB_Cupones 
                           select p).OrderByDescending(p => p.nrCupon ).FirstOrDefault();

                if (max == null)
                {
                    throw new DAOEntityException("no se pudo obtener el máximo nro de cupón");
                }
                else
                {

                    unCupon.nrCupon = max.nrCupon + 1;
                    unCupon.dtCupon = DateTime.Now.Date ;
                    unCupon.cdCliente = pcdCliente; 
                    unCupon.nrLicencia = pnrLicencia ; //  definir que licencia vamos a utilizar para el armado de estos recibos
                    unCupon.tpCupon = ptpCupon ;
                    unCupon.tpComprobanteCliente = ptpComprobanteCliente;
                    unCupon.nrComprabanteCliente = pnrComprabanteCliente;
                    unCupon.nrTalonarioCliente = pnrTalonarioCliente;
                    unCupon.tpLetraCliente = ptpLetraCliente;
                    unCupon.vlMontoCupon = pvlMontoCupon; // aqui debemos 
                    unCupon.vlComision = pvlComision; 
                    unCupon.vlPagoPesos = 0;
                    unCupon.vlPagoReales  = 0;
                    unCupon.vlPagoEuros = 0;
                    unCupon.vlPagoDolares = 0;
                    unCupon.nro_trans = pnro_trans;
                    unCupon.flCobradoalCliente = false;
                    unCupon.flCompensado = false;
                    unCupon.flAnulado = false;
                    unCupon.flEliminar = false;
                    unCupon.vlIVA = 0;
                    unCupon.vlSubtotal = 0;
                    unCupon.nro_trans = pnro_trans;  // referencia muy importante
                    unCupon.dsDestino = pdsDestino;
                    unCupon.dsObservacion = pdsObservacion;
                    unCupon.dsLeyenda = pdsLeyenda;
                    unCupon.dtCobradoalCliente = pdtFecha.Date;
                    unCupon.dsUsuario = pdsUsuario;
                    unCupon.nrCajaCliente = pnrCajaCliente;
                    context.TB_Cupones.Add(unCupon);
                    context.SaveChanges();

                }


            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                /*foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }*/
                throw;
            }
            return;
        } // CIERRA GrabarCupon



        public List<TB_Cupones> existenComprobantesCompensados( int nro_trans)
        {
            var lista  = (from p in context.TB_Cupones where  p.nro_trans ==  nro_trans &&
                                                                     p.flCompensado == true
                          select p).OrderByDescending(p => p.nrCupon).ToList<TB_Cupones>();

            return lista ;
        }  // cierra metodo existenComprobantesCompensados

        // tambien verificamos por trans y licencia
        public List<TB_Cupones> existenComprobantesCompensados(int pnro_trans, int pnrLicencia)
        {
            var lista = (from p in context.TB_Cupones
                         where (p.nro_trans == pnro_trans && p.nrLicencia == pnrLicencia && 
                                       p.flCompensado == true)
                         select p).OrderByDescending(p => p.nrCupon).ToList<TB_Cupones>();

            return lista;
        }  // cierra metodo existenComprobantesCompensados


        // Modificar Condicion de ventas  (tpCupon)
        // PORC_RECARGO_TC	8,7
        // PORC_RECARGO_TD	8,6
        // PORC_RECARGO_TP	8,7
        // Tarjeta de Crédito / Tarjeta de Débito  / Todo Pago
        public bool ModificarCondicionDeVenta(decimal pnrCupon, string ptpCuponOrigen, string ptpCuponDestino)
        {

            List<string> lista_tpCupon = new List<string> { "Tarjeta de Crédito", "Tarjeta de Débito", "Todo Pago" };

            if (!lista_tpCupon.Exists(c => ptpCuponOrigen == c))
            {
                this._lista_errores  = "La condición de venta origen no es válida"; 
                return false;
            }

            if (ptpCuponOrigen.CompareTo(ptpCuponDestino) == 0)
            {
                this._lista_errores = "La condición de venta origen y destino son iguales";
                return false;
            }

            TB_Cupones un_TB_CuponesBD = (from p in context.TB_Cupones
                                          where p.nrCupon == pnrCupon
                                          select p).First<TB_Cupones>();

            switch (ptpCuponDestino)
            {
                case "Tarjeta de Crédito":
                    un_TB_CuponesBD.vlRecargoTarjeta =  un_TB_CuponesBD.vlMontoCupon * this._PORC_RECARGO_TC / 100  ;  
                    break;
                case "Tarjeta de Débito":
                    un_TB_CuponesBD.vlRecargoTarjeta = un_TB_CuponesBD.vlMontoCupon * this._PORC_RECARGO_TD / 100; 
                    break;
                case "Todo Pago":
                    un_TB_CuponesBD.vlRecargoTarjeta = un_TB_CuponesBD.vlMontoCupon * this._PORC_RECARGO_TP / 100; 
                    break;
            }
            un_TB_CuponesBD.vlRecargoTarjeta = Math.Round(un_TB_CuponesBD.vlRecargoTarjeta.Value , 2);
            un_TB_CuponesBD.tpCupon = ptpCuponDestino;

            context.SaveChanges();

            return true; 

        }

        
    } // CIERRA CLASE 



}
