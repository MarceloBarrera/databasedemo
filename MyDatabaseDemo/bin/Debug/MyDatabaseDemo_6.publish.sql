﻿/*
Deployment script for ProdDatabase

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "ProdDatabase"
:setvar DefaultFilePrefix "ProdDatabase"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key 8b094a10-7bc9-4aea-92be-e9f5a41af95d is skipped, element [dbo].[User].[EmailAddress] (SqlSimpleColumn) will not be renamed to [Email]';


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8b094a10-7bc9-4aea-92be-e9f5a41af95d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8b094a10-7bc9-4aea-92be-e9f5a41af95d')

GO

GO
DECLARE @Version int
SET @Version = 2 -- update each time we have a new version
IF (EXISTS (SELECT TOP 1 1 FROM dbo.Settings WHERE Name = 'Version'))
BEGIN
	UPDATE dbo.Settings
	SET Value = @Version
	WHERE Name = 'Version'
END
ELSE
BEGIN
	INSERT dbo.Settings (Name, Value)
	VALUES ('Version', @Version)
END
GO

GO
PRINT N'Update complete.';


GO