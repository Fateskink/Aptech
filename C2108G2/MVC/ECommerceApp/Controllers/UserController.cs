using ECommerceApp.Models;
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
            return View();
        }
    }
}
