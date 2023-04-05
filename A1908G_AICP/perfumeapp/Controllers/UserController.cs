using Microsoft.AspNetCore.Mvc;

namespace perfumeapp.Controllers
{
    public class UserController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Register()
        {
            return View();//Register.cshml
        }
    }
}
