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
