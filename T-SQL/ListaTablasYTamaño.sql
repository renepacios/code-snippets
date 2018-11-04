/*
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Fecha:			26/12/2013
Autor:			René Pacios
Descripción:	Obtiene una lista de las tablas conenidas en la base de datos actual, junto con el número de campos y el tamaño máximo por registro

------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

SELECT o.name 'Tabla',
     COUNT(*) 'Columnas',
	 SUM(c.length) 'Tamaño  máx. registro (bytes)'
FROM
     sysobjects o
INNER JOIN syscolumns c ON
     c.id = o.id
where o.xtype='U' and o.name<>'dtproperties'
group by o.name
order by 1
/* No necesario, si se desease información de una sóla tabla en ese caso es mejor usar sys.tables, o syscolumns */
--WHERE
--     o.name = '<table name>'

/* Consultas auxiliares */
select * from sysobjects
where xtype='U'

select * from sys.tables

select * from syscolumns