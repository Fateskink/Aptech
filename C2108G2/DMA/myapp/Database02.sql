USE UserManagementAPI;
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
    INSERT INTO users (username, hashed_password, email, phone, full_name, date_of_birth, country)
    VALUES (@username, dbo.HashPassword(@password), @email, @phone, @full_name, @date_of_birth, @country);
END;

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