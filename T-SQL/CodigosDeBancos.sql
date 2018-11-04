SET ANSI_NULLS ON
 
GO
 
SET QUOTED_IDENTIFIER ON
 
GO
 
SET ANSI_PADDING ON
 
GO
 
CREATE TABLE [dbo].[tipoBIC](
 
[idTipo] [int] IDENTITY(1,1) NOT NULL,
 
[bic] [varchar](100) NOT NULL,
 
[denominacion] [varchar](250) NOT NULL,
 
[codigo] [varchar](10) NOT NULL,
 
CONSTRAINT [PK_tipoBIC] PRIMARY KEY CLUSTERED
 
(
 
[idTipo] ASC
 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
 
) ON [PRIMARY]
 
GO
 
SET ANSI_PADDING OFF
 
GO
 
SET IDENTITY_INSERT [dbo].[tipoBIC] ON
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (1, N'ABNAESMMXXX', N'THE ROYAL BANK OF SCOTLAND PLC, SUCURSAL EN ESPAÑA', N'0156')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (2, N'AHCFESMMXXX', N'AHORRO CORPORACION FINANCIERA, S.A., SOCIEDAD DE', N'3524')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (3, N'ALCLESMMXXX', N'BANCO ALCALA, S.A.', N'0188')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (4, N'AREBESMMXXX', N'ARESBANK, S.A.', N'0136')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (5, N'BAPUES22XXX', N'BANCA PUEYO, S.A.', N'0078')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (6, N'BARCESMMXXX', N'BARCLAYS BANK, S.A.', N'0065')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (7, N'BASKES2BXXX', N'KUTXABANK, S.A.', N'2095')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (8, N'BBPIESMMXXX', N'BANCO BPI, S.A., SUCURSAL EN ESPAÑA', N'0190')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (9, N'BBRUESMXXXX', N'ING BELGIUM, S.A., SUCURSAL EN ESPAÑA', N'0168')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (10, N'BBVAESMMXXX', N'BANCO BILBAO VIZCAYA ARGENTARIA, S.A.', N'0182')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (11, N'BCOEESMM081', N'CAJA RURAL DE CASTILLA-LA MANCHA, S.C.C.', N'3081')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (12, N'BCOEESMMXXX', N'BANCO COOPERATIVO ESPAÑOL, S.A.', N'0198')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (13, N'BESMESMMXXX', N'BANCO ESPIRITO SANTO, S.A., SUCURSAL EN ESPAÑA', N'0131')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (14, N'BFASESMMXXX', N'BANCO FINANCIERO Y DE AHORROS, S.A.', N'0488')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (15, N'BFIVESBBXXX', N'BANCO MEDIOLANUM, S.A.', N'0186')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (16, N'BKBKESMMXXX', N'BANKINTER, S.A.', N'0128')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (17, N'BKOAES22XXX', N'BANKOA, S.A.', N'0138')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (18, N'BMARES2MXXX', N'BANCA MARCH, S.A.', N'0061')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (19, N'BMCEESMMXXX', N'BANQUE MAROCAINE COMMERCE EXTERIEUR INTERNATIONAL,', N'0219')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (20, N'BNPAESMHXXX', N'BNP PARIBAS, SUCURSAL EN ESPAÑA', N'0149')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (21, N'BNPAESMZXXX', N'BNP PARIBAS ESPAÑA, S.A.', N'0058')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (22, N'BOTKESMXXXX', N'THE BANK OF TOKYO-MITSUBISHI UFJ, LTD, SUCURSAL EN', N'0160')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (23, N'BPLCESMMXXX', N'BARCLAYS BANK PLC, SUCURSAL EN ESPAÑA', N'0152')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (24, N'BRASESMMXXX', N'BANCO DO BRASIL, S.A., SUCURSAL EN ESPAÑA', N'0155')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (25, N'BSABESBBXXX', N'BANCO DE SABADELL, S.A.', N'0081')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (26, N'BSCHESMMXXX', N'BANCO SANTANDER, S.A.', N'0049')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (27, N'BSUIESMMXXX', N'CREDIT AGRICOLE CORPORATE AND INVESTMENT BANK,', N'0154')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (28, N'BVALESMMXXX', N'RBC INVESTOR SERVICES ESPAÑA, S.A.', N'0094')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (29, N'CAGLESMMVIG', N'NCG BANCO, S.A.', N'2080')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (30, N'CAHMESMMXXX', N'BANKIA, S.A.', N'2038')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (31, N'CAIXESBBXXX', N'CAIXABANK, S.A.', N'2100')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (32, N'CAPIESMMXXX', N'CM CAPITAL MARKETS BOLSA, SOCIEDAD DE VALORES, S.A.', N'3604')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (33, N'CASDESBBXXX', N'CAJA DE ARQUITECTOS S.C.C.', N'3183')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (34, N'CAZRES2ZXXX', N'IBERCAJA BANCO, S.A.', N'2085')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (35, N'CCOCESMMXXX', N'BANCO CAMINOS, S.A.', N'0234')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (36, N'CCRIES2AXXX', N'CAJAS RURALES UNIDAS, S.C.C.', N'3058')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (37, N'CDENESBBXXX', N'CAIXA DE CREDIT DELS ENGINYERS - CAJA DE CREDITO DE LOS', N'3025')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (38, N'CECAESMM045', N'CAJA DE AHORROS Y M.P. DE ONTINYENT', N'2045')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (39, N'CECAESMM048', N'LIBERBANK, S.A.', N'2048')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (40, N'CECAESMM056', N'COLONYA - CAIXA D''ESTALVIS DE POLLENSA', N'2056')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (41, N'CECAESMM086', N'BANCO GRUPO CAJATRES, S.A.', N'2086')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (42, N'CECAESMMXXX', N'CECABANK, S.A.', N'2000')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (43, N'CESCESBBXXX', N'CATALUNYA BANC, S.A.', N'2013')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (44, N'CGDIESMMXXX', N'BANCO CAIXA GERAL, S.A.', N'0130')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (45, N'CITIES2XXXX', N'CITIBANK ESPAÑA, S.A.', N'0122')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (46, N'CITIESMXSEC', N'CITIBANK INTERNATIONAL PLC, SUCURSAL EN ESPAÑA', N'1474')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (47, N'CLPEES2MXXX', N'CAJA LABORAL POPULAR, C.C.', N'3035')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (48, N'COBAESMXTMA', N'COMMERZBANK AKTIENGESELLSCHAFT, SUCURSAL EN', N'0159')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (49, N'CRESESMMXXX', N'CREDIT SUISSE AG, SUCURSAL EN ESPAÑA', N'1460')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (50, N'CSPAES2L108', N'BANCO DE CAJA ESPAÑA DE INVERSIONES, SALAMANCA Y', N'2108')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (51, N'CSSOES2SFIN', N'FINANDUERO, SOCIEDAD DE VALORES, S.A.', N'3656')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (52, N'CSURES2CXXX', N'CAJASUR BANCO, S.A', N'0237')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (53, N'DEUTESBBASS', N'DEUTSCHE BANK, S.A.E.', N'0019')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (54, N'DSBLESMMXXX', N'DEXIA SABADELL, S.A.', N'0231')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (55, N'EHYPESMXXXX', N'HYPOTHEKENBANK FRANKFURT AG. SUCURSAL EN ESPAÑA', N'1467')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (56, N'ESPBESMMXXX', N'BANCO DE ESPAÑA', N'9000')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (57, N'ESSIESMMXXX', N'BANCO ESPIRITO SANTO DE INVESTIMENTO, S.A., SUCURSAL', N'1497')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (58, N'ETCHES2GXXX', N'BANCO ETCHEVERRIA, S.A.', N'0031')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (59, N'GALEES2GXXX', N'BANCO GALLEGO, S.A.', N'0046')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (60, N'GBMNESMMXXX', N'BANCO MARE NOSTRUM, S.A.', N'0487')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (61, N'GEBAESMMBIL', N'BNP PARIBAS FORTIS, S.A., N.V., SUCURSAL EN ESPAÑA', N'0167')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (62, N'GVCBESBBETB', N'GVC GAESCO VALORES, SOCIEDAD DE VALORES, S.A.', N'3682')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (63, N'IBRCESMMXXX', N'SOCIEDAD DE GESTION DE LOS SISTEMAS DE REGISTRO,', N'9096')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (64, N'ICROESMMXXX', N'INSTITUTO DE CREDITO OFICIAL', N'1000')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (65, N'INGDESMMXXX', N'ING DIRECT, N.V., SUCURSAL EN ESPAÑA', N'1465')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (66, N'INSGESMMXXX', N'INVERSEGUROS, SOCIEDAD DE VALORES, S.A.', N'3575')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (67, N'INVLESMMXXX', N'BANCO INVERSIS, S.A.', N'0232')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (68, N'IPAYESMMXXX', N'SOCIEDAD ESPAÑOLA DE SISTEMAS DE PAGO, S.A.', N'9020')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (69, N'IVALESMMXXX', N'INTERMONEY VALORES, SOCIEDAD DE VALORES, S.A.', N'3669')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (70, N'LISEESMMXXX', N'LINK SECURITIES, SOCIEDAD DE VALORES, S.A.', N'3641')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (71, N'LOYIESMMXXX', N'LLOYDS BANK INTERNATIONAL, S.A.U.', N'0236')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (72, N'MADRESMMXXX', N'BANCO DE MADRID, S.A.', N'0059')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (73, N'MEFFESBBXXX', N'MEFF SOCIEDAD RECTORA DE PRODUCTOS DERIVADOS S.A.U.', N'9094')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (74, N'MIDLESMXXXX', N'HSBC BANK PLC, SUCURSAL EN ESPAÑA', N'0162')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (75, N'MISVESMMXXX', N'MAPFRE INVERSION, SOCIEDAD DE VALORES, S.A.', N'3563')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (76, N'MLCEESMMXXX', N'MERRILL LYNCH CAPITAL MARKETS ESPAÑA, S.A., SOCIEDAD', N'3661')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (77, N'NACNESMMXXX', N'BANCO DE LA NACION ARGENTINA, SUCURSAL EN ESPAÑA', N'0169')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (78, N'NATXESMMXXX', N'NATIXIS, S.A., SUCURSAL EN ESPAÑA', N'1479')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (79, N'PARBESMHXXX', N'BNP PARIBAS SECURITIES SERVICES, SUCURSAL EN ESPAÑA', N'0144')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (80, N'POHIESMMXXX', N'TARGOBANK, S.A.', N'0216')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (81, N'POPIESMMXXX', N'POPULAR BANCA PRIVADA, S.A.', N'0233')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (82, N'POPLESMMXXX', N'BANCOPOPULAR-E, S.A.', N'0229')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (83, N'POPUESMMXXX', N'BANCO POPULAR ESPAÑOL, S.A.', N'0075')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (84, N'PRABESMMXXX', N'COOPERATIEVE CENTRALE RAIFFEISEN- BOERENLEENBANK', N'1459')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (85, N'PROAESMMXXX', N'EBN BANCO DE NEGOCIOS, S.A.', N'0211')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (86, N'RENBESMMXXX', N'RENTA 4 BANCO, S.A.', N'0083')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (87, N'RENTESMMXXX', N'RENTA 4 SOCIEDAD DE VALORES, S.A.', N'3501')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (88, N'SOGEESMMAGM', N'SOCIETE GENERALE, SUCURSAL EN ESPAÑA', N'0108')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (89, N'UBIBESMMXXX', N'UBI BANCA INTERNATIONAL, S.A., SUCURSAL EN ESPAÑA', N'1524')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (90, N'UBSWESMMNPB', N'UBS BANK, S.A.', N'0226')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (91, N'UCJAES2MXXX', N'UNICAJA BANCO, S.A.', N'2103')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (92, N'WELAESMMFUN', N'PORTIGON AG, SUCURSAL EN ESPAÑA', N'0196')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (93, N'XBCNESBBXXX', N'SOCIEDAD RECTORA BOLSA VALORES DE BARCELONA, S.A.,', N'9091')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (94, N'XRBVES2BXXX', N'SOCIEDAD RECTORA BOLSA DE VALORES DE BILBAO, S.A.,', N'9092')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (95, N'XRVVESVVXXX', N'SOCIEDAD RECTORA BOLSA VALORES DE VALENCIA, S.A.,', N'9093')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (96, N'CAIXESBBXXX', N'CAIXABANK, S.A.', N'2106')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (97, N'BCOEESMM009', N'CAJA RURAL DE EXTREMADURA', N'3009')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (98, N'BCOEESMM067', N'CAJA RURAL DE JAEN', N'3067')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (99, N'CAIXESBBXXX', N'CAIXABANK, S.A.', N'2065')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (100, N'BCOEESMM017', N'CAJA RURAL DE SORIA', N'3017')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (101, N'CSPAES2LXXX', N'BANCO DE CAJA ESPANA DE INVERSIONES, SALAMANCA Y SORIA, S.A.', N'2096')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (102, N'BSABESBBXXX', N'BANCO DE SABADELL, S.A.', N'2090')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (103, N'CSSOES2SXXX', N'CAJA DE AHORROS DE SALAMANCA Y SORIA (CAJA DUERO)', N'2104')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (104, N'CSURES2CXXX', N'CAJASUR BANCO, S.A.U.', N'2024')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (105, N'BCOEESMM023', N'CAJA RURAL DE GRANADA', N'3023')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (106, N'CECAESMM105', N'BANCO DE CASTILLA-LA MANCHA, S.A.', N'2105')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (107, N'CAIXESBBXXX', N'CAIXABANK, S.A.', N'0093')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (108, N'CAIXESBBXXX', N'CAIXABANK, S.A.', N'2054')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (109, N'BBVAESMMXXX', N'BANCO BILBAO VIZCAYA ARGENTARIA S.A.', N'2107')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (110, N'BASKES2BXXX', N'KUTXABANK, S.A.', N'2097')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (111, N'PSTRESMMXXX', N'BANCO PASTOR S.A.', N'0072')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (112, N'ESPCESMMXXX', N'BANCO SANTANDER S.A. FORMERLY BANCO ESPANOL DE CREDITO', N'0030')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (113, N'CCRIES2AXXX', N'CAJAS RURALES UNIDAS, SOCIEDAD COOPERATIVA DE CREDITO', N'3082')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (114, N'BCOEESMMXXX', N'BANCO COOPERATIVO ESPANOL S.A.', N'3190')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (115, N'CECAESMM051', N'CAJA DE AHORROS Y MONTE DE PIEDAD DE LAS BALEARES', N'2051')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (116, N'CECAESMM099', N'CAJA DE AHORROS Y MONTE DE PIEDAD DE EXTREMADURA', N'2099')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (117, N'CAIXESBBXXX', N'CAIXABANK, S.A.', N'2018')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (118, N'BCOEESMM187', N'CAJA RURAL DEL SUR,SDAD.COOP.CTO (FORMERLY CAJA RURAL DE HUELVA Y SEVI', N'3187')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (119, N'CAHMESMMXXX', N'BANKIA S.A.', N'2052')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (120, N'CECAESMM031', N'CAJA GENERAL DE AHORROS DE GRANADA', N'2031')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (121, N'BCOEESMM191', N'CAJA RURAL DE ARAGON, SOCIEDAD COOPERATIVA DE CREDITO', N'3191')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (122, N'CVRVES2BXXX', N'IPAR KUTXA RURAL, S.C.C.', N'3084')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (123, N'BCOEESMM063', N'CAJA RURAL DE CORDOBA', N'3063')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (124, N'BCOEESMM005', N'CAJA RURAL CENTRAL, S.C.C.', N'3005')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (125, N'BCOEESMM085', N'CAJA RURAL DE ZAMORA', N'3085')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (126, N'BCOEESMM001', N'CAJA RURAL DE ALMENDRALEJO', N'3001')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (127, N'BCOEESMM140', N'CAJA RURAL DE GUISSONA SOCIEDAD COOPERATIVA DE CREDITO', N'3140')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (128, N'CECAESMM086', N'BANCO GRUPO CAJATRES', N'2010')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (129, N'BCOEESMM060', N'CAJA RURAL DE BURGOS, FUENTEPELAYO, SEGOVIA Y CASTELLDANS, S.C.C', N'3060')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (130, N'CCRIES2A029', N'CAJA DE CREDITO DE PETREL,C.R.,CCV', N'3029')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (131, N'CCRIES2A102', N'CAJA RURAL DE SAN VICENTE VALL DUXO', N'3102')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (132, N'CAHMESMMXXX', N'BANKIA S.A.', N'2077')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (133, N'MIKBESB1XXX', N'NUEVO MICRO BANK, S.A.U.', N'0133')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (134, N'BCOEESMM116', N'CAJA RURAL DE MOTA DEL CUERVO', N'3116')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (135, N'BCOEESMM059', N'CAJA RURAL DE ASTURIAS', N'3059')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (136, N'CECAESMM043', N'CAJA DE AHORROS DE MURCIA', N'2043')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (137, N'BAOFESM1XXX', N'BANCOFAR S.A.', N'0125')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (138, N'CCRIES2AXXX', N'CAJAS RURALES UNIDAS, SOCIEDAD COOPERATIVA DE CREDITO', N'3177')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (139, N'BSABESBBXXX', N'BANCO DE SABADELL, S.A.', N'0042')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (140, N'BBVAESMMXXX', N'BANCO BILBAO VIZCAYA ARGENTARIA S.A.', N'2059')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (141, N'BASKES2BXXX', N'KUTXABANK, S.A.', N'2101')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (142, N'BCOEESMM076', N'CAJA SIETE, CAJA RURAL, SCC', N'3076')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (143, N'CAHMESMMXXX', N'BANKIA S.A.', N'2069')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (144, N'CECAESMM066', N'CAJA DE AHORROS DE SANTANDER Y CANTABRIA', N'2066')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (145, N'POPUESMMXXX', N'BANCO POPULAR ESPANOL, S.A.', N'0082')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (146, N'BSABESBBXXX', N'BANCO DE SABADELL, S.A.', N'2081')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (147, N'BCOEESMM127', N'CAJA RURAL CASAS IBANEZ SDAD. COOP.', N'3127')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (148, N'BCOEESMM007', N'CAJA RURAL DE GIJON', N'3007')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (149, N'BCOEESMM113', N'CAIXA RURAL LALCORA', N'3113')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (150, N'BCOEESMM008', N'CAJA RURAL DE NAVARRA', N'3008')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (151, N'BCOEESMM016', N'CAJA RURAL DE SALAMANCA', N'3016')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (152, N'CAGLESMMXXX', N'NCG BANCO S.A.', N'2091')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (153, N'POPUESMMXXX', N'BANCO POPULAR ESPANOL, S.A.', N'0004')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (154, N'BCOEESMM080', N'CAJA RURAL DE TERUEL', N'3080')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (155, N'BCOEESMM070', N'CAIXA RURAL GALEGA', N'3070')
INSERT [dbo].[tipoBIC] ([idTipo], [bic], [denominacion], [codigo]) VALUES (156, N'PSTRESMMXXX', N'BANCO PASTOR, S.A.', N'0238')
SET IDENTITY_INSERT [dbo].[tipoBIC] OFF