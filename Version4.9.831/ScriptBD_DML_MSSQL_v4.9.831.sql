
-- Cambios de DML version 4.9.831
use dbSG2000
go 



delete from TB_Parametros  where dsParametro = 'CONCILIACION_CANT_DIAS_COBRO_TARJETA_CREDITO'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('CONCILIACION_CANT_DIAS_COBRO_TARJETA_CREDITO','30','DECIMAL',2,GETDATE(),'creado en la versión 4.9.831','Mòdulo de Ventas',1);


delete from TB_Parametros  where dsParametro = 'CONCILIACION_CANT_DIAS_COBRO_TARJETA_DEBITO'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('CONCILIACION_CANT_DIAS_COBRO_TARJETA_DEBITO','10','DECIMAL',2,GETDATE(),'creado en la versión 4.9.831','Mòdulo de Ventas',1);




delete from TB_Parametros  where dsParametro = 'CONCILIACION_DIF_DIAS_FECHA_PAGO_Y_CUPON'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('CONCILIACION_DIF_DIAS_FECHA_PAGO_Y_CUPON','20','DECIMAL',2,GETDATE(),'creado en la versión 4.9.831','Mòdulo de Ventas',1);



delete from TB_Parametros  where dsParametro = 'CONCILIACION_CANT_DIAS_COBRO_AMCA'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('CONCILIACION_CANT_DIAS_COBRO_AMCA','10','DECIMAL',2,GETDATE(),'creado en la versión 4.9.831','Mòdulo de Ventas',1);
