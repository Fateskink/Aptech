using ECommerceApp.Models;
using ECommerceApp.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Linq;


namespace ECommerceApp.Controllers
{
    public class UserController : Controller
    {
        private readonly ECommerceDbContext _context;
        public UserController(ECommerceDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            _context.GenerateFakedProducts();
            return View();
        }
        [HttpGet]
        public IActionResult Login()
        {           
            return View(new UserViewModel()); //Views/User/Login.cshtml
        }

        [HttpPost]
        public IActionResult Login(UserViewModel model)
        {            
            return View(model);//Views/User/Login.cshtml
        }
    }
}
