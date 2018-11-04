----------------------------------
-- http://www.duanewingett.info/2011/04/12/CreateVBNetClassFromSqlServerTable.aspx
/*
	Revisiones:
		- [13/11/2012] Modificado para poder utilizar declaración implícita de variables
		- [13/11/2012] Añadida funcion para obtener el VO
		- [14/11/2012] Añadida la funcionalidad de obtener si son nullables o no los campos
		- [14/11/2012] Implementada la opción de tratar los strings que pueden ser nullos
	Ideas a implementar:		
		- [14/02/2014] Implementar par aque pormita codificar en formato C#
*/
----------------------------------

DECLARE @TableName varchar(50)
DECLARE @VoName varchar(50)


SET @TableName ='sorde_permisos'	
set @VOName='PermisosUsuario'

DECLARE @propImplicit bit,@crearMetodoObtenerVO bit

set @propImplicit=1
set @crearMetodoObtenerVO=1

SET NOCOUNT ON; -- Hide row count so printed output is not affected

DECLARE @DataTypeName varchar(50)
DECLARE @NewLine char
DECLARE @ColumnName varchar(50)
DECLARE @DataType varchar(50)
DECLARE @FieldName varchar(50)
DECLARE @IsNullable bit
DECLARE @intDateType int

--Los nullables depende de la implmentación aplicada a cada proyecto, por eso se utiliza esta plantilla para obtenerlos
DECLARE @PlantillaNullables varchar(200)
DECLARE @PlantillaNullableString varchar(200)
--set @PlantillaNullables ='dr.GetNullable(Of ##TIPO_NET##)("##CAMPO_BD##")'


