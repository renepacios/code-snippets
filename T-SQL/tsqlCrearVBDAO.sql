----------------------------------
-- 
/*
	Revisiones:
		- 
	Ideas a implementar:
		- Detectar las claves de cada tabla para las operaciones de actualizado y borrado
*/
----------------------------------

DECLARE @TableName varchar(50)
DECLARE @DAOName varchar(50)
DECLARE @VOName varchar(50)

SET @TableName = 'u_notificaciones_wrs'	
set @VOName='NotificacionVO'
SET @DAOName='NotificacionesDAO' 




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
PRINT 'Public Class '+ @DAOName;
PRINT '';


PRINT '#Region "Constructors"';
PRINT '';
PRINT '    Public Sub New()';
PRINT '        ';
PRINT '    End Sub';
PRINT ''; 
PRINT '#End Region';
PRINT ''; 


-- Declarations
DECLARE DeclarationCursor CURSOR SCROLL FOR 
    SELECT
        columns.name [ColumnName],
        CASE 
            WHEN columns.system_type_id = 34    THEN 'Byte[]'
            WHEN columns.system_type_id = 35    THEN 'String'
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

DECLARE @FIELDS varchar(max)
DECLARE @ASIGNACIONES varchar(max)
DECLARE @UPDATES VARCHAR(MAX)

SET @FIELDS = ''
SET @ASIGNACIONES = ''
SET @UPDATES=''


FETCH FIRST FROM DeclarationCursor 
INTO @ColumnName, @DataType,@IsNullable,@intDateType;
declare @campos int, @firstCampo varchar(100), @firstCampoVO varchar(100)
set @campos=0
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @FieldName = LOWER(SUBSTRING(@ColumnName, 1,1)) + SUBSTRING(@ColumnName, 2, LEN(@ColumnName)-1)


	IF (LEN(@FIELDS)>0) SET @FIELDS=@FIELDS+','
	IF LEN(@ASIGNACIONES)>0 SET @ASIGNACIONES=@ASIGNACIONES+','
	IF LEN(@UPDATES)>0 SET @UPDATES=@UPDATES+','

	IF (LEN(@FIELDS)=0) SET @firstCampo=@ColumnName
	IF (LEN(@FIELDS)=0) SET @firstCampoVO=REPLACE(@FieldName,'_','')


    SET @FIELDS = @FIELDS + '[' + @ColumnName + ']'
	SET @ASIGNACIONES = @ASIGNACIONES + '@' + REPLACE(@FieldName,'_','') 
	SET @UPDATES = @UPDATES + @ColumnName+'=@' + REPLACE(@FieldName,'_','') 
	

    FETCH NEXT FROM DeclarationCursor 
    INTO @ColumnName, @DataType,@IsNullable,@intDateType;
END

PRINT 'Public Sub Insertar(cn As SqlConnection, VO As '+@VOName+', Optional tran As SqlTransaction = Nothing) Implements IDAOContract(Of '+@VOName+').Insertar'
print ''
PRINT '        Const strSQL As String = " INSERT INTO '+@TableName+' ('+@FIELDS+')  " + _'
PRINT '                                 " VALUES ( '+@ASIGNACIONES+') " + _ '
PRINT '                                 " ;Select Scope_Identity()" '
PRINT ''
PRINT '        Using cmd As New SqlCommand(strSQL, cn, tran)'
PRINT '            EstablecerParametros(cmd, VO)'
PRINT '            ''Obtengo el id autonumérico que me generó la BD, uso el Scope_Identity'
PRINT '            VO.id_LO_QUE_SEA_CAMBIAR = CType(cmd.ExecuteScalar(), Integer)'
PRINT '        End Using'
PRINT ''
PRINT 'End Sub'

PRINT ''; 

PRINT 'Public Sub Actualizar(cn As SqlConnection, VO As '+@VOName+', Optional tran As SqlTransaction = Nothing)  Implements IDAOContract(Of '+@VOName+').Actualizar'
print ''
PRINT '        Const strSQL As String = " UPDATE '+@TableName+' SET " + _'
PRINT '                                 " '+ @UPDATES +' " + _ '
PRINT '									" WHERE '+@firstCampo+'=@'+@firstCampoVO+' " ''falta implementar la clave '

PRINT '        Using cmd As New SqlCommand(strSQL, cn, tran)'
PRINT '            EstablecerParametros(cmd, VO)
				  cmd.Parameters.AddWithValue("@'+@firstCampoVO+'", '+@firstCampoVO+')
					'
PRINT '            cmd.ExecuteNonQuery()			'
PRINT '        End Using'
PRINT ''
PRINT 'End Sub'

print 'Public Function Obtener(cn As SqlConnection, cantidadDeRegistros As Integer, pagina As Integer, Optional tran As SqlTransaction = Nothing) As IEnumerable(Of  '+@VOName+') Implements IDAOContract(Of  '+@VOName+').Obtener'
print ''
print '			Const criterioOrdenacion As String = " Order by t.'+@firstCampo+' Desc"	    '
print ''
PRINT '			Const strSQL As String = " SELECT '+@FIELDS+'  " + _ '
print '									" FROM '+@TableName+' t " '
print '			'
print '      Dim LDev As List(Of '+@VOName+') = Nothing '
print '		  '
print '		  ''si me ha solicitado paginar la consulta
        If cantidadDeRegistros > 0 Then strSQL = EnvolverSQLEnPaginacionEfectiva(strSQL, cantidadDeRegistros, pagina, criterioOrdenacion) '

print '	    Using cmd As New SqlCommand(strSQL, cn, tran) '
print '           
            If cantidadDeRegistros > 0 Then
                cmd.Parameters.AddWithValue("@pagina", pagina)
                cmd.Parameters.AddWithValue("@regsPorPagina", cantidadDeRegistros)
            End If
            Using dr As IDataReader = cmd.ExecuteReader()
                While dr.Read()
                    If LDev Is Nothing Then LDev = New List(Of '+@VOName+')
                    LDev.Add(ObtenerVO(dr))
                End While
            End Using
        End Using
        Return LDev																																																								'
print 'End Function																																																					   '
print '																																																									 '
print 'Public Function Obtener(cn As SqlConnection, id As Integer, Optional tran As SqlTransaction = Nothing) As NotificacionVO Implements IDAOContract(Of NotificacionVO).Obtener														'
print '																																																									  '
print 'End Function																																																						 '

DECLARE @AUX_STR VARCHAR(200)	


	FETCH FIRST FROM DeclarationCursor 
	INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	PRINT '';
	PRINT ' Private Sub EstablecerParametros(cmd As SqlCommand, VO As '+@VoName+')'	
	PRINT '     With VO';
	WHILE @@FETCH_STATUS = 0
	BEGIN
			SET @FieldName = SUBSTRING(@ColumnName, 1,1) + SUBSTRING(@ColumnName, 2, LEN(@ColumnName)-1)
			PRINT '			cmd.Parameters.AddWithValue("@'+REPLACE(@FieldName,'_','')+'", .'+REPLACE(@FieldName,'_','')+') '

	    FETCH NEXT FROM DeclarationCursor 
	    INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	END
	PRINT '		 End With';
	PRINT '	';   
	PRINT '	';
    print '	End Sub';

	PRINT '';

	FETCH FIRST FROM DeclarationCursor 
	INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	PRINT '';
	PRINT 'Private Function ObtenerVO(ByVal dr As SqlDataReader) As '+ @VoName;
	PRINT '	Dim VO As New '+@VoName;
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




CLOSE DeclarationCursor;
DEALLOCATE DeclarationCursor;

-- End of Class
PRINT 'End Class';