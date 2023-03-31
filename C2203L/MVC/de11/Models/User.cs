namespace de11.Models
{
    public class User
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
/*
USE C2203L;
CREATE TABLE Users(
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(100),
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PASSWORD NVARCHAR(100) NOT NULL    
);
 */