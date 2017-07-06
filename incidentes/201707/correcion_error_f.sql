
select x.nrTalonario , x.nrComprobante , x.tpComprobante , x.tpLetra  , y.tpletra as  tpletraOK
     --into ztmp_comprobantesF_error
	 from TB_Comprobantes x  inner join TB_Puestos y on
                    x.nrPuesto = y.nrPuesto
  where x.tpletra = 'F'


  select * from ztmp_comprobantesF_error x  inner join TB_Comprobantes y
				on x.nrComprobante = y.nrComprobante
						and x.nrTalonario = y.nrTalonario
						  and x.tpComprobante = y.tpComprobante
							and  x.tpletraOK  = y.tpLetra

							
	
	select 'exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = ''' + nrTalonario   + ''' , 
		@nrComprobante_param      =  ''' + nrComprobante + ''' , 
		@tpComprobante_param      = ''FA'' , 
		@tpLetra_param            = ''' + tpLetra + ''',
		@nrTalonario_new_param    = ''' + nrTalonario   + ''',
		@nrComprobante_new_param  =  '''+ nrComprobante   + ''',
		@tpComprobante_new_param  = ''FA'',
		@tpLetra_new_param        = ''B'', @solo_cambio_cabecera_comprobante = ''SI'' ; '
		FROM TB_Comprobantes where tpLetra = 'F' and  tpComprobante = 'FA'


exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00525409    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00525409    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00532749    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00532749    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00532797    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00532797    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00532810    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00532810    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00532824    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00532824    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00532895    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00532895    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00532931    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00532931    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533083    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533083    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533107    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533107    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533120    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533120    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533153    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533153    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533157    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533157    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533158    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533158    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533222    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533222    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533685    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533685    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533765    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533765    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533768    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533768    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533780    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533780    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533784    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533784    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533787    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533787    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00533815    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00533815    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00534200    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00534200    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00534311    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00534311    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00534540    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00534540    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00535851    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00535851    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00536121    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00536121    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00536173    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00536173    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00536937    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00536937    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00537007    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00537007    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00537086    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00537086    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00751775    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00751775    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00752380    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00752380    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00752381    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00752381    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00752390    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00752390    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00752661    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00752661    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00752851    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00752851    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00752852    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00752852    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00753313    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00753313    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00753314    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00753314    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00753475    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00753475    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00753542    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00753542    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00753620    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00753620    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00753898    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00753898    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00753908    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00753908    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00753980    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00753980    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00754282    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00754282    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00754291    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00754291    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00754293    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00754293    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00754344    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00754344    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00755346    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00755346    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00755665    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00755665    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00756340    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00756340    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00756524    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00756524    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00756555    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00756555    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00756892    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00756892    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00756898    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00756898    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00756908    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00756908    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00757535    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00757535    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0008' , 
		@nrComprobante_param      =  '00178880    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0008',
		@nrComprobante_new_param  =  '00178880    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0008' , 
		@nrComprobante_param      =  '00180624    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0008',
		@nrComprobante_new_param  =  '00180624    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0003' , 
		@nrComprobante_param      =  '00117461    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0003',
		@nrComprobante_new_param  =  '00117461    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0003' , 
		@nrComprobante_param      =  '00117900    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0003',
		@nrComprobante_new_param  =  '00117900    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
exec [dbo].[SP_ActualizarComprobante_v4_9_7]
		@nrTalonario_param        = '0001' , 
		@nrComprobante_param      =  '00000807    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0001',
		@nrComprobante_new_param  =  '00000807    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' ; 
	