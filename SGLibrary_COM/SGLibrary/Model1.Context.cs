﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.SqlClient;
    using System.Data.EntityClient;
    using System.Diagnostics; 
    
    
    public partial class dbSG2000Entities : DbContext
    {
    
    
    	private static string ConnectionString()
    	{
    
    
    		ConfigBD objConfig = new ConfigBD();
    		SqlConnectionStringBuilder sqlBuilder = new SqlConnectionStringBuilder();
    		// obtenemos el datasource desde el archivo  ConfigBD.Xml
    		sqlBuilder.DataSource = objConfig.DataSource;
    		//sqlBuilder.DataSource = "MSI\\SQLEXPRESS";
    		sqlBuilder.InitialCatalog = objConfig._initialCatalog ;
    		sqlBuilder.PersistSecurityInfo = false;
    		sqlBuilder.IntegratedSecurity = false;
    		sqlBuilder.UserID ="USRSG2006";
    				sqlBuilder.Password  ="sonrisa14";
    		sqlBuilder.MultipleActiveResultSets = true;
    		sqlBuilder.ApplicationName = "SGLibrary";
    
    		EntityConnectionStringBuilder entityBuilder = new EntityConnectionStringBuilder();
    		entityBuilder.ProviderConnectionString = sqlBuilder.ToString();
        	 entityBuilder.Metadata = "res://*/Model1.csdl|res://*/Model1.ssdl|res://*/Model1.msl";
    			
            //res://*/Model1.csdl|res://*/Model1.ssdl|res://*/Model1.msl
    
            /* entityBuilder.Metadata =
            string.Format("res://{0}/Model1.csdl|res://{0}/Model1.ssdl|res://{0}/Model1.msl",
                                typeof(dbSG2000Entities).Assembly.FullName); */
    
    
    
    		entityBuilder.Provider = "System.Data.SqlClient";
    
    		Trace.TraceInformation(entityBuilder.ToString());
    
    		return entityBuilder.ToString();
    	}
    
        public dbSG2000Entities()
               : base(nameOrConnectionString: ConnectionString())
        {
    	// EULISES
    
    
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<TB_Productos> TB_Productos { get; set; }
        public DbSet<TB_Conciliacion> TB_Conciliacion { get; set; }
        public DbSet<TB_ConciliacionDetalle> TB_ConciliacionDetalle { get; set; }
        public DbSet<TB_Cupones> TB_Cupones { get; set; }
        public DbSet<TB_Usuarios> TB_Usuarios { get; set; }
        public DbSet<TB_MovimientosContables> TB_MovimientosContables { get; set; }
        public DbSet<TB_Conceptos> TB_Conceptos { get; set; }
        public DbSet<TB_ArchivoTarjeta> TB_ArchivoTarjeta { get; set; }
        public DbSet<TB_ArchivoTarjetaDetalle> TB_ArchivoTarjetaDetalle { get; set; }
    }
}