-- (dr["##CAMPO_BD##"]==DBNull.Value)?((##TIPO_NET##?)null):(##TIPO_NET##?)(dr["##CAMPO_BD##"]),
set @PlantillaNullables ='(dr["##CAMPO_BD##"]==DBNull.Value)? ((##TIPO_NET##?)null) : (##TIPO_NET##?)dr["##CAMPO_BD##"]'
set @PlantillaNullableString ='(dr["##CAMPO_BD##"]==DBNull.Value)? null : (##TIPO_NET##)dr["##CAMPO_BD##"]'
--SET @NewLine = char(13)

-- Start Output
--PRINT '' + @NewLine;
PRINT 'public class '+ @VoName +' {';
PRINT '';

IF @propImplicit=0  
	PRINT '#region "Declarations"';
else
	PRINT '#region "Propiedades"'
PRINT '';

-- Declarations
DECLARE DeclarationCursor CURSOR SCROLL FOR 
    SELECT
        columns.name [ColumnName],
        CASE 
            WHEN columns.system_type_id = 34    THEN 'byte[]'
            WHEN columns.system_type_id = 35    THEN 'string '
            WHEN columns.system_type_id = 36    THEN 'System.Guid'
            WHEN columns.system_type_id = 48    THEN 'byte'
            WHEN columns.system_type_id = 52    THEN 'short'
            WHEN columns.system_type_id = 56    THEN 'int'
            WHEN columns.system_type_id = 58    THEN 'System.DateTime'
            WHEN columns.system_type_id = 59    THEN 'float'
            WHEN columns.system_type_id = 60    THEN 'decimal'
            WHEN columns.system_type_id = 61    THEN 'System.DateTime'
            WHEN columns.system_type_id = 62    THEN 'double'
            WHEN columns.system_type_id = 98    THEN 'object'
            WHEN columns.system_type_id = 99    THEN 'string'
            WHEN columns.system_type_id = 104   THEN 'bool'
            WHEN columns.system_type_id = 106   THEN 'decimal'
            WHEN columns.system_type_id = 108   THEN 'decimal'
            WHEN columns.system_type_id = 122   THEN 'decimal'
            WHEN columns.system_type_id = 127   THEN 'long'
            WHEN columns.system_type_id = 165   THEN 'byte[]'
            WHEN columns.system_type_id = 167   THEN 'string'
            WHEN columns.system_type_id = 173   THEN 'byte[]'
            WHEN columns.system_type_id = 175   THEN 'string'
            WHEN columns.system_type_id = 189   THEN 'long'
            WHEN columns.system_type_id = 231   THEN 'string'
            WHEN columns.system_type_id = 239   THEN 'string'
            WHEN columns.system_type_id = 241   THEN 'string'          
        END [DataType],is_nullable,columns.system_type_id
FROM              sys.tables tables
    INNER JOIN    sys.schemas schemas ON (tables.schema_id = schemas.schema_id )
    INNER JOIN    sys.columns columns ON (columns.object_id = tables.object_id) 
WHERE
    tables.name = @TableName
ORDER BY 
    columns.object_id ASC;


OPEN DeclarationCursor;

FETCH NEXT FROM DeclarationCursor 
INTO @ColumnName, @DataType,@IsNullable,@intDateType;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- SET @FieldName = LOWER(SUBSTRING(@ColumnName, 1,1)) + SUBSTRING(@ColumnName, 2, LEN(@ColumnName)-1)
	 SET @FieldName = SUBSTRING(@ColumnName, 1,1) + SUBSTRING(@ColumnName, 2, LEN(@ColumnName)-1)
IF @propImplicit=0  
    PRINT '    Private _' + @FieldName + ' As ' + @DataType;
else
	if @IsNullable=1 and @intDateType not in (34,35,98,99,165,167,173,175,231,239,241)
		--PRINT '    Public Property ' + REPLACE(@FieldName,'_','') + ' As ' + @DataType+'?';
		PRINT '    public '+@DataType+'? '  + REPLACE(@FieldName,'_','') + ' {get; set;} ';
	else
		PRINT '    public '+@DataType+' '  + REPLACE(@FieldName,'_','') + ' {get; set;} ';

    FETCH NEXT FROM DeclarationCursor 
    INTO @ColumnName, @DataType,@IsNullable,@intDateType;
END
PRINT ''; 
PRINT '#endregion';
PRINT ''; 

IF @propImplicit=0  
	BEGIN
	PRINT '#region "Properties"';
	PRINT '';
	
	FETCH FIRST FROM DeclarationCursor 
	INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
	    SET @FieldName = '_' + LOWER(SUBSTRING(@ColumnName, 1,1)) + SUBSTRING(@ColumnName, 2, LEN(@ColumnName)-1)
	
	    PRINT '    Public Property ' + @ColumnName + ' As ' + @DataType;
	    PRINT '        Get';
	    PRINT '            Return ' + @FieldName;
	    PRINT '        End Get';
	    PRINT '        Set';
	    PRINT '            ' + @FieldName + ' = value';
	    PRINT '        End Set';
	    PRINT '    End Property';
	    PRINT ''; 
	
	    FETCH NEXT FROM DeclarationCursor 
	    INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	END
	
	PRINT ''; 
	PRINT '#endregion';
	PRINT ''; 
END

DECLARE @FIELDS varchar(max)
DECLARE @ASIGNACIONES varchar(max)

SET @FIELDS = ''
SET @ASIGNACIONES = ''

FETCH FIRST FROM DeclarationCursor 
INTO @ColumnName, @DataType,@IsNullable,@intDateType;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @FieldName = LOWER(SUBSTRING(@ColumnName, 1,1)) + SUBSTRING(@ColumnName, 2, LEN(@ColumnName)-1)
    SET @FIELDS = @FIELDS + 'ByVal ' + @FieldName + ' as ' + @DataType + ', '
	SET @ASIGNACIONES = @ASIGNACIONES + 'Me.'+@FieldName+'='+@FieldName+ ' : '
    FETCH NEXT FROM DeclarationCursor 
    INTO @ColumnName, @DataType,@IsNullable,@intDateType;
END

--SET @FIELDS = SUBSTRING(@FIELDS, 1, (LEN(@FIELDS) - 1))

PRINT '#region "Constructors"';
PRINT '';
PRINT '    public '+@VoName+'(){}';

PRINT '';
--IF @propImplicit=0  
--	BEGIN
--	PRINT '    Public Sub New(' + @FIELDS + ')'
--	PRINT '        '+@ASIGNACIONES;
--	PRINT '    End Sub';
--	PRINT '';
--END 
PRINT '#endregion';
PRINT ''; 

DECLARE @AUX_STR VARCHAR(200)	

IF @crearMetodoObtenerVO=1
BEGIN
	FETCH FIRST FROM DeclarationCursor 
	INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	PRINT '';
	PRINT '  private '+ @VoName +' ObtenerVO(IDataReader dr) { ';
	PRINT '		'+ @VoName +' vo = new '+@VoName+'();';
	print '';
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
	    --SET @FieldName = LOWER(SUBSTRING(@ColumnName, 1,1)) + SUBSTRING(@ColumnName, 2, LEN(@ColumnName)-1)
		SET @FieldName = SUBSTRING(@ColumnName, 1,1) + SUBSTRING(@ColumnName, 2, LEN(@ColumnName)-1)
		if @IsNullable=1 and @intDateType not in (34,35,98,99,165,167,173,175,231,239,241)
		BEGIN
					
			SET @AUX_STR=REPLACE(@PlantillaNullables,'##TIPO_NET##',@DataType)
			SET @AUX_STR=REPLACE(@AUX_STR,'##CAMPO_BD##',@FieldName)
			PRINT '			vo.'+REPLACE(@FieldName,'_','')+' = '+@AUX_STR+';';
			--PRINT '			.'+REPLACE(@FieldName,'_','')+' = dr.GetNullable(Of '+@DataType+')("'+@FieldName+'")';
		END		   
		ELSE IF @IsNullable=1 and @intDateType in (35,99,167,175,231,239,241)
		BEGIN
			--@PlantillaNullableString
					
			SET @AUX_STR=REPLACE(@PlantillaNullableString,'##TIPO_NET##',@DataType)
			SET @AUX_STR=REPLACE(@AUX_STR,'##CAMPO_BD##',@FieldName)
			PRINT '			vo.'+REPLACE(@FieldName,'_','')+' = '+@AUX_STR+';';
		END
		ELSE
			PRINT '			vo.'+REPLACE(@FieldName,'_','')+' = (string)dr["'+@FieldName+'"];';
		
		----SET @FIELDS = @FIELDS + 'ByVal ' + @FieldName + ' as ' + @DataType + ', '
		----SET @ASIGNACIONES = @ASIGNACIONES + 'Me.'+@FieldName+'='+@FieldName+ ' : '
	    FETCH NEXT FROM DeclarationCursor 
	    INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	END
	
	PRINT '	';
    print '	    return vo;';
	PRINT '	';
    print '}';

END


CLOSE DeclarationCursor;
DEALLOCATE DeclarationCursor;

-- End of Class
PRINT '}';