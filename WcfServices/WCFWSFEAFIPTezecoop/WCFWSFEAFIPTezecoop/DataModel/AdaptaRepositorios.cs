using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WCFWSFEAFIPTezecoop.DataModeldbSG2000;
using WCFWSFEAFIPTezecoop.DataModelFE; 

namespace WCFWSFEAFIPTezecoop.DataModel
{
    public class AdaptaRepositorios
    {
        private dbSG2000Entities _ContextOrigen;  
        private FacturaElectronicaEntities _ContextDestino;
        public AdaptaRepositorios(dbSG2000Entities pContextOrigen, FacturaElectronicaEntities pContextDestino)
        {
            _ContextOrigen = pContextOrigen  ;
            _ContextDestino = pContextDestino; 
        }

        public string DescripcionError { get; set; }

        public bool AdaptarComprobante(int pIdSolicitud){

            // recuperamos la cabecera del comprobante
            var un_TB_Comprobantes = (from c in _ContextOrigen.TB_Comprobantes
                                      where c.nro_trans == pIdSolicitud  select c).First<TB_Comprobantes>();

            if (un_TB_Comprobantes == null)
            {
                DescripcionError = "El comprobante origen no existe";
                return false;
            }

            var un_comprobantes_ml = new comprobantes_ml();

            un_comprobantes_ml.idsolicitud = pIdSolicitud;
            un_comprobantes_ml.CbteTipo = this.ObtenerCodComprobanteAFIP(un_TB_Comprobantes.tpComprobante, un_TB_Comprobantes.tpLetra);
 
            un_comprobantes_ml.PtoVta = 0; // Determinar logica de puntos de Venta 
            un_comprobantes_ml.Concepto = 2;  // Servicios

            un_comprobantes_ml.DocTipo = this.ObtenerCodTipoDocumentoClienteAFIP(un_TB_Comprobantes.tpIVA, un_TB_Comprobantes.nrDoc);
            un_comprobantes_ml.DocNro = decimal.Parse( this.ObtenerNroDocumentoClienteAFIP(un_TB_Comprobantes.tpIVA, un_TB_Comprobantes.nrDoc)) ;
            un_comprobantes_ml.CbteDesde = 1;
            un_comprobantes_ml.CbteHasta = 1;
            un_comprobantes_ml.CbteFch = DateTime.Now;
            un_comprobantes_ml.ImpTotal = decimal.Parse ( un_TB_Comprobantes.vlTotalGeneral.ToString());
            un_comprobantes_ml.ImpTotConc = 0;
            un_comprobantes_ml.ImpNeto = decimal.Parse(un_TB_Comprobantes.vlSubtotal.ToString());

            if (un_TB_Comprobantes.vlIVA == 0.0)
                un_comprobantes_ml.ImpOpEx = decimal.Parse(un_TB_Comprobantes.vlTotalGeneral.ToString());
            else
                un_comprobantes_ml.ImpOpEx = 0;

            un_comprobantes_ml.FchServDesde = un_comprobantes_ml.CbteFch;
            un_comprobantes_ml.FchServHasta = un_comprobantes_ml.CbteFch;
            un_comprobantes_ml.FchServHasta = un_comprobantes_ml.CbteFch;
            un_comprobantes_ml.ImpIVA = decimal.Parse (un_TB_Comprobantes.vlIVA.ToString());
            un_comprobantes_ml.ImpTrib = 0;
            un_comprobantes_ml.MonId = "PES";
            un_comprobantes_ml.MonCotiz = 1;
            
            return true;
        }

        private  int ObtenerCodTipoDocumentoClienteAFIP(string ptpIVA , string pnrDoc)
        {
            if (ptpIVA == "RI") return 80;  // CUIT
            return 99;  // venta local diario 
        }


        private string ObtenerNroDocumentoClienteAFIP(string ptpIVA, string pnrDoc)
        {
            if (ptpIVA == "RI") return pnrDoc.Replace("-","").Trim();  // CUIT
            return "00000000000";  // venta local diario 
        }

        private int ObtenerCodComprobanteAFIP(string tpComprobante , string tpLetra)
        {

            /*= (from c in pContextOrigen.TB_Comprobantes
             where c.nro_trans == pIdSolicitud
             select c).First<TB_Comprobantes>();
             * var codCompAFIP = (from c in pContextOrigen.tipo 
             */

            var codCompAFIP = (from c in _ContextOrigen.tipo_comprobanteAFIP where c.tpComprobante==tpComprobante 
                                && c.tpLetra == tpLetra select c.cod_tipo_comprobante).First()  ;

            return codCompAFIP;
        }



    }
}

/*


--  select   [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] ('CF' , '20100177341         ','580')
CREATE  FUNCTION [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] (@tpIVA  varchar(4) ,  @nrDoc as varchar(100), @vlTotalGeneral as float  )
RETURNS varchar(50)
BEGIN
declare @valor_retorno char(2) = '99' 


IF  @tpIVA = 'RI'  
BEGIN
	IF  dbo.ufn_ValidarCUIT_v4_9_4(@nrDoc)=1
		set @valor_retorno = '80'
	ELSE
			set @valor_retorno = '90'  -- VERIFICAR ESTA SITUACION
END
BEGIN
	IF ISNULL(rtrim(@nrDoc),'') = ''
	BEGIN
		IF @vlTotalGeneral > 999 
			SET  @valor_retorno = '90' 
		ELSE
			SET  @valor_retorno = '99' 
	END
	ELSE
	BEGIN
		IF dbo.ufn_ValidarCUIT_v4_9_4(@nrDoc)=1
			set @valor_retorno = '80'
		ELSE 
			set @valor_retorno = '90'
	END
END





@valor_retorno = case  @tpIVA when 'RI'  
							  then (case WHEN dbo.ufn_ValidarCUIT(@nrDoc)=1 
								THEN '80' ELSE  (CASE ISNULL(rtrim(@nrDoc),'') WHEN ''   
										                                       THEN '99' ELSE '90' END)   END)
							   else     (CASE ISNULL(rtrim(@nrDoc),'') WHEN ''   THEN '99' ELSE 
											 (CASE WHEN @vlTotalGeneral > 999  
												THEN	 (case WHEN dbo.ufn_ValidarCUIT(@nrDoc)=1
														       THEN '80' 
															   ELSE '90' END) ELSE   '90'  END ) END)    END  -- As cod_dgi,


	RETURN @valor_retorno
END



*/