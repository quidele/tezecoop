
	select  max(nrCaja) from tb_movimientoscontables  where nrcajapuesto=2000004741

begin tran 


Exec sp_desimputarcajapuesto_v3_2 @nrCajaPuesto_param = 2000002241 ,@nrCajaAdmActual = 9000001113 ,@dsUsuario_param = 'ROMA' ,@dsUsuarioCajaPuesto_param = null ,@dsUsuario_Supervisor_param = 'USRPARAM' 


commit tran


	sp_obtiene_saldo_cajapuestoimputada_v3_2 2000002241, 9000001113


2000004741


Exec sp_desimputarcajapuesto_v3_2 @nrCajaPuesto_param = 2000004741 ,@nrCajaAdmActual = 2000004742 ,@dsUsuario_param = 'MARIA' ,@dsUsuarioCajaPuesto_param = null ,@dsUsuario_Supervisor_param = 'USRPARAM' 

select * from TB_MovimientosContables where dtMovimiento > GETDATE()-1
