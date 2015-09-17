cd C:\Windows\sc\sg_git\tezecoop
git pull --all
xcopy C:\Windows\sc\sg_git\tezecoop\GestiondeViajes.exe C:\Gestion_PRUEBAS\GestiondeViajesADM_Pruebas /y
xcopy C:\Windows\sc\sg_git\tezecoop\GestiondeViajes.exe C:\Gestion_PRUEBAS\GestiondeViajesFacturacionRETORNO_Pruebas /y
xcopy C:\Windows\sc\sg_git\tezecoop\GestiondeViajes.exe C:\Gestion_PRUEBAS\GestiondeViajesPUESTOS_Pruebas /y
MD C:\Gestion_PRUEBAS\GestiondeViajesADM_Pruebas\Componentes
MD C:\Gestion_PRUEBAS\GestiondeViajesFacturacionRETORNO_Pruebas\Componentes
MD C:\Gestion_PRUEBAS\GestiondeViajesPUESTOS_Pruebas\Componentes
xcopy Componentes  C:\Gestion_PRUEBAS\GestiondeViajesADM_Pruebas\Componentes /i  /Y 
xcopy Componentes  C:\Gestion_PRUEBAS\GestiondeViajesFacturacionRETORNO_Pruebas\Componentes /i  /Y 
xcopy Componentes  C:\Gestion_PRUEBAS\GestiondeViajesPUESTOS_Pruebas\Componentes /i  /Y 
xcopy C:\Windows\sc\sg_git\tezecoop\InstalarComponentes.bat C:\Gestion_PRUEBAS\GestiondeViajesADM_Pruebas /y
xcopy C:\Windows\sc\sg_git\tezecoop\GInstalarComponentes.bat C:\Gestion_PRUEBAS\GestiondeViajesFacturacionRETORNO_Pruebas /y
xcopy C:\Windows\sc\sg_git\tezecoop\InstalarComponentes.bat C:\Gestion_PRUEBAS\GestiondeViajesPUESTOS_Pruebas /y
