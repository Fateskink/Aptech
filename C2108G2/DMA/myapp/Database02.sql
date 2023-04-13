USE UserManagementAPI;

CREATE PROCEDURE GetAllProceduresAndFunctions
    @ObjectName NVARCHAR(128)
AS
BEGIN
    SELECT
        o.[type_desc] AS ObjectType,
        s.[name] AS SchemaName,
        o.[name] AS ObjectName,
        p.[ordinal_position] AS ParameterId,
        p.[parameter_name] AS ParameterName,
        p.[data_type] AS DataType,
        p.[character_maximum_length] AS MaxLength,
        p.[numeric_precision] AS Precision,
        p.[numeric_scale] AS Scale,
        p.[parameter_mode] AS ParameterMode
    FROM sys.objects o
    JOIN sys.schemas s ON o.schema_id = s.schema_id
    LEFT JOIN INFORMATION_SCHEMA.PARAMETERS p ON s.[name] = p.SPECIFIC_SCHEMA AND o.[name] = p.SPECIFIC_NAME
    WHERE o.[type] IN ('P', 'FN', 'IF', 'TF', 'FS', 'FT') AND o.[name] = @ObjectName
    ORDER BY s.[name], o.[name], p.[ordinal_position];
END;


EXEC GetAllProceduresAndFunctions @ObjectName = 'YourProcedureOrFunctionName';
--DROP PROCEDURE IF EXISTS GetAllProceduresAndFunctions;


CREATE FUNCTION HashPassword (@password NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
    -- Replace with the actual hashing function you want to use
    RETURN CONVERT(NVARCHAR(255), HASHBYTES('SHA2_256', @password), 2);
END;

CREATE PROCEDURE RegisterUser
    @username NVARCHAR(50),
    @password NVARCHAR(255),
    @email NVARCHAR(255),
    @phone NVARCHAR(20),
    @full_name NVARCHAR(255),
    @date_of_birth DATE,
    @country NVARCHAR(255)
AS
BEGIN
    DECLARE @InsertedRows AS TABLE (
        user_id INT,
        username NVARCHAR(50),
        hashed_password NVARCHAR(255),
        email NVARCHAR(255),
        phone NVARCHAR(20),
        full_name NVARCHAR(255),
        date_of_birth DATE,
        country NVARCHAR(255)
    );

    INSERT INTO users (username, hashed_password, email, phone, full_name, date_of_birth, country)
    OUTPUT INSERTED.user_id, INSERTED.username, INSERTED.hashed_password, INSERTED.email, INSERTED.phone, INSERTED.full_name, INSERTED.date_of_birth, INSERTED.country
    INTO @InsertedRows
    VALUES (@username, dbo.HashPassword(@password), @email, @phone, @full_name, @date_of_birth, @country);

    SELECT * FROM @InsertedRows;
END;

DROP PROCEDURE IF EXISTS RegisterUser;

CREATE PROCEDURE LoginUser
    @login NVARCHAR(255),
    @password NVARCHAR(255),
    @device_id NVARCHAR(255)
AS
BEGIN
    DECLARE @user_id INT;
    DECLARE @token NVARCHAR(255);
    DECLARE @hashed_password NVARCHAR(255) = dbo.HashPassword(@password);
    DECLARE @device_count INT;

    SELECT @user_id = user_id
    FROM users
    WHERE (username = @login OR email = @login) AND hashed_password = @hashed_password;

    IF @user_id IS NOT NULL
    BEGIN
        SELECT @device_count = COUNT(*)
        FROM user_devices
        WHERE user_id = @user_id;

        IF @device_count < 3
        BEGIN
            SET @token = NEWID();
            INSERT INTO user_devices (user_id, device_id, token, token_expiration)
            VALUES (@user_id, @device_id, @token, DATEADD(day, 30, GETDATE()));

            SELECT @token AS token, DATEADD(day, 30, GETDATE()) AS token_expiration;
        END
        ELSE
        BEGIN
            PRINT 'User has reached the maximum number of devices (3).';
        END
    END
    ELSE
    BEGIN
        PRINT 'Invalid login or password.';
    END
END;

CREATE FUNCTION IsTokenExpired
    (@user_id INT, @token NVARCHAR(255))
RETURNS BIT
AS
BEGIN
    DECLARE @token_expiration DATETIME;

    SELECT @token_expiration = token_expiration
    FROM user_devices
    WHERE user_id = @user_id AND token = @token;

    IF @token_expiration IS NULL OR @token_expiration < GETDATE()
        RETURN 1;
    ELSE
        RETURN 0;
    RETURN 0;
END;