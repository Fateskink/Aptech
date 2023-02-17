using DiplomaClient.Controllers;
using DiplomaClient.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;

namespace DiplomaClient.Repositories
{
    public class UsersRepository
    {
        public User Login(string username, string password) {
            string jsonString = Api.SendPostRequest(Api.urlLogin(username, password), "");
            Dictionary<string, string> dictionary = JsonConvert
                .DeserializeObject<Dictionary<string, string>>(jsonString);
            //something more ...
            return User.FromJSON(dictionary);            
        }
    }
}