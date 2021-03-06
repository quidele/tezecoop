//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SGLibrary
{
    using System;
    using System.Collections.Generic;
    
    public partial class TB_Comprobantes
    {
        public TB_Comprobantes()
        {
            this.TB_ComprobantesDetalle = new HashSet<TB_ComprobantesDetalle>();
        }
    
        public string nrTalonario { get; set; }
        public string nrComprobante { get; set; }
        public string tpComprobante { get; set; }
        public string tpLetra { get; set; }
        public Nullable<System.DateTime> dtComprobante { get; set; }
        public Nullable<int> cdCliente { get; set; }
        public string cdCondVenta { get; set; }
        public string tpComision { get; set; }
        public string tpMoneda { get; set; }
        public string tpIVA { get; set; }
        public Nullable<double> vlTotalGeneral { get; set; }
        public Nullable<double> vlPagoPesos { get; set; }
        public Nullable<double> vlPagoEuros { get; set; }
        public Nullable<double> vlPagoDolares { get; set; }
        public string dsLeyenda { get; set; }
        public string flManual { get; set; }
        public Nullable<System.DateTime> dtInsercion { get; set; }
        public bool flSincronizado { get; set; }
        public string dsUsuario { get; set; }
        public decimal nrCaja { get; set; }
        public Nullable<System.DateTime> dtCaja { get; set; }
        public Nullable<short> nrPuesto { get; set; }
        public string dsDomicilio { get; set; }
        public string nrLicencia { get; set; }
        public Nullable<short> nrBultos { get; set; }
        public Nullable<short> nrPasajeros { get; set; }
        public string nrDoc { get; set; }
        public string dsRazonSocial { get; set; }
        public string nmNombre { get; set; }
        public string nmApellido { get; set; }
        public string nmLicenciatario { get; set; }
        public string cdPostal { get; set; }
        public string nmLocalidad { get; set; }
        public string cdCodBar { get; set; }
        public string dsEmail { get; set; }
        public string nrTel { get; set; }
        public string nrCAI { get; set; }
        public Nullable<System.DateTime> dtVencimiento { get; set; }
        public Nullable<double> vlDiaDolar { get; set; }
        public Nullable<double> vlDiaEuro { get; set; }
        public string dsOpcional1 { get; set; }
        public string dsOpcional2 { get; set; }
        public string dsOpcional3 { get; set; }
        public Nullable<int> dsOpcional4 { get; set; }
        public bool flAnulado { get; set; }
        public Nullable<System.DateTime> dtAnulado { get; set; }
        public string nmEmpleado { get; set; }
        public Nullable<decimal> IdReciboCtaCte { get; set; }
        public Nullable<bool> flCargaErronea { get; set; }
        public Nullable<int> problema { get; set; }
        public string dsUsuario_Supervisor { get; set; }
        public Nullable<System.DateTime> dtComprobante_hora { get; set; }
        public Nullable<System.DateTime> dtActualizacion { get; set; }
        public Nullable<bool> flEliminar { get; set; }
        public Nullable<double> vlSubtotal { get; set; }
        public Nullable<double> vlIVA { get; set; }
        public string tpModificacionCajaPuesto { get; set; }
        public string dsObservacionCajaPuesto { get; set; }
        public Nullable<double> vlPagoReales { get; set; }
        public Nullable<double> vlDiaReal { get; set; }
        public string nrTarjeta { get; set; }
        public string tpDocTarjeta { get; set; }
        public string nrDocTarjeta { get; set; }
        public Nullable<double> vlRecargoTarjeta { get; set; }
        public string nrCuponPosnet { get; set; }
        public string nmEmpresaTarjeta { get; set; }
        public string dsRazonSocial_original { get; set; }
        public string nrDoc_original { get; set; }
    
        public virtual ICollection<TB_ComprobantesDetalle> TB_ComprobantesDetalle { get; set; }
        public virtual TB_Usuarios TB_Usuarios { get; set; }
    }
}
