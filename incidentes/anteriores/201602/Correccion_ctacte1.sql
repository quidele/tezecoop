

select flCobradoalCliente, * from TB_Cupones  where    cdCliente = 111 and  convert(date,dtCobradoalCliente)= '20160226'

select top 500 IdReciboCtaCte ,  dtCobradoalCliente as fechaLiq , flCobradoalCliente, * from TB_Cupones  
			where    cdCliente = 111 and flCobradoalCliente = 1 order by dtCobradoalCliente desc

select * from TB_Comprobantes   where  IdReciboCtaCte = 1000292161

select flCobradoalCliente, * from TB_Cupones  where  IdReciboCtaCte =1000292161

select sum(vlMontoCupon) from TB_Cupones  where  IdReciboCtaCte =1000292161


begin tran 

select * into  TB_Cupones_bkp_26022016_1  from TB_Cupones  where  IdReciboCtaCte =1000292161
update  TB_Cupones set IdReciboCtaCte = null, flCobradoalCliente = 0  where  IdReciboCtaCte = 1000292161

--rollback tran 

commit tran

--- Obtener cta cte del cliente a facturar AEROLINEAS
SELECT TB_Cupones.cdCodBar ,TB_Cupones.nrLicencia ,TB_Cupones.nmLicenciatario ,TB_Cupones.cdCliente ,TB_Cupones.nrCupon ,TB_Cupones.tpCupon ,
TB_Cupones.vlMontoCupon ,TB_Cupones.vlPagoPesos ,TB_Cupones.vlPagoEuros ,TB_Cupones.vlPagoDolares ,TB_Cupones.vlComision , 
TB_Cupones.nrTalonarioCliente ,TB_Cupones.nrComprabanteCliente ,TB_Cupones.flCobradoalCliente ,TB_Cupones.vlafavorAdmin ,TB_Cupones.dtCupon  
FROM TB_Cupones  WHERE TB_Cupones.cdCliente = 111  AND  TB_Cupones.tpCupon = 'Cuenta Corriente' AND TB_Cupones.flEliminar = 0  AND 
TB_Cupones.flCobradoalCliente = 0 AND TB_Cupones.flAnulado = 0   Order by TB_Cupones.cdCliente ASC 



