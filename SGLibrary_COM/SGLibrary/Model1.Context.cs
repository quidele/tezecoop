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
    
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
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
        public DbSet<TB_Usuarios> TB_Usuarios { get; set; }
        public DbSet<TB_MovimientosContables> TB_MovimientosContables { get; set; }
        public DbSet<TB_Conceptos> TB_Conceptos { get; set; }
        public DbSet<TB_ArchivoTarjetaDetalle> TB_ArchivoTarjetaDetalle { get; set; }
        public DbSet<TB_ConciliacionDetalle> TB_ConciliacionDetalle { get; set; }
        public DbSet<TB_MovimientosContablesPosdatados> TB_MovimientosContablesPosdatados { get; set; }
        public DbSet<TB_ArchivoTarjeta> TB_ArchivoTarjeta { get; set; }
        public DbSet<TB_Conciliacion> TB_Conciliacion { get; set; }
        public DbSet<TB_PresentacionesCAI> TB_PresentacionesCAI { get; set; }
        public DbSet<TB_PresentacionesCAIDetalle> TB_PresentacionesCAIDetalle { get; set; }
        public DbSet<TB_Cupones> TB_Cupones { get; set; }
        public DbSet<TB_Parametros> TB_Parametros { get; set; }
    
        public virtual ObjectResult<spu_conciliarAutomaticamente_Result> spu_conciliarAutomaticamente(Nullable<int> idArchivo)
        {
            var idArchivoParameter = idArchivo.HasValue ?
                new ObjectParameter("idArchivo", idArchivo) :
                new ObjectParameter("idArchivo", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spu_conciliarAutomaticamente_Result>("spu_conciliarAutomaticamente", idArchivoParameter);
        }
    
        public virtual ObjectResult<spu_procesarMovimientosPosdatados_Result> spu_procesarMovimientosPosdatados(Nullable<decimal> nrCaja, string dsUsuario)
        {
            var nrCajaParameter = nrCaja.HasValue ?
                new ObjectParameter("nrCaja", nrCaja) :
                new ObjectParameter("nrCaja", typeof(decimal));
    
            var dsUsuarioParameter = dsUsuario != null ?
                new ObjectParameter("dsUsuario", dsUsuario) :
                new ObjectParameter("dsUsuario", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spu_procesarMovimientosPosdatados_Result>("spu_procesarMovimientosPosdatados", nrCajaParameter, dsUsuarioParameter);
        }
    
        public virtual ObjectResult<spu_generarPresentacionCAI_v4_9_4_Result> spu_generarPresentacionCAI_v4_9_4(Nullable<int> idPresentacion, string realizarLOG)
        {
            var idPresentacionParameter = idPresentacion.HasValue ?
                new ObjectParameter("IdPresentacion", idPresentacion) :
                new ObjectParameter("IdPresentacion", typeof(int));
    
            var realizarLOGParameter = realizarLOG != null ?
                new ObjectParameter("realizarLOG", realizarLOG) :
                new ObjectParameter("realizarLOG", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spu_generarPresentacionCAI_v4_9_4_Result>("spu_generarPresentacionCAI_v4_9_4", idPresentacionParameter, realizarLOGParameter);
        }
    
        public virtual ObjectResult<spu_obtenerDeudoresaFecha_Result> spu_obtenerDeudoresaFecha(Nullable<System.DateTime> fecha)
        {
            var fechaParameter = fecha.HasValue ?
                new ObjectParameter("fecha", fecha) :
                new ObjectParameter("fecha", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spu_obtenerDeudoresaFecha_Result>("spu_obtenerDeudoresaFecha", fechaParameter);
        }
    
        public virtual ObjectResult<spu_conciliarAutomaticamente_v4_9_900_Result> spu_conciliarAutomaticamente_v4_9_900(Nullable<int> idArchivo)
        {
            var idArchivoParameter = idArchivo.HasValue ?
                new ObjectParameter("idArchivo", idArchivo) :
                new ObjectParameter("idArchivo", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spu_conciliarAutomaticamente_v4_9_900_Result>("spu_conciliarAutomaticamente_v4_9_900", idArchivoParameter);
        }
    
        public virtual int spu_obtenerPresentacionCAIs(Nullable<int> mes, Nullable<int> anio)
        {
            var mesParameter = mes.HasValue ?
                new ObjectParameter("mes", mes) :
                new ObjectParameter("mes", typeof(int));
    
            var anioParameter = anio.HasValue ?
                new ObjectParameter("anio", anio) :
                new ObjectParameter("anio", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spu_obtenerPresentacionCAIs", mesParameter, anioParameter);
        }
    
        public virtual ObjectResult<spu_obtenerUltNroCAIsUsados_Result> spu_obtenerUltNroCAIsUsados(Nullable<int> mes, Nullable<int> anio)
        {
            var mesParameter = mes.HasValue ?
                new ObjectParameter("mes", mes) :
                new ObjectParameter("mes", typeof(int));
    
            var anioParameter = anio.HasValue ?
                new ObjectParameter("anio", anio) :
                new ObjectParameter("anio", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spu_obtenerUltNroCAIsUsados_Result>("spu_obtenerUltNroCAIsUsados", mesParameter, anioParameter);
        }
    
        public virtual ObjectResult<spu_generarPresentacionCAI_v4_9_41_Result> spu_generarPresentacionCAI_v4_9_41(Nullable<int> idPresentacion, string realizarLOG)
        {
            var idPresentacionParameter = idPresentacion.HasValue ?
                new ObjectParameter("IdPresentacion", idPresentacion) :
                new ObjectParameter("IdPresentacion", typeof(int));
    
            var realizarLOGParameter = realizarLOG != null ?
                new ObjectParameter("realizarLOG", realizarLOG) :
                new ObjectParameter("realizarLOG", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spu_generarPresentacionCAI_v4_9_41_Result>("spu_generarPresentacionCAI_v4_9_41", idPresentacionParameter, realizarLOGParameter);
        }
    
        public virtual ObjectResult<spu_generarPresentacionCAI_v4_9_830_Result> spu_generarPresentacionCAI_v4_9_830(Nullable<int> idPresentacion, string realizarLOG)
        {
            var idPresentacionParameter = idPresentacion.HasValue ?
                new ObjectParameter("IdPresentacion", idPresentacion) :
                new ObjectParameter("IdPresentacion", typeof(int));
    
            var realizarLOGParameter = realizarLOG != null ?
                new ObjectParameter("realizarLOG", realizarLOG) :
                new ObjectParameter("realizarLOG", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spu_generarPresentacionCAI_v4_9_830_Result>("spu_generarPresentacionCAI_v4_9_830", idPresentacionParameter, realizarLOGParameter);
        }
    }
}
