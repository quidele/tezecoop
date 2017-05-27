If  exist C:\Gestion\GestiondeViajesADM\Versiones_Anteriores\27052017\GestiondeViajes.exe  (
	xcopy GestiondeViajes.exe C:\Gestion\GestiondeViajesADM /y
	xcopy GestiondeViajes.exe C:\Gestion\GestiondeViajesFacturacionRETORNO /y
) else (
	MD C:\Gestion\GestiondeViajesADM\Versiones_Anteriores\27052017
	xcopy C:\Gestion\GestiondeViajesADM\GestiondeViajes.exe C:\Gestion\GestiondeViajesADM\Versiones_Anteriores\27052017 /y
	xcopy C:\Gestion\GestiondeViajesFacturacionRETORNO\GestiondeViajes.exe C:\Gestion\GestiondeViajesFacturacionRETORNO\Versiones_Anteriores\27052017  /y
)

REM MD C:\Gestion\GestiondeViajesADM\Componentes
REM MD C:\Gestion\GestiondeViajesFacturacionRETORNO\Componentes
REM xcopy Componentes  C:\Gestion\GestiondeViajesADM\Componentes /i  /Y 
REM xcopy Componentes  C:\Gestion\GestiondeViajesFacturacionRETORNO\Componentes /i  /Y 
REM xcopy C:\Windows\sc\sg_git\tezecoop\InstalarComponentes.bat C:\Gestion\GestiondeViajesADM /y
REM xcopy C:\Windows\sc\sg_git\tezecoop\InstalarComponentes.bat C:\Gestion\GestiondeViajesFacturacionRETORNO /y