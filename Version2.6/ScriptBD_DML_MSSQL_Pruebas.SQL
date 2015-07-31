-- cambios de DML version 2.6
use dbSG2000_pruebas
go



/* SP_realizarCierreCajaPuesto_v2_6
 determina si un usuario puede reabrir una caja o no */
DELETE FROM DiccionariodeDatos  WHERE  nmtabla='SP_realizarCierreCajaPuesto_v2_6';

INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_realizarCierreCajaPuesto_v2_6','@pnrCaja_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'9000001098','2000001555','3000000022','9000001087','SI','0','5000000004','1');
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_realizarCierreCajaPuesto_v2_6','@pdsUsuario_param','Usuario','VARCHAR','10','No','Yes','Yes',5,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_realizarCierreCajaPuesto_v2_6','@pdsUsuario_Supervisor_param','dsUsuario_Supervisor','VARCHAR','50',null,null,null,0,null,null,null,'0',null,null,null,null);


