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

SET @TableName ='sorde_diagnosticos'	
set @VOName='sordeDT'
SET @DAOName='IdentDAO' 




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
DECLARE @PlantillaNullablestring varchar(200)
--set @PlantillaNullables ='dr.GetNullable(Of ##TIPO_NET##)("##CAMPO_BD##")'
set @PlantillaNullables ='(dr["##CAMPO_BD##"]==DBNull.Value)? ((##TIPO_NET##?)null) : (##TIPO_NET##?)dr["##CAMPO_BD##"]'
set @PlantillaNullablestring ='(dr["##CAMPO_BD##"]==DBNull.Value)? null : (##TIPO_NET##)dr["##CAMPO_BD##"]'

--SET @NewLine = char(13)

-- Start Output
--PRINT '' + @NewLine;
PRINT 'public class '+ @DAOName;
PRINT '{';
PRINT ''; 
PRINT '#region "Constructors"';
PRINT '';
PRINT '    public '+@DAOName+'(){}';

PRINT '';

PRINT '#endregion';


-- Declarations
DECLARE DeclarationCursor CURSOR SCROLL FOR 
    SELECT
        columns.name [ColumnName],
        CASE 
            WHEN columns.system_type_id = 34    THEN 'byte[]'
            WHEN columns.system_type_id = 35    THEN 'string'
            WHEN columns.system_type_id = 36    THEN 'System.Guid'
            WHEN columns.system_type_id = 48    THEN 'byte'
            WHEN columns.system_type_id = 52    THEN 'Short'
            WHEN columns.system_type_id = 56    THEN 'int'
            WHEN columns.system_type_id = 58    THEN 'System.DateTime'
            WHEN columns.system_type_id = 59    THEN 'float'
            WHEN columns.system_type_id = 60    THEN 'decimal'
            WHEN columns.system_type_id = 61    THEN 'System.DateTime'
            WHEN columns.system_type_id = 62    THEN 'double'
            WHEN columns.system_type_id = 98    THEN 'Object'
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
            WHEN columns.system_type_id = 189   THEN 'Long'
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
    SET @FieldName = LOWER(SUBstring(@ColumnName, 1,1)) + SUBstring(@ColumnName, 2, LEN(@ColumnName)-1)


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

PRINT 'public void Insertar(SqlConnection cn, '+@VOName+' vo, SqlTransaction tran= null) '
print '{'
PRINT '        const string strSQL = " INSERT INTO ('+@TableName+' ('+@FIELDS+')  " + '
PRINT '                                 " VALUES ( '+@ASIGNACIONES+') " +  '
PRINT '                                 " ;Select Scope_Identity()" ;'
PRINT ''
PRINT '        using (SqlCommand cmd = new SqlCommand(strSQL, cn, tran)) '
PRINT '        {    EstablecerParametros(cmd, vo);'
PRINT '            //Obtengo el id autonumérico que me generó la BD, uso el Scope_Identity'
PRINT '            vo.id_LO_QUE_SEA_CAMBIAR = (typeof(vo.id_LO_QUE_SEA_CAMBIAR))cmd.ExecuteScalar();'
PRINT '        }'
PRINT ''
PRINT '}'

PRINT ''; 

PRINT 'public void Actualizar(SqlConnection cn, '+@VOName+' vo, SqlTransaction tran= null)  '
print '{'
PRINT '        const string strSQL =  " UPDATE '+@TableName+' SET " + '
PRINT '                                 " '+ @UPDATES +' " +  '
PRINT '									" WHERE '+@firstCampo+'=@'+@firstCampoVO+' "; //''falta implementar la clave '

PRINT '        using (SqlCommand cmd = new SqlCommand(strSQL, cn, tran)) '
PRINT '        {  EstablecerParametros(cmd, vo);
				  cmd.Parameters.AddWithValue("@'+@firstCampoVO+'", vo.'+@firstCampoVO+');
					'
PRINT '            cmd.ExecuteNonQuery();			'
PRINT '        }'
PRINT ''
PRINT '}'

print 'public IList<'+@VOName+'> Obtener(SqlConnection cn, SqlTransaction tran=null) '
print '{'

print ''
PRINT '			const string strSQL = " SELECT '+@FIELDS+'  " +  '
print '									" FROM '+@TableName+' t " ;'
print '			'
print '      List<'+@VOName+'> lDev = null ;'
    
PRINT '        using (SqlCommand cmd = new SqlCommand(strSQL, cn, tran)) '
PRINT '        {       
            
					 using (IDataReader dr  = cmd.ExecuteReader())
					{	while(dr.Read())
						{
							if(lDev==null) lDev = new List<'+@VOName+'>();
							lDev.Add(ObtenerVO(dr));
						}
					}
				}
        return lDev;																																																								'
print '}'
print '																																																									 '
--print 'Public Function Obtener(cn As SqlConnection, id As int, Optional tran As SqlTransaction = Nothing) As NotificacionVO Implements IDAOContract(Of NotificacionVO).Obtener														'
--print '																																																									  '
--print 'End Function																																																						 '

