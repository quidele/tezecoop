-- cambios de DML version 2.7
use dbSG2000_pruebas
go


GO

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='obtenerCuponesAnulados_v2_7';

GO 

INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('obtenerCuponesAnulados_v2_7','@nrLicencia_param','Nro. de Licencia','INTEGER','9','Yes','No','Yes',1,null,null,null,null,null,null,null,null);




