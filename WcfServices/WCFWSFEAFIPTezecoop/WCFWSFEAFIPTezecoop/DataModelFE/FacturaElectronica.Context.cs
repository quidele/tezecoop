﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class FacturaElectronicaEntities : DbContext
    {
        public FacturaElectronicaEntities()
            : base("name=FacturaElectronicaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<cbtesasoc> cbtesasoc { get; set; }
        public virtual DbSet<comprobante> comprobante { get; set; }
        public virtual DbSet<comprobantes_ml> comprobantes_ml { get; set; }
        public virtual DbSet<conceptos> conceptos { get; set; }
        public virtual DbSet<condicion_iva> condicion_iva { get; set; }
        public virtual DbSet<destinos> destinos { get; set; }
        public virtual DbSet<detalle> detalle { get; set; }
        public virtual DbSet<detalle_iva> detalle_iva { get; set; }
        public virtual DbSet<detalle_tributos> detalle_tributos { get; set; }
        public virtual DbSet<formaspago> formaspago { get; set; }
        public virtual DbSet<idioma> idioma { get; set; }
        public virtual DbSet<incoterms> incoterms { get; set; }
        public virtual DbSet<lote> lote { get; set; }
        public virtual DbSet<moneda> moneda { get; set; }
        public virtual DbSet<observaciones> observaciones { get; set; }
        public virtual DbSet<paises> paises { get; set; }
        public virtual DbSet<permisodestino> permisodestino { get; set; }
        public virtual DbSet<simulacion> simulacion { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<tipo_comprobante> tipo_comprobante { get; set; }
        public virtual DbSet<tipo_documento> tipo_documento { get; set; }
        public virtual DbSet<tipos_responsables> tipos_responsables { get; set; }
        public virtual DbSet<unidad_medida> unidad_medida { get; set; }
        public virtual DbSet<LogApp> LogApp { get; set; }
    }
}
