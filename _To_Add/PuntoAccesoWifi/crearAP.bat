
@echo Creando punto de acceso con pass 12345678

Netsh wlan set hostednetwork mode=allow SSID=CORUNARENE key=12345678
Netsh wlan start hostednetwork