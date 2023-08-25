using Microsoft.AspNetCore.Mvc;
using NewsAppClient.Models;
using System.Diagnostics;
using System.Net.Http;

namespace NewsAppClient.Controllers
{
    public class UserController : Controller
    {
        private readonly ILogger<UserController> _logger;
        private readonly IHttpClientFactory _httpClientFactory;

        public UserController(ILogger<UserController> logger, IHttpClientFactory httpClientFactory)
        {
            _logger = logger;
            _httpClientFactory = httpClientFactory;
        }

        public IActionResult Index()
        {
            return View();//Views/Index.cshtml
        }

        public IActionResult Login(string UserName, string Password, string RememberPassword)
        {
            //call api
            return View();//Views/Index.cshtml
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