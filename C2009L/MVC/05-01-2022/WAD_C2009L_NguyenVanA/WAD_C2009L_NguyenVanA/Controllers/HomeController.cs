﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WAD_C2009L_NguyenVanA.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();//Views/Home/Index.cshtml
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();//Views/Home/About.cshtml
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            ViewData["Message"] = "Your contact page.";//Dictionary
            return View(); //Views/Home/Contact.cshtml (cshap + html)
        }
    }
}