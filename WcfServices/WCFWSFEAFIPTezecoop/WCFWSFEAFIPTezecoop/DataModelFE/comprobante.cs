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
    
    public partial class comprobante
    {
        public comprobante()
        {
            this.detalle = new HashSet<detalle>();
            this.formaspago = new HashSet<formaspago>();
            this.permisodestino = new HashSet<permisodestino>();
        }
    
        public int idsolicitud { get; set; }
        public Nullable<int> tipo { get; set; }
        public Nullable<int> ptovta { get; set; }
        public Nullable<decimal> cuitemisor { get; set; }
        public Nullable<System.DateTime> fechaemision { get; set; }
        public Nullable<int> idioma { get; set; }
        public Nullable<int> concepto { get; set; }
        public string ape { get; set; }
        public string moneda { get; set; }
        public Nullable<double> tipocambio { get; set; }
        public Nullable<int> destinocmp { get; set; }
        public Nullable<int> tipodocreceptor { get; set; }
        public Nullable<decimal> nrodocreceptor { get; set; }
        public string idimpositivoreceptor { get; set; }
        public string receptor { get; set; }
        public string domicilioreceptor { get; set; }
        public Nullable<decimal> importetotal { get; set; }
        public string incoterms { get; set; }
        public string detalleincoterms { get; set; }
        public string otrosdatoscomerciales { get; set; }
        public string otrosdatosgenerales { get; set; }
        public string estado_envio { get; set; }
        public string observa_envio { get; set; }
        public Nullable<decimal> codaut { get; set; }
        public Nullable<System.DateTime> vtocodaut { get; set; }
        public Nullable<decimal> nro { get; set; }
        public Nullable<decimal> codtarea { get; set; }
        public string estadocmp { get; set; }
        public Nullable<System.DateTime> fechacreacion { get; set; }
        public Nullable<int> lote { get; set; }
        public string nom_moneda_ingles { get; set; }
        public Nullable<int> nro_doc { get; set; }
    
        public virtual conceptos conceptos { get; set; }
        public virtual destinos destinos { get; set; }
        public virtual idioma idioma1 { get; set; }
        public virtual incoterms incoterms1 { get; set; }
        public virtual lote lote1 { get; set; }
        public virtual moneda moneda1 { get; set; }
        public virtual tipo_comprobante tipo_comprobante { get; set; }
        public virtual tipo_documento tipo_documento { get; set; }
        public virtual ICollection<detalle> detalle { get; set; }
        public virtual ICollection<formaspago> formaspago { get; set; }
        public virtual ICollection<permisodestino> permisodestino { get; set; }
    }
}
