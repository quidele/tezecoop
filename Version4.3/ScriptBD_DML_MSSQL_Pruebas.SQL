-- Cambios de DML version 4.2
use dbSG2000_Pruebas 
go 


--- Crear Usuario USRSG2013 con la clave correspondiente

delete from Conexion 

INSERT INTO Conexion (Id_conexion,plataforma,ambiente,nombre,driver,url,usuario,password)  VALUES (22,'.NET','Produccion','LOCAL',null,'Data Source=127.0.0.1;Database=dbSG2000','USRSG2013','ITf0nBD');

delete from plantillas_excel_detalle
delete from plantillas_excel 


INSERT INTO plantillas_excel (aplicacion,nombre,hoja_xls,ruta_archivo,fila_datos,columnas,filas,base_destino,procedimiento,carp_archivo_tmp,separador)  VALUES ('carga_maestros','definicion tablas_v3_2_5','destinos','C:\limpiar',2,8,1000,'LOCAL','spu_carga_destinos','C:\limpiar','|');

declare  @id integer

select  @id = id  from plantillas_excel where  aplicacion = 'carga_maestros'

INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_ENC','Producto',1,1,null,'numerico');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_ENC','Descripción',1,2,null,'cadena');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_ENC','Importe',1,3,null,'numerico');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_ENC','Peajes',1,4,null,'numerico');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_ENC','Total',1,5,null,'numerico');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_ENC','Mostrar en la WEB',1,6,null,'cadena');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_ENC','Comisión Retorno',1,7,null,'cadena');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_ENC','Obs. Horas',1,8,null,'cadena');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_DATO','Producto',1,1,null,'numerico');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_DATO','Descripción',1,2,null,'cadena');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_DATO','Importe',1,3,null,'numerico');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_DATO','Peajes',1,4,null,'numerico');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_DATO','Total',1,5,null,'numerico');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_DATO','Mostrar en la WEB',1,6,null,'cadena');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_DATO','Comisión Retorno',1,7,null,'cadena');
INSERT INTO plantillas_excel_detalle (id,tipo_detalle,nombre,fila,columna,valor,tipo_dato)  VALUES (@id,'XLS_DATO','Obs. Horas',1,8,null,'cadena');

--- crear insert de la nueva opcion de menu carga tarifas

delete from TB_OpcionesMenues where nmOpcionMenu = 'optCargaMaestros'


INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (202,'Carga Tarifas','optCargaMaestros','Empleado',17.1,1,1,0);



exec dbo.SP_GenerarNuevasOpcionesdeMenues
