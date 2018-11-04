sp_CONFIGURE 'show advanced', 1
GO
RECONFIGURE
GO
sp_CONFIGURE 'Database Mail XPs', 0
GO
RECONFIGURE
GO
sp_configure 'show advanced', 0
RECONFIGURE
GO
sp_configure
