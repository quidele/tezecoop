-- Test de la version 1.3 

SELECT     *
FROM      TB_Comprobantes
WHERE     (nrComprobante IN ('00032422', '00032421', '00032423', '00032424')) 
          AND (nrTalonario = '0001')

