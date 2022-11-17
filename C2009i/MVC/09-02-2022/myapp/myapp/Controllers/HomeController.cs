﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace myapp.Controllers
{    
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            
            return View();//Views/Home/Index.cshtml => cu phap razor(C# and html)
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
    }
}