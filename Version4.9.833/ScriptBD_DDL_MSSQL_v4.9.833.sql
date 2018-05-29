
-- Cambios de DDL version 4.9.832
use dbSG2000
go


-- Modificamos la definicion del campo  nrLicencia
ALTER TABLE TB_ObligacionesTitulares ALTER COLUMN nrLicencia int;

GO

-- Corregimos la definicion del campo 
ALTER TABLE TB_transCab ALTER COLUMN estado_registro char(2);

/*

estado_registro
CO = COBRADO 
PE = PENDIENTE 
CP = COBRO PARCIAL 
*/

-- Agregamos el campo estado_registro en  TB_ObligacionesCuotas
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_ObligacionesCuotas'  and  c.Name = 'estado_registro' )
	ALTER TABLE dbo.TB_ObligacionesCuotas ADD 	estado_registro char(2) NULL

GO


-- Agregamos el campo nro_trans 
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_ObligacionesTitulares'  and  c.Name = 'estado_registro' )
	ALTER TABLE dbo.TB_ObligacionesTitulares ADD 	estado_registro char(2) NULL

GO
-- Modificamos la definicion del campo  nrLicencia
ALTER TABLE TB_ObligacionesCuotas ALTER COLUMN nrLicencia int;
	
Go

IF   EXISTS  (SELECT c.* FROM     sys.triggers  c  
								WHERE      c.Name = 'upd_gestionar_estado_obligacion'   )
	drop trigger upd_gestionar_estado_obligacion

GO
/****** Object:  Trigger [dbo].[upd_control_conciliacion]    Script Date: 29/05/2018 15:40:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Eulises Quidel>
-- Create date: <29/06/2018>
-- Description:	<Eulises Quidel>
-- =============================================
CREATE TRIGGER [dbo].[upd_gestionar_estado_obligacion]
   ON  [dbo].[TB_Cupones]
   AFTER UPDATE
AS 
BEGIN

	SET NOCOUNT ON


	select y.flCompensado,
		   x.nro_trans , 
		   x.nrLicencia , 
		   x.dtCobradoalCliente  as fecha_vencimiento
		   	   into #tmp_registros_modif
		   from deleted x inner join inserted y
			on x.nrCupon = y.nrCupon
			where    x.flCompensado <>  y.flCompensado  and y.tpCupon in ( 'Débito' )
	
	if @@ROWCOUNT = 0  
	begin
		--print ' @@ROWCOUNT = 0  '
		return ;
	end 
	

	UPDATE x SET x.estado_registro =  CASE flCompensado  WHEN 1 THEN 'CO' ELSE 'PE' END  FROM TB_ObligacionesCuotas x inner join #tmp_registros_modif Y
						ON x.nrLicencia = y.nrLicencia AND
							x.nro_trans = y.nro_trans AND
							 convert(date , x.fecha_vencimiento)  = convert(date ,y.fecha_vencimiento)



	SELECT y.nro_trans , y.nrLicencia  , count(*) as total , 'XX' as estado_registro
	INTO #TMP_estado_vencimiento_x_obligacion_licencia_totales
	FROM TB_ObligacionesCuotas x inner join #tmp_registros_modif Y
						ON x.nrLicencia = y.nrLicencia AND
							x.nro_trans = y.nro_trans 
	
	
	SELECT y.nro_trans , y.nrLicencia , estado_registro , count(*) as cantidad 
	INTO #TMP_estado_vencimiento_x_obligacion
	FROM TB_ObligacionesCuotas x inner join #tmp_registros_modif Y
						ON x.nrLicencia = y.nrLicencia AND
							x.nro_trans = y.nro_trans 

	-- PARA UNA OBLIGACION / LICENCIA : TODOS LOS VENCIMIENTO ESTAN COBRADOS  
	UPDATE x SET x.estado_registro = 'CO'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion  y
							 ON x.nro_trans = y.nro_trans AND x.nrLicencia = x.nrLicencia  AND x.total = y.cantidad 
								WHERE y.estado_registro = 'CO'

	-- PARA UNA OBLIGACION / LICENCIA : TODOS LOS VENCIMIENTO ESTAN PENDIENTES
	UPDATE x SET x.estado_registro = 'PE'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion  y
							 ON x.nro_trans = y.nro_trans AND x.nrLicencia = x.nrLicencia  AND x.total = y.cantidad 
								WHERE y.estado_registro = 'PE'

	-- SINO ACTUALIZADO POR LOS CASOS ANTERIORES
	UPDATE x SET x.estado_registro = 'CP'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion  y
							 ON x.nro_trans = y.nro_trans AND x.nrLicencia = x.nrLicencia  AND x.total = y.cantidad 
								WHERE x.estado_registro = 'XX'


	
	SELECT nro_trans ,  sum(total) as total_obligacion , 'XX' as estado_registro
	INTO #TMP_estado_vencimiento_x_obligacion_licencia_totales_general
	FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales

	SELECT x.nro_trans ,  x.estado_registro , sum(cantidad) as cantidad  
	INTO #TMP_estado_vencimiento_x_obligacion_general
	FROM #TMP_estado_vencimiento_x_obligacion x
	GROUP BY  x.nro_trans ,  x.estado_registro 


	-- PARA UNA OBLIGACION / LICENCIA : TODOS LOS VENCIMIENTO ESTAN COBRADOS  
	UPDATE x SET x.estado_registro = 'CO'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales_general x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion_general  y
							 ON x.nro_trans = y.nro_trans AND   x.total_obligacion = y.cantidad 
								WHERE y.estado_registro = 'CO'

	-- PARA UNA OBLIGACION / LICENCIA : TODOS LOS VENCIMIENTO ESTAN PENDIENTES
	UPDATE x SET x.estado_registro = 'PE'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales_general x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion_general  y
							 ON x.nro_trans = y.nro_trans  AND x.total_obligacion = y.cantidad 
								WHERE y.estado_registro = 'PE'

	-- SINO FUE ACTUALIZADO POR LOS CASOS ANTERIORES ENTONCES ES COBRO PARCIAL
	UPDATE x SET x.estado_registro = 'CP'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales_general x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion_general  y
							 ON x.nro_trans = y.nro_trans AND  x.total_obligacion = y.cantidad 
								WHERE x.estado_registro = 'XX'
										

END

