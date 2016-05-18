

Use Magma_ERP_Desa

Select * FROM fon.ufn_obtenerComprobantesAsociadosML(473494)
--Select * FROM fon.ufn_obtenerComprobanteIVAML(473494)
select * FROM fon.ufn_obtenerComprobanteTributosML(473494)

INSERT INTO FacturaElectronica_Prueba.dbo.comprobantes_ml

SELECT * into fon.tmp_obtenerComprobanteML3
FROM fon.ufn_obtenerComprobanteML(473494)

SELECT * from FacturaElectronica_Prueba.dbo.comprobantes_ml




