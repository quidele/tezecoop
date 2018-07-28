//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WCFWSFEAFIPTezecoop.DataModelFE
{
    using System;
    using System.Collections.Generic;
    
    public partial class comprobantes_ml
    {
        public comprobantes_ml()
        {
            this.cbtesasoc = new HashSet<cbtesasoc>();
            this.detalle_iva = new HashSet<detalle_iva>();
            this.detalle_tributos = new HashSet<detalle_tributos>();
        }
    
        public int idsolicitud { get; set; }
        public int CbteTipo { get; set; }
        public int PtoVta { get; set; }
        public int Concepto { get; set; }
        public int DocTipo { get; set; }
        public decimal DocNro { get; set; }
        public decimal CbteDesde { get; set; }
        public decimal CbteHasta { get; set; }
        public Nullable<System.DateTime> CbteFch { get; set; }
        public decimal ImpTotal { get; set; }
        public decimal ImpTotConc { get; set; }
        public decimal ImpNeto { get; set; }
        public decimal ImpOpEx { get; set; }
        public decimal ImpIVA { get; set; }
        public decimal ImpTrib { get; set; }
        public Nullable<System.DateTime> FchServDesde { get; set; }
        public Nullable<System.DateTime> FchServHasta { get; set; }
        public Nullable<System.DateTime> FchVtoPago { get; set; }
        public string MonId { get; set; }
        public double MonCotiz { get; set; }
        public string estado_envio { get; set; }
        public string CAE { get; set; }
        public string CAEFchVto { get; set; }
        public Nullable<decimal> nro_doc_afip { get; set; }
    
        public virtual ICollection<cbtesasoc> cbtesasoc { get; set; }
        public virtual conceptos conceptos { get; set; }
        public virtual moneda moneda { get; set; }
        public virtual moneda moneda1 { get; set; }
        public virtual tipo_comprobante tipo_comprobante { get; set; }
        public virtual tipo_documento tipo_documento { get; set; }
        public virtual ICollection<detalle_iva> detalle_iva { get; set; }
        public virtual ICollection<detalle_tributos> detalle_tributos { get; set; }
    }
}