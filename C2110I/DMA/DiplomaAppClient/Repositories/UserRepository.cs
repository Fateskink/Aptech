using DipplomaApp.Repositories;
using DipplomaAppClient.Models;
using System.Text.Json;

namespace DiplomaAppClient.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly string urlLogin = "https://localhost:7044/api/users/CheckLogin";
        public async Task<User> Login(string username, string password)
        {
            //call api
            string jsonString = await Api.SendGetRequestAsync(urlLogin, new Dictionary<string, string>
            {
                { "username", username },
                { "password", password }
            });
            return JsonSerializer.Deserialize<User>(jsonString);            
        }
    }
}
