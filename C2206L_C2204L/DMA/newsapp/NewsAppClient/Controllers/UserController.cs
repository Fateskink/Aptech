using Microsoft.AspNetCore.Mvc;
using NewsAppClient.Models;
using Newtonsoft.Json.Linq;
using System.Diagnostics;
using System.Net.Http;

namespace NewsAppClient.Controllers
{
    public class UserController : Controller
    {
        private readonly ILogger<UserController> _logger;
        private readonly IHttpClientFactory _httpClientFactory;        
        private String urlLogin = "https://localhost:7175/api/User/CheckLogin";

        public UserController(ILogger<UserController> logger, IHttpClientFactory httpClientFactory)
        {
            _logger = logger;
            _httpClientFactory = httpClientFactory;
        }

        public IActionResult Index()
        {
            ViewBag.UserName = HttpContext.Session.GetString("UserName") ?? "";
            ViewBag.Password = HttpContext.Session.GetString("Password") ?? "";
            return View();//Views/Index.cshtml
        }

        public async Task<IActionResult> Login(string UserName, string Password, string RememberPassword)
        {
            //call api
            if (RememberPassword != null) {
                HttpContext.Session.SetString("UserName", UserName);
                HttpContext.Session.SetString("Password", Password);                
            }
            var client = _httpClientFactory.CreateClient();

            var content = new StringContent("", System.Text.Encoding.UTF8, "text/plain");            
            var response = await client.PostAsync($"{urlLogin}?userName={UserName}&password={Password}", content);

            if (response.IsSuccessStatusCode) //check code is 200
            {
                //var responseContent = await response.Content.ReadAsStringAsync();

                //return Content(responseContent, "text/plain");
                return RedirectToAction("GetAllUsers");                
            }
            else { 

            }
            return View();//Views/Index.cshtml
        }
        public async Task<IActionResult> GetAllUsers() {
            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}