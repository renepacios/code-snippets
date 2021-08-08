# Genera un informe en c:\report del estado de salud de la bateria, ciclos de carga, etc..

# refs: 
#    - https://www.jasoft.org/Blog/post/como-saber-si-la-bateria-de-tu-portatil-ha-perdido-capacidad <-- 05-2021 


c:
md c:\report
cd c:\report
powercfg /batteryreport
