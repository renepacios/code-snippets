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


SET @TableName = 'tmpIrisIdent'
set @VOName='IrisIdentVO'

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
set @PlantillaNullables ='If(IsDBNull(dr.Item("##CAMPO_BD##")), CType(Nothing,  ##TIPO_NET##?), CType(dr.Item("##CAMPO_BD##"), ##TIPO_NET##?))'
set @PlantillaNullableString ='If(IsDBNull(dr.Item("##CAMPO_BD##")), Nothing, CType(dr.Item("##CAMPO_BD##"), ##TIPO_NET##))'


--SET @NewLine = char(13)

-- Start Output
--PRINT '' + @NewLine;
PRINT 'Public Class '+ @VoName;
PRINT '';

IF @propImplicit=0  
	PRINT '#Region "Declarations"';
else
	PRINT '#Region "Propiedades"'
PRINT '';

-- Declarations
DECLARE DeclarationCursor CURSOR SCROLL FOR 
    SELECT
        columns.name [ColumnName],
        CASE 
            WHEN columns.system_type_id = 34    THEN 'Byte[]'
            WHEN columns.system_type_id = 35    THEN 'String '
            WHEN columns.system_type_id = 36    THEN 'System.Guid'
            WHEN columns.system_type_id = 48    THEN 'Byte'
            WHEN columns.system_type_id = 52    THEN 'Short'
            WHEN columns.system_type_id = 56    THEN 'Integer'
            WHEN columns.system_type_id = 58    THEN 'System.DateTime'
            WHEN columns.system_type_id = 59    THEN 'float'
            WHEN columns.system_type_id = 60    THEN 'Decimal'
            WHEN columns.system_type_id = 61    THEN 'System.DateTime'
            WHEN columns.system_type_id = 62    THEN 'double'
            WHEN columns.system_type_id = 98    THEN 'Object'
            WHEN columns.system_type_id = 99    THEN 'String'
            WHEN columns.system_type_id = 104   THEN 'Boolean'
            WHEN columns.system_type_id = 106   THEN 'Decimal'
            WHEN columns.system_type_id = 108   THEN 'Decimal'
            WHEN columns.system_type_id = 122   THEN 'Decimal'
            WHEN columns.system_type_id = 127   THEN 'long'
            WHEN columns.system_type_id = 165   THEN 'Byte[]'
            WHEN columns.system_type_id = 167   THEN 'String'
            WHEN columns.system_type_id = 173   THEN 'Byte[]'
            WHEN columns.system_type_id = 175   THEN 'string'
            WHEN columns.system_type_id = 189   THEN 'Long'
            WHEN columns.system_type_id = 231   THEN 'String'
            WHEN columns.system_type_id = 239   THEN 'String'
            WHEN columns.system_type_id = 241   THEN 'String'          
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
		PRINT '    Public Property ' + REPLACE(@FieldName,'_','') + ' As ' + @DataType+'?';
	else
		PRINT '    Public Property ' + REPLACE(@FieldName,'_','') + ' As ' + @DataType;

    FETCH NEXT FROM DeclarationCursor 
    INTO @ColumnName, @DataType,@IsNullable,@intDateType;
END
PRINT ''; 
PRINT '#End Region';
PRINT ''; 

IF @propImplicit=0  
	BEGIN
	PRINT '#Region "Properties"';
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
	PRINT '#End Region';
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

PRINT '#Region "Constructors"';
PRINT '';
PRINT '    Public Sub New()';
PRINT '        ';
PRINT '    End Sub';
PRINT '';
IF @propImplicit=0  
	BEGIN
	PRINT '    Public Sub New(' + @FIELDS + ')'
	PRINT '        '+@ASIGNACIONES;
	PRINT '    End Sub';
	PRINT '';
END 
PRINT '#End Region';
PRINT ''; 

DECLARE @AUX_STR VARCHAR(200)	

IF @crearMetodoObtenerVO=1
BEGIN
	FETCH FIRST FROM DeclarationCursor 
	INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	PRINT '';
	PRINT ' Private Function ObtenerVO(ByVal dr As IDataReader) As '+ @VoName;
	PRINT '		Dim VO As New '+@VoName;
	PRINT '     With VO';
	WHILE @@FETCH_STATUS = 0
	BEGIN
	    --SET @FieldName = LOWER(SUBSTRING(@ColumnName, 1,1)) + SUBSTRING(@ColumnName, 2, LEN(@ColumnName)-1)
		SET @FieldName = SUBSTRING(@ColumnName, 1,1) + SUBSTRING(@ColumnName, 2, LEN(@ColumnName)-1)
		if @IsNullable=1 and @intDateType not in (34,35,98,99,165,167,173,175,231,239,241)
		BEGIN
					
			SET @AUX_STR=REPLACE(@PlantillaNullables,'##TIPO_NET##',@DataType)
			SET @AUX_STR=REPLACE(@AUX_STR,'##CAMPO_BD##',@FieldName)
			PRINT '			.'+REPLACE(@FieldName,'_','')+' = '+@AUX_STR;
			--PRINT '			.'+REPLACE(@FieldName,'_','')+' = dr.GetNullable(Of '+@DataType+')("'+@FieldName+'")';
		END		   
		ELSE IF @IsNullable=1 and @intDateType in (35,99,167,175,231,239,241)
		BEGIN
			--@PlantillaNullableString
					
			SET @AUX_STR=REPLACE(@PlantillaNullableString,'##TIPO_NET##',@DataType)
			SET @AUX_STR=REPLACE(@AUX_STR,'##CAMPO_BD##',@FieldName)
			PRINT '			.'+REPLACE(@FieldName,'_','')+' = '+@AUX_STR;
		END
		ELSE
			PRINT '			.'+REPLACE(@FieldName,'_','')+' = CType(dr.Item("'+@FieldName+'"),'+@DataType+')';
		
		----SET @FIELDS = @FIELDS + 'ByVal ' + @FieldName + ' as ' + @DataType + ', '
		----SET @ASIGNACIONES = @ASIGNACIONES + 'Me.'+@FieldName+'='+@FieldName+ ' : '
	    FETCH NEXT FROM DeclarationCursor 
	    INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	END
	PRINT '		 End With';
	PRINT '	';
    print '	    Return VO';
	PRINT '	';
    print '	End Function';

END


CLOSE DeclarationCursor;
DEALLOCATE DeclarationCursor;

-- End of Class
PRINT 'End Class';