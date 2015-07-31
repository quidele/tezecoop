-- cambios de DML version 3.3
use dbSG2000
go
set dateformat dmy

set dateformat dmy

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='sp_cuponesCompensadosdelDia_v3_3' and nmCampo='@pnrLicencia';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_cuponesCompensadosdelDia_v3_3','@pnrLicencia','@pnrLicencia','VARCHAR','3','No','No','No',0,'0','0','0','0','SI','0','0','1');


DELETE FROM TB_Parametros  WHERE dsParametro='COBRO_COMISION_CD_RE_OBLIGATORIA';
INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,flNoEditable,nrTamanio,dtActualizacion)  VALUES ('COBRO_COMISION_CD_RE_OBLIGATORIA','S','S/N',0,1,'16/04/2008 8:04:37');
