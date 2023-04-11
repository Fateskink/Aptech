using myapp.Models;

namespace myapp.GraphQL
{
    public class Query
    {
        public List<User> GetAllUsers([Service] UserService userService)
        {
            return userService.GetAllUsers();
        }

        public User GetUserById(int id, [Service] UserService userService)
        {
            return userService.GetUserById(id);
        }
    }
}
