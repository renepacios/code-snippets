
@echo off
rem Ejecuta un store procedure que realiza un copia de la bd indicada, o de todas
rem parametros 
rem   @backupLocation (varchar) -> Direcctorio fichero backup, sólo directorio DEBE TERMINAR EN \
rem   @BackupType(char) -> F=full, D=differential, L=log
rem   @databaseName(sysname) -> Nombre de la base de datos, en caso de no establecerlo copiará todas las BDs que estén online

rem backup usando autenticacion sqlserver, el usuario debe estar al menos en el rol de los usuarios de backup
  rem sqlcmd -U p1 -P p1 -S .\SQL2k12 -Q "EXEC sp_BackupDatabases_DayOfWeek @backupLocation ='C:\BDs\', @databaseName='p1', @BackupType='F'"

@echo on
rem backup usando autenticacion windows

sqlcmd -S .\SQL2k12 -E -Q "EXEC sp_BackupDatabases_DayOfWeek  @backupLocation ='C:\Proyectos\', @databaseName='p1', @BackupType='F'"