using de11.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Security.Cryptography;
using System.Text;

namespace de11.Controllers
{
    public class UserController : Controller
    {
        
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Login() { 
            LoginViewModel loginViewModel = new LoginViewModel { 
                Email = "",
                Password = ""
            };
            return View(loginViewModel);
        }
        [HttpGet]
        public IActionResult Register()
        {
            RegisterViewModel registerViewModel = new RegisterViewModel
            {
                Email = "",
                Password = "",
                RetypePassword = "",
                UserName= "",
            };
            return View(registerViewModel);
        }

        [HttpPost]
        public IActionResult Register(RegisterViewModel registerViewModel)
        {
            bool success = true;
            
            if (success == true) {
                return RedirectToAction("Login", "User");
            }
            return View(registerViewModel);
        }


        [HttpPost]
        public IActionResult Login(LoginViewModel userViewModel) { 
            bool success = true;
            if (success == true)
            {
                return RedirectToAction("Index", "Employee");
            }
            else { 
                return View(userViewModel);
            }
            
        }
        public IActionResult InputName(string name)
        {
            ViewBag.Name = name ?? "";
            string[] arrayOfWords = ViewBag.Name.Split(new char[] { ' ' },
                                    StringSplitOptions.RemoveEmptyEntries);
            ViewBag.ColorText = "";
            foreach (var word in arrayOfWords)
            {
                var newWord = $"<span style=\"color:red;\">" + word[0] 
                    + "</span>" + word.Substring(1);
                ViewBag.ColorText = ViewBag.ColorText + newWord + " ";
            }

            return View();
        }
        public IActionResult ShowDetailDay(string day = "")
        {
            string message = "";
            
            if (day.ToLower().Equals("monday")) {
                message = "Laugh on Monday, laugh for danger";
            } else if (day.ToLower().Equals("tuesday"))
            {
                message = "Laugh on Tuesday, kiss a stranger.";
            }
            else if (day.ToLower().Equals("wednesday"))
            {
                message = "Laugh on Wednesday, laugh for a letter.";
            }
            else if (day.ToLower().Equals("thursday"))
            {
                message = "Laugh on Thursday, something better.";
            }
            else if (day.ToLower().Equals("friday"))
            {
                message = "Laugh on Friday, laugh for sorrow.";
            }
            else if (day.ToLower().Equals("saturday"))
            {
                message = "Laugh on Saturday, joy tomorrow.";
            }
            ViewBag.Message = message;
            return View();
        }
        public static string CalculateSHA1(string text)
        {
            byte[] buffer = Encoding.UTF8.GetBytes(text);
            SHA1CryptoServiceProvider cryptoTransformSHA1 = new SHA1CryptoServiceProvider();
            return BitConverter.ToString(cryptoTransformSHA1.ComputeHash(buffer)).Replace("-", "");
        }
    }
}
