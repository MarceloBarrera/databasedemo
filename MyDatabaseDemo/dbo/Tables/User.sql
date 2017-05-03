CREATE TABLE [dbo].[User] (
    [UserID] BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (200) NOT NULL,
    [Email]  NVARCHAR (256) NOT NULL,
    [Status] NVARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);

