using myapp.Models;

namespace myapp
{
    public class UserService
    {
        private readonly ApplicationDbContext _dbContext;

        public UserService(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public List<User> GetAllUsers()
        {
            return _dbContext.Users.ToList();
        }

        public User GetUserById(int id)
        {
            return _dbContext.Users.Find(id);
        }
    }
}
