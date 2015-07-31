-- cambios de DML version 1.5
use dbSG2000_Pruebas
go


update tb_movimientoscontables
set  tpConcepto='Cajas'
where tpConcepto='Caja'

update tb_conceptos
set  tpConcepto='Cajas'
where tpConcepto='Caja'

-----------------------------------------------------
--- Campos para Calculo del IVA


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Cupones' and nmCampo = 'vlSubTotal' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('TB_Cupones','vlSubTotal','vlSubTotal','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Cupones' and nmCampo = 'vlIVA' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('TB_Cupones','vlIVA','vlIVA','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-------
delete from tb_conceptos where dsConcepto='COBRO IVA AL LICENCIATARIO'


insert into  TB_Conceptos (cdConcepto, tpConcepto, dsConcepto, 
		vlConcepto, tpOperacion, dtActualizacion, flEliminar)
values (1064, 'Cajas', 'COBRO IVA AL LICENCIATARIO',0, 'Entrada de Dinero', getDate(), 0)


update a
set a.dsConcepto=b.dsConcepto
from TB_Conceptos a, TB_MovimientosContables b
where (a.dsConcepto is null or a.dsConcepto='') and
b.dsConcepto is not null and
a.cdConcepto = b.cdConcepto

delete  from  TB_Conceptos
where  cdConcepto  not in (select cdConcepto from TB_MovimientosContables) 
