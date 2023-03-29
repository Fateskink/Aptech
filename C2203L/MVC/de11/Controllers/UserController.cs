using Microsoft.AspNetCore.Mvc;
using System.Reflection.Metadata.Ecma335;

namespace de11.Controllers
{
    public class UserController : Controller
    {
        public IActionResult Index()
        {
            return View();
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
    }
}
