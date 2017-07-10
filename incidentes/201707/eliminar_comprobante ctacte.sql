

SELECT * FROM  TB_ComprobantesDetalle x   WHERE x.nrComprobante = '00000814' and x.nrTalonario = '0001' and x.tpComprobante = 'FA' and  x.tpletra  = 'M'
SELECT * from TB_Comprobantes x   WHERE x.nrComprobante = '00000814' and x.nrTalonario = '0001' and x.tpComprobante = 'FA' and  x.tpletra  = 'M'
SELECT  * FROM TB_CUPONES X WHERE x.nrComprobante = '00000814' and x.nrTalonario = '0001' and x.tpComprobante = 'FA' and  x.tpletra  = 'M'


SELECT * FROM  TB_ComprobantesDetalle x into zTB_ComprobantesDetalle_bkp_01072017  WHERE x.nrComprobante = '00000814' and x.nrTalonario = '0001' and x.tpComprobante = 'FA' and  x.tpletra  = 'M'
SELECT * from  TB_Comprobantes x into zTB_Comprobantes_bkp_01072017  WHERE x.nrComprobante = '00000814' and x.nrTalonario = '0001' and x.tpComprobante = 'FA' and  x.tpletra  = 'M'
SELECT  * FROM TB_CUPONES X   into zTB_CUPONES_bkp_0107201  WHERE x.nrComprobante = '00000814' and x.nrTalonario = '0001' and x.tpComprobante = 'FA' and  x.tpletra  = 'M'


BEGIN TRAN
DELETE x FROM  TB_ComprobantesCupones x   WHERE x.nrComprobante = '00000814' and x.nrTalonario = '0001' and x.tpComprobante = 'FA' and  x.tpletra  = 'M'
DELETE x FROM TB_CUPONES X WHERE x.nrComprobante = '00000814' and x.nrTalonario = '0001' and x.tpComprobante = 'FA' and  x.tpletra  = 'M'
DELETE x from TB_Comprobantes x   WHERE x.nrComprobante = '00000814' and x.nrTalonario = '0001' and x.tpComprobante = 'FA' and  x.tpletra  = 'M'

ROLLBACK TRAN
COMMIT TRAN

