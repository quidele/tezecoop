//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WCFWSFEAFIPTezecoop.DataModeldbSG2000
{
    using System;
    using System.Collections.Generic;
    
    public partial class TB_Cupones
    {
        public decimal nrCupon { get; set; }
        public Nullable<int> cdCliente { get; set; }
        public Nullable<short> nrPuesto { get; set; }
        public int nrLicencia { get; set; }
        public string nmLicenciatario { get; set; }
        public string tpCupon { get; set; }
        public Nullable<double> vlMontoCupon { get; set; }
        public Nullable<double> vlaFavordelLicenciatario { get; set; }
        public Nullable<double> vlafavorAdmin { get; set; }
        public Nullable<double> vlPagoPesos { get; set; }
        public Nullable<double> vlPagoEuros { get; set; }
        public Nullable<double> vlPagoDolares { get; set; }
        public Nullable<double> vlComision { get; set; }
        public Nullable<short> nrCantidadBultos { get; set; }
        public Nullable<short> nrPasajeros { get; set; }
        public Nullable<System.DateTime> dtCupon { get; set; }
        public string nrTalonarioCliente { get; set; }
        public string nrComprabanteCliente { get; set; }
        public string tpComprobanteCliente { get; set; }
        public string tpLetraCliente { get; set; }
        public bool flCobradoalCliente { get; set; }
        public Nullable<System.DateTime> dtCobradoalCliente { get; set; }
        public Nullable<decimal> nrCajaCliente { get; set; }
        public Nullable<System.DateTime> dtCajaCliente { get; set; }
        public Nullable<double> nrTalonarioProveedor { get; set; }
        public Nullable<double> nrComprabanteProveedor { get; set; }
        public string tpComprobanteProveedor { get; set; }
        public string tpLetraLetraProveedor { get; set; }
        public bool flCompensado { get; set; }
        public Nullable<System.DateTime> dtCompensado { get; set; }
        public Nullable<decimal> nrCajaLicenciatario { get; set; }
        public Nullable<System.DateTime> dtCajaLicenciatario { get; set; }
        public string dsUsuario { get; set; }
        public Nullable<short> nrLiquidacionProveedores { get; set; }
        public Nullable<short> nrLiquidacionCliente { get; set; }
        public string cdCodBar { get; set; }
        public bool flAnulado { get; set; }
        public Nullable<System.DateTime> dtAnulado { get; set; }
        public Nullable<int> IdRecibo { get; set; }
        public Nullable<decimal> IdReciboCtaCte { get; set; }
        public string dsObservacion { get; set; }
        public string dsDestino { get; set; }
        public string dsHoraViaje { get; set; }
        public Nullable<int> problema { get; set; }
        public string Mellizo { get; set; }
        public Nullable<System.DateTime> dtActualizacion { get; set; }
        public Nullable<bool> flEliminar { get; set; }
        public Nullable<bool> flSincronizado { get; set; }
        public Nullable<double> vlSubtotal { get; set; }
        public Nullable<double> vlIVA { get; set; }
        public Nullable<decimal> nrCajaCtaCte { get; set; }
        public Nullable<System.DateTime> dtCajaCtaCte { get; set; }
        public string dsLeyenda { get; set; }
        public Nullable<double> vlPagoReales { get; set; }
        public string flNoCompensado { get; set; }
        public Nullable<System.DateTime> dtNoCompensado { get; set; }
        public string nrTarjeta { get; set; }
        public string tpDocTarjeta { get; set; }
        public string nrDocTarjeta { get; set; }
        public Nullable<double> vlRecargoTarjeta { get; set; }
        public string nrCuponPosnet { get; set; }
        public Nullable<System.DateTime> dtFechaAcreditacion { get; set; }
        public Nullable<double> vlMontoAcreditacion { get; set; }
        public Nullable<int> IdConciliacion { get; set; }
        public string nmEmpresaTarjeta { get; set; }
        public Nullable<int> nro_trans { get; set; }
    }
}
