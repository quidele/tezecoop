cd C:\Windows\sc\sg_git\tezecoop
xcopy C:\Windows\sc\sg_git\tezecoop\GestiondeViajes.exe C:\Gestion\GestiondeViajesADM /y
xcopy C:\Windows\sc\sg_git\tezecoop\GestiondeViajes.exe C:\Gestion\GestiondeViajesFacturacionRETORNO /y
MD C:\Gestion\GestiondeViajesADM\Componentes
MD C:\Gestion\GestiondeViajesFacturacionRETORNO\Componentes
xcopy Componentes  C:\Gestion\GestiondeViajesADM\Componentes /i  /Y 
xcopy Componentes  C:\Gestion\GestiondeViajesFacturacionRETORNO\Componentes /i  /Y 
xcopy C:\Windows\sc\sg_git\tezecoop\InstalarComponentes.bat C:\Gestion\GestiondeViajesADM /y
xcopy C:\Windows\sc\sg_git\tezecoop\InstalarComponentes.bat C:\Gestion\GestiondeViajesFacturacionRETORNO /y