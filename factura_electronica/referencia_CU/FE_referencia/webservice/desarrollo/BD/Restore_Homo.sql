RESTORE DATABASE [FacturaElectronica_Homo] FROM  
DISK = N'E:\BACKUP_ARCSERVER\BACKUP_ARCSERVER\BKP_BDFacturaElectronica_Dia.bak' WITH  FILE = 1,  
MOVE N'FacturaElectronica' TO
N'B:\sqlserver\DATA\FacturaElectronica_homo.mdf', 
 MOVE N'FacturaElectronica_log' TO
  N'L:\sqlserver\DATA\FacturaElectronica_homo_log.ldf',
    NOUNLOAD,  REPLACE,  STATS = 10
GO
