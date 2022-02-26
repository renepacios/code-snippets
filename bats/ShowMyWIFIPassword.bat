@echo off 
CLS

IF "" =="%1" goto NO_SSID
IF "?"=="%1" goto SHOW_SSIDS


netsh wlan show profile %1 key=clear
GOTO FIN

:NO_SSID
	echo *************************************************************************************************************************
	echo *	DEBES INDICAR EL NOMBRE DE LA WIFI	                                      
	echo *                                                                                
	echo *		ejemplo ShowMyWIFIPassword MiWifi	                                      
	echo *                                                                                
	echo *	Si no conoces el nombre de tu WIFI ejecuta el comando con el argumento ?     
	echo *									
	echo	*		ejemplo ShowMyWIFIPassword ?										
	echo *																	
	echo *  	Mostrará un listado de las wifis configuradas en tu equipo				
	echo *																	
	echo *************************************************************************************************************************
	GOTO FIN


:SHOW_SSIDS
	netsh wlan show profile
	GOTO FIN

:FIN
	pause 100

@echo on
