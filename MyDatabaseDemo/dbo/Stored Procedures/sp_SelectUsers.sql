
CREATE PROCEDURE [dbo].[sp_SelectUsers]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT u.UserID, u.Name
	FROM dbo.[User] u
END