using _03_07_2023.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace _03_07_2023.Controllers
{
    public class ProductController : Controller
    {
        //http://localhost:port/Product/Index
        public IActionResult Index()
        {
            ViewBag.x = 123;
            ViewData["y"] = 345;            
            ViewBag.productA = new Product //Buider pattern
            {
                Description = "This is an iphone",
                Id = 1,
                Name="iphone 14",
                Price=1234.0f,                
                Count = 2
            };
            ViewBag.products = new List<Product>()
            {
                new Product //Buider pattern
                    {
                        Description = "aaaa",
                        Id = 1,
                        Name="p1111",
                        Price=2224.0f,
                        Count = 10
                    },
                new Product //Buider pattern
                    {
                        Description = "a222",
                        Id = 1,
                        Name="p2223",
                        Price=3344.0f,
                        Count = 30
                    }
            };
            return View();//Views/Product/Index.cshtml
        }
        //https://localhost:port/Product/DoSomething
        public IActionResult DoSomething(string x, string y) { 
            return View(); //Views/Product/DoSomething.cshtml
        }
        
    }
}
