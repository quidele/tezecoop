using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WCFWSFEAFIPTezecoop.wsfev1_homo;

namespace WCFWSFEAFIPTezecoop
{
    public class ComprobanteAFIPHomo : ComprobanteAFIP ,  IComprobanteAFIP
    {

        private Ticket _ticket;

        public ComprobanteAFIPHomo(Ticket ticket)
        {
            _ticket = ticket; 
        }

        public   ComprobanteAFIP ObtenerCompUltimoAutorizado()
        {

            FEAuthRequest feAuthRequest = new FEAuthRequest();
            // MIGRAR LA BUSQUEDA A LA CLASE COMPROBANTE
            feAuthRequest.Cuit = _ticket.Cuit;
            feAuthRequest.Sign = _ticket.Sign;
            feAuthRequest.Token = _ticket.Token;
            ServiceSoapClient client = new ServiceSoapClient();
            FERecuperaLastCbteResponse result = client.FECompUltimoAutorizado(feAuthRequest, 27, 1);
            Console.WriteLine(" ULTIMO COMPROBANTE PARA  EL PVTA 27 TIPO TIPO COMPROBANTE 1 - FACTURA ");
            Console.WriteLine(result.CbteNro);
            return new ComprobanteAFIP();

        }

        public ResultadoSolicitarCAE SolicitarCAE(comprobantes_ml p_comprobante_ml)
        {
            FEAuthRequest feAuthRequest = new FEAuthRequest();
            // MIGRAR LA BUSQUEDA A LA CLASE COMPROBANTE
            feAuthRequest.Cuit = _ticket.Cuit;
            feAuthRequest.Sign = _ticket.Sign;
            feAuthRequest.Token = _ticket.Token;
            ServiceSoapClient client = new ServiceSoapClient();
            FECAEResponse result = client.FECAESolicitar(feAuthRequest, AdaptarComprobanteaFECAERequest(p_comprobante_ml));
            // falta inconporar los try - cacth
            // falta loguear
            return new ResultadoSolicitarCAE(); 
        }

