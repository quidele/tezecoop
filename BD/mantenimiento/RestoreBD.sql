RESTORE DATABASE [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BACKUP_DIARIO_TE.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 2,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 3,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 4,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 5,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 6,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 7,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 8,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 9,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 10,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 11,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 12,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 13,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 14,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 15,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 16,  NORECOVERY,  NOUNLOAD,  STATS = 10
GO
---- el ulimo deberia ser el tail log
RESTORE LOG [dbSG2000] FROM  DISK = N'E:\BACKUPS_DIARIO\BackupLogs.bak' WITH  FILE = 17,  NOUNLOAD,  STATS = 10
GO
