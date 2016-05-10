use FacturaElectronica
go 
 

 
insert into [dbo].[tipos_responsables]
select * from FacturaElectronica_Prueba.dbo.tipos_responsables  a
	where	a.codigo not in (Select codigo from [dbo].[tipos_responsables]) 


insert into [dbo].[condicion_iva]
select * from FacturaElectronica_Prueba.dbo.condicion_iva  a
	where	a.codigo not in (Select codigo from [dbo].[condicion_iva]) 


insert into [dbo].paises
select * from FacturaElectronica_Prueba.dbo.paises  a
	where	a.codigo not in (Select codigo from [dbo].paises) 

insert into [dbo].[cuit_paises]
select * from FacturaElectronica_Prueba.dbo.[cuit_paises]  a
	where	a.cuit not in (Select cuit from [dbo].[cuit_paises]) 

insert into [dbo].tipo_comprobante
select * from FacturaElectronica_Prueba.dbo.tipo_comprobante  a
	where	a.cod_tipo_comprobante  not in (Select cod_tipo_comprobante from [dbo].tipo_comprobante) 

insert into [dbo].tipo_comprobante
select * from FacturaElectronica_Prueba.dbo.tipo_comprobante  a
	where	a.cod_tipo_comprobante  not in (Select cod_tipo_comprobante from [dbo].tipo_comprobante) 


insert into [dbo].moneda
select * from FacturaElectronica_Prueba.dbo.moneda  a
	where	a.cod_moneda  not in (Select cod_moneda  from [dbo].moneda) 



insert into [dbo].unidad_medida
select * from FacturaElectronica_Prueba.dbo.unidad_medida  a
	where	a.cod_unidad_medida  not in (Select cod_unidad_medida   from [dbo].unidad_medida) 


insert into [dbo].tipo_documento
select * from FacturaElectronica_Prueba.dbo.tipo_documento  a
	where	a.cod_tipo_documento   not in (Select cod_tipo_documento   from [dbo].tipo_documento) 


insert into [dbo].idioma
select * from FacturaElectronica_Prueba.dbo.tipo_documento  a
	where	a.cod_tipo_documento   not in (Select cod_tipo_documento   from [dbo].tipo_documento) 


update a
set  a.permitidoenfonseca  = b.permitidoenfonseca ,
	 a.requiere_cmp_asociado  = b.requiere_cmp_asociado
from tipo_comprobante    a,
	 FacturaElectronica_Prueba.dbo.tipo_comprobante b
	 where a.cod_tipo_comprobante = b.cod_tipo_comprobante 
	 