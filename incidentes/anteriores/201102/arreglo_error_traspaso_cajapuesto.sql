


SET DATEFORMAT DMY 

select * from tb_cajas where convert(varchar,dtApertura,103) = '17/02/2011' AND
nrPuesto = 1
 
select  * from TB_Cajas where nrCaja = 1000006110 

update TB_Cajas  set  dsUsuario ='VRIVEROS'  where nrCaja = 1000006110 and dsUsuario = 'MGABRIELA'


1000006110	1	MGABRIELA	2011-02-17 06:01:17.000	2011-02-17 13:48:25.000	06:01	13:48

 
select * from TB_Usuarios where dsUsuario = 'VRIVEROS'