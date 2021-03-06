BACKUP DATABASE [catwin_pruebas] TO
  DISK = N'E:\Catwin_pruebas.bak' WITH  
NOFORMAT, INIT, 
   NAME = N'catwin_pruebas-Completa Base
    de datos Copia de seguridad', SKIP,
     NOREWIND, NOUNLOAD,  STATS = 10
GO


/* backup de logs */
BACKUP LOG [catwin_pruebas] TO  DISK = N'E:\Catwin_pruebas_logs.bak'
     WITH NOFORMAT, INIT,  
     NAME = N'BACKUP Registro de transacciones  - NO inicializa Dispositivo', SKIP, NOREWIND, NOUNLOAD,  STATS = 10


GO

/* backup de tail logs */
BACKUP LOG catwin_pruebas TO 
disk ='E:\catwin_pruebas_tail_log.bak' WITH NORECOVERY ,
noformat, init,STATS = 10 , CONTINUE_AFTER_ERROR 


restore database [catwin_pruebas] from  
DISK = N'E:\Catwin_pruebas.bak' with norecovery

restore  log [catwin_pruebas] from  
DISK = N'E:\Catwin_pruebas_logs.bak' with norecovery

restore  log [catwin_pruebas] from  
DISK = N'E:\catwin_pruebas_tail_log.bak' with recovery