DECLARE @AUX_STR VARCHAR(200)	


	FETCH FIRST FROM DeclarationCursor 
	INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	PRINT '';
	PRINT ' private void EstablecerParametros(SqlCommand cmd,'+@VoName+' vo ){'	
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
			SET @FieldName = SUBstring(@ColumnName, 1,1) + SUBstring(@ColumnName, 2, LEN(@ColumnName)-1)
			PRINT '			cmd.Parameters.AddWithValue("@'+REPLACE(@FieldName,'_','')+'", vo.'+REPLACE(@FieldName,'_','')+'); '

	    FETCH NEXT FROM DeclarationCursor 
	    INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	END

	PRINT '	';   
	PRINT '	';
    print '	}';

	PRINT '';

	FETCH FIRST FROM DeclarationCursor 
	INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	PRINT '';
	PRINT '  private '+ @VoName +' ObtenerVO(IDataReader dr) { ';
	PRINT '		'+ @VoName +' vo = new '+@VoName+'();';
	print '';
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
	    --SET @FieldName = LOWER(SUBstring(@ColumnName, 1,1)) + SUBstring(@ColumnName, 2, LEN(@ColumnName)-1)
		SET @FieldName = SUBstring(@ColumnName, 1,1) + SUBstring(@ColumnName, 2, LEN(@ColumnName)-1)
		if @IsNullable=1 and @intDateType not in (34,35,98,99,165,167,173,175,231,239,241)
		BEGIN
					
			SET @AUX_STR=REPLACE(@PlantillaNullables,'##TIPO_NET##',@DataType)
			SET @AUX_STR=REPLACE(@AUX_STR,'##CAMPO_BD##',@FieldName)
			PRINT '			vo.'+REPLACE(@FieldName,'_','')+' = '+@AUX_STR+';';
			--PRINT '			.'+REPLACE(@FieldName,'_','')+' = dr.GetNullable(Of '+@DataType+')("'+@FieldName+'")';
		END		   
		ELSE IF @IsNullable=1 and @intDateType in (35,99,167,175,231,239,241)
		BEGIN
			--@PlantillaNullablestring
					
			SET @AUX_STR=REPLACE(@PlantillaNullablestring,'##TIPO_NET##',@DataType)
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




	FETCH FIRST FROM DeclarationCursor 
	INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	PRINT '';
	PRINT '  private '+ @VoName +' AuxCrearTable() { ';
	--PRINT '		'+ @VoName +' dt = new Data();';
	print '    DataTable dt'+ @VoName +' = new DataTable("'+ @VoName +'");
            DataColumn column;
            DataRow row;
            row = dtPrueba.NewRow();'


	print '';
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
	print '
            column = new DataColumn();
            column.DataType = System.Type.GetType("'+@DataType+'");
            column.ColumnName = "'+@FieldName+'";
            dtPrueba.Columns.Add(column);
            row["'+@FieldName+'"] = txt'+@FieldName+'.Text.Trim();'

	 --   --SET @FieldName = LOWER(SUBstring(@ColumnName, 1,1)) + SUBstring(@ColumnName, 2, LEN(@ColumnName)-1)
		--SET @FieldName = SUBstring(@ColumnName, 1,1) + SUBstring(@ColumnName, 2, LEN(@ColumnName)-1)
		--if @IsNullable=1 and @intDateType not in (34,35,98,99,165,167,173,175,231,239,241)
		--BEGIN
					
		--	SET @AUX_STR=REPLACE(@PlantillaNullables,'##TIPO_NET##',@DataType)
		--	SET @AUX_STR=REPLACE(@AUX_STR,'##CAMPO_BD##',@FieldName)
		--	PRINT '			vo.'+REPLACE(@FieldName,'_','')+' = '+@AUX_STR+';';
		--	--PRINT '			.'+REPLACE(@FieldName,'_','')+' = dr.GetNullable(Of '+@DataType+')("'+@FieldName+'")';
		--END		   
		--ELSE IF @IsNullable=1 and @intDateType in (35,99,167,175,231,239,241)
		--BEGIN
		--	--@PlantillaNullablestring
					
		--	SET @AUX_STR=REPLACE(@PlantillaNullablestring,'##TIPO_NET##',@DataType)
		--	SET @AUX_STR=REPLACE(@AUX_STR,'##CAMPO_BD##',@FieldName)
		--	PRINT '			vo.'+REPLACE(@FieldName,'_','')+' = '+@AUX_STR+';';
		--END
		--ELSE
		
       
		--	PRINT '			vo.'+REPLACE(@FieldName,'_','')+' = (string)dr["'+@FieldName+'"];';
		
		----SET @FIELDS = @FIELDS + 'ByVal ' + @FieldName + ' as ' + @DataType + ', '
		----SET @ASIGNACIONES = @ASIGNACIONES + 'Me.'+@FieldName+'='+@FieldName+ ' : '
	    FETCH NEXT FROM DeclarationCursor 
	    INTO @ColumnName, @DataType,@IsNullable,@intDateType;
	END
	
	PRINT '	';
    print '	    return '+ @VoName +';';
	PRINT '	';
    print '}';


CLOSE DeclarationCursor;
DEALLOCATE DeclarationCursor;

-- End of Class
PRINT '}';