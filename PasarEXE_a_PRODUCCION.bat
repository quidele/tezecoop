cd C:\Windows\sc\sg_git\tezecoop
xcopy C:\Windows\sc\sg_git\tezecoop\GestiondeViajes.exe C:\Gestion\GestiondeViajesADM /y
xcopy C:\Windows\sc\sg_git\tezecoop\GestiondeViajes.exe C:\Gestion\GestiondeViajesFacturacionRETORNO /y
REM MD C:\Gestion\GestiondeViajesADM\Componentes
REM MD C:\Gestion\GestiondeViajesFacturacionRETORNO\Componentes
REM xcopy Componentes  C:\Gestion\GestiondeViajesADM\Componentes /i  /Y 
REM xcopy Componentes  C:\Gestion\GestiondeViajesFacturacionRETORNO\Componentes /i  /Y 
REM xcopy C:\Windows\sc\sg_git\tezecoop\InstalarComponentes.bat C:\Gestion\GestiondeViajesADM /y
REM xcopy C:\Windows\sc\sg_git\tezecoop\InstalarComponentes.bat C:\Gestion\GestiondeViajesFacturacionRETORNO /y