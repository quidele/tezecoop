-- cambios de DDL version 1.3   - MySQL

-- MYSQL


ALTER TABLE tb_cajas DROP flSincronizado;
ALTER TABLE tb_comprobantes DROP flSincronizado;
ALTER TABLE tb_comprobantesdetalle DROP flSincronizado;
ALTER TABLE tb_cupones DROP flSincronizado;


ALTER TABLE tb_cajas ADD
	flSincronizado   bit  NULL;

ALTER TABLE tb_comprobantes ADD
	 flSincronizado   bit  NULL;


ALTER TABLE tb_comprobantesdetalle  ADD
	 flSincronizado   bit  NULL;

ALTER TABLE tb_cupones  ADD
	 flSincronizado  bit NULL;



ALTER TABLE tb_clientes DROP	dtActualizacion;
ALTER TABLE tb_conceptos DROP	dtActualizacion;
ALTER TABLE tb_comisiones DROP dtActualizacion;
ALTER TABLE tb_productos DROP	dtActualizacion;
ALTER TABLE tb_puestos DROP dtActualizacion;
ALTER TABLE tb_usuarios DROP	dtActualizacion;
ALTER TABLE tb_proveedores DROP	dtActualizacion;	

	
ALTER TABLE tb_clientes ADD	dtActualizacion  datetime NULL;
ALTER TABLE tb_conceptos ADD	dtActualizacion  datetime NULL;
ALTER TABLE tb_comisiones ADD dtActualizacion  datetime NULL;
ALTER TABLE tb_productos ADD	dtActualizacion  datetime NULL;
ALTER TABLE tb_puestos ADD dtActualizacion  datetime NULL;
ALTER TABLE tb_usuarios ADD	dtActualizacion  datetime NULL;
ALTER TABLE tb_proveedores ADD	dtActualizacion  datetime NULL;	


