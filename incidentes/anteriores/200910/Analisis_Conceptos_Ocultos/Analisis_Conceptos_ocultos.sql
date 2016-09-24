SELECT *
FROM  TB_Conceptos
WHERE
               (flOcultadoCajaLicenciatario = 1) OR
               (flOcultadoCajaCooperativa = 1)


update TB_Conceptos
set flOcultadoCajaLicenciatario=0,
    flOcultadoCajaCooperativa=0
WHERE
               (flOcultadoCajaLicenciatario = 1) OR
               (flOcultadoCajaCooperativa = 1)