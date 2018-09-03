
-- Cambios de DML version 4.9.834b
use dbSG2000
go 



  
DELETE FROM DiccionariodeDatos WHERE nmTabla='TB_Puestos' and nmCampo = 'flFacturaManualElectronica' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,
flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,
vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','flFacturaManualElectronica','Es Factura Manual Electronica ','BIT','1','No','No','Yes',8,null,null,null,null,null,null,null,null);
