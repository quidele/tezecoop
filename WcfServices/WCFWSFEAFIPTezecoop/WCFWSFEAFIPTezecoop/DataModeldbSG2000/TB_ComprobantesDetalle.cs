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
    
    public partial class TB_ComprobantesDetalle
    {
        public string nrTalonario { get; set; }
        public string nrComprobante { get; set; }
        public string tpComprobante { get; set; }
        public string tpLetra { get; set; }
        public short nrItem { get; set; }
        public Nullable<int> cdProducto { get; set; }
        public string dsProducto { get; set; }
        public string tpOperacion { get; set; }
        public Nullable<short> qtCantidad { get; set; }
        public Nullable<double> vlPorcentaje { get; set; }
        public Nullable<double> vlPrecioPeaje { get; set; }
        public Nullable<double> vlPrecioViaje { get; set; }
        public Nullable<double> vlTotalItem { get; set; }
        public Nullable<System.DateTime> dtInsercion { get; set; }
        public bool flSincronizado { get; set; }
        public Nullable<double> vlKilometros { get; set; }
        public Nullable<System.DateTime> dtActualizacion { get; set; }
        public Nullable<bool> flEliminar { get; set; }
        public Nullable<int> nrPuesto { get; set; }
        public Nullable<decimal> nrCaja { get; set; }
        public Nullable<double> vlPrecioTC { get; set; }
        public Nullable<double> vlPrecioTD { get; set; }
        public Nullable<double> vlRecargoTC { get; set; }
        public Nullable<double> vlRecargoTD { get; set; }
        public Nullable<double> vlPrecioTP { get; set; }
        public Nullable<double> vlRecargoTP { get; set; }
        public Nullable<int> nro_trans { get; set; }
    }
}