        private FECAERequest AdaptarComprobanteaFECAERequest(comprobantes_ml p_comprobante_ml)
        {

            /*
             <soap12:Envelope xmlns:soap="http://www.w3.org/2003/05/soapenvelope"
            xmlns:ar="http://ar.gov.afip.dif.FEV1/">
              <soap12:Header/>
              <soap12:Body>
                <FECAESolicitar>
                  <Auth>
                    <Token>string</Token>
                    <Sign>string</Sign>
                    <Cuit>long</Cuit>
                  </Auth>
                  <FeCAEReq>
                    <FeCabReq>
                      <CantReg>int</CantReg>
                      <PtoVta>int</PtoVta>
                      <CbteTipo>int</CbteTipo>
                    </FeCabReq>
                    <FeDetReq>
                      <FECAEDetRequest>
                        <Concepto>int</Concepto>
                        <DocTipo>int</DocTipo>
                        <DocNro>long</DocNro>
                        <CbteDesde>long</CbteDesde>
                        <CbteHasta>long</CbteHasta>
                        <CbteFch>string</CbteFch>
                        <ImpTotal>double</ImpTotal>
                        <ImpTotConc>double</ImpTotConc>
                        <ImpNeto>double</ImpNeto>
                        <ImpOpEx>double</ImpOpEx>
                        <ImpTrib>double</ImpTrib>
                        <ImpIVA>double</ImpIVA>
                        <FchServDesde>string</FchServDesde>
                        <FchServHasta>string</FchServHasta>
                        <FchVtoPago>string</FchVtoPago>
                        <MonId>string</MonId>
                        <MonCotiz>double</MonCotiz>
                        <CbtesAsoc>
                          <CbteAsoc>
                            <Tipo>short</Tipo>
                            <PtoVta>int</PtoVta>
                            <Nro>long</Nro>
                          </CbteAsoc>
                        </CbtesAsoc>
                        <Tributos>
                          <Tributo>
                            <Id>short</Id>
                            <Desc>string</Desc>
                            <BaseImp>double</BaseImp>
                            <Alic>double</Alic>
                            <Importe>double</Importe>
                          </Tributo>
                        </Tributos>
                        <Iva>
                          <AlicIva>
                            <Id>short</Id>
                            <BaseImp>double</BaseImp>
                            <Importe>double</Importe>
                          </AlicIva>
                        </Iva>
                        <Opcionales>
                          <Opcional>
                            <Id>string</Id>
                            <Valor>string</Valor>
                          </Opcional>
                        </Opcionales>
                      </FECAEDetRequest>
                    </FeDetReq>
                  </FeCAEReq>
                </FECAESolicitar>
              </soap12:Body>
            </soap12:Envelope>
            */

            // OBJETO PARA REQUERIR EL CAE 
            FECAERequest un_FECAERequest = new FECAERequest();

            // CABECARA
            FECAECabRequest cabecera = new FECAECabRequest();

            cabecera.CantReg = 1;
            cabecera.CbteTipo = p_comprobante_ml.CbteTipo ; //Factura A (Ver tipos de comprobantes)
            cabecera.PtoVta = Convert.ToInt32(p_comprobante_ml.PtoVta); //Punto de venta a autorizar
            un_FECAERequest.FeCabReq = cabecera; // Asignar a la cabecera de la factura

            //DETALLE
            FECAEDetRequest[] detalle = new FECAEDetRequest[1];

            detalle[0].Concepto = p_comprobante_ml.Concepto ; // Concepto de comprbantes (Ver conceptos)

            detalle[0].DocTipo =   p_comprobante_ml.DocTipo ;// Codigo de documento del comprador (Ver codigos de documentos)
            detalle[0].DocNro = Convert.ToInt64(p_comprobante_ml.DocNro); // Nro de documento del comprador
            detalle[0].CbteDesde = Convert.ToInt32(p_comprobante_ml.CbteDesde); //Nro comprobante desde
            detalle[0].CbteHasta = Convert.ToInt32(p_comprobante_ml.CbteHasta); //Nro comprobante hasta
            detalle[0].CbteFch =  DateTime.Now.ToString("yyyyMMdd");
            detalle[0].ImpTotal = Convert.ToDouble(p_comprobante_ml.ImpTotal); //Total = no gravado + exento + neto + todos los iva + tributos (ej. perc.iibb)
            detalle[0].ImpTotConc = double.Parse  (p_comprobante_ml.ImpTotConc.ToString());  // 0; //No gravado
            detalle[0].ImpNeto = double.Parse(p_comprobante_ml.ImpNeto.ToString()); // Convert.ToDouble(100); // neto gravado
            detalle[0].ImpOpEx = double.Parse(p_comprobante_ml.ImpOpEx.ToString());  // Exento
            detalle[0].ImpIVA = double.Parse(p_comprobante_ml.ImpIVA.ToString());  // Convert.ToDouble(21); // suma de los importes del array de iva
            detalle[0].ImpTrib = double.Parse(p_comprobante_ml.ImpTrib.ToString());  // 0; // suma de los importes del array de tributos, ej. perc iibb
            detalle[0].FchServDesde = ""; // fecha inicio abono para servicios
            detalle[0].FchServHasta = ""; // fecha fin abono para servicios
            detalle[0].FchVtoPago = p_comprobante_ml.FchVtoPago.ToString(); ; // ""; // fecha vto para servicios
            detalle[0].MonId = p_comprobante_ml.MonId; //   "PES"; //moneda
            detalle[0].MonCotiz = p_comprobante_ml.MonCotiz;  // 1; //cotizacion

            //como relacionarlo con fc.FeDetReq
            un_FECAERequest.FeDetReq[0] = detalle[0];

            return un_FECAERequest;
            
        }

    }
}